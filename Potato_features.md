# Potato.hook v1.2 foliver — Feature List (build 18)

Menu: Combat / ESP / Visuals / Misc / Skins / Settings / Plugins. Toggle with RightShift.

---

## COMBAT

### Aimbot (camera only, no silent)
- Enabled
- Mode: Smooth / Snap
- Smoothness 1-20 (lower = faster, 1 = instant)
- Aim key (hold) / Always target (works without a key)
- Visibility check, Hit part (Head / UpperTorso / LowerTorso)
- Target Players / Target AI / Target Bosses (teammates are never targeted)
- FOV Settings: Visualize FOV, Dynamic Radius, Radius, Color, Target color
- Armor Viewer (shows target armor + weapon)

### Crosshair
- Crosshair, Size, Gap, Length, Width, Color, Outline color, Dynamic Radius

---

## ESP (Players / AI / Bosses)
- Enabled, Bounding box (+type), Skeleton, Name, Distance, Health / Healthbar
- Chams (style, visible / occluded color, refresh rate)
- Visible / Occluded color, Lower / Higher health color, Maximum distance
- Only show health if damaged, Character model, Weapon image
- Tracers (enemy / teammates, colors), Offscreen indicators (arrow size / radius)
- Smart ESP Fade / Radius, Combat Hide key
- Flags: VIP / Staff / Clan / Aiming / Healing / Reloading / Safezone (+colors)
- Lock-on indicators (threshold / danger threshold, Stick to target, Sync to lock color)

## ESP (World)
- Resources, Nodes (Stone / Metal / Sulfur / Phosphate), Care Packages, Timed Crates
- Raids, Bases, Benches, Body bags, Sleepers, Tools, Looting, Building, Locks

---

## VISUALS

### Camera
- Zoom (+level +key), Field of view / Custom FOV, Camera Effects, Remove bobbing

### World
- Fullbright, Brightness, Ambient color, XRay (+transparency +key)
- Fog (density / color / haze / glare / decay), Clouds (density / cover / color)
- Sky / Skyboxes (Star count), Change time, Ambience
- Remove grass, Cloth plants, Bloom, Lighting, Terrain (material / reflectance)
- Hitmarkers (hit / headshot sound + volume), Tracers (lifetime / speed / colors)

### Viewmodel
- Remove sleeves, Arms / Sleeves / Gloves, Highlight (fill / outline), rotation / random rotation

---

## MISC
- Sound: Master, Hit / Headshot volume, Silent step

## SKINS
- Skin changer, per-item skins, weapon image, Sandbox armor models

## SETTINGS
- Configs: Save / Load / Delete, Config name
- Notifications, Watermark / HUD, Menu keybind

## PLUGINS
- Armor Viewer, Moderator panel, Hotkeys panel

---

## Not in this build (removed on purpose)
Silent aim, Manipulation, packet redirect, wallbang / force hit / hitscan, resolvers, anti-aim,
kill aura, rapid fire / fire rate / recoil mods, fly / speed / teleport / bunnyhop, instant loot / farm.

---

## Protection
- Minified build, loader <-> cheat handshake (raw file will not run on its own)
- Anti-hook fail-safe, kill-switch via status.txt
- Key window: JNKIE UI-Source (aquabeary)

## Changelog
- build 19: single-instance guard (second inject = notification, no double hooks), config load fixed (old/unknown values skipped), silent paths hard-disabled.
- build 18: silent aim removed, aimbot = camera only (Smooth/Snap, Smoothness, Aim key). Manipulation gone. Key window renamed aquabeary.
- build 17: LarpGuard support, LOS-only aim, no wall shots.
