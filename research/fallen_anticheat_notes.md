# Клиентский античит оригинального Fallen (FallenGuard) — первый разбор

Файл: `uploads/fallen_anticheat.lua` (8288 строк, деобфус). Это КЛИЕНТСКАЯ часть: вешает слушатели, собирает улики и шлёт на сервер через `FireServer` (76 вызовов, коды нарушений в таблицах `{N}`), сервер уже решает бан. Серверных проверок (дистанция камера↔рут, спред по seed, скорость пули) здесь НЕТ — в файле ни одного `.Magnitude`. Значит, manipulation/hitscan валидируются на сервере, этот файл про них не скажет.

В форке античит называется LarpGuard/CameraLockGuard — переименован и дописан, но, судя по совпадению строк-паттернов, основа та же.

## Что ловит и что это значит для нашего билда

1. **LogService.MessageOut + ScriptContext.Error (L2313, L2459, обработчик Fn27 L1583).** Каждое сообщение в консоли (print/warn/error) прогоняется через ~190 паттернов (таблица T9, L387–560): `discord`, `github`, `cheat`, `bypass`, `hooked`, `hookfunction`, `metatable`, `namecall`, `upvalue`, `userdata`, `function:`, `thread:`, `loadstring`, `writefile`, `getnilinstances`, `rconsoleprint`, `lph_`, `Luraph`, `amongus.hook`, `[fallen]`, `[...hub]`, `gui `, `noclip`, `gravity`, `xray `, `createesp/updateesp`, `getclosestplayer`, `queue_on_teleport`, `setfenv/getfenv`, `%[string ".*"%]` и т.д. Плюс у любой ошибки вида `Имя:строка:` имя скрипта сверяется с белым списком (T4/T5/T6: `ViewmodelController = 2610` строк, `RaycastUtil = 270`, `EquipController = 240`…), чужое имя или строка вне диапазона → отчёт NAME1/LINE1.
   **Правило:** в нашем скрипте НОЛЬ `print/warn`, ни одна ошибка не должна долететь до консоли — всё в pcall, чанк-имя loadstring не светить. Любая вылезшая ошибка из loadstring даёт `[string "..."]` → флаг сразу.

2. **Скан картинок в CoreGui (Fn45, L2106–2160).** `ContentProvider.PreloadAsync(CoreGui)` перехватывает каждый `rbxassetid://`, через `MarketplaceService.GetProductInfo` смотрит автора; если автор не verified, не группа и не из белого списка T2 (14 id) → отчёт `{7, assetId}`.
   **Правило для лоадера/меню:** НЕ использовать свои/чужие rbxassetid-иконки (иконки Ignite 88117961086501 и т.п. под вопросом — проверить автора). Картинки — только через `writefile + getcustomasset` (так делает сам Ignite) или встроенные ассеты Roblox. Это же касается Potato-меню, если там есть rbxassetid.

3. **Стек вызовов (L1905–2205, L5555–5566, L8130–8180).** При вызове защищённых функций проходит `debug.info(2..11)`: каждый фрейм должен быть либо `[C] pcall`, либо `ReplicatedStorage.Modules.AssetContainer:3`; иначе отчёт `0/источник/строка/имя`. Дополнительно `getfenv(уровень).getconnections` — если в окружении вызывающего есть экзекьюторные глобалы → отчёт `"1"`. Также проверяет, что сам `debug.info` не подменён (L8130).
   **Правило:** игровые функции (Raycast/FireRemote/CreateProjectile) не дёргать напрямую из нашего кода; только через хук-подмену аргументов внутри родного вызова игры (как сейчас), и обёртки — с чистым env (`setfenv` на пустую таблицу с __index = game-env).

4. **Движение:** `WalkSpeed` вне `[0, 19.01]` → отчёт `{11}` и клэмп до 18 (L2611); `HipHeight` вне `[-0.01, 3]` → `{3,1}` и сброс 1.6 (L2630); `JumpPower` аналогично; `Workspace.Gravity ≠ 160` → `{5}` и сброс (L2465); любое `Workspace.Changed` → `{5}`. Fly через CFrame/Velocity здесь не ловится (ловит сервер).

5. **Камера:** `FieldOfView` вне `(0, 105]` дважды с интервалом 4 с → `{7}` (L2482). Наш FOV-слайдер ограничить 105. Проверки `Motor6D.C0 == CFrame.new(0, y, 0)` (L2735…) — шея/рут, ловят anti-aim на мотор6D.

