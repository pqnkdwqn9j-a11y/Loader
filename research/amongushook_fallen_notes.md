# amongus.hook [FALLEN] - разбор (uploads/amongushook_fallen.lua, 6404 строки)

## 0. Карта файла
- 1-116 алиасы (debug.getstack/setstack/getupvalues/setupvalue/getconstants/setconstant, getgc, cloneref ...).
- 120-352 модули T[1..8]: T[2] kick (+подмена CoreGui ErrorPrompt), T[3] пустые print/warn,
  T[4] константы движка игры (уровни стека, номера регистров, upvalue-индексы), T[5] шрифты Drawing по экзекьютору
  (Wave/Volt/AWP/Zenith), T[6] список флагов, T[7] Replacemetamethod, T[8] утилиты таблиц.
- 398-560 V4 = "Bypass" (главное, см. п.2). 562-605 проверка наличия 40 экзекьюторных функций, иначе Kick.
- 606-620 `if not V4() then return end` - без байпаса чит НЕ запускается (fail-closed).
- 672-2448 UI-библиотека на Drawing API (окно/табы/toggle/slider/keypicker/colorpicker/dropdown/notify/
  keybind list/target HUD) + ESP-библиотека на Drawing. Строка 674 - base64 PNG (908 КБ).
- 2455-2510 общий контекст T2 (services через cloneref, world-папки, require игровых модулей Items/ToolInfo/
  BenchInfo/RaycastUtil/SoundModule/VFXModule).
- 2511-3700 V40-V48: табы меню, target/client-состояние, isVisible/isTeammate/isDowned, выбор цели,
  hitscan/manipulation (V45), getEquipped (V46), баллистическое предсказание (V47), staff detector (V48).
- 3703-3948 V49/V50: fly, speed, autoreload, desync/antiaim, freecam, PreRender/Heartbeat-циклы.
- 3949-4884 V51: ЯДРО - подмена игровых модулей (silent/forcehit/manipulation/recoil/spread/auto/melee/eoka/
  instant equip/instant loot/silent walk/shoot while piloted/spoof root CFrame).
- 4885-4952 V52: спуф Lighting/Camera (__index/__newindex + checkcaller). 4953-6156 V53: привязка флагов,
  xray, traps/spikes, chams, waypoint tp, fov/zoom, grass. 6157-6404 V54-V57: resolve antiaim, коннекты, запуск.

## 1. Что требует от экзекьютора (иначе Kick на старте)
getgc, debug.info/getstack/setstack/getupvalues/setupvalue/getconstants/setconstant, cloneref, compareinstances,
Drawing, getrawmetatable/setrawmetatable/setreadonly, checkcaller, getcallingscript, getsenv, setfpscap,
newcclosure, getnamecallmethod, clonefunction, hookfunction, request, setfflag, sethiddenproperty, base64_decode,
getconnections, identifyexecutor, файловые функции. Самые редкие: debug.getstack/setstack, getgc, getsenv, setfflag.
=> ПЕРВЫЙ ШАГ ПЕРЕД КОДОМ: проверить, что из этого есть в OpiumWare (Mac). Без getstack/setstack и
getupvalues/setupvalue схема amongus.hook невозможна 1-в-1.

## 2. Bypass АЧ (V4, строки 398-560) - главное открытие
1. Через getgc ищется функция AC из `ReplicatedStorage.Modules.AssetContainer` с константой "WalkSpeed".
2. Её upvalue #2 (BAN_TABLE_UPVALUE) - служебная таблица обфускатора АЧ: содержит ссылку на саму себя
   (ключ self) и ровно одно числовое значение (ключ index). По этим двум признакам находятся ВСЕ такие таблицы,
   достижимые из upvalue функций AssetContainer.
3. Каждая найденная таблица подменяется: содержимое копируется в теневую таблицу, оригинал очищается и получает
   metatable: __index -> тень, __newindex -> фильтр Fn4. Так все записи АЧ (в т.ч. отчёты о нарушении
   `{11, WalkSpeed}`, `{3,1,HipHeight}`, `{"27",...}`) проходят через фильтр.
4. Фильтр Fn4: не-таблицы и Instance пропускает; таблицы пропускает только если они похожи на "легитные"
   формы (пустая, `{2}`, `{"2", str}`, `{n<=10, float}`, `{{73},false,n,n}`, `{2,"BillboardGui","BillboardGui",false}`,
   `{{55},"167"}`, `{{37},"216"}`, `{str, n, true}` и т.п.). Всё остальное (= реальные репорты) МОЛЧА ВЫБРАСЫВАЕТСЯ.
   Также глушит текст "emote exists with name nil".
