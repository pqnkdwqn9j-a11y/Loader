local function Log() end
local Name = "Potato"
local Directory = "Potato"
local ConfigsFolder = Directory .. "/Configs"
pcall(makefolder, Directory)
pcall(makefolder, ConfigsFolder)
local function GetImage() return "" end
local function GetService(Service)
	local S = game:GetService(Service)
	return (cloneref and cloneref(S)) or S
end
local HttpService = GetService("HttpService")
local UserInputService = GetService("UserInputService")
local Workspace = GetService("Workspace")
local RunService = GetService("RunService")
local TweenService = GetService("TweenService")
local TextService = GetService("TextService")
local Players = GetService("Players")
local GuiService = GetService("GuiService")
local CoreGui = (function()
	local ok, hidden = pcall(function() return gethui and gethui() end)
	if ok and hidden then return hidden end
	return GetService("CoreGui")
end)()
local Camera = Workspace.CurrentCamera
local Client = Players.LocalPlayer
local Mouse = Client:GetMouse()
local MouseConstant = 30
