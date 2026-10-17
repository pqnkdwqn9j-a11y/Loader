import subprocess, re, json, os, sys
from PIL import Image, ImageDraw, ImageFont

HOME = "/home/user"
P = HOME + "/auh/preview"
LUAU = HOME + "/.cache/tools/luau"
src = open(HOME + "/burmalda_loader_ui.lua").read()
src = src.replace('repeat task.wait(0.1) until getgenv().SCRIPT_KEY or getgenv().UI_CLOSED or state.closed\nif not getgenv().SCRIPT_KEY then\n\tgetgenv().UI_CLOSED = true\n\treturn\nend\n', '')
src = src.replace('\tif n == 2 then setLaunch("off"); task.defer', '\tif n == 2 then setLaunch("off") task.defer')
src += '\nTEST = { selBtn = selBtn, list = list, keyBox = keyBox, chkBtn = chkBtn, launchBtn = launchBtn, launchText = launchText, licL = licL, subL = subL, timerNums = timerNums, expL = expL, applyLang = applyLang, state = state, toastText = toastText, toast = toast, clockL = clockL, closeBtn = closeBtn, backBtn = backBtn, dcBtn = dcBtn, img = img, glow = glow, keyStroke = keyStroke, shieldIcon = shieldIcon, renderStatus = renderStatus }\n'
driver = r'''
local S = TEST
local gui = S.selBtn
while gui.Parent and gui.Parent.ClassName ~= "CoreGui" do gui = gui.Parent end
local function click(b) b.MouseButton1Click:Fire() end
S.img.ImageTransparency = 0 S.glow.ImageTransparency = 0.82
local function out(name) S.toast.BackgroundTransparency = 0 S.toastText.TextTransparency = 0 print("@@"..name.."@@"..DUMP(gui)) end
click(S.selBtn)
local items = S.list._children
local fallenItem, hvhItem
for _, ch in ipairs(items) do if ch.ClassName == "TextButton" then if hvhItem then fallenItem = ch else hvhItem = ch end end end
click(fallenItem)
out("state1")
click(hvhItem) FLUSH()
S.keyBox.Text = "wrong"
getgenv().BURMALDA_LOADER.notify("Invalid key. Check it and try again.", true)
S.keyStroke.Color = {224,108,108} TEST.renderStatus("bad")
S.licL.Text = "Invalid key" S.licL.TextColor3 = {224,108,108} S.shieldIcon.ImageColor3 = {224,108,108}
S.subL.Text = "Invalid key. Check it and try again."
out("state2")
S.keyBox.Text = "BURM-TEST-0001"
click(S.chkBtn)
getgenv().BURMALDA_LOADER.license(os.time() + 10*3600, "KEY_VALID", "foliver")
S.applyLang("ru")
out("state3")
'''
open(P + "/run.lua", "w").write(open(P + "/mock.lua").read() + src + driver)
res = subprocess.run([LUAU, P + "/run.lua"], capture_output=True, text=True)
if res.returncode != 0:
    print(res.stderr); sys.exit(1)
states = {}
for m in re.finditer(r'@@(\w+)@@(\{.*?\})(?=\n@@|\s*$)', res.stdout, re.S):
    states[m.group(1)] = json.loads(m.group(2))
sys.path.insert(0, P)
from render import render
ims = [render(states[k]) for k in ("state1", "state2", "state3")]
caps = ["1. Select script (fallen survival = in development)", "2. Wrong key -> Invalid key", "3. Key accepted -> License Active, timer, LAUNCH (RU)"]
W = ims[0].width; H = sum(i.height for i in ims) + 3 * 28
out = Image.new("RGB", (W, H), (20, 20, 20)); d = ImageDraw.Draw(out); f = ImageFont.truetype("/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf", 15)
y = 0
for im, c in zip(ims, caps):
    d.text((12, y + 6), c, font=f, fill=(200, 200, 200)); y += 28; out.paste(im, (0, y)); y += im.height
out.save(HOME + "/loader_lua_preview.png")
for i, im in enumerate(ims): im.save(f"{P}/state{i+1}.png")
print("ok", out.size)
