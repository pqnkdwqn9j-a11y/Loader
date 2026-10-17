(function () {
  var I18N = {
    en: { hint: "Choose the game to load", select: "Select script", indev: "in development", time: "Time", user: "User", check: "CHECK", checking: "CHECKING", status: "Status", days: "DAYS", hours: "HOURS", mins: "MINS", expires: "Expires on", reseller: "Reseller", back: "change game", ph: "Enter your key", nolic: "No license", enterkey: "Enter your key to activate", active: "License Active", pillok: "ACTIVE", pillbad: "INVALID", accepted: "Key accepted", waitauth: "Authorizing...", invalid: "Invalid key", left: "Time left: ", life: "Lifetime", never: "Never", d: " d ", h: " h ", m: " min", launch: "LAUNCH ", loading: "LOADING", inject: "INJECTING", launched: "LAUNCHED", tdev: "fallen survival is in development.", tload: " loaded. Press RightShift to open the menu.", tdc: "Discord invite copied to clipboard.", tkey: "Enter your key first.", tinv: "Invalid key. Check it and try again.", closed: "Loader closed. UI_CLOSED = true, script not loaded." },
    ru: { hint: "Выбери игру для загрузки", select: "Выбрать скрипт", indev: "в разработке", time: "Время", user: "Пользователь", check: "ПРОВЕРИТЬ", checking: "ПРОВЕРКА", status: "Статус", days: "ДНЕЙ", hours: "ЧАСОВ", mins: "МИНУТ", expires: "Истекает", reseller: "Реселлер", back: "сменить игру", ph: "Введи ключ", nolic: "Нет лицензии", enterkey: "Введи ключ для активации", active: "Лицензия активна", pillok: "АКТИВНА", pillbad: "ОШИБКА", accepted: "Ключ принят", waitauth: "Авторизация...", invalid: "Неверный ключ", left: "Осталось: ", life: "Навсегда", never: "Никогда", d: " д ", h: " ч ", m: " мин", launch: "ЗАПУСК ", loading: "ЗАГРУЗКА", inject: "ИНЖЕКТ", launched: "ЗАПУЩЕНО", tdev: "fallen survival пока в разработке.", tload: " загружен. RightShift - открыть меню.", tdc: "Ссылка на Discord скопирована.", tkey: "Сначала введи ключ.", tinv: "Неверный ключ. Проверь и попробуй ещё раз.", closed: "Лоадер закрыт. UI_CLOSED = true, скрипт не загружен." }
  };
  var MONTHS = { en: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"], ru: ["января", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентября", "октября", "ноября", "декабря"] };
  var GAMES = [{ id: "hvh", name: "aquabeary-hvh", ready: true }, { id: "fallen", name: "fallen survival", ready: false }];
  var ICON = { clock: 0, user: 1, shield: 2, calendar: 3, cart: 4, discord: 5, arrow: 6, close: 7, crown: 8, key: 9, globe: 10, check: 11 };
  var VALID_KEYS = { "BURM-TEST-0001": 3 * 86400, "BURM-LIFE-0001": null, "BURM-TEST-10H": 10 * 3600 };

  var $ = function (id) { return document.getElementById(id); };
  var LANG = "en", T = I18N.en, selected = null, state = { accepted: false, auth: false, busy: false, expires: null, lifetime: false, closed: false };

  document.querySelectorAll(".ico").forEach(function (el) {
    var i = ICON[el.getAttribute("data-i")] || 0, s = +el.getAttribute("data-s") || 16;
    el.style.width = el.style.height = s + "px";
    el.style.webkitMaskSize = el.style.maskSize = (s * 6) + "px " + (s * 2) + "px";
    el.style.webkitMaskPosition = el.style.maskPosition = (-(i % 6) * s) + "px " + (-Math.floor(i / 6) * s) + "px";
  });

  function fit() {
    var s = Math.min(1, (window.innerWidth - 16) / 754, (window.innerHeight - 24) / 525);
    $("stage").style.transform = "translate(-50%,-50%) scale(" + s + ")";
  }
  window.addEventListener("resize", fit); fit();

  var toastTimer = null;
  function notify(text, err) {
    var t = $("toast"); $("toastText").textContent = text;
    t.className = err ? "err on" : "on";
    clearTimeout(toastTimer); toastTimer = setTimeout(function () { t.className = err ? "err" : ""; }, 3500);
  }

  function pad(n) { return (n < 10 ? "0" : "") + n; }
  function fmtDate(t, withTime) {
    var d = new Date(t * 1000), s;
    if (LANG === "ru") { s = d.getDate() + " " + MONTHS.ru[d.getMonth()] + " " + d.getFullYear(); if (withTime) s += ", " + pad(d.getHours()) + ":" + pad(d.getMinutes()); }
    else { s = MONTHS.en[d.getMonth()] + " " + d.getDate() + ", " + d.getFullYear(); if (withTime) { var h = d.getHours() % 12, ap = d.getHours() >= 12 ? "PM" : "AM"; if (h === 0) h = 12; s += ", " + pad(h) + ":" + pad(d.getMinutes()) + " " + ap; } }
    return s;
  }
  function human(sec) {
    var d = Math.floor(sec / 86400), h = Math.floor(sec % 86400 / 3600), m = Math.floor(sec % 3600 / 60);
    if (d > 0) return d + T.d + h + T.h; if (h > 0) return h + T.h + m + T.m; return m + T.m;
  }
  function setLaunch(mode, text) {
    $("launchText").textContent = text || (T.launch + (selected ? selected.name.toUpperCase() : ""));
    $("launch").className = mode === "off" ? "" : mode;
  }
  function renderStatus(kind, l1, l2) {
    $("timer").className = kind === "ok" ? "on" : ""; $("div").style.display = $("meta").style.display = kind === "ok" ? "block" : "none";
    var pill = $("stPill"); pill.className = kind === "ok" ? "ok" : kind === "bad" ? "bad" : ""; pill.textContent = kind === "ok" ? T.pillok : T.pillbad;
    $("shield").style.backgroundColor = kind === "ok" || kind === "wait" ? "#2f9bff" : kind === "bad" ? "#e06c6c" : "#52525a";
    $("lic").style.color = kind === "bad" ? "#e06c6c" : "#fff";
    if (l1 != null) $("lic").textContent = l1; if (l2 != null) $("sub").textContent = l2;
  }
  function tick() {
    var now = Math.floor(Date.now() / 1000), d = new Date();
    if (LANG === "ru") $("clock").textContent = pad(d.getHours()) + ":" + pad(d.getMinutes()) + ":" + pad(d.getSeconds());
    else { var h = d.getHours() % 12, ap = d.getHours() >= 12 ? "PM" : "AM"; if (h === 0) h = 12; $("clock").textContent = pad(h) + ":" + pad(d.getMinutes()) + ":" + pad(d.getSeconds()) + " " + ap; }
    $("date").textContent = fmtDate(now, false);
    if (state.auth) {
      if (state.lifetime) { $("n0").textContent = $("n1").textContent = $("n2").textContent = "∞"; $("sub").textContent = T.left + T.life; $("exp").textContent = T.never; }
      else { var left = Math.max(0, state.expires - now); $("n0").textContent = Math.floor(left / 86400); $("n1").textContent = Math.floor(left % 86400 / 3600); $("n2").textContent = Math.floor(left % 3600 / 60); $("sub").textContent = T.left + human(left); $("exp").textContent = fmtDate(state.expires, true); }
    }
  }
  setInterval(tick, 1000);

  function applyLang(l) {
    LANG = l; T = I18N[l];
    document.querySelectorAll("#lang button").forEach(function (b) { b.className = b.getAttribute("data-l") === l ? "on" : ""; });
    $("hint").textContent = T.hint; $("selText").textContent = T.select; $("tTime").textContent = T.time; $("tUser").textContent = T.user;
    $("key").placeholder = T.ph; $("chk").textContent = state.busy ? T.checking : T.check; $("stHead").textContent = T.status;
    $("c0").textContent = T.days; $("c1").textContent = T.hours; $("c2").textContent = T.mins; $("expCap").textContent = T.expires; $("resCap").textContent = T.reseller;
    $("back").textContent = "\u2190  " + T.back;
    document.querySelectorAll(".item .tag").forEach(function (t) { t.textContent = T.indev; });
    if (state.auth) { renderStatus("ok", T.active, null); setLaunch(state.busy ? "busy" : "on"); }
    else if (state.accepted) { renderStatus("wait", T.accepted, T.waitauth); setLaunch("off"); }
    else if (state.badMsg) { renderStatus("bad", T.invalid, T.tinv); setLaunch("off"); }
    else { renderStatus("none", T.nolic, T.enterkey); setLaunch("off"); }
    tick();
  }
  document.querySelectorAll("#lang button").forEach(function (b) { b.onclick = function () { applyLang(b.getAttribute("data-l")); }; });

  // screen 1
  var list = $("list"), open = false;
  function setList(o) { open = o; list.className = o ? "on" : ""; $("selBtn").className = o ? "open" : ""; $("selBtn").querySelector("b").innerHTML = o ? "&#9652;" : "&#9662;"; }
  $("selBtn").onclick = function () { setList(!open); };
  GAMES.forEach(function (g, i) {
    if (i > 0) { var s = document.createElement("div"); s.className = "sep"; list.appendChild(s); }
    var it = document.createElement("div"); it.className = "item" + (g.ready ? " ready" : "");
    it.innerHTML = '<div class="ib"><i class="ico" style="width:16px;height:16px;-webkit-mask-size:96px 32px;mask-size:96px 32px;-webkit-mask-position:-32px -16px;mask-position:-32px -16px;background-color:' + (g.ready ? "#2f9bff" : "#52525a") + '"></i></div><div class="nm">' + g.name + '</div>' +
      (g.ready ? '<i class="ico" style="width:14px;height:14px;-webkit-mask-size:84px 28px;mask-size:84px 28px;-webkit-mask-position:0 -14px;mask-position:0 -14px;background-color:#2f9bff"></i>' : '<div class="tag"></div>');
    it.onclick = function () {
      if (!g.ready) { var tag = it.querySelector(".tag"); tag.className = "tag red"; notify(T.tdev, true); setTimeout(function () { tag.className = "tag"; }, 2500); return; }
      selected = g; setList(false); showScreen(2);
    };
    list.appendChild(it);
  });

  function showScreen(n) {
    $("s1").className = "screen" + (n === 1 ? " on" : ""); $("s2").className = "screen" + (n === 2 ? " on" : "");
    if (n === 2) { setLaunch("off"); setTimeout(function () { $("mascot").style.opacity = 1; $("glow").style.opacity = .28; }, 50); }
  }

  // screen 2
  function acceptKey(key) {
    state.accepted = true; state.badMsg = null; $("key").className = "ok";
    renderStatus("wait", T.accepted, T.waitauth); setLaunch("off");
    // demo server: answer after 1.2s like JNKIE would
    setTimeout(function () {
      var dur = VALID_KEYS[key];
      state.auth = true; state.lifetime = dur === null; state.expires = dur === null ? null : Math.floor(Date.now() / 1000) + dur;
      $("key").className = "ok"; renderStatus("ok", T.active, null); tick(); setLaunch("on");
      notify(T.active + " - " + T.left + (state.lifetime ? T.life : human(state.expires - Math.floor(Date.now() / 1000))), false);
    }, 1200);
  }
  function rejectKey() { state.accepted = false; state.badMsg = T.tinv; $("key").className = "bad"; renderStatus("bad", T.invalid, T.tinv); setLaunch("off"); notify(T.tinv, true); }
  function checkKey() {
    if (state.busy || state.accepted) return;
    var key = $("key").value.trim();
    if (!key) { notify(T.tkey, true); return; }
    state.busy = true; $("chk").textContent = T.checking; $("key").className = "";
    setTimeout(function () { state.busy = false; $("chk").textContent = T.check; if (key in VALID_KEYS) acceptKey(key); else rejectKey(); }, 700);
  }
  $("chk").onclick = checkKey;
  $("key").addEventListener("keydown", function (e) { if (e.key === "Enter") { checkKey(); e.target.blur(); } });

  $("launch").onclick = function () {
    if (state.busy || !state.auth) return;
    state.busy = true; setLaunch("busy", T.loading);
    setTimeout(function () { setLaunch("busy", T.inject); }, 900);
    setTimeout(function () { state.busy = false; setLaunch("on", T.launched); notify(selected.name + T.tload, false); setTimeout(function () { closeGui(selected.name + T.tload); }, 900); }, 1800);
  };
  $("back").onclick = function () { if (state.busy) return; selected = null; showScreen(1); };
  $("close").onclick = function () { closeGui(T.closed); };
  $("dc").onclick = function () { try { navigator.clipboard && navigator.clipboard.writeText("https://discord.gg/kYxbtF3TUc"); } catch (e) { } notify(T.tdc, false); };
  $("again").onclick = function () { location.reload(); };
  function closeGui(msg) {
    state.closed = true; var st = $("stage"); st.style.transition = "opacity .3s,transform .3s"; st.style.opacity = 0;
    setTimeout(function () { st.style.display = "none"; $("doneText").textContent = msg; $("done").style.display = "block"; }, 320);
  }

  // drag
  (function () {
    var dragging = false, sx, sy, ox = 0, oy = 0, st = $("stage");
    function down(e) { if (e.target.closest("button,input")) return; dragging = true; var p = e.touches ? e.touches[0] : e; sx = p.clientX - ox; sy = p.clientY - oy; e.preventDefault(); }
    function move(e) { if (!dragging) return; var p = e.touches ? e.touches[0] : e; ox = p.clientX - sx; oy = p.clientY - sy; st.style.marginLeft = ox + "px"; st.style.marginTop = oy + "px"; }
    function up() { dragging = false; }
    ["head", "side"].forEach(function (id) { $(id).addEventListener("mousedown", down); $(id).addEventListener("touchstart", down, { passive: false }); });
    window.addEventListener("mousemove", move); window.addEventListener("touchmove", move, { passive: true }); window.addEventListener("mouseup", up); window.addEventListener("touchend", up);
  })();

  applyLang("en"); showScreen(1); tick();
})();
