#!/usr/bin/env python3
"""Assemble Potato.hook (AUH logic + Potato UI) from parts."""
import re, sys, os

ROOT = '/home/user/auh'
src = open(f'{ROOT}/auh_src.lua', encoding='utf-8').read().rstrip('\n').split('\n')
N = len(src)

def L(a, b):
    """1-based inclusive line range."""
    return src[a-1:b]

def expect(line_no, substring):
    text = src[line_no-1]
    if substring not in text:
        raise SystemExit(f'anchor mismatch at {line_no}: expected {substring!r}, got {text[:100]!r}')

def read(name):
    return open(f'{ROOT}/{name}', encoding='utf-8').read()

# ---- anchors ---------------------------------------------------------------
expect(13, 'local function __luraph_native')
expect(140, 'kick = function(Arg1)')
expect(160, 'end,')
expect(161, 'wasKicked = function()')
expect(167, 'V20[1] = (function()')
expect(180, 'end)()')
expect(425, 'local V24 = (function()')
expect(591, 'end)()')
expect(592, ';(function()')
expect(634, 'if not V24() then')
expect(637, 'end')
expect(1910, 'local V58 = (__luraph_native')
expect(1914, 'local V59, V60 = V57.windowClass.new')
expect(1915, 'local V61 = V57.boardClass.new')
expect(1916, 'local V62 = V57.targethudClass.new')
expect(2349, 'local V65 = (function()')
expect(2478, 'end)()')
expect(2479, 'local V66 = (function()')
expect(2519, 'end)()')
expect(2520, 'local V67 = (function()')
expect(3472, 'return function(Arg1)')
expect(3473, 'local GameModules = Arg1.gameModules')
expect(3487, 'end')
expect(3488, 'end)()')
expect(3821, 'local V = __luraph_native("Mr"')
expect(3822, 'local V2 = __luraph_native("Or"')
expect(3823, 'Spread.Hip = SetMetatable')
expect(3824, 'Spread.Aiming = SetMetatable')
expect(3840, 'local function Fn(Arg1, Arg2)')
expect(3853, 'end')
expect(3854, 'local function Fn3(Arg1, Arg2)')
expect(5071, 'local V3 = __luraph_native("p4"')
expect(5397, 'Replacemetamethod(Arg1, "__index", NewCClosure(__luraph_native')
expect(5398, 'Replacemetamethod(Arg1, "__newindex", NewCClosure(__luraph_native')
expect(N, 'V63.client.FULLY_LOADED = true')

out = []
def add(lines):
    if isinstance(lines, str):
        lines = lines.split('\n')
    out.extend(lines)

# ---- header -----------------------------------------------------------------
add('''--[[
	Potato.hook v1.2
	build: fallen / no-ac
]]
local PH_NOTIFY = nil
local PH_MISSING = {}
local PH_UI = {}
local PH_ESP_HEADLESS = true''')
add(L(14, 139))

# ---- kick -> warning only ------------------------------------------------------
add('''			kick = function(Arg1)
				Warn("[Potato.hook] internal check failed: " .. tostring(Arg1))
				if PH_NOTIFY then
					Pcall(PH_NOTIFY, "Internal check failed: " .. tostring(Arg1), 6, Color3.fromRGB(255, 80, 80))
				end
			end,''')
add(L(161, 166))

# ---- environment check -> collect missing functions -----------------------------
add('''V20[1] = (function()
	return function(Arg1, Arg2, Arg3)
		if (not Arg1 or Arg3 and TypeOf(Arg1) ~= Arg3) then
			PH_MISSING[#PH_MISSING + 1] = tostring(Arg2)
			Warn("[Potato.hook] executor is missing: " .. tostring(Arg2))
		end
	end
end)()''')
add(L(181, 424))
# V24 (anticheat bypass probe) removed entirely: 425-591
add(L(592, 633))
# "if not V24() ... end" removed: 634-637
add(L(638, 1909))

# ---- ESP library ------------------------------------------------------------------
add(read('esp_lib.lua').rstrip('\n'))
add(L(1911, 1913))