6. **Оружие:** таблица эталонов T10 (L561+): для каждого ствола RPM, авто, скорость пули, дальность, отдача, разброс и т.д. (`Military MP7 = {575, true, nil, 1900, 0.6, 800, …}`, `Salvaged AK47 = {450, true, nil, 2100, 0.55, 1100, …}`). Сверяется с ToolInfo (`chickenfried` в форке). **Правило:** no recoil / no spread / RPM нельзя делать правкой таблиц ToolInfo — только подменой значений в момент выстрела (как сейчас через хук).

7. **Базы/xray (L7878–7912):** у Wall/Floor/Foundation/Half Wall проверяет `CanCollide`, `CanQuery`, `Transparency`, `Size`, `Anchored`, `MeshId`, смещение Detail/Fill → отчёты `0,1..7`. Xray через Transparency деталей = флаг; только через Highlight/чамсы в CoreGui.

8. **Прочее:** `setfflag` (L19), `getconnections` на сигналы AC, тела ошибок `RemoteEvent/RemoteFunction` в логах, проверка количества паттернов (`Count < 168` → отчёт о подмене таблицы), `string.format` с `%*`-защитой от hook'а tostring.

## Итог
- Ничего из перечисленного не ломает manipulation/hitscan/instant напрямую — их судьба решается на сервере (нужен дамп пакетов `aquabeary_packets.txt` и, если достанешь, античит ФОРКА, а не оригинала).
- Срочно проверить в нашем билде: (а) нет ли print/warn и утечек ошибок в консоль; (б) rbxassetid в меню/лоадере; (в) FOV ≤ 105; (г) WalkSpeed ≤ 19.

## yvyx.cc leaks vs our bypass (2026-10-14)
- Constant.cc Fallen (src_69, Jun 2026, newest): same bypass principle as amongus.hook — getgc(true) self-referencing table + ban index 1..4, setrawmetatable __newindex filter. Whitelist: {{n},n}, {2}, {2,_,_,false}, {str,7}. Fail-closed kick otherwise.
- Our Fn4 already passes {{n},n}, {2}, {2,"BillboardGui","BillboardGui",false}, {numeric-str,int}. User AC dump has {"109",7} -> passes. No change needed.
- Constant uses identical remote keys ("d\147e\1R\169#o..." = TP_SHOOT_KEY_1) -> amongus dump is same game generation.
- Monolith (src_67): proxies different tables ({Remotes,_,_,Ban}, {Character,Humanoid,...,[5],[8]}) + hookfunction on AssetContainer protos (SurfaceGui/Foundation/LocalAmmo/WalkSpeed). Insulin (src_65): hookfunction on AssetContainer protos by #constants==23/9. Riskier (hooks checked by AC stack checks); not adopting.
- Fallen Ult V3 (src_59): bypass stub empty ("PUT BREDS BYPASS"). LunaVip (src_66): no bypass.

### Feature gap vs leaks (candidates to port)
Safe (client-only, Drawing/clone-based): aim assist (camera smoothing), triggerbot, hit/kill sounds, bullet tracers, skeleton ESP, out-of-view arrows, ESP nodes/plants/sleepers/BTR/turrets, ESP priority list, combat-hide ESP, perfect farm (RaycastUtil clone, same as our MouseRaycast clone), extend interaction distance, no camera shake/bob (via upvalues), view info/player list, game events timer, switch delay / priority-only for silent.
Risky (server-visible or AC-watched): double heal (duplicate NetworkSend), auto upgrade / farm aura (remote spam), bunnyhop/omnisprint/anti fling (movement), chams via Highlight (AC detects Highlights/SurfaceGui), instant last code / bolt (setconstant on game protos), teleport to bullet (we have, risky), reach.

## Status 2026-10-15 (user ban + amongus discord)
- User banned "RULE 1" (caps = anticheat ban; lowercase "rule 1" = moderator) right after launching fallen_test.lua (old amongus-style bypass: table shadow + Lighting/Camera metatable replace at startup). Fresh AC checks own tables via getmetatable/iteration (L1055-1120) -> likely trigger.
- amongus.hook dev (mainstreamed) Discord: 24.09.2026 "Fixed Invalids: Spread %, Hitscan, Instant Hit no longer cause invalids"; 27.09.2026 "Fallen is Very Risky; do not recommend using it until I fix it". Mass false bans reported by the new AC (even without cheats).
- Conclusion: as of Oct 2026 no known public bypass for the new Fallen AC; paid cheat dev himself paused. Any new bypass = untested hypothesis until live test on throwaway account.
