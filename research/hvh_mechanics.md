# Manipulation / Hitscan / Force hit — как это реально сделано в Fallen-читах

Источники (скачаны в `research/`):
- `sb_raw.lua` — утечка Iridescent (сборка Amongushook), 616 КБ, открытый код. Манипуляция: L6213–6256, L11476–11499, L12322–12372. Хук: `hookfunction(VFX.CreateProjectile)` L12290.
- `tapped_src.lua` — утечка Tapped.wtf, 363 КБ. Silent через `hookfunction(RaycastUtil.Raycast)` L7262–7283, «Instant Hit» L4141–4160, «Manipulation» (десинк) L3499–3600, L4769–4830.
- `uploads/AUHDeobfuscated (1).txt` — AUH: `canHitscan` / `canManipulate` L2690–2820, таблицы углов L4515–4529, слайдеры L2010–2036.
- `uploads/friend.lua` — чит друга под форк: `findHitscanPoint` L5827–5873, индикаторы L2785–2810.
- Описание фич FallenUltimate (rscripts): «Force Hit — penetration through walls/objects», «Manipulation — shoot around walls», «Hit Scan — alternative visibility detection (may cause lag)».

Вывод: в Fallen-сцене все три слова означают одно и то же у всех авторов, реализации отличаются только деталями.

---

## 1. Manipulation («стрельба из-за угла»)

**Суть.** Сервер проверяет линию огня из точки, которую прислал клиент (камера / флешпарт / рут), а не из реального положения персонажа. Клиент подбирает ТОЧКУ-ОРИГИН рядом с собой (3–8 стадов вбок/вверх), из которой цель видна, и в пакет выстрела кладёт её вместо настоящей. Персонаж при этом физически не двигается.

**Iridescent (L6213–6256):** список смещений от CFrame камеры:
`(±3,0,0) (±6,0,0) (±4,0,0) (±7,0,0)` + те же с `y=2`, и вверх `(0.2,3.9,0) (1.8,4.1,1) (2.1,4.4,1.1) (0.15,5.2,0.1) (-1.8,5.4,-0.2) (-2.3,6.35,-0.4) (0.1,7.5,0) (0.1,8,0)`.
Перебирает по порядку, первый оффсет, из которого `IsPartVisible(TargetPart, newOrigin)` → это `ManipulatedPosition`. Считается только когда цель НЕ видна напрямую (`not Core.Visible`).

**Как подменяется выстрел (L12322–12372)** — внутри хука `VFX.CreateProjectile`, когда traceback содержит `ViewmodelController`:
1. `debug.getstack(3)` — берут локалы функции выстрела: `[45]` camera CFrame, `[51]` flashpart position, `[52]` HRP CFrame, `[54]` hit position, `[62]` spread, `[25]` таблица отдачи.
2. `NewFlashpart = CFrame.new(ManipulatedPosition, HitPosition).p`
   `NewCamera = NewFlashpart + (Camera - Flashpart)`, `NewHRP = NewFlashpart + (HRP - Flashpart)` — т.е. сдвигают камеру, флешпарт и рут ОДНИМ вектором, чтобы взаимные расстояния остались как у честного клиента (античит сверяет их).
3. `debug.setstack(3, 45/51/52/54, …)` — пишут обратно; дальше игра сама собирает пакет из этих локалов и шлёт на сервер.
4. Параллельно правят cfg проджектайла: `Position/PositionFirst = CorrectedPosition`, `Direction/DirectionFirst = (Hit - Origin).Unit`.

**AUH (`canManipulate`, L2807–2815 + углы L4522):** направления `(±1,0,0) (0,±1,0) (±1,1,0)` × «manipulation distance» (слайдер 3–8, дефолт 8). Для каждого: `P2 = (Camera * CFrame.new(dir)).Position`; если луч камера→P2 упирается в стену — P2 укорачивают до `dist-0.2`; затем луч P2→цель; чистый → манипулируем из P2. Кэшируют последний удачный угол (`Cached.manipulationAngles`) и проверяют его первым. Лимит лучей на кадр `maxRayAmount = 160`.

**У друга (форк):** в пакете выстрела `payload[4] = rootSend (CFrame)`, `payload[5] = flashOffset Vector3(0.5,-0.3,-2)`, `payload[6] = cameraSend (CFrame)` — подмена идёт прямо в `Client.packetHook(Args)` перед `FireRemote`, без getstack. Для нашего форка это и есть путь: подменять [4] и [6] на сдвинутые CFrame, направленные на цель.

