# AC INTEL CROSS-REFERENCE (Claude-AC / AssetContainer vs LarpGuard)

Source: `uploads/message-10.txt` lines 1-290 ("IRIDESCENT FIX" block) — decompile knowledge of the
Claude-written anticheat (AssetContainer game). Cross-referenced with LarpGuard AC
(`uploads/PF_modules.txt` Preload 104824-105682, `uploads/PotatoDec2_AC_CameraLockGuard.txt`).

## Claude-AC (AssetContainer) — full map
- **Report transport**: reports B_XX go via ANY RemoteEvent with marker "0xR" in args.
  Fallback channel: `ReplicatedStorage.LoadingScreen:FireServer("B_XX"/"0xXX", ...)`.
  Heartbeat: `LoadingScreen:FireServer("124", {tick(), counter})` every 20s.
  Selftest: args[2] == "selftest".
- **Known report codes**: B_7B = "FieldOfView %.0f but game set %.0f" (FOV mismatch);
  B_8C/B_8E/B_8F/B_90 = executor-globals detected.
- **Lighting monitor** (every 5s, tolerance 5% / 6-of-255):
  Lighting: Brightness, Ambient, OutdoorAmbient, FogEnd, FogStart, FogColor, ExposureCompensation, GlobalShadows
  Atmosphere: Color, Density, Decay, Glare, Haze, Offset
  BloomEffect: Intensity, Size, Threshold
  ColorCorrectionEffect: Brightness, Contrast, Saturation, TintColor
  Clouds(Terrain): Density, Color, Cover
  **ClockTime NOT monitored (Time slider safe).**
  Spoof: hook `__index` — game reads snapshot (originals), render uses real values; `checkcaller()`
  separates executor reads from game reads.
- **CoreGui scanner**: periodic `CoreGui:GetChildren()`; reports ScreenGui/Folder not in whitelist
  (RobloxGui, RobloxLoadingGui, PurchasePromptApp, DevConsoleMaster, PlayerList, Chat, InGameExplorer_ImportUI).
- **FOV check (B_7B)**: every ~1s compares `workspace.CurrentCamera.FieldOfView` vs
  `ViewmodelController:GetAttribute("IntendedFov")` OR `shared.__fovWitness` (function, lives 2s).
  >2 degrees 3 times in a row -> B_7B.
  Fix pattern: set FOV + IntendedFov attr + call witness(fov); re-feed witness every 1.5s.
- **Admin bypass**: `LocalPlayer:SetAttribute("AdminFullbright", true)` skips lighting check.
- **Executor detection**: B_8C/B_8E/B_8F/B_90 — executor-global calls are visible to AC.

## LarpGuard AC (observed)
- Preload: self-checks (debug.getinfo 0..4, source len 18, v_u_65/66/67 = tonumber(match)/2),
  heartbeat FireServer x40 interval 1s, color-integrity every 4+rand()*2s (2 colors + 1 scalar ->
  t15 = 7 numbers from Lighting:GetAttributes, max|diff| <= 40, 3 strikes -> violation FireServer),
  Kz chain 25 names -> UoEx export (3 numeric keys), dispatcher v_u_99 (pre-encryption shot path).
- CameraLockGuard: client-side only, force-restores 2 props (numeric 0.5 + Enum),
  bypass-attribute via GetAttribute (name unknown — scan spies it), NO FireServer, no ban.
- Camera attrs: NONE (PF_info.txt). FOV base 70, zoom 63.636 (PF_cam.txt timeline).
- Character LocalScripts: CameraController, CameraLockGuard, ViewmodelController, StateController,
  ServerTypeController, SettingsApplier, ... (PF_info.txt).

## Overlap / implications for ultimate build
1. Both AIs use: attribute-based bypass, FOV/camera monitoring, lighting tolerance checks,
   heartbeat, report-code transport. LarpGuard transport is ENCRYPTED (S[..]+PRNG, UoEx) —
   report codes may be inside encrypted payload; scan v3 catches ANY B_XX/0xXX string on ANY remote
   (unencrypted pre-send).
2. FOV: if LarpGuard mirrors B_7B pattern, silent aimbot FOV changes must update the witness/attr.
   Scan v3 FOV timeline (4Hz) + ViewmodelController attr dump will confirm the pattern.
3. GUI: our menu is in PlayerGui (not CoreGui). Scan v3 GUI_SCANS section will show if game code
   enumerates PlayerGui with whitelist logic.
4. Executor globals: keep hook installs at init only (no hot-loop executor calls) — mirrors B_8x.
5. Lighting for v17: Fog/Bloom/ambience features are RISKY if LarpGuard mirrors the 5% monitor;
   color-integrity (7 numbers) is the confirmed one — scan v3 LIGHTING_ATTR_READS gives the names.

## Scan v3 captures (potato_last_scan.lua)
DISPATCHER (pre-enc calls + upvalues), ATTRS (player/char/Viewmodel), CAM (props+attrs+state),
KZ (tree + decompiles UoEx/rCnJ/Preload/crypto-winner), REMOTES (trees), LOOK (samples),
LIGHTING (props/attrs/reads), PROBE (shared global), AC_TRANSPORT (B_XX/0xXX + LoadingScreen),
GUI_SCANS (CoreGui/PlayerGui enumeration), FOV_TIMELINE (4Hz x 60s), CHANNELS, SHOTS,
DECOMP_FAILURES. Passive. DONE button / auto 300s -> clipboard + print.
