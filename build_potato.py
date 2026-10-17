import re

# ============ POTATO.HOOK — single build, no loader ============
# base: TungTungHook.lua (= message-10 menu engine verbatim
#        + merged friend-cheat combat layer + full ac shield)
fallen = open('TungTungHook.lua', encoding='utf-8').read()

n = fallen.count("TungTungHook")
fallen = fallen.replace("TungTungHook", "Potato")
print(f"brand: {n} refs -> Potato")

header = '''--[[
    ███████╗ ██████╗ ██████╗  ██████╗
    ██╔════╝██╔═══██╗██╔══██╗██╔═══██╗
    ███████╗██║   ██║██████╔╝██║   ██║
    ╚════██║██║   ██║██╔══██╗██║   ██║
    ███████║╚██████╔╝██████╔╝╚██████╔╝
    ╚══════╝ ╚═════╝ ╚═════╝  ╚═════╝
    .hook

    Potato.hook v1.0 foliver — Fallen Survival
    ------------------------------------------------
    • silent aim / killaura / skins / esp / minimap
    • packet layer: shot rewrite / force hit / fast hit / force pen
    • ac shield: report cut + lighting spoof + coregui filter
    • RightShift — menu
    ------------------------------------------------
]]

'''

final = header + fallen

# ============ VALIDATION ============
assert not re.search(r"[А-Яа-яЁё]", final), "CYRILLIC IN FINAL BUILD"
assert "TungTungHook" not in final, "OLD BRAND LEFT"
assert "kota" not in final.lower(), "KOTA BRAND LEFT"
assert "github_pat" not in final, "TOKEN LEFT"

# shields present
for probe in ["REPORT_REMOTE", "LoadingScreen", "0xR", "cgWhitelist"]:
    assert probe in final, "MISSING SHIELD PART: " + probe

# menu engine from file-1 present
for probe in ["NotificationList", "HighlightSpeed", "CategoryTransitionSpeed"]:
    assert probe in final, "MISSING MENU ENGINE PART: " + probe

# friend-cheat combat layer present
for probe in ["PacketSilent", "ForcePenetration", "FastHit", "ForceHit", "TTHShot"]:
    assert probe in final, "MISSING COMBAT FEATURE: " + probe

open('Potato.hook.lua', 'w', encoding='utf-8').write(final)
print("Potato.hook.lua:", final.count("\n") + 1, "lines,", len(final.encode('utf-8')), "bytes")
print("cyrillic: 0 | shields: ok | menu engine: ok | combat layer: ok")