**Tapped.wtf называет «Manipulation» другое** (L3499–3600): анкорит HRP, позволяет WASD сдвигать его до 8 стадов от стартовой точки, рисует forcefield-клон на старом месте. Это десинк в стиле Da Hood, а не подмена пакета. Нам не нужно.

---

## 2. Hitscan («альтернативная проверка видимости»)

**Суть.** Это НЕ мгновенная пуля. Hitscan = когда выбранная часть цели (голова/торс) закрыта, чит сканирует ТОЧКИ РЯДОМ с целью и ищет любую, до которой долетит пуля; в пакет кладётся эта точка как hit position. Срабатывает на целях, торчащих из-за угла частично. Поэтому в FallenUltimate написано «may cause lag» — много рейкастов за кадр.

**AUH (`canHitscan`, L2787 + Fn5 L2773–2786 + углы L4515):** направления `(±1,0,0) (0,0,±1) (±1,0,±1) (0,1,0)` × «hitscan distance» (1–8.9 стадов). Для каждого: `P = targetPos + dir`; луч цель→P (если стена — укоротить до `dist-0.2`); луч origin→P чистый → стрелять в P. Индикатор «hitscanning», цвет (255,196,0).

**У друга (`findHitscanPoint`, L5828–5873):** честнее — симулирует траекторию с гравитацией (`cheat.solveAim` + `cheat.simulatePath`, параметры `bulletStats.speed/gravity/range`), origin = глаза `(root*CFrame(0,1.5,0)) + 2 стада вперёд − 0.3 по Y`. Если до основной части не долетает — перебирает `Head, UpperTorso, HumanoidRootPart, LowerTorso, Torso, руки, ноги, стопы`, у каждой 3 точки: центр, `±0.3*Size.Y`. Первая достижимая → `Targeting.HitscanPoint`, статус «Hitscanned» (255,170,60). Пересчёт не чаще раза в N мс на цель (`lastHitscanAt`).

**Tapped** (L7262–7283) hitscan не имеет; его silent = хук `RaycastUtil.Raycast` из `ViewmodelController`: `args[3] = (closest_part.Position - args[2]).Unit * 2500` (просто подмена направления луча + hitchance через `math.random(1,100) <= hitchance`).

---

## 3. Force hit / Instant hit

Два разных значения, оба встречаются:

**a) Instant bullet (Iridescent «InstantBullet», Tapped «Instant Hit», AUH `silentAim_instantHit`).**
- Iridescent L12334–12345 + L12376: `Args[1].Speed = 9e9` в cfg CreateProjectile, а чтобы сервер (который считает падение по СВОЕЙ скорости) не промахнулся — компенсируют дроп: `G = Gravity * -195; Drop = -0.5*G*t*t, t = dist/Speed; HitPosition += (0, Drop, 0)`.
- Tapped L4141–4160: ищет через `getgc(true)` все таблицы с полем `Bullet` и ставит `Bullet.Speed = 10000` (сохраняя старые для отката).
- Наш ит.10: `Instant = 1/60` в cfg CreateProjectile — то же семейство; если не подтвердится, запасной путь — `Speed = 9e9` + компенсация дропа как у Iridescent.

**b) Force hit = «penetration» (FallenUltimate, часть паблик-сборок).** Отключает visible-check полностью и отправляет хит по невидимой цели как есть. Работает только если сервер не делает свой LOS-рейкаст (в оригинальном Fallen работал в старых версиях; в форке с «переделанным AC» скорее всего режется — проверять только на пустом сервере, один выстрел).

---

## 4. Что важно для нашего форка

1. Все три фичи живут в одном месте — там, где собирается пакет выстрела (`Client.packetHook(Args)` → `FireRemote`). Manipulation меняет ОРИГИН (`[4]` root, `[6]` camera, одним вектором), hitscan меняет ХИТ-ПОЗИЦИЮ (`[1]`), instant меняет скорость/флаг `Instant` в cfg проджектайла.
2. Античит сверяет взаимное расположение camera/flashpart/root → сдвигать их одним и тем же вектором, как делает Iridescent (не только камеру).
3. Дистанции: manipulation 3–8 стадов (дефолт 8 у AUH, у Iridescent до 8 вверх и ±7 вбок); hitscan 1–8.9 стадов. Больше 8 — почти наверняка флаг у LarpGuard.
4. Обязательно: лимит рейкастов за кадр (AUH: 160) и кэш последнего удачного угла, иначе фпс падает.
5. Пока нет `aquabeary_packets.txt`, индексы `[4]/[6]` в НАШЕМ форке — предположение по читу друга (shot = table(12)). Нужен дамп, чтобы не промахнуться с полями.
