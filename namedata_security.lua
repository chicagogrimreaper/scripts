local module = {}

-- these lines are so useless
local task = task;
local debug = debug;
local string = string;
local math = math;
local table = table;

-- this retard suffers of several down syndromes
local fastWait = task.wait;
local fastSpawn = task.spawn;
local debugInfo = debug.info;


-- autism 2
local TeleportService = game:GetService("TeleportService");
local Players = game:GetService("Players");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local HttpServ = game:GetService("HttpService");
local MarketplaceServ = game:GetService("MarketplaceService");

function module.AntiCheat()

	
	local AntiHookTable = {
		require,
		string.char,
		setmetatable,
		rawequal,
		debug.info,
		next
	}; -- genius
	fastSpawn(function()
		for i, v in next, AntiHookTable do
			if #debugInfo(v, "n") < 1 then -- genius function name check, function require(...) end 😱
				return;
			end
		end
		rawequal = (function(a, b)
			return (a == b) and true or false;
		end) -- "custom" rawequal
		if script:IsA("ModuleScript") and script.Name ~= "MainModule" then
			return;
		end -- 2021 protection
		if getmetatable(require) then
			return;
		end -- __call metatable hacker
		pcall(setmetatable, pcall(getmetatable, require), {}) -- hacker v2
		setmetatable({}, {
			__index = function()
			end
		}); -- what is bro doing
		if game:GetService("RunService"):IsStudio() or 1 < #game.JobId then
			return;
		end; -- game.JobId = string.rep("\32", 2^31-1)
		if rawequal(require, print) or rawequal(require, warn) or rawequal(require, error) then
			return;
		end; -- oldreq=require;require=function(...)print(...)return oldreq(...)end;
		if rawequal(_G.print, getfenv().print) then
			return;
		end --isnt the _G dictionary empty tho... wtf..
		if getfenv(0).require ~= getfenv(1).require then
			return;
		end -- smart
		if rawequal(getfenv, print) then
			return
		end -- print(function: 0xaddress or stack level??)
		if rawequal(getfenv, error) then
			return
		end -- same shit as above
		if rawequal(getfenv, warn) then
			return
		end
		if rawequal(unpack, print) then
			return
		end -- he doesnt even uses unpack what the fuck is this retard on
		if rawequal(unpack, error) then
			return
		end
		if rawequal(unpack, warn) then
			return;
		end
		if not game then
			return;
		end -- game = {};
		if pcall(setfenv, require, {}) then
			return;
		end -- if boolean hacker
		local bruhmomento = 1
		local hacks = {}
		local inx = 0
		for i, v in next, getfenv() do
			inx = inx + 1
			hacks[inx] = i
		end
		if hacks[1] == "script" and not(hacks[3]) then
    -- the fuck is the 3rd index is
    -- anyways enjoy skidding off this shit its bad
			--require here
		else
			return
		end
	end)
end

return module
