#!/usr/bin/env python3
import re, sys
SRC = '/home/user/uploads/amongushook_fallen.lua'
OUT = '/home/user/Burmalda.hook.fallen.src.lua'
PLACE = '112819027197869'
text = open(SRC, encoding='utf-8').read()

def rep(old, new, count=1):
    global text
    n = text.count(old)
    if n != count:
        raise SystemExit(f'anchor x{n} (want {count}): {old[:90]!r}')
    text = text.replace(old, new)

i = text.index(']]\n')
text = text[i+3:]
text = 'if getgenv().PHOOKGATE ~= 1347571535 then return end\ngetgenv().BURMALDA_ERROR = nil\n' + text
# env check: collect instead of kick
rep('''\t\telseif (not Arg1 or Arg3 and TypeOf(Arg1) ~= Arg3) then
\t\t\tLocalPlayer:Kick(`amongus.hook enviroment error getgenv().{Arg2} -> {Arg1}`)
\t\t\tTask.wait(9000000000)
\t\t\treturn
\t\tend''', '''\t\telseif (not Arg1 or Arg3 and TypeOf(Arg1) ~= Arg3) then
\t\t\tBH_MISSING[#BH_MISSING + 1] = ToString(Arg2)
\t\tend''')
rep('''\t\t\tFn(V2)
\t\t\tif not Arg2 then
\t\t\t\tif Pcall(function()
\t\t\t\t\tV.kick(V2)
\t\t\t\tend) then
\t\t\t\t\treturn
\t\t\t\tend
\t\t\t\twhile true do
\t\t\t\tend
\t\t\telse
\t\t\t\twhile true do
\t\t\t\tend
\t\t\tend
\t\tend''', '''\t\t\tFn(V2)
\t\t\tBH_FAIL(V2)
\t\t\treturn false
\t\tend''')
# globals for abort path, inserted before T table
rep('''if not Game:IsLoaded() then
\tGame.Loaded:Wait()
end
local T = {''', '''local BH_MISSING = {}
local function BH_FAIL(Arg1)
\tlocal V = "Burmalda.hook could not start: " .. ToString(Arg1)
\tPcall(function()
\t\tif not isfolder("Burmalda") then makefolder("Burmalda") end
\t\twritefile("Burmalda\\\\error.txt", V)
\tend)
\tPcall(setclipboard, V)
\tgetgenv().BURMALDA_ERROR = V
end
if not Game:IsLoaded() then
\tGame.Loaded:Wait()
end
local T = {''')
# after env check block: abort if missing
rep('''if not V4() then
\tV3.warn("Bypass not ran")
\treturn
end''', '''if #BH_MISSING > 0 then
\tBH_FAIL("executor is missing " .. Table.concat(BH_MISSING, ", "))
\treturn
end
if Game.PlaceId ~= ''' + PLACE + ''' then
\tBH_FAIL("wrong game")
\treturn
end
if not V4() then
\treturn
end''')
rep('''\treturn V2.kick("amongus.hook error (0)")''', '''\tBH_FAIL("no terrain")
\treturn''')
# branding / paths
rep('"amongus.hook / Error"', '"Burmalda.hook / Error"')
rep('"amongus.hook [FALLEN]"', '"Burmalda.hook"')
rep('title = Arg1.title or "amongus.hook"', 'title = Arg1.title or "Burmalda.hook"')
text = text.replace('"amongus.hook error (', '"Burmalda.hook error (')
rep('"amg_log.txt"', '"Burmalda\\\\log.txt"', 3)
text = text.replace('amghook\\\\fallen\\\\configs', 'Burmalda\\\\configs')
text = text.replace('"amghook/fallen/configs"', '"Burmalda/configs"')
text = text.replace('amghook\\\\fallen', 'Burmalda')
text = text.replace('amghook\\\\assets', 'Burmalda\\\\assets')
text = text.replace('"amghook"', '"Burmalda"')
text = text.replace('FromRGB(255, 42, 191)', 'FromRGB(86, 140, 255)')
assert 'amongus' not in text and 'amghook' not in text and 'aquabeary' not in text
assert not re.search(r'[^.\w]print\(|[^.\w]warn\(', text.replace('V3.warn', '').replace('V2.warn', '').replace('V.print', '').replace('V3.print', '').replace('V2.print', ''))
assert not any('\u0400' <= c <= '\u04ff' for c in text)
open(OUT, 'w', encoding='utf-8').write(text)
print('written', len(text))

def conv(m):
    body = m.group(1)
    parts, buf, i, depth = [], '', 0, 0
    while i < len(body):
        c = body[i]
        if c == '{':
            if buf: parts.append('"%s"' % buf); buf = ''
            j = body.index('}', i)
            parts.append('tostring(%s)' % body[i+1:j])
            i = j + 1
            continue
        buf += c; i += 1
    if buf: parts.append('"%s"' % buf)
    return '(' + ' .. '.join(parts) + ')'
def convert_all(t):
    out, i, n = [], 0, len(t)
    while i < n:
        c = t[i]
        if c in '"\'':
            j = i + 1
            while j < n and t[j] != c:
                j += 2 if t[j] == '\\' else 1
            out.append(t[i:j+1]); i = j + 1
        elif t.startswith('--', i):
            j = t.find('\n', i); j = n if j < 0 else j
            out.append(t[i:j]); i = j
        elif c == '`':
            j = t.index('`', i + 1)
            out.append(conv(re.match(r'`([^`]*)`', t[i:j+1]))); i = j + 1
        else:
            out.append(c); i += 1
    return ''.join(out)
text = convert_all(text)
text = text.replace('V14.ViewportSize // 2', 'V14.ViewportSize / 2')
text = text.replace('.Magnitude // 1)', '.Magnitude - .Magnitude % 1)') if False else text
text = text.replace('TargetHUD:setDistance((Target.silent.vector3 - Camera.CFrame.Position).Magnitude // 1)',
                    'TargetHUD:setDistance(math.floor((Target.silent.vector3 - Camera.CFrame.Position).Magnitude))')
assert ' // ' not in text
open(OUT, 'w', encoding='utf-8').write(text)
print('written', len(text))

# external assets instead of 900 KB inline base64
m = re.search(r'^(\t*)local T2 = \{\["hue\.png"\] = "iVBOR.*$', text, flags=re.M)
assert m and len(m.group(0)) > 800000
text = text[:m.start()] + m.group(1) + 'local T2 = {["hue.png"] = true, ["overlay.png"] = true, ["blank.png"] = true}' + text[m.end():]
rep('''\t\t\t\tif (not IsFile(V)) then
\t\t\t\t\tWriteFile(V, Base64Decode(Value))
\t\t\t\tend''', '''\t\t\t\tif (not IsFile(V)) then
\t\t\t\t\tlocal V2, V3 = Pcall(Game.HttpGet, Game, "https://raw.githubusercontent.com/pqnkdwqn9j-a11y/potatoh/refs/heads/main/" .. Key)
\t\t\t\t\tif (V2 and Type(V3) == "string" and #V3 > 100) then
\t\t\t\t\t\tPcall(WriteFile, V, V3)
\t\t\t\t\tend
\t\t\t\tend''')
open(OUT, 'w', encoding='utf-8').write(text)
print('final', len(text))
rep('\tV(Drawing2.new, "Drawing.new", "function")', '\tV(Drawing2 and Drawing2.new, "Drawing.new", "function")')
open(OUT, 'w', encoding='utf-8').write(text)