# ---- UI (Potato library + adapter) ------------------------------------------------
add('local V59, V60')
add('do')
ui_head = read('ui_head.lua').rstrip('\n')
ui_body = read('ui_body.lua').rstrip('\n')
adapter = read('adapter.lua').rstrip('\n')
add('\n'.join('\t' + l if l.strip() else l for l in ui_head.split('\n')))
add('\n'.join('\t' + l if l.strip() else l for l in ui_body.split('\n')))
add(adapter)
add('\t;(function()')
add(read('potato_esp.lua').rstrip('\n'))
add('\tend)()')
add('end')
add('V59 = PH_UI.window')
add('V60 = PH_UI.flags')
add('PH_NOTIFY = PH_UI.notify')
add('local V61 = PH_UI.keybindList')
add(L(1916, 2348))

# ---- V65: configs + hud toggles ------------------------------------------------------
add('''local V65 = (function()
	return function(Arg1)
		local Tabs = Arg1.tabs
		Tabs.ui:addConfigs(1)
		Tabs.ui:addToggle({flag = "targetHud_toggle", text = "target hud", default = false}, 2)
		Tabs.ui:addToggle({flag = "keybindList_toggle", text = "keybind list", default = false}, 2)
	end
end)()''')

# ---- V66: target hud follows menu state (no dark overlay) -------------------------------
add('''local V66 = (function()
	return function(Arg1)
		local function Fn(Arg1_2)
			if (not Arg1_2) then
				Arg1.targetHUD:toggle(false)
				return
			end
			Arg1.targetHUD:toggle(Arg1.flags.targetHud_toggle.value)
		end
		Arg1.window:onToggle(Fn)
		Fn(Arg1.window.active)
	end
end)()''')
add(L(2520, 3471))

# ---- V75 anticheat probe -> always ok ------------------------------------------------------
add('''		return function(Arg1)
			return true
		end''')
add(L(3488, 3820))

# ---- spread override -----------------------------------------------------------------------------
add('''					local HipSpread = Spread.Hip
					local AimSpread = Spread.Aiming
					local function ScaleSpread(Source)
						return function(_, Key)
							local Value = Source[Key]
							if (Type(Value) == "number") then
								return Value * (Flags.gunMods_spreadPercentage.value / 100)
							end
							return Value
						end
					end
					Spread.Hip = SetMetatable({}, {__metatable = "", __index = ScaleSpread(HipSpread)})
					Spread.Aiming = SetMetatable({}, {__metatable = "", __index = ScaleSpread(AimSpread)})''')
add(L(3825, 3839))

# ---- recoil start/finish wrappers -------------------------------------------------------------
add('''				local function Fn(...)
					local V2 = RecoilStart(...)
					if (Type(V2) == "number") then
						return V2 * (Flags.gunMods_recoilPercentage.value / 100)
					end
					return V2
				end
				local function Fn2(...)
					local V2 = RecoilFinish(...)
					if (Type(V2) == "number") then
						return V2 * (Flags.gunMods_recoilPercentage.value / 100)
					end
					return V2
				end''')
add(L(3854, 5070))

# ---- xray helper -------------------------------------------------------------------------------------
add('''				local function V3(Value)
					local function Register(Part)
						if (not Part:IsA("BasePart") or T2[Part] ~= nil) then
							return
						end
						T2[Part] = Part.Transparency
						T[#T + 1] = Part
						if (Flags.xray_toggle.value) then
							Part.Transparency = Flags.xray_transparency.value / 100
						end
					end
					Register(Value)
					for _, Descendant in Value:GetDescendants() do
						Register(Descendant)
					end
					Value.DescendantAdded:Connect(Register)
				end''')
add(L(5072, 5396))
# chams metamethod spoofing removed: 5397-5398
add(L(5399, N))

# ---- finishing --------------------------------------------------------------------------------
add('''PH_UI.finish()
if (#PH_MISSING > 0) then
	PH_UI.notify("Executor is missing: " .. Table.concat(PH_MISSING, ", "), 8, Color3.fromRGB(255, 165, 0))
end''')
add(read('potato_aimbot.lua').rstrip('\n'))