5. В fallen_anticheat.lua это подтверждается: репорт кладётся в слот V6/V8 (строки 1428, 2614, 2630...),
   а Fn23 (1281) подмешивает его в аргументы СЛЕДУЮЩЕГО легитного FireServer (отдельного "ban remote" нет).
   Если запись в слот перехвачена - серверу уходит чистый трафик.
6. Если таблица не найдена / найдено две - чит сам кикает игрока ("No corresponding values found",
   "Duplicate Index") и не стартует. Это защищает от запуска без байпаса после обновления АЧ.
ВЫВОД: amongus.hook не "обходит" каждый детект по отдельности - он отключает доставку репортов. Поэтому
дальше он спокойно меняет Camera/Lighting, использует setfflag, Velocity-fly и т.д.
Хрупкость: зависит от раскладки обфускатора АЧ (BAN_TABLE_UPVALUE=2, вид таблицы). Live-АЧ мог измениться
с момента дампа - нужна проверка в игре (поиск таблицы можно сделать read-only, без подмены).

## 3. Как сделаны боевые фичи (V51, 3949-4884)
Общий принцип: НЕ hookfunction на игровых функциях. Вместо этого `table.clone(модуль)` с подменёнными полями и
`debug.setupvalue` на функциях ViewmodelController/InventoryController/StateAssetController, чтобы ОНИ вызывали
клон. Доп. защита: перед стартом проверяется, что RaycastUtil.Raycast, VFXModule.CreateProjectile/
CheckCameraDistance, SoundModule.ToggleFootstep не содержат upvalue-функций из AssetContainer (AC_* kick) -
т.е. что АЧ сам их ещё не обернул.
Поиск функций: getgc -> `debug.info(f,"s")` содержит "ViewmodelController" -> `debug.getconstants(f)` содержит
"DebugEnableVMMovement" -> среди upvalue функция с константой "cancel" и `getfenv(f).script == ViewmodelController`
= mouseButton1Down (стрельба). Там же upvalue из AssetContainer = fireRemote (обёртка FireServer).
Подмена upvalue у mouseButton1Down: VFXModule -> клон, RaycastUtil -> клон, ToolInfo -> deepClone, CameraShake
(функция с константой "Damper") -> своя. Плюс upvalue ToolInfo у Heartbeat-коннекта ViewmodelController и у
обработчика EquipVM (константа "EquipAnimSpeed").

- Silent aim = клон RaycastUtil.MouseRaycast (4106): если арг #3 (ignore-list) длиной 2 и вызов из
  ViewmodelController (уровень 2): берёт цель, с шансом hitchance подменяет точку попадания, учитывает spread-
  паттерн из
- Silent aim = clone of RaycastUtil.MouseRaycast (4106). Conditions: arg #3 (ignore list) has len 2 and caller
  level 2 is ViewmodelController. Replaces hit point (hitchance, ballistic prediction by Bullet.Speed/Gravity,
  compensates spread pattern {Radius,Degree} found in caller stack).
  KEY TRICK: debug.getstack(2) finds caller registers equal to Camera.CFrame and to RootPart.CFrame*(0,1.5,0),
  then debug.setstack replaces them with fake CFrames (origin -> Target.silent.origin for manipulation,
  look -> hit point). Fake torso CFrame gets __namecall hook on PointToObjectSpace so the game's own
  "is aim direction plausible" math returns consistent values. So the packet the GAME builds already contains
  the spoofed origin/direction -> server-side checks pass. Needs getstack/setstack (no alternative).
- Force hit / "instant hit" = clone of RaycastUtil.Raycast swapped into VFXModule.CreateProjectile upvalue (4460):
  when filter list [1] == local character and target set: does own workspace:Raycast with Include={target part}
  and returns target instance/pos/normal/material (ignores walls). For hitPosition (hitscan) adds offset via a
  one-shot __index hook on target part CFrame. Skipped for "Salvaged RPG".
- Bullet TP = setfflag S2PhysicsSenderRate 240 + RootPart.CFrame = hit point (inside MouseRaycast clone).
- Recoil = CameraShake replacement (scales 2nd arg + Strength) + ToolInfo deepClone where Recoil.Camera.
  RecoilStart/RecoilFinish/Shake.X/Y wrapped by proxies multiplying numbers by recoil%.
