local names = {
 "getgc","getrawmetatable","setrawmetatable","setreadonly","checkcaller","getcallingscript","getsenv",
 "cloneref","compareinstances","newcclosure","getnamecallmethod","clonefunction","hookfunction","hookmetamethod",
 "getconnections","setfflag","getfflag","sethiddenproperty","gethiddenproperty","identifyexecutor","request",
 "writefile","readfile","isfile","appendfile","makefolder","isfolder","listfiles","getcustomasset","base64_decode",
 "setfpscap","getgenv","getrenv","gethui","queue_on_teleport","iscclosure","islclosure","getupvalues","setupvalue",
 "getconstants","setconstant","getstack","setstack","getinfo","isvalidlevel","getprotos","getproto"
}
local dbg = {"info","getupvalues","getupvalue","setupvalue","getconstants","getconstant","setconstant",
 "getstack","setstack","isvalidlevel","getprotos","getproto","traceback","getinfo"}
local out = {}
local ok, ex = pcall(function() return identifyexecutor and identifyexecutor() end)
out[#out+1] = "executor: " .. tostring(ok and ex or "?")
out[#out+1] = "drawing: " .. tostring(type(Drawing) == "table" and type(Drawing.new) == "function")
local env = getfenv(0)
for _, n in ipairs(names) do
 local v = rawget(env, n) or (getgenv and getgenv()[n])
 out[#out+1] = n .. " = " .. (type(v) == "function" and "yes" or "NO")
end
for _, n in ipairs(dbg) do
 out[#out+1] = "debug." .. n .. " = " .. (type(debug) == "table" and type(debug[n]) == "function" and "yes" or "NO")
end
local gs, ss = debug and debug.getstack, debug and debug.setstack
if gs and ss then
 local r = pcall(function()
  local function f() local a = 5; local t = gs(1); ss(1, 1, 7); return a end
  return f()
 end)
 out[#out+1] = "setstack_works = " .. tostring(r)
end
if getgc then
 local r, n = pcall(function() return #getgc() end)
 out[#out+1] = "getgc_count = " .. tostring(r and n or "ERR")
end
pcall(writefile, "burmalda_check.txt", table.concat(out, "\n"))
pcall(setclipboard, table.concat(out, "\n"))
