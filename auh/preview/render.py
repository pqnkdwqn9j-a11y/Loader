import json, sys, math
from PIL import Image, ImageDraw, ImageFont
import numpy as np

FONT_R = "/usr/share/fonts/truetype/dejavu/DejaVuSans.ttf"
FONT_B = "/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf"
IMAGES = {"burmalda_mascot.jpg": "/home/user/burmalda_mascot.jpg", "burmalda_icons.png": "/home/user/burmalda_icons.png", "burmalda_glow.png": "/home/user/burmalda_glow.png"}

def col(c, default=(255, 255, 255)):
    return tuple(int(x) for x in c) if c else default

def font(size, bold):
    return ImageFont.truetype(FONT_B if bold else FONT_R, max(6, int(round(size * 0.92))))

def render(tree, W=1000, H=640, bg=(26, 26, 26)):
    img = Image.new("RGBA", (W, H), bg + (255,))
    d = ImageDraw.Draw(img)
    for r in range(0, 700, 6):
        v = max(16, int(58 - r * 0.05))
        d.ellipse([W / 2 - r, H * 0.6 - r, W / 2 + r, H * 0.6 + r], outline=(v, v, v))
    layer = Image.new("RGBA", (W, H), (0, 0, 0, 0))

    def children_of(n, cls):
        return [c for c in n.get("children", []) if c.get("ClassName") == cls]

    def draw(n, px, py, pw, ph, scale, clip):
        if n.get("Visible") is False: return
        cls = n.get("ClassName")
        sz = n.get("Size", {"xs": 1, "xo": 0, "ys": 1, "yo": 0}); pos = n.get("Position", {"xs": 0, "xo": 0, "ys": 0, "yo": 0})
        ap = n.get("AnchorPoint", {"x": 0, "y": 0})
        if cls == "ScreenGui":
            w, h, x, y = W, H, 0, 0
        else:
            w = sz["xs"] * pw + sz["xo"] * scale; h = sz["ys"] * ph + sz["yo"] * scale
            x = px + pos["xs"] * pw + pos["xo"] * scale - ap["x"] * w
            y = py + pos["ys"] * ph + pos["yo"] * scale - ap["y"] * h
        for s in children_of(n, "UIScale"):
            sc = s.get("Scale", 1); scale = scale * sc
            cx, cy = x + ap["x"] * w, y + ap["y"] * h
            w, h = w * sc, h * sc; x, y = cx - ap["x"] * w, cy - ap["y"] * h
        box = (x, y, x + w, y + h)
        box_c = (max(box[0], clip[0]), max(box[1], clip[1]), min(box[2], clip[2]), min(box[3], clip[3])) if clip else box
        corner = 0
        for c in children_of(n, "UICorner"):
            cr = c.get("CornerRadius", {"s": 0, "o": 0}); corner = cr["o"] * scale + cr["s"] * min(w, h)
        ld = ImageDraw.Draw(layer)
        if cls in ("Frame", "TextButton", "TextLabel", "TextBox", "ImageLabel"):
            bt = n.get("BackgroundTransparency", 0)
            if bt < 1 and w > 0 and h > 0:
                c = col(n.get("BackgroundColor3"), (163, 162, 165)); a = int(255 * (1 - bt))
                grads = [g for g in children_of(n, "UIGradient") if g.get("Color")]
                if grads:
                    g = grads[0]; c1 = col(g["Color"]["cs"][0]); c2 = col(g["Color"]["cs"][1]); rot = g.get("Rotation", 0) % 360
                    iw, ih = max(1, int(w)), max(1, int(h))
                    ang = math.radians(rot); dx, dy = math.cos(ang), math.sin(ang)
                    xs = (np.arange(iw) / iw - 0.5)[None, :]; ys = (np.arange(ih) / ih - 0.5)[:, None]
                    t = np.clip(xs * dx + ys * dy + 0.5, 0, 1)
                    arr = np.zeros((ih, iw, 4), dtype="uint8")
                    for i in range(3):
                        arr[..., i] = (c[i] / 255 * (c1[i] * (1 - t) + c2[i] * t)).astype("uint8")
                    mk = Image.new("L", (iw, ih), 0); ImageDraw.Draw(mk).rounded_rectangle([0, 0, iw - 1, ih - 1], radius=corner, fill=255)
                    arr[..., 3] = (np.array(mk).astype("float") * a / 255).astype("uint8")
                    layer.alpha_composite(Image.fromarray(arr, "RGBA"), (int(x), int(y)))
                else:
                    ld.rounded_rectangle(box, radius=corner, fill=c + (a,))
            for s in children_of(n, "UIStroke"):
                st = s.get("Transparency", 0)
                if st < 1:
                    th = s.get("Thickness", 1) * scale
                    ld.rounded_rectangle(box, radius=corner, outline=col(s.get("Color")) + (int(255 * (1 - st)),), width=max(1, int(round(th))))
        if cls == "ImageLabel" and n.get("Image") and n.get("ImageTransparency", 0) < 1 and w > 0 and h > 0:
            fname = n["Image"].split("/")[-1]
            m = Image.open(IMAGES[fname]).convert("RGBA")
            ro, rs = n.get("ImageRectOffset"), n.get("ImageRectSize")
            if ro and rs and rs["x"] > 0:
                m = m.crop((int(ro["x"]), int(ro["y"]), int(ro["x"] + rs["x"]), int(ro["y"] + rs["y"])))
            tint = n.get("ImageColor3")
            if tint:
                tc = col(tint); px = m.split(); m = Image.merge("RGBA", [px[i].point(lambda v, k=tc[i]: int(v * k / 255)) for i in range(3)] + [px[3]])
            it = n.get("ImageTransparency", 0)
            if it > 0:
                m.putalpha(m.getchannel("A").point(lambda v: int(v * (1 - it))))
            if n.get("ScaleType") == "Fit":
                r = min(w / m.width, h / m.height); nw, nh = max(1, int(m.width * r)), max(1, int(m.height * r))
            else:
                nw, nh = max(1, int(w)), max(1, int(h))
            m = m.resize((nw, nh), Image.LANCZOS)
            for g in children_of(n, "UIGradient"):
                ks = g.get("Transparency")
                if ks:
                    tt = np.linspace(0, 1, nw); vv = np.interp(tt, [k[0] for k in ks], [k[1] for k in ks])
                    mask = np.tile(((1 - vv) * 255).astype("uint8")[None, :], (nh, 1))
                    m.putalpha(Image.fromarray((np.array(m.getchannel("A")).astype("float") * mask / 255).astype("uint8")))
            ox = int(x + (w - nw) / 2); oy = int(y + (h - nh) / 2)
            tmp = Image.new("RGBA", (W, H), (0, 0, 0, 0)); tmp.paste(m, (ox, oy), m)
            cm = Image.new("L", (W, H), 0); ImageDraw.Draw(cm).rectangle(box_c, fill=255)
            tmp.putalpha(Image.fromarray((np.array(tmp.getchannel("A")).astype("float") * np.array(cm) / 255).astype("uint8")))
            layer.alpha_composite(tmp)
        if cls in ("TextLabel", "TextButton", "TextBox"):
            txt = n.get("Text", "")
            tc = col(n.get("TextColor3"), (0, 0, 0))
            if cls == "TextBox" and txt == "":
                txt = n.get("PlaceholderText", ""); tc = col(n.get("PlaceholderColor3"), (120, 120, 120))
            tt = n.get("TextTransparency", 0)
            if txt and tt < 1:
                fn = n.get("Font") or ""
                fnt = font(n.get("TextSize", 14) * scale, ("Bold" in fn) or ("SemiBold" in fn))
                padl = padr = 0
                for p in children_of(n, "UIPadding"):
                    padl = p.get("PaddingLeft", {"o": 0})["o"] * scale; padr = p.get("PaddingRight", {"o": 0})["o"] * scale
                lines = txt.split("\n")
                lh = fnt.size * 1.25
                total = lh * len(lines)
                ya = n.get("TextYAlignment", "Center")
                ty = y + (h - total) / 2 if ya == "Center" else (y + 2 if ya == "Top" else y + h - total)
                for li, line in enumerate(lines):
                    tw = ld.textlength(line, font=fnt)
                    xa = n.get("TextXAlignment", "Center")
                    if n.get("TextTruncate") == "AtEnd":
                        while tw > w - padl - padr - 2 and len(line) > 1:
                            line = line[:-2] + "…"; tw = ld.textlength(line, font=fnt)
                    tx = x + padl if xa == "Left" else (x + w - padr - tw if xa == "Right" else x + (w - tw) / 2)
                    ld.text((tx, ty + li * lh), line, font=fnt, fill=tc + (int(255 * (1 - tt)),))
        newclip = box_c if n.get("ClipsDescendants") else clip
        for c in n.get("children", []):
            if c.get("ClassName") in ("UICorner", "UIStroke", "UIScale", "UIGradient", "UIPadding"): continue
            draw(c, x, y, w, h, scale, newclip)

    draw(tree, 0, 0, W, H, 1.0, None)
    img.alpha_composite(layer)
    return img.convert("RGB")

if __name__ == "__main__":
    tree = json.load(open(sys.argv[1]))
    render(tree).save(sys.argv[2])
    print("saved", sys.argv[2])
