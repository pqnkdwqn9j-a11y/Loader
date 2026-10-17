(function () {
  var $ = function (s, r) { return (r || document).querySelector(s); };
  var S = {}; // feature state
  var PAGES = {
    combat: { t: "Combat", s: "aimbot, fov, crosshair", g: [
      { h: "Aimbot", master: "aim", r: [
        ["t", "Enabled", "aim", true],
        ["seg", "Mode", "aim_mode", ["Smooth", "Snap"], 0],
        ["s", "Smoothness", "aim_smooth", 1, 20, 6, "", "lower = faster"],
        ["k", "Aim key", "aim_key", "MB2"],
        ["t", "Always target", "aim_always", false, "works without a key"],
        ["t", "Visibility check", "aim_vis", true],
        ["d", "Hit part", "aim_part", ["Head", "UpperTorso", "LowerTorso"], 0],
        ["t", "Target players", "aim_pl", true], ["t", "Target AI", "aim_ai", false], ["t", "Target bosses", "aim_boss", false],
      ] },
      { h: "FOV", master: "fov", r: [
        ["t", "Visualize FOV", "fov", true],
        ["t", "Dynamic radius", "fov_dyn", true],
        ["s", "Radius", "fov_r", 20, 300, 110, "px"],
        ["c", "Color", "fov_c", "#2f9bff"], ["c", "Target color", "fov_tc", "#e06c6c"],
        ["prev"],
      ] },
      { h: "Crosshair", master: "ch", r: [
        ["t", "Crosshair", "ch", true],
        ["s", "Size", "ch_size", 1, 30, 8, "px"], ["s", "Gap", "ch_gap", 0, 20, 4, "px"], ["s", "Width", "ch_w", 1, 6, 1.5, "px", "", 0.5],
        ["c", "Color", "ch_c", "#ffffff"], ["c", "Outline", "ch_oc", "#000000"],
      ] },
      { h: "Armor viewer", master: "av", r: [
        ["t", "Enabled", "av", true, "shows target armor + weapon"],
        ["d", "Position", "av_pos", ["Top right", "Top left", "Bottom"], 0],
        ["s", "Scale", "av_sc", 50, 150, 100, "%"],
      ] },
    ] },
    esp: { t: "Players ESP", s: "players, ai, bosses", g: [
      { h: "Main", master: "esp", r: [
        ["t", "Enabled", "esp", true], ["t", "Bounding box", "esp_box", true], ["d", "Box type", "esp_boxt", ["2D", "Corner", "3D"], 1],
        ["t", "Skeleton", "esp_skel", false], ["t", "Name", "esp_name", true], ["t", "Distance", "esp_dist", true],
        ["t", "Health bar", "esp_hp", true], ["t", "Only if damaged", "esp_hpd", false], ["t", "Weapon image", "esp_wimg", true],
        ["s", "Max distance", "esp_maxd", 50, 2000, 600, "m"],
      ] },
      { h: "Chams", master: "chams", r: [
        ["t", "Enabled", "chams", true], ["d", "Style", "chams_st", ["Flat", "Outline", "Glow"], 2],
        ["c", "Visible", "chams_v", "#2f9bff"], ["c", "Occluded", "chams_o", "#8a4bff"], ["s", "Refresh rate", "chams_rr", 1, 60, 20, "hz"],
      ] },
      { h: "Colors", r: [
        ["c", "Visible", "esp_cv", "#ffffff"], ["c", "Occluded", "esp_co", "#8b8b96"], ["c", "Teammate", "esp_ct", "#3fbf7f"],
        ["c", "Low health", "esp_cl", "#e06c6c"], ["c", "High health", "esp_ch", "#3fbf7f"],
      ] },
      { h: "Tracers / Offscreen", master: "trc", r: [
        ["t", "Tracers", "trc", false], ["t", "Teammate tracers", "trc_tm", false], ["t", "Offscreen arrows", "oa", true],
        ["s", "Arrow size", "oa_s", 4, 30, 12, "px"], ["s", "Arrow radius", "oa_r", 50, 500, 220, "px"],
      ] },
      { h: "Flags", r: [
        ["t", "VIP / Staff", "fl_vip", true], ["t", "Clan", "fl_clan", true], ["t", "Aiming", "fl_aim", true], ["t", "Healing", "fl_heal", true], ["t", "Reloading", "fl_rel", true], ["t", "Safezone", "fl_sz", false],
      ] },
      { h: "Smart ESP", r: [
        ["t", "Fade near crosshair", "sm_fade", true], ["s", "Fade radius", "sm_r", 20, 300, 90, "px"], ["k", "Combat hide key", "sm_key", "NONE"],
        ["t", "Lock-on indicator", "lock", true], ["s", "Danger threshold", "lock_d", 1, 90, 15, "°"],
      ] },
    ] },
    world: { t: "World ESP", s: "resources, raids, bases", g: [
      { h: "Resources", r: [["t", "Nodes", "w_nodes", true], ["t", "Stone", "w_stone", true], ["t", "Metal", "w_metal", true], ["t", "Sulfur", "w_sulf", true], ["t", "Phosphate", "w_phos", false], ["s", "Max distance", "w_maxd", 50, 1000, 300, "m"]] },
      { h: "Events", r: [["t", "Care packages", "w_care", true], ["t", "Timed crates", "w_crate", true], ["t", "Raids", "w_raid", true], ["c", "Raid color", "w_raidc", "#e06c6c"]] },
      { h: "Structures", r: [["t", "Bases", "w_base", true], ["t", "Benches", "w_bench", false], ["t", "Locks", "w_lock", false], ["t", "Building", "w_build", false]] },
      { h: "Players items", r: [["t", "Body bags", "w_bag", true], ["t", "Sleepers", "w_sleep", true], ["t", "Tools", "w_tool", false], ["t", "Looting", "w_loot", true]] },
    ] },
    visuals: { t: "Visuals", s: "camera, world, viewmodel", g: [
      { h: "Camera", r: [["t", "Zoom", "v_zoom", true], ["s", "Zoom level", "v_zl", 1, 8, 3, "x", "", 0.5], ["k", "Zoom key", "v_zk", "C"], ["t", "Custom FOV", "v_fov", true], ["s", "Field of view", "v_fovv", 70, 105, 95, "°"], ["t", "Remove bobbing", "v_bob", true], ["t", "Camera effects", "v_fx", false]] },
      { h: "World", r: [["t", "Fullbright", "v_fb", false], ["s", "Brightness", "v_br", 0, 10, 2, ""], ["c", "Ambient", "v_amb", "#9aa6ff"], ["t", "XRay", "v_xr", false], ["s", "XRay transparency", "v_xrt", 0, 100, 60, "%"], ["k", "XRay key", "v_xrk", "X"], ["t", "Remove grass", "v_gr", true], ["t", "Remove fog", "v_fog", true], ["t", "Bloom", "v_bl", false]] },
      { h: "Sky", r: [["t", "Skybox", "v_sky", true], ["d", "Preset", "v_skyp", ["Night", "Purple", "Space", "Clean"], 2], ["s", "Star count", "v_stars", 0, 5000, 3000, ""], ["t", "Change time", "v_time", true], ["s", "Time", "v_timev", 0, 24, 21, "h"]] },
      { h: "Hitmarkers", master: "hm", r: [["t", "Enabled", "hm", true], ["d", "Hit sound", "hm_s", ["Default", "Bubble", "Rust", "Bell"], 2], ["d", "Headshot sound", "hm_hs", ["Default", "Bubble", "Rust", "Bell"], 3], ["s", "Volume", "hm_v", 0, 100, 60, "%"]] },
      { h: "Viewmodel", r: [["t", "Remove sleeves", "vm_sl", true], ["t", "Highlight arms", "vm_hl", true], ["c", "Fill", "vm_f", "#2f9bff"], ["c", "Outline", "vm_o", "#ffffff"], ["s", "Rotation", "vm_rot", -45, 45, 0, "°"], ["t", "Random rotation", "vm_rr", false]] },
      { h: "Tracers", master: "bt", r: [["t", "Bullet tracers", "bt", true], ["s", "Lifetime", "bt_l", 0.1, 3, 0.8, "s", "", 0.1], ["s", "Speed", "bt_s", 1, 10, 4, ""], ["c", "Color", "bt_c", "#2f9bff"]] },
    ] },
    skins: { t: "Skins", s: "skin changer", g: [
      { h: "Skin changer", master: "sk", r: [["t", "Enabled", "sk", true], ["t", "Sandbox armor models", "sk_arm", false], ["t", "Show weapon image", "sk_img", true]] },
      { h: "Weapons", r: [["d", "AK-47", "sk_ak", ["Default", "Glory", "Tempered", "Frostbite", "Neon"], 3], ["d", "LR-300", "sk_lr", ["Default", "Carbon", "Blackout"], 1], ["d", "MP5", "sk_mp5", ["Default", "Alien Red", "Tempered"], 2], ["d", "Python", "sk_py", ["Default", "Gold", "Blackout"], 1], ["d", "Bolt rifle", "sk_bolt", ["Default", "Arctic", "Dragon"], 2]] },
      { h: "Armor", r: [["d", "Chestplate", "sk_ch", ["Default", "Gold", "Dark", "Ice"], 1], ["d", "Helmet", "sk_he", ["Default", "Gold", "Dark"], 2], ["d", "Hazmat", "sk_hz", ["Default", "Arctic", "Space"], 0]] },
    ] },
    misc: { t: "Misc", s: "sound, movement helpers", g: [
      { h: "Sound", r: [["s", "Master volume", "m_mv", 0, 100, 80, "%"], ["s", "Hit volume", "m_hv", 0, 100, 60, "%"], ["s", "Headshot volume", "m_hsv", 0, 100, 70, "%"], ["t", "Silent step", "m_ss", true]] },
      { h: "Hotkeys panel", master: "hk", r: [["t", "Enabled", "hk", true], ["d", "Position", "hk_pos", ["Left", "Right"], 0], ["t", "Show inactive", "hk_in", false]] },
      { h: "Moderator panel", r: [["t", "Enabled", "mod", true, "warns when staff joins"], ["t", "Sound alert", "mod_s", true], ["b", "Test alert", "mod_t", "TEST"]] },
    ] },
    settings: { t: "Settings", s: "configs, hud, keybinds", g: [
      { h: "Configs", cfgs: true },
      { h: "Interface", r: [["k", "Menu key", "ui_key", "RSHIFT"], ["t", "Watermark", "ui_wm", true], ["t", "Notifications", "ui_nt", true], ["d", "Accent", "ui_ac", ["Blue", "Purple", "Red", "Green", "Orange"], 0], ["s", "Menu scale", "ui_sc", 70, 120, 100, "%"], ["t", "Animations", "ui_an", true], ["t", "UI sounds", "ui_snd", true], ["b", "Reset position", "rst", "RESET"]] },
      { h: "Info", r: [["info", "Build", "1.0 beta"], ["info", "Game", "aquabeary-hvh"], ["info", "License", "lifetime"], ["b", "Discord", "dsc", "COPY INVITE"], ["b", "Unload", "unl", "UNLOAD", "dan"]] },
    ] },
  };
  var ACC = { Blue: ["#2f9bff", "#1978dc"], Purple: ["#9b6bff", "#6f3fe0"], Red: ["#ff5c6c", "#d63a4a"], Green: ["#3fd38a", "#1fa866"], Orange: ["#ffa23a", "#e0761a"] };

  function note(html) {
    var n = document.createElement("div"); n.className = "note"; n.innerHTML = html + '<span class="pb"></span>';
    $("#notes").appendChild(n); setTimeout(function () { n.className = "note out"; setTimeout(function () { n.remove(); }, 300); }, 2600);
  }
  function ripple(el, e) {
    var r = el.getBoundingClientRect(), d = Math.max(r.width, r.height), s = document.createElement("span"); s.className = "rip";
    var sc = cur_scale(); s.style.cssText = "width:" + d + "px;height:" + d + "px;left:" + ((e.clientX - r.left) / sc - d / 2) + "px;top:" + ((e.clientY - r.top) / sc - d / 2) + "px";
    el.appendChild(s); setTimeout(function () { s.remove(); }, 500);
  }
  function burst(sw) { for (var i = 0; i < 6; i++) { var p = document.createElement("i"); p.className = "sp"; var a = (i / 6) * Math.PI * 2; p.style.setProperty("--dx", Math.cos(a) * 18 + "px"); p.style.setProperty("--dy", Math.sin(a) * 18 + "px"); sw.appendChild(p); } setTimeout(function () { sw.querySelectorAll(".sp").forEach(function (x) { x.remove(); }); }, 500); }
  function el(h) { var d = document.createElement("div"); d.innerHTML = h; return d.firstElementChild; }
  function fmt(v, step) { return step && step < 1 ? v.toFixed(1) : Math.round(v); }

  var keyLis = null;
  function mkRow(r, gb) {
    var k = r[0], row;
    if (k === "t") {
      row = el('<div class="row" data-q="' + r[1] + '"><div class="lb">' + r[1] + (r[4] ? "<small>" + r[4] + "</small>" : "") + '</div><div class="sw' + (r[3] ? " on" : "") + '"></div></div>');
      S[r[2]] = r[3];
      $(".sw", row).onclick = function (e) { S[r[2]] = !S[r[2]]; this.classList.toggle("on", S[r[2]]); burst(this); snd(S[r[2]] ? "on" : "off"); row.classList.remove("flash"); void row.offsetWidth; row.classList.add("flash"); note("<b>" + r[1] + "</b> " + (S[r[2]] ? "enabled" : "disabled")); if (gb.master === r[2]) gb.el.style.opacity = S[r[2]] ? 1 : .55; sync(); };
    } else if (k === "s") {
      var min = r[3], max = r[4], step = r[8] || 1, unit = r[6] || "";
      S[r[2]] = r[5];
      row = el('<div class="row sl" data-q="' + r[1] + '"><div class="lb">' + r[1] + (r[7] ? "<small>" + r[7] + "</small>" : "") + '</div><div class="val"></div><div class="sld"><div class="tr"><div class="fl"></div></div><div class="th"></div><div class="bub"></div></div></div>');
      var sld = $(".sld", row), fl = $(".fl", row), th = $(".th", row), bub = $(".bub", row), val = $(".val", row);
      function set(v, silent) {
        v = Math.min(max, Math.max(min, Math.round(v / step) * step)); S[r[2]] = v; val.classList.remove("tick"); void val.offsetWidth; val.classList.add("tick");
        var p = (v - min) / (max - min) * 100; fl.style.width = p + "%"; th.style.left = bub.style.left = p + "%"; val.textContent = bub.textContent = fmt(v, step) + unit;
        if (!silent) sync();
      }
      function fromEvent(e) { var p = e.touches ? e.touches[0] : e, rc = sld.getBoundingClientRect(); set(min + (p.clientX - rc.left) / rc.width * (max - min)); }
      function down(e) { sld.classList.add("drag"); fromEvent(e); e.preventDefault(); var mv = function (e) { fromEvent(e); }, up = function () { sld.classList.remove("drag"); window.removeEventListener("mousemove", mv); window.removeEventListener("touchmove", mv); window.removeEventListener("mouseup", up); window.removeEventListener("touchend", up); }; window.addEventListener("mousemove", mv); window.addEventListener("touchmove", mv, { passive: false }); window.addEventListener("mouseup", up); window.addEventListener("touchend", up); }
      sld.addEventListener("mousedown", down); sld.addEventListener("touchstart", down, { passive: false });
      sld.addEventListener("wheel", function (e) { e.preventDefault(); set(S[r[2]] + (e.deltaY < 0 ? step : -step)); }, { passive: false });
      set(r[5], true);
    } else if (k === "d") {
      S[r[2]] = r[3][r[4]];
      row = el('<div class="row" data-q="' + r[1] + '"><div class="lb">' + r[1] + '</div><div class="dd"><div class="cur">' + r[3][r[4]] + '</div><div class="ls"></div></div></div>');
      var dd = $(".dd", row), ls = $(".ls", row), curr = $(".cur", row);
      r[3].forEach(function (o, i) { var it = el("<div" + (i === r[4] ? ' class="on"' : "") + ">" + o + "</div>"); it.onclick = function (e) { e.stopPropagation(); snd("click"); S[r[2]] = o; curr.textContent = o; ls.querySelectorAll("div").forEach(function (x) { x.classList.toggle("on", x === it); }); dd.classList.remove("open"); note("<b>" + r[1] + "</b>: " + o); sync(); }; ls.appendChild(it); });
      curr.onclick = function (e) { e.stopPropagation(); closeAll(dd); dd.classList.toggle("open"); };
    } else if (k === "k") {
      S[r[2]] = r[3];
      row = el('<div class="row" data-q="' + r[1] + '"><div class="lb">' + r[1] + '</div><div class="kb">' + r[3] + '</div></div>');
      var kb = $(".kb", row);
      kb.onclick = function (e) { e.stopPropagation(); if (keyLis) keyLis.el.classList.remove("lis"); keyLis = { el: kb, id: r[2], name: r[1] }; kb.classList.add("lis"); kb.textContent = "..."; };
      kb.onmousedown = function (e) { if (keyLis && keyLis.el === kb && e.button !== 0) { e.preventDefault(); setKey(e.button === 2 ? "MB2" : "MB" + (e.button + 1)); } };
    } else if (k === "c") {
      S[r[2]] = r[3];
      row = el('<div class="row" data-q="' + r[1] + '"><div class="lb">' + r[1] + '</div><div class="cp" style="background:' + r[3] + '"><div class="pop"><input type="range" class="hue" min="0" max="360" value="0"><input type="range" class="sat" min="0" max="100" value="100"><input type="range" class="lig" min="0" max="100" value="60" style="background:linear-gradient(90deg,#000,#fff)"><div class="pv"><b></b><span></span></div></div></div></div>');
      var cp = $(".cp", row), hue = $(".hue", row), sat = $(".sat", row), lig = $(".lig", row), pv = $(".pv b", row), pt = $(".pv span", row);
      var hsl = hexToHsl(r[3]); hue.value = hsl[0]; sat.value = hsl[1]; lig.value = hsl[2];
      function upd() { var c = "hsl(" + hue.value + "," + sat.value + "%," + lig.value + "%)"; cp.style.background = c; pv.style.background = c; pt.textContent = hslToHex(+hue.value, +sat.value, +lig.value).toUpperCase(); cp.style.setProperty("--c", "hsl(" + hue.value + ",100%,50%)"); S[r[2]] = pt.textContent; sync(); }
      [hue, sat, lig].forEach(function (i) { i.oninput = upd; i.onclick = function (e) { e.stopPropagation(); }; i.onmousedown = function (e) { e.stopPropagation(); }; });
      upd();
      cp.onclick = function (e) { if (e.target !== cp) return; e.stopPropagation(); closeAll(cp); cp.classList.toggle("open"); };
    } else if (k === "b") {
      row = el('<div class="row" data-q="' + r[1] + '"><div class="lb">' + r[1] + '</div><button class="btn ' + (r[4] || "") + '">' + r[3] + '</button></div>');
      $(".btn", row).onclick = function (e) { ripple(this, e); snd("click"); if (r[2] === "rst") { menu.style.marginLeft = menu.style.marginTop = "0px"; note("Position reset"); return; } if (r[2] === "unl") { note("<b>Burmalda.hook</b> unloaded"); setTimeout(hide, 600); } else if (r[2] === "dsc") note("Discord invite <b>copied</b>"); else if (r[2] === "mod_t") note("<b>Moderator</b> joined: <b>ExampleMod</b>"); else note("<b>" + r[1] + "</b>"); };
    } else if (k === "seg") {
      S[r[2]] = r[3][r[4]];
      row = el('<div class="row" data-q="' + r[1] + '"><div class="lb">' + r[1] + '</div><div class="seg"></div></div>');
      var seg = $(".seg", row);
      r[3].forEach(function (o, i) { var it = el("<div" + (i === r[4] ? ' class="on"' : "") + ">" + o + "</div>"); it.onclick = function () { S[r[2]] = o; seg.querySelectorAll("div").forEach(function (x) { x.classList.toggle("on", x === it); }); sync(); }; seg.appendChild(it); });
    } else if (k === "info") {
      row = el('<div class="row" data-q="' + r[1] + '"><div class="lb">' + r[1] + '</div><span class="tag">' + r[2] + '</span></div>');
    } else if (k === "prev") {
      row = el('<div class="prev" id="fovprev"><div class="fov"></div><div class="ch"></div><div class="box"></div></div>');
    }
    return row;
  }
  function closeAll(except) { document.querySelectorAll(".dd.open,.cp.open").forEach(function (d) { if (d !== except) d.classList.remove("open"); }); }
  document.addEventListener("click", function () { closeAll(); if (keyLis) { keyLis.el.classList.remove("lis"); keyLis.el.textContent = S[keyLis.id]; keyLis = null; } });
  function setKey(name) { if (!keyLis) return; S[keyLis.id] = name; keyLis.el.textContent = name; keyLis.el.classList.remove("lis"); var ke = keyLis.el; ke.classList.add("got"); setTimeout(function () { ke.classList.remove("got"); }, 500); note("<b>" + keyLis.name + "</b> bound to <b>" + name + "</b>"); keyLis = null; }

  function mkCfgs(gb) {
    var box = el('<div></div>');
    box.appendChild(el('<div class="row"><input class="inp" id="cfgname" placeholder="config name"><button class="btn pri" id="cfgsave">SAVE</button></div>'));
    var lst = el('<div id="cfglist"></div>'); box.appendChild(lst);
    var cfgs = [["legit", "today 14:02"], ["rage hvh", "yesterday"], ["esp only", "3 days ago"]];
    function render() {
      lst.innerHTML = "";
      cfgs.forEach(function (c, i) {
        var it = el('<div class="cfg"><div class="ic">' + c[0][0].toUpperCase() + '</div><div class="meta">' + c[0] + '<small>' + c[1] + '</small></div><button class="btn">LOAD</button><button class="btn dan">DEL</button></div>');
        it.querySelectorAll(".btn")[0].onclick = function (e) { ripple(this, e); note("Config <b>" + c[0] + "</b> loaded"); };
        it.querySelectorAll(".btn")[1].onclick = function (e) { ripple(this, e); cfgs.splice(i, 1); it.style.transition = "all .25s"; it.style.opacity = 0; it.style.transform = "translateX(20px)"; setTimeout(render, 250); note("Config <b>" + c[0] + "</b> deleted"); };
        lst.appendChild(it);
      });
    }
    $("#cfgsave", box).onclick = function (e) { ripple(this, e); var n = $("#cfgname", box).value.trim() || "config " + (cfgs.length + 1); cfgs.unshift([n, "just now"]); $("#cfgname", box).value = ""; render(); note("Config <b>" + n + "</b> saved"); };
    render(); return box;
  }

  var pages = $("#pages");
  Object.keys(PAGES).forEach(function (id) {
    var p = PAGES[id], pg = el('<div class="page" id="p-' + id + '"></div>');
    var cols = el('<div class="cols"><div></div><div></div></div>'), hs = [0, 0];
    p.g.forEach(function (gb) {
      var g = el('<div class="gb' + (gb.cfgs ? " wide" : "") + '"><h3>' + gb.h + '</h3></div>'); gb.el = g;
      if (gb.cfgs) g.appendChild(mkCfgs(gb)); else gb.r.forEach(function (r) { g.appendChild(mkRow(r, gb)); });
      if (gb.master && !S[gb.master]) g.style.opacity = .55;
      if (gb.cfgs) { pg.appendChild(g); return; }
      var est = 46 + gb.r.reduce(function (a, r) { return a + (r[0] === "s" ? 52 : r[0] === "prev" ? 136 : 36); }, 0);
      var ci = hs[0] <= hs[1] ? 0 : 1; hs[ci] += est + 16; cols.children[ci].appendChild(g);
    });
    pg.appendChild(cols);
    pages.appendChild(pg);
  });
  $("#p-combat").classList.add("on");

  var tabs = document.querySelectorAll(".tab"), ind = $("#ind"), curTab = 0;
  tabs.forEach(function (t, i) {
    t.onclick = function () {
      snd("tab"); tabs.forEach(function (x) { x.classList.remove("on"); }); t.classList.add("on"); ind.style.top = (12 + i * 42) + "px";
      var id = t.getAttribute("data-p"), p = PAGES[id], dir = i > curTab ? "down" : "up"; curTab = i;
      document.querySelectorAll(".page").forEach(function (x) { x.classList.remove("on", "down", "up"); });
      var pg = $("#p-" + id); void pg.offsetWidth; pg.classList.add("on", dir);
      var h = $("#ptitle"); h.classList.remove("swap"); void h.offsetWidth; h.classList.add("swap");
      h.childNodes[0].textContent = p.t; $("#psub").textContent = p.s;
      var sv = t.querySelector("svg"); sv.classList.remove("pop"); void sv.offsetWidth; sv.classList.add("pop");
    };
  });

  $("#q").oninput = function () {
    var q = this.value.trim().toLowerCase();
    document.querySelectorAll(".row[data-q]").forEach(function (r) { r.classList.toggle("hide", !!q && r.getAttribute("data-q").toLowerCase().indexOf(q) < 0); });
    document.querySelectorAll(".gb").forEach(function (g) { var vis = g.querySelectorAll(".row[data-q]:not(.hide)").length; g.style.display = (!q || vis) ? "" : "none"; });
    if (q) { var first = document.querySelector(".row[data-q]:not(.hide)"); if (first) { var pid = first.closest(".page").id.slice(2); var t = document.querySelector('.tab[data-p="' + pid + '"]'); if (!t.classList.contains("on")) t.click(); } }
  };

  function sync() {
    var fp = $("#fovprev"); if (fp) {
      var r = Math.max(20, Math.min(110, S.fov_r * .5)); var f = $(".fov", fp); f.style.width = f.style.height = r + "px"; f.style.margin = (-r / 2) + "px 0 0 " + (-r / 2) + "px"; f.style.borderColor = S.fov_c; f.style.display = S.fov ? "" : "none";
      var ch = $(".ch", fp); ch.innerHTML = ""; if (S.ch) { var s = S.ch_size, g = S.ch_gap, w = S.ch_w; [[g, -w / 2, s, w], [-g - s, -w / 2, s, w], [-w / 2, g, w, s], [-w / 2, -g - s, w, s]].forEach(function (a) { var i = document.createElement("i"); i.style.cssText = "left:" + a[0] + "px;top:" + a[1] + "px;width:" + a[2] + "px;height:" + a[3] + "px;background:" + S.ch_c + ";box-shadow:0 0 0 1px " + S.ch_oc; ch.appendChild(i); }); }
      $(".box", fp).style.borderColor = S.esp_cv || "#fff";
    }
    var a = ACC[S.ui_ac] || ACC.Blue; document.documentElement.style.setProperty("--ac", a[0]); document.documentElement.style.setProperty("--ac2", a[1]);
    document.documentElement.style.setProperty("--s", (S.ui_sc || 100) / 100 * fitScale());
    hud();
    $("#wm").style.display = S.ui_wm === false ? "none" : "";
    $("#notes").style.display = S.ui_nt === false ? "none" : "";
    document.body.style.setProperty("--anim", S.ui_an === false ? "0s" : "");
  }
  function hud() {
    var fc = $("#fovc"); fc.style.display = S.fov ? "" : "none"; fc.style.borderColor = S.fov_c; var rr = S.fov_r * 2; fc.style.width = fc.style.height = rr + "px";
    var xh = $("#xh"); xh.innerHTML = ""; xh.style.display = S.ch ? "" : "none";
    if (S.ch) { var sz = S.ch_size, g = S.ch_gap, w = S.ch_w; [[g, -w / 2, sz, w], [-g - sz, -w / 2, sz, w], [-w / 2, g, w, sz], [-w / 2, -g - sz, w, sz]].forEach(function (a) { var i = document.createElement("i"); i.style.cssText = "left:" + a[0] + "px;top:" + a[1] + "px;width:" + a[2] + "px;height:" + a[3] + "px;background:" + S.ch_c + ";box-shadow:0 0 0 1px " + S.ch_oc; xh.appendChild(i); }); }
    var eb = $("#espbox"); eb.style.display = S.esp ? "" : "none"; eb.style.borderColor = S.esp_cv || "#fff"; eb.style.borderStyle = S.esp_box === false ? "none" : "solid";
    $(".nm", eb).style.display = S.esp_name ? "" : "none"; $(".hp", eb).style.display = S.esp_hp ? "" : "none"; $(".ds", eb).style.display = S.esp_dist ? "" : "none"; $(".wp", eb).style.display = S.esp_wimg ? "" : "none";
    var hk = $("#hk"); hk.style.display = S.hk ? "" : "none"; hk.className = S.hk_pos === "Right" ? "right" : "";
    var binds = [["Aimbot", S.aim_key, S.aim, "hold"], ["Zoom", S.v_zk, S.v_zoom, "toggle"], ["XRay", S.v_xrk, S.v_xr, "toggle"], ["Combat hide", S.sm_key, S.sm_key !== "NONE", "hold"]];
    var ls = $(".ls", hk), html = "";
    binds.forEach(function (b) { if (!b[2] && !S.hk_in) return; html += '<div class="' + (b[2] ? "" : "off") + '">' + b[0] + ' <span>[' + b[1] + ' ' + b[3] + ']</span></div>'; });
    ls.innerHTML = html;
    var ar = $("#armor"); ar.style.display = S.av ? "" : "none"; ar.style.transform = "scale(" + (S.av_sc || 100) / 100 + ")"; ar.style.transformOrigin = "top right";
    ar.style.left = S.av_pos === "Top left" ? "14px" : ""; ar.style.right = S.av_pos === "Top left" ? "auto" : "14px"; ar.style.top = S.av_pos === "Bottom" ? "auto" : "14px"; ar.style.bottom = S.av_pos === "Bottom" ? "60px" : "";
  }
  var AC = null;
  function snd(kind) {
    if (S.ui_snd === false) return;
    try {
      AC = AC || new (window.AudioContext || window.webkitAudioContext)(); if (AC.state === "suspended") AC.resume();
      var o = AC.createOscillator(), g = AC.createGain(), t = AC.currentTime;
      o.type = "sine"; o.frequency.setValueAtTime(kind === "on" ? 520 : kind === "off" ? 380 : kind === "tab" ? 640 : 460, t); o.frequency.exponentialRampToValueAtTime(kind === "off" ? 220 : 900, t + .08);
      g.gain.setValueAtTime(.0001, t); g.gain.exponentialRampToValueAtTime(.06, t + .01); g.gain.exponentialRampToValueAtTime(.0001, t + .12);
      o.connect(g); g.connect(AC.destination); o.start(t); o.stop(t + .13);
    } catch (e) { }
  }
  function fitScale() { return Math.min(1, (window.innerWidth - 16) / 840, (window.innerHeight - 24) / 570); }
  function cur_scale() { return parseFloat(getComputedStyle(document.documentElement).getPropertyValue("--s")) || 1; }
  window.addEventListener("resize", sync); sync();

  var menu = $("#menu"), open = true;
  function hide() { open = false; menu.classList.add("hidden"); snd("off"); }
  function show() { open = true; menu.classList.remove("hidden"); snd("on"); }
  function toggle() { open ? hide() : show(); }
  $("#x").onclick = hide; $("#tgl").onclick = toggle;
  window.addEventListener("keydown", function (e) {
    if (keyLis) { e.preventDefault(); var n = e.key === "Escape" ? "NONE" : e.key.length === 1 ? e.key.toUpperCase() : e.code.replace("Key", "").replace("ShiftRight", "RSHIFT").replace("ShiftLeft", "LSHIFT").toUpperCase(); setKey(n); return; }
    if (e.code === "ShiftRight" || (e.key === "Insert")) toggle();
  });
  window.addEventListener("contextmenu", function (e) { if (keyLis) e.preventDefault(); });
  $("#pin").onclick = function () { menu.style.marginLeft = menu.style.marginTop = "0px"; note("Position reset"); };

  // drag
  (function () { var d = false, sx, sy, ox = 0, oy = 0; function down(e) { if (e.target.closest("input,button,.tbtn")) return; d = true; var p = e.touches ? e.touches[0] : e; sx = p.clientX - ox; sy = p.clientY - oy; e.preventDefault(); } function mv(e) { if (!d) return; var p = e.touches ? e.touches[0] : e; ox = p.clientX - sx; oy = p.clientY - sy; menu.style.marginLeft = ox + "px"; menu.style.marginTop = oy + "px"; } function up() { d = false; } ["#top", "#brand"].forEach(function (s) { $(s).addEventListener("mousedown", down); $(s).addEventListener("touchstart", down, { passive: false }); }); window.addEventListener("mousemove", mv); window.addEventListener("touchmove", mv, { passive: true }); window.addEventListener("mouseup", up); window.addEventListener("touchend", up); })();

  // watermark fake stats
  setInterval(function () { $("#fps").textContent = (138 + Math.floor(Math.random() * 12)) + " fps"; $("#ping").textContent = (28 + Math.floor(Math.random() * 7)) + " ms"; var d = new Date(); $("#wmtime").textContent = (d.getHours() < 10 ? "0" : "") + d.getHours() + ":" + (d.getMinutes() < 10 ? "0" : "") + d.getMinutes(); }, 1000);
  setTimeout(function () { note("<b>Burmalda.hook</b> v1.0 beta loaded. <b>RightShift</b> to toggle"); }, 400);

  function hexToHsl(h) { var r = parseInt(h.slice(1, 3), 16) / 255, g = parseInt(h.slice(3, 5), 16) / 255, b = parseInt(h.slice(5, 7), 16) / 255, mx = Math.max(r, g, b), mn = Math.min(r, g, b), l = (mx + mn) / 2, s = 0, hh = 0; if (mx !== mn) { var d = mx - mn; s = l > .5 ? d / (2 - mx - mn) : d / (mx + mn); hh = mx === r ? (g - b) / d + (g < b ? 6 : 0) : mx === g ? (b - r) / d + 2 : (r - g) / d + 4; hh *= 60; } return [Math.round(hh), Math.round(s * 100), Math.round(l * 100)]; }
  function hslToHex(h, s, l) { s /= 100; l /= 100; var k = function (n) { return (n + h / 30) % 12; }, a = s * Math.min(l, 1 - l), f = function (n) { var c = l - a * Math.max(-1, Math.min(k(n) - 3, 9 - k(n), 1)); return ("0" + Math.round(c * 255).toString(16)).slice(-2); }; return "#" + f(0) + f(8) + f(4); }
})();