text = '\n'.join(out)

# ---- branding / paths ----------------------------------------------------------------------
text = text.replace('''		for Index = 2, #Players2 do
			PlayerESP.new(Players2[Index])''', '''		for Index = 1, #Players2 do
			PlayerESP.new(Players2[Index])''')
# drop embedded PNG assets (hue/overlay/blank) - only used by the unused native colourpicker
import re as _re
_m = _re.search(r'^(\t*)local T2 = \{\["hue\.png"\] = "iVBOR.*$', text, flags=_re.M)
assert _m and len(_m.group(0)) > 800000, 'asset line not found'
text = text[:_m.start()] + _m.group(1) + 'local T2 = {}' + text[_m.end():]
text = text.replace('amongus.hook [FALLEN]', 'Potato.hook')
text = text.replace('amongus.hook', 'Potato.hook')
text = text.replace('amghook\\\\assets', 'Potato\\\\Assets')
text = text.replace('"amghook"', '"Potato"')
text = text.replace('amghook', 'Potato')

# ---- fork compatibility --------------------------------------------------------------------
import sys as _sys0
_sys0.path.insert(0, ROOT)
from fork_patch import apply as _fork_apply
text = _fork_apply(text)
text = text.replace('Potato.hook', 'aquabeary')

# sanity
for bad in ['__luraph_native', 'deobf', 'Luraph', 'amongus', 'amghook']:
    if bad in text:
        idx = text.index(bad)
        raise SystemExit(f'leftover {bad!r} near: {text[idx-80:idx+80]!r}')

import sys as _sys
_sys.path.insert(0, ROOT)
from deluau import convert_backticks
text = convert_backticks(text)
text = text.replace('V19.ViewportSize // 2', 'V19.ViewportSize / 2')
text = text.replace('TargetHUD:setDistance((Target.silent.vector3 - Camera.CFrame.Position).Magnitude // 1)',
                    'TargetHUD:setDistance(math.floor((Target.silent.vector3 - Camera.CFrame.Position).Magnitude))')
assert ' // ' not in text and text.count('`') == 3
# cyrillic check
assert not any('\u0400' <= ch <= '\u04ff' for ch in text), 'cyrillic found'
# split top-level locals into two function scopes (Luau limit: 200 locals per function)
_marker = '\nif not Game:IsLoaded() then\n'
assert text.count(_marker) == 1, 'split marker'
_i = text.index(_marker)
text = text[:_i] + '\n;(function(...)' + text[_i:] + '\nend)(...)'
open(f'{ROOT}/Potato.hook.fallen.src.lua', 'w', encoding='utf-8').write(text + '\n')
# gated variant: only runs when started through the protected JNKIE loader (same gate as build 19)
GATE = """do
	local __g = (getgenv and getgenv()) or _G
	if tostring(__g.PHOOKGATE) ~= "1347571535" then return end
	__g.PHOOKGATE = nil
	pcall(function()
		local s = game:HttpGet("https://raw.githubusercontent.com/pqnkdwqn9j-a11y/potatoh/refs/heads/main/status.txt")
		if type(s) == "string" and (s:gsub("%s+", "")) ~= "ok" then
			__g.PHOOKKILL = true
		end
	end)
	if __g.PHOOKKILL then return end
	if __g.__PHOOK_RUNNING then
		__g.__PHOOK_STAGE = "already"
		pcall(function()
			game:GetService("StarterGui"):SetCore("SendNotification", {
				Title = "aquabeary",
				Text = "Already running. Press RightShift to open the menu.",
				Duration = 5,
			})
		end)
		return
	end
	__g.__PHOOK_RUNNING = true
	__g.__PHOOK_STAGE = "gate"
end
"""
open(f'{ROOT}/Potato.hook.fallen.gate.src.lua', 'w', encoding='utf-8').write(GATE + text + '\n')
print('lines', text.count('\n') + 1, 'bytes', len(text.encode()))
