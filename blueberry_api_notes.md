# Blueberry (Roblox External Cheat) — Lua API. Конспект

> Источник: https://blueberry-3.gitbook.io/blueberry-1/lua-api (все страницы изучены 2026-09-03)
> Контекст: внешний чит для Roblox (Windows, процесс `RobloxPlayerBeta.exe`, PROCESS_ALL_ACCESS).
> Скрипты: Lua 5.x-подобное окружение, UTF-8 без BOM, из `C:\blueberry\scripts\`. Перед повторным Execute — Unload (иначе хуки дублируются).

## Карта API

| Модуль/глобал | Назначение |
|---|---|
| `rbx` | OOP-инстансы Roblox (`.addr` — сырой указатель) |
| `cheat` | живые настройки встроенных фич (aimbot/esp/...) |
| `players` | кэш игроков (быстрый снапшот) |
| `hooks` | события: кадр, рескан, вход/выход игроков, клавиши |
| `Drawing` | 2D/3D примитивы + картинки (PNG/JPG/GIF/URL) |
| `memory` | чтение/запись памяти процесса + `memory.offsets` (~70) |
| `aim` | низкоуровневый аим: мышь, камера, предикшн, w2s |
| `UIManager` | свои виджеты в меню чита |
| `Windows`, `VK` | OS-ввод (мышь/клава), окна, VK-коды |
| `Http`, `Json` | синхронный HTTPS GET (WinHTTP) + JSON (nlohmann). Только GET |
| `fire_remote`/`get_remotes`/`find_remote` (+ `rbx.*`) | RemoteEvent'ы (Remote Spy) |
| `getgc`/`findgc`/`applygc`/`setgc`/`getrawkeys`/`gcprobe` | обход Luau GC-кучи игры (оружейные статы и т.п.) |
| `Instance.new/create/highlight/part/...` | создание объектов через CallGate |
| Легаси-глобалы | `GetLocalPlayer`, `FindFirstChild`, `SetWalkSpeed`, `SetPartPosition`, `callbacks.paint/rescan` |
| Утилиты | `notify`, `print`, `warn`, `tick`, `wait`, `read_file`/`write_file`/`append_file`/`exists_file`, `set_clipboard`/`get_clipboard`, `ScreenSize`, `crosshair_pos`, `get_camera`, `game_id`, `LoadScriptFromURL` |

Lua-библиотеки: есть `string/table/math/coroutine/os.time/date/utf8`; НЕТ `io`, `package/require`, `debug`.

---

## 1. Утилиты
- `notify(msg [, level])` — level: "normal"(0)/"success"(1)/"error"(2)/"warning"(3) или число.
- `warn`/`error_log` = notify с warning/error. `print(...)` — в консоль чита.
- `tick()` сек (монотонное). `wait(sec)` блокирующий, ≤60 сек, НЕ звать из `on_render`.
- Файлы: `read_file(path)`, `write_file(path, str)` (создаёт папки), `append_file`, `exists_file`.
- `ScreenSize() -> {Width,Height,X,Y}`; `crosshair_pos() -> {X,Y}`; `get_camera() -> {position,fov}`; `game_id()` = PlaceID.
- `callbacks.paint/rescan` — легаси = `hooks.on_render/on_rescan`.

## 2. Легаси-глобалы (поиск по имени)
- `game.Players.LocalPlayer()`, `game.Players.GetPlayers()`, `game.Workspace()`.
- `GetLocalPlayer() -> {Name,DisplayName,UserId,Character{Health,MaxHealth,Position,EquippedTool},BackpackTools,Team}`.
- `GetAllPlayers()`, `GetMyPosition()`, `GetMyCharacter()`, `GetCurrentTool()`.
- `FindFirstChild(parent, name)` (parent = "Workspace"/"Players"/"DataModel"/"game" или таблица с `_instance`), `FindFirstChildOfClass(parent, class)`, `GetChildren(parent)`, `FindAllChildren(parent, substr)` (регистронезависимо), `GetPartPosition(name)`, `GetTextLabelText(partName)` (TextLabel в BillboardGui у партa).

## 3. `rbx` — инстансы
Конструкторы: `rbx.local_player()`, `rbx.local_character()`, `rbx.local_humanoid()`, `rbx.local_hrp()`, `rbx.local_head()`, `rbx.local_tool()`, `rbx.workspace()`, `rbx.players_service()`, `rbx.datamodel()`, `rbx.lighting()`, `rbx.visual_engine()`, `rbx.mouse_service()`, `rbx.camera()`, `rbx.instance(addr)`, `rbx.world_to_screen(v3) -> {X,Y,visible}`, `rbx.screen_dim()`.
ВАЖНО: `Character` НЕ ребёнок `Player` → `:get_character()` или `rbx.local_*()`.

Методы (`:`):
- Идентификация: `get_name`, `get_class`, `is_a(class)`, `parent`, `is_valid`, `tostring(inst)`, `==`.
- Навигация: `find_first_child(name)` (alias `get_child`), `find_first_child_of_class(class)`, `get_children`, `find_descendants_of_class(class)`.
- Персонаж: `get_character`, `get_humanoid`, `get_hrp`, `get_head`, `get_tool`; `user_id`, `display_name`, `team`, `team_color`.
- Part: `get_position`/`set_position(v3)`, `get_size`/`set_size`, `get_velocity`/`set_velocity`, `get/set_can_collide`, `set_transparency(0..1)`, `set_anchored`, `get/set_rotation(matrix3 {9 float})`.
- Humanoid: `health`/`max_health`/`set_health`, `set_walkspeed`, `set_jumppower`/`jumppower`, `set_hipheight`, `rig_type()` (0=R6,1=R15), `move_direction()`, `move_to(dest [,wait[,timeout=30]])` (wait=true блокирует — не из on_render).
- Camera: `camera_pos`/`set_camera_pos`, `camera_rotation`/`set_camera_rotation`, `camera_fov`/`set_camera_fov(rad)`.
- Values: `bool_value`/`set_bool_value`, `double_value`/`set_double_value`, `int_value`, `text_label_text`.
- Remotes: `:fire_server(...)`/`:fire_remote(...)`/`:invoke_server(...)` (RemoteEvent/Unreliable; аргументы nil/bool/number/string/instance).

`Instance.new(class [,parent])`, `Instance.create(class, parent, props)` (Position,Size,Color,Anchored,CanCollide,Transparency,Velocity), `Instance.highlight(target, props{fill,outline,fill_transparency})`, `Instance.part/block`, `Instance.fire/smoke/sparkles/pointlight/spotlight/surfacelight/particles/beam/trail`. Создание ~80мс интервал, НЕ спамить; MeshPart/UnionOperation запрещены.

## 4. `cheat` — настройки
Секции: `aimbot`, `silent_aim`, `triggerbot`, `esp`, `esp_colors`, `camera`. Чтение/запись полей; `cheat._sections()`, `cheat.SECTION:_keys()`.
- `aimbot`: enabled, fov_only, prediction, team_check, friend_check, knock_check, wall_check, sticky_aim, smoothness_enabled, only_targets, fov(px), min_dist, target_part(0 Head/1 Torso/2 Feet), targeting_mode(0 cursor/1 closest/2 low hp/3 high hp), sticky_aim_max_distance, smooth_factor/x/y, pred_x/y.
- `silent_aim`: enabled, fov_only, prediction, team_check, sticky_aim, target_part, fov, pred_x/y, **method** (0 ApplyFrame, 1 Viewport, 2 Raycast — Phantom Forces; при method=2 `aim.raycast_target(part)`).
- `triggerbot`: enabled, team_check, friend_check, wall_check, knock_check, only_targets, target_part, delay(ms), max_dist, miss_chance(0..100).
- `esp`: enabled, self_vis, team_check, friend_check, wall_check, use_team_color, box, filled_box, health, name, distance, tool, chams, chams_edge, tracers, skeleton, aim_line, max_dist, box_type, chams_type, tracer_type, name_type.
- `esp_colors`: RGB {r,g,b}: box, aim_line, tracers, healthbar, name, distance, tool, skeleton, chams_edge, team, vis, hidden; RGBA {r,g,b,a}: filled_box, chams. Принимает Color3.
- `camera`: fov_enabled, fov (рад).

## 5. `players` — кэш
`get_all()`, `get_local()`, `find(namePart)`, `count()`, `get_nearest([max_dist])`, `get_closest_to_crosshair([fov_px])`, `set_friended(name,bool)`, `set_targeted(name,bool)`.
Поля записи: name, display_name, address, distance, health/max_health/shield/flame, is_r15, is_self, is_teammate, is_friended, is_marked_friend/target, is_roblox_friend, is_knocked, has_gun, position, head_pos, camera_pos, team_color, team_name, tool, bones[{name,size,position}], **player_addr/character_addr/hrp_addr/head_addr/humanoid_addr/tool_addr/team_addr** (0 если нет; → `rbx.instance(addr)`).

## 6. `hooks`
`on_render(fn)` (каждый кадр; здесь Drawing), `on_rescan(fn)`, `on_player_join(fn(pTable))`, `on_player_leave(fn(addr))`, `on_key(vk, fn)` (фиксированный VK, edge-нажатие), `on_keybind(elemId, fn)` (VK из виджета UIManager.CreateKeybind, edge; VK 0 = не срабатывает), `disconnect_all()`. Хуки снимаются автоматически при unload скрипта.

## 7. `Drawing`
Вызывать ТОЛЬКО в `hooks.on_render`/`callbacks.paint`; очередь рисуется в конце кадра. Есть плоские глобалы (DrawBox и т.п.).
- `WorldToScreen(v3) -> {X,Y}` (или `{-1,-1}`).
- `DrawLine(x1,y1,x2,y2,r,g,b,a,thick)`, `DrawLine3D(p1,p2,...)`, `DrawBox`, `DrawBoxFilled`, `DrawCircle`, `DrawCircleFilled`, `DrawBox3D(center,sizeX,sizeY,sizeZ,...)`, `DrawText(x,y,text,r,g,b,a)`, `DrawTextWithOutline(cx,y,text,tr,tg,tb,ta,or,og,ob,oa)`, `DrawCornerBox(x1,y1,x2,y2,r,g,b,a,or,og,ob,oa,cornerSize(-1 авто),thick)`, `ClearDrawings()`.
- Картинки: `LoadImage(url|path)` (async, кэш по URL; http(s) любые + локальные; Tenor view-URL самоскрапится), `LoadImageFromFile`, `IsImageReady(h)`, `IsImageFailed(h)`, `GetImageSize(h) -> {Width,Height,FrameCount}`, `DrawImage(h,x,y,w,h[,r,g,b,a[,rounding[,uv0x,uv0y,uv1x,uv1y]]])`, `UnloadImage(h)`. GIF анимированные ≤400 кадров.

## 8. `memory`
Процесс открыт PROCESS_ALL_ACCESS. Адреса — 64-бит int.
- Скаляры: `read/write_u8|u16|u32|u64|i8|i16|i32|i64|f32|f64|bool|ptr(addr[,v])` (write возвращают true).
- `read_buffer(addr,len ≤1MB)`, `write_buffer(addr,str)`, `read_string(addr[,max=256])`.
- `read/write_vec2/vec3`, `read/write_matrix3` (лейаут как в движке).
- `module_base([name])`, `alloc(size)` (VirtualAllocEx), `is_valid(addr)`.
- `memory.offsets` (~70): Name, ClassDescriptor, Children, Parent, LocalPlayer, ModelInstance, Health, MaxHealth, WalkSpeedA/B, JumpPower, HipHeight, RigType, MoveDirection, Primitive, BasePartSize/Position, CFrame, AssemblyLinear/AngularVelocity, Transparency, CanCollide, Anchored, CurrentCamera, CameraPosition/Rotation/FOV, ViewportSize, ViewMatrix, Lighting (ClockTime, FogEnd...), Gravity, TickRate, FFlag-глобалы: TaskSchedulerTargetFps, TaskSchedulerLimitTargetFpsTo240, FRMMin/MaxGrassDistance, DebugSkyGray, CameraFarZPlane, MouseSensitivity, DebugDontRenderUI и др.
- Пример CFrame part: `prim = read_ptr(hrp.addr + offsets.Primitive)`; rot = `read_matrix3(prim + offsets.CFrame)`, pos = `read_vec3(prim + offsets.CFrame + 36)`.

## 9. `aim`
- `write_mouse(vec2 [,writes])` — silent aim (пишет в MouseService->InputObject->MousePosition; 16 записей при стрельбе, иначе 4). `prime_mouse(vec2)` — 32 записи. `move_mouse(vec2)` — физический SetCursorPos.
- `is_firing()` — LMB/RMB зажата.
- `get/set_camera_rotation(matrix3)` (ряды: right, up, -forward), `get/set_camera_position(v3)`, `get/set_camera_fov(rad)`, `look_at_matrix(camPos,target)`, `world_to_screen(v3) -> {X,Y,visible}`, `predict(pos,vel,dt) = pos+vel*dt`, `raycast_target(inst|nil)` (для silent_aim method=2), `aim.aim_part` {Head=0,Torso=1,Feet=2}.

## 10. `UIManager`
`CreateWindow(id,label,x,y,w,h)`, `CreateTab(id,label)`, `CreateCheckbox(id,label,default,on_change)`, `CreateButton(id,label,fn)`, `CreateSliderFloat/Int(id,label,min,max,default)`, `CreateText`, `CreateSeparator`, `CreateColorPicker(id,label,r,g,b,a)`, `CreateKeybind(id,label[,defVK[,on_change]])`.
Геттеры/сеттеры: `Get/SetCheckboxValue`, `Get/SetSliderFloatValue`, `Get/SetSliderIntValue`, `Get/SetColorPickerValue`, `SetKeybindValue`, `IsKeybindPressed`.
Прочее: `SetElementParent(id,parent)`, `SetElementSameLine(id,bool)`, `SetElementVisible`/`IsElementVisible`, `RemoveElement(id)`. id уникальны; элементы снимаются при unload.

## 11. `Windows` + `VK`
`GetMousePos`, `MoveMouse(x,y)`, `MoveMousePercent`, `MouseClick("left|right|middle")`, `MouseDown/Up`, `MouseClickAt(sx,sy[,btn])`, `MoveMouseInRoblox(cx,cy)`, `MouseClickInRoblox(cx,cy[,btn])` (для игрового UI), `IsKeyPressed(vk)`, `KeyPress/KeyDown/KeyUp`, `GetScreenSize` (системный), `FindWindow(title)`, `GetWindowRect`, `SetForegroundWindow`, `IsWindowForeground`, `IsRobloxForeground`, `FocusRoblox`, `GetRobloxWindow`, `GetRobloxClientSize`, `Beep([freq,dur])`, `MessageBox(text[,title])`.
`VK.*`: BACKSPACE, TAB, ENTER, SHIFT, CTRL, ALT, ESC, SPACE, LEFT/UP/RIGHT/DOWN, F1..F12, NUM0..NUM9, A..Z.

## 12. `Http` / `Json`
`Http.get(url [,opts]) -> ok, status, body, err` — синхронно (блокирует рантайм; НЕ в on_render). opts: `timeout_ms` (деф. 30000), `headers` (массив строк или map). Лимит тела 8 MiB. Только GET.
`Http.roblox_avatar_headshot_url(userId [,size="150x150"[,format="Png"[,isCircular]]])`.
`Json.decode(s) -> val[,err]`, `Json.encode(v [,pretty])`. Плоские алиасы: `http_get`, `json_decode`, `json_encode`.
`LoadScriptFromURL(url)` — только raw.githubusercontent.com и pastebin.com (raw авто).

## 13. Remotes
`get_remotes() -> {name,class,path,addr,kind,instance}` (kind: 0 Event, 1 Function, 2 Unreliable; если Remote Spy закрыт — первый вызов сканирует). `find_remote(query)` (имя/подстрока/путь `game.ReplicatedStorage.Foo`). `fire_remote(remote|path, ...)` — только RemoteEvent/Unreliable; аргументы nil/bool/number/string/instance; возвращает ok,err.

## 14. `getgc`-семейство (Luau GC игры)
Внешний обход кучи игры (ScriptContext → lua_State → global_State). `getgc()` → инфо о VM (kb, pages, by_type, L, G...) | nil,"no game lua state". `getgc(true)` → итератор прокси-таблиц (bb.luau_table — живое чтение/запись кучи игры). `getgc({names})` → кэш {key,value,type,addr}. `findgc(key[,val])` / `findgc({keys})` → итератор / {[key]={proxy,...}}. `applygc(cache, key, num|{key=num})` → записывает только number-поля, возвращает кол-во. `setgc("stop|restart|count|isrunning|pause|setpause|stepmul|setstepmul|collect|step")` или `setgc({RecoilMult=-1,...})`. `getrawkeys(proxy)`, `gcprobe()`.
НЕ звать getgc/findgc из on_render. One-shot: игра может сбросить статы (смена оружия) — повторить.

## 15. `config` (из рецептов)
`config.apply(presetTable)`, `config.create(name, preset)` — профили настроек (legit/rage и т.п.), хранятся на диске.

---

## Критичные правила (грабли)
1. `wait()` и `Http.get` — блокируют; НЕ в `on_render`/Execute-кнопке оверлея. `move_to(wait=true)` — только из фонового цикла.
2. `Drawing.*` — только внутри `hooks.on_render`.
3. `Instance.new` — pacing ~80мс, не в цикле по всем игрокам; MeshPart/UnionOperation — нельзя.
4. `findgc/getgc` — не каждый кадр.
5. `Character` не ребёнок `Player`.
6. Легаси-таблицы без `_instance` при поиске могут вернуть любой объект с тем же именем — использовать таблицы от FindFirstChild/GetChildren.
7. Перед повторным Execute — Unload (хуки/элементы UI иначе стакаются; вообще auto-cleanup при unload есть).
8. `fire_remote` не поддерживает Vector3/таблицы в аргументах; RemoteFunction нельзя.
9. `ScreenSize()`/`rbx.screen_dim()` — вьюпорт игры; `Windows.GetScreenSize()` — системный экран.

## Ключевые паттерны из Recipes
- Кастомный silent aim: `players.get_closest_to_crosshair(fov)` → velocity из дельт позиций по `tick()` → `aim.predict(pos,vel,prof.x)` → `aim.world_to_screen` → `aim.write_mouse(screen)`.
- Кастомный ESP: `players.get_all()` → w2s ног/головы → высота/ширина бокса `w = h*0.55`, `DrawBox` + `DrawTextWithOutline`.
- Кастомный fly: F9 toggle (`hooks.on_key`), направление из `aim.get_camera_rotation()` (right=строки 1-3, forward=-строки 7-9), WASD/Space/Ctrl, `hrp:set_position(pos+dir*1.5)`, `hrp:set_velocity(0,0,0)`.
- Spinbot: `aim.set_camera_rotation` матрица поворота по Y каждый кадр.
- FFlag: `memory.write_f32(memory.module_base()+memory.offsets.FRMMaxGrassDistance, 1)`.
- FPS-разблок: `memory.offsets.TaskSchedulerTargetFps`.
- Профили (legit/rage) через `config.apply` + переключение по F6.