- Spread = ToolInfo clone: Spread.Hip/Aiming proxies multiply by spread%; "fake ADS": via getstack on
  ViewmodelController level 3-4 flips SHOOT_AIMING_REGISTER(31)=true and heartbeat regs 52/56 so server-seeded
  spread uses the Aiming values (server recomputes spread from seed, so only ADS-state can be faked).
- Always automatic/firerate/melee speed+range = ToolInfo clone proxies (Auto=true, RPM*mult, Cooldown/, Range*).
- Instant eoka = rawset ChooseRandom in getsenv(ViewmodelController) (rolls len 5 -> 0.25, len 4 -> 0).
- Always shoot = debug.setupvalue(mouseButton1Down, LAST_AIRED_UPVALUE=12, -0.1).
- Auto reload = fireRemote("Fire", FIRE_KEY, RELOAD_KEY, GetServerTimeNow(), "None") via protectedCall
  (task.spawn with setfenv(0, env of fn)) when ammo timing allows.
- Silent walk = clone SoundModule.ToggleFootstep -> noop, swapped into StateAssetController FloorMaterial handler.
- Instant equip = ToolInfo proxy EquipAnimSpeed=inf for EquipVM handler. Instant loot = InventoryController
  EquipArmor handler gets fake RunService (Part with __index -> Heartbeat.Wait returns 10).
- Shoot while piloted = Humanoid __index SeatPart -> nil when caller is ViewmodelController.
- Antiaim (underground) = each Heartbeat move RootPart down by depth, PreRender:Wait, restore; CameraModule reads
  spoofed CFrame via HRP __index + getcallingscript; replays Down/DownFall animations. resolveAntiAim = stop
  DOWNED animation (13435049596) on enemies without Downed attribute.
- Fly/speed = RootPart.Velocity. NoFall = Velocity (0,16384,0) trick. Freecam = NetworkIsSleeping + CFrame.

## 4. Targeting (V45, 3216-3519)
- Candidates: Players (skip downed, >1300 studs from scan origin, teammates = NameTag.AlwaysOnTop), optionally
  NPCs in Workspace.Military (Soldier/Bruno/Boris/Brutus). Hit part: Head or UpperTorso or "closest" of 8 parts.
  FOV check in screen space vs mouse (Drawing circle radius, dynamic by Camera.FieldOfView/70).
- Visibility ray filter: Camera, VFX, Plants, Drops, local char, GLOBAL_HIT_IGNORE (LeafPart/CactusPart of
  Trees/Vegetation). Ray budget 160/tick.
- Hitscan: 9 directions * distance from TARGET; point reachable from origin and sees target -> hitPosition.
- Manipulation: 6 directions * distance from camera (origin shifted); if that point sees target (or hitscan from
  it) -> origin = point. Priority: direct LOS > hitscan > manipulation; if visibleCheck off -> notVisible target.

## 5. Visual/misc hiding (V52/V53)
- Lighting/Camera: __index returns spoofed Ambient/FieldOfView to game code (checkcaller false), __newindex
  records game writes; FOV changer/zoom write real FOV but game reads original. (AC watches FOV<=105.)
- Xray: per-part Replacemetamethod __index/__newindex on Transparency of base parts (Wall/Floor/Foundation...)
  in Workspace.Bases - game reads original transparency. Traps/spikes: CanTouch=false on TouchCollision/DamageParts.
- Remove grass: setfflag FRMMin/MaxGrassDistance (restored on leave). Staff detector: GetRankInGroupAsync
  (group 1154360, rank>=15) -> notify.
- Whole UI/ESP is Drawing API -> nothing in CoreGui/PlayerGui, no rbxassetid (PNG via writefile+getcustomasset).
- print/warn stubbed; errors never reach console. Services via cloneref; checkcaller on all metamethod hooks.

## 6. Conclusions for our cheat on original Fallen
1. Executor capability check is step zero (getgc, getupvalues/setupvalue, getstack/setstack, getsenv,
   getconnections, setfflag, cloneref, compareinstances, newcclosure, checkcaller, getcallingscript, Drawing).
2. If full set exists: port the amongus.hook scheme (report-table proxy + module-clone swaps + stack spoof).
   Verify report table layout read-only first (count matches, no duplicates) before enabling.
3. If getstack/setstack missing: silent aim possible only as module-clone MouseRaycast/Raycast swap with
   direction limited to what passes server plausibility (no manipulation/hitscan origin shift); must still
   neutralize report table (needs getgc+getupvalues) or stay in "visuals only" mode.
4. If getgc/getupvalues missing: only Drawing ESP, FOV circle, keybinds, staff detector, grass fflag (if any).
