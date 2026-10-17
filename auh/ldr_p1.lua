local JNKIE_SERVICE = ""
local JNKIE_IDENTIFIER = ""
local DISCORD_INVITE = "https://discord.gg/kYxbtF3TUc"
local LOADER_VERSION = "1.0.0"
local KEY_FILE = "burmalda_key.txt"
local LANG_FILE = "burmalda_lang.txt"
local IMG_FILE = "burmalda_mascot.jpg"
local ICONS_FILE = "burmalda_icons.png"
local GLOW_FILE = "burmalda_glow.png"
local ASSET_BASE = "https://raw.githubusercontent.com/pqnkdwqn9j-a11y/potatoh/refs/heads/main/"

local GAMES = {
	{ id = "hvh", name = "aquabeary-hvh", ready = true },
	{ id = "fallen", name = "fallen survival", ready = true },
}

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TS = game:GetService("TweenService")
local RS = game:GetService("RunService")
local HttpService = game:GetService("HttpService")
local LP = Players.LocalPlayer

getgenv().SCRIPT_KEY = nil
getgenv().UI_CLOSED = false

local function safe(f, ...)
	local ok, r = pcall(f, ...)
	if ok then return r end
	return nil
end

local function fread(name)
	if not (isfile and readfile) then return nil end
	local ok, r = pcall(function() if isfile(name) then return readfile(name) end end)
	if ok and type(r) == "string" then return r end
	return nil
end

local function fwrite(name, data)
	if not writefile then return false end
	return pcall(writefile, name, data)
end

local I18N = {
	en = {
		desc = "no cap, best fallen hvh script\n- Burmalda", hint = "Choose the game to load", select = "Select script",
		indev = "in development", time = "Time", user = "User", check = "CHECK", checking = "CHECKING", status = "Status",
		days = "DAYS", hours = "HOURS", mins = "MINS", expires = "Expires on", reseller = "Reseller", back = "change game",
		ph = "Enter your key", nolic = "No license", enterkey = "Enter your key to activate", active = "License Active", pillok = "ACTIVE", pillbad = "INVALID",
		accepted = "Key accepted", waitauth = "Authorizing...", invalid = "Invalid key", expired = "Key expired",
		left = "Time left: ", life = "Lifetime", never = "Never", d = " d ", h = " h ", m = " min",
		launch = "LAUNCH ", loading = "LOADING", inject = "INJECTING", launched = "LAUNCHED", failed = "FAILED",
		tdev = "fallen survival is in development.", tload = " loaded. Press RightShift to open the menu.",
		tdc = "Discord invite copied to clipboard.", tkey = "Enter your key first.", tinv = "Invalid key. Check it and try again.",
		tnet = "Could not reach the key server. Try again.", trej = "Key rejected by server. Run the script again.",
		e_KEY_INVALID = "Invalid key", e_KEY_EXPIRED = "Key expired", e_HWID_MISMATCH = "Key is bound to another device",
		e_HWID_BANNED = "Device banned", e_KEY_INVALIDATED = "Key revoked", e_ALREADY_USED = "Key already used",
		e_SERVICE_NOT_FOUND = "Service error", e_SERVICE_MISMATCH = "Service error", e_PREMIUM_REQUIRED = "Premium key required",
	},
	ru = {
		desc = "no cap, best fallen hvh script\n- Burmalda", hint = "Выбери игру для загрузки", select = "Выбрать скрипт",
		indev = "в разработке", time = "Время", user = "Пользователь", check = "ПРОВЕРИТЬ", checking = "ПРОВЕРКА", status = "Статус",
		days = "ДНЕЙ", hours = "ЧАСОВ", mins = "МИНУТ", expires = "Истекает", reseller = "Реселлер", back = "сменить игру",
		ph = "Введи ключ", nolic = "Нет лицензии", enterkey = "Введи ключ для активации", active = "Лицензия активна", pillok = "АКТИВНА", pillbad = "ОШИБКА",
		accepted = "Ключ принят", waitauth = "Авторизация...", invalid = "Неверный ключ", expired = "Ключ истёк",
		left = "Осталось: ", life = "Навсегда", never = "Никогда", d = " д ", h = " ч ", m = " мин",
		launch = "ЗАПУСК ", loading = "ЗАГРУЗКА", inject = "ИНЖЕКТ", launched = "ЗАПУЩЕНО", failed = "ОШИБКА",
		tdev = "fallen survival пока в разработке.", tload = " загружен. RightShift - открыть меню.",
		tdc = "Ссылка на Discord скопирована.", tkey = "Сначала введи ключ.", tinv = "Неверный ключ. Проверь и попробуй ещё раз.",
		tnet = "Сервер ключей недоступен. Попробуй ещё раз.", trej = "Сервер отклонил ключ. Запусти скрипт заново.",
		e_KEY_INVALID = "Неверный ключ", e_KEY_EXPIRED = "Ключ истёк", e_HWID_MISMATCH = "Ключ привязан к другому устройству",
		e_HWID_BANNED = "Устройство забанено", e_KEY_INVALIDATED = "Ключ отозван", e_ALREADY_USED = "Ключ уже использован",
		e_SERVICE_NOT_FOUND = "Ошибка сервиса", e_SERVICE_MISMATCH = "Ошибка сервиса", e_PREMIUM_REQUIRED = "Нужен премиум-ключ",
	},
}
local LANG = (fread(LANG_FILE) == "ru") and "ru" or "en"
local T = I18N[LANG]
local MONTHS = {
	en = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" },
	ru = { "января", "февраля", "марта", "апреля", "мая", "июня", "июля", "августа", "сентября", "октября", "ноября", "декабря" },
}
