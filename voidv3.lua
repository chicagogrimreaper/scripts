--[[
     _    __      _     __   _    _______
    | |  / /___  (_)___/ /  | |  / /__  /
    | | / / __ \/ / __  /   | | / / /_ < 
    | |/ / /_/ / / /_/ /    | |/ /___/ / 
    |___/\____/_/\__,_/     |___//____/  
        
        • Void V3 [neptune#2506]
        • Credits:
            → Neptune (Being enslaved by blizex with no payments)

        FK you blizex pay me next time you ed aS skid
		blizex is a skid btw
		dont ever stress me out you neek
]]--

assert(getrawmetatable, "your executor doesn't support getrawmetatable!");
assert(setrawmetatable, "your executor doesn't support setrawmetatable!");
assert(Drawing, "your executor doesn't have a drawing lib!");
assert(getgenv, "your executor doesn't have a function to look for the global exploit environment!");
--[[
assert(rconsolename, "your executor is missing rconsole functions");
assert(rconsoleinfo, "your executor is missing rconsole functions");
assert(rconsoleerr, "your executor is missing rconsole functions");
assert(rconsoleclear, "your executor is missing rconsole functions");
assert(rconsoleinput, "your executor is missing rconsole functions");
assert(rconsoleprint, "your executor is missing rconsole functions");
assert(rconsolewarn, "your executor is missing rcosnole functions");
]]
assert(writefile, "your executor is missing file functions");
assert(readfile, "your executor is missing file functions");
assert(isfile, "your executor is missing file functions");
assert(isfolder, "your executor is missing file functions");
assert(tick, "your executor doesn't have the tick function!");
assert(pcall, "your executor doesn't have protected call functions!");
assert(xpcall, "your executor doesn't have protected call functions!");
assert(ypcall, "your executor doesn't have protected call functions!");
assert(table.insert, "your executor doesn't have table.insert!");
--assert(identifyexecutor, "your executor doesn't have identifyexecutor")
assert(math.randomseed, "your executor doesn't have math.randomseed!");
--[[
assert(os.clock, "your executor doesn't have os.clock!");
assert(os.time, "your executor doesn't have os.time!");
]]
--[[
assert(messagebox, "your executor doesn't have messagebox!");
]]
assert(setfflag, "your executor doesn't have fflag functions!")

pcall(math.randomseed, os.clock() * 2);

if (getgenv().Void) then 
    if getgenv().Void.Startup.Intro.Enabled == true and string.lower(Void.Startup.Intro.Data.IntroType) == "console" then -- Must use getgenv() to access the global exploit environment else Void wont be defined in the current environment if script is ran in another environment
        rconsolename(string.format("Void %s [BETA]", getgenv().Void.Version or "V3"));
        rconsoleprint(getgenv().Void.Startup.Intro.Data.Console.WATERMARK_COLOR);
        rconsoleprint(getgenv().Void.Watermarks[string.lower(getgenv().Void.Startup.DesiredConsoleWatermark)]);
        rconsoleprint("\n");
        rconsoleprint("@@CYAN@@");
        rconsoleprint(string.format("  Void %s is already loaded!", getgenv().Void.Version))
        rconsoleprint("\n");
        task.wait(0.5);
        rconsoleprint("\n");
        rconsoleclear();
        if syn then 
            rconsoleclear();
        else
            rconsoleclose();
        end
    elseif getgenv().Void.Startup.Notification.Enabled == true then 
        SendNotification(getgenv().Void.Startup.Notification.Data.Title or "Void", "Void V3 is already loaded!", getgenv().Void.Startup.Notification.Data.Duration);
    else
        xpcall(function() 
            messagebox("Already Loaded!", "Void", 0);
        end, function() 
            print(string.format("Void %s is already loaded!", getgenv().Void.Version));
        end);
    end;
    return;
end;

-- // Variable checking
messagebox = messagebox or function(msg, title) print(`{title} - {msg} [MSGBOX]`) end
rconsolename = rconsolename or function() end;
rconsoleinfo = rconsoleinfo or function(msg) print(`RCONSOLE INFO: {msg}`); end;
rconsoleerr = rconsoleerr or function(msg) error(`RCONSOLE ERROR: {msg}`); end;
rconsoleclear = rconsoleclear or function() end; --??
rconsoleinput = rconsoleinput or function() end; --??
rconsoleprint = rconsoleprint or function(msg) print(`RCONSOLE: {msg}`) end;
rconsolewarn = rconsolewarn or function(msg) warn(`RCONSOLE WARN: {msg}`) end;
-- // Service Variables

local Workspace = Workspace or workspace or game:GetService("Workspace");
local Players = game:GetService("Players");
local CoreGui = game:GetService("CoreGui");
local Lightning = game.Lighting or game:GetService("Lighting");
local ReplicatedStorage = game:GetService("ReplicatedStorage");
local ContentProvider = game:GetService("ContentProvider");
local StarterGui = game:GetService("StarterGui");
local HttpService = game:GetService("HttpService");
local RunService = game:GetService("RunService");
local TweenService = game:GetService("TweenService");
local UserInputService = game:GetService("UserInputService");
local VirtualInputManager = game:GetService("VirtualInputManager");
local MarketplaceService = game:GetService("MarketplaceService");
local GroupService = game:GetService("GroupService");
local Stats = game:GetService("Stats");

-- // Variables
local JoinModule = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))(); -- blizex wtf is this
local OldFunctions = {
    -- Garbage collecting functions
    [0] = gcinfo;
    [1] = collectgarbage;

};
local isGroupGame = (function() 
    return MarketplaceService:GetProductInfo(game.PlaceId).Creator.CreatorType == "Group" and true or false;
end);
isGroupGame = isGroupGame();
local getGroupId = (function()
    return game:GetService("GroupService"):GetGroupInfoAsync(MarketplaceService:GetProductInfo(game.PlaceId).Creator.CreatorTargetId).Id;
end);
getGroupId = tonumber(getGroupId());

-- // Coding

---------------------------------------------------------------------------

getgenv().Void = {
    Connections = {}; -- Indexes of every rbxscript connection, please don't remove 🙏
    Cache = {
        Execution = tick();
        Elapsed = wait(0.00350); -- getgenv().Void.Cache.Elapsed, DONT MODIFY THIS!
        MemorySpoofer = {
            SpoofedMem = 482.50;
            SpoofedMem_Console = 482.50;

            SpoofMem_Positive = {[0] = 294; [1] = 338};
            SpoofMem_Negative = {[0] = 384; [1] = 418};
        };
    };

    ---------------------------------------------------- [ LOCK ]
    Lock = {
        Target = nil;
        -------------------
        Prediction = {
            Pred = 0.1468;
            Enabled = true; -- Disabled will have 0 pred so you will be missing almost all of your shots
            AutomaticPred = {
                Enabled = false;
                Mode = "Advanced"; --<Pred mode> [Default : Ping based / Advanced : Ping based + depending on the distance from the enemy you are locking on]
                Range = "Mid"; --<Range mode> [close / mid / far]
                PingPreds = {
                    [30] = 0.11;
                    [40] = 0.1256;
                    [50] = 0.112;
                    [60] = 0.1335;
                    [70] = 0.131;
                    [80] = 0.132;
                    [90] = 0.136;
                    [105] = 0.138;
                    [110] = 0.146;
                    [120] = 0.149;
                    [130] = 0.151;
                    [140] = 0.153;
                };
            };
        };
        Smoothness = {
            Smoothn = 0.084;
            Enabled = false;
        };
        Shake = {
            X = {
                Negative = -2; Positive = 1;
            };
            Y = {
                Negative = -0.15; Positive = 0.35;
            };
            Z = {
                Negative = -1; Positive = 0.1;
            };
            Enabled = false;
        };
        Radius = 60;
        Method = "Mouse"; --<Find Method> [Mouse / Character]
        FOV = {
            GunFovs = {};
            Visuals = {
                Circle = {
                    Visible = false;
                    Color = Color3.fromRGB(255, 255, 255);
                    Filled = false;
                    Transparency = 0.15;
                    NumSides = 128;
                    Thickness = 0;
                    Radius = 0; -- Will be modified later in the script
                    Position = Vector2.new(0, 0); -- Will be modified later in the script
                    -- Drawing.new Instance
                    _DRAWING_FOV = Drawing.new("Circle");
                }; -- Visuals for Circle
            };
            UseFOV = false;
        };

        MainPart = "HumanoidRootPart";
        Checks = {
            CrewCheck = true; -- If target that was picked up by the lock is in the same crew
            KOCheck = true; -- If KO Constraint is inside their body effects
            GrabbedCheck = true; -- If grabbed
            VisibleCheck = true; -- If behind a wall, uses raycasting
            AntiCheck = true; -- If using anti
        };
        Toggled = false;
    };
    ---------------------------------------------------- [ SILENT ]
    Silent = {
        ARGUMENT_INDICATOR = "UpdateMousePos"; -- Very important for the silent to work.
        -------------------
        ALLOWED_ENTITIES = {
            ["Player"] = true;
            ["NPC"] = false;
        }; --<Allowed entities> (this will declare what kind of humanoid will be targetted. can be both, but better would be only Player.)
        Prediction = {
            Pred = 0.1658;
            Enabled = true; -- Disabled will have 0 pred so you will be missing almost all of your shots
            AutomaticPred = {
                Enabled = false;
                Mode = "Advanced"; --<Pred mode> [Normal : Ping based / Advanced : Ping based + depending on the distance from the enemy you are locking on]
                Range = "Mid"; --<Range mode> [close / mid / far]
                PingPreds = {
                    [30] = 0.11;
                    [40] = 0.1256;
                    [50] = 0.112;
                    [60] = 0.1335;
                    [70] = 0.131;
                    [80] = 0.132;
                    [90] = 0.136;
                    [105] = 0.138;
                    [110] = 0.142;
                    [120] = 0.145;
                    [130] = 0.151;
                    [140] = 0.153;
                };
            };
        };
        Radius = 70; --<Search Radius>--
        Method = "Mouse"; --<Method type> [Mouse / Character]
        FOV = {
            GunFovs = {};
            Visuals = {
                Circle = {
                    Color = Color3.fromRGB(255, 255, 255);
                    Filled = false;
                    Transparency = 0.15;
                    NumSides = 128;
                    Thickness = 0;
                    Radius = 0; -- Will be modified later in the script
                    Position = Vector2.new(0, 0); -- Will be modified later in the script
                    -- Drawing.new Instance
                    _DRAWING_FOV = Drawing.new("Circle");
                }; -- Visuals for Circle
            };
            UseFOV = true;
        };
        Parts = {
            "Head",
            "HumanoidRootPart";
            "UpperTorso";
            "LowerTorso";
        };
        Checks = {
            CrewCheck = true; -- If target that was picked up by the silent is in the same crew
            KOCheck = true; -- If KO Constraint is inside their body effects
            GrabbedCheck = true; -- If grabbed
            VisibleCheck = true; -- If behind a wall, uses raycasting
            AntiCheck = true; -- If using anti
        };

        MainPart = "HumanoidRootPart";
        AimingMethod = {
            UseMainPart = true;
            UseRandomPart = false;
            UseNearestPart = false; -- Nearest point
        };
        UseResolver = {
            Enabled = false;
            ResolverMethod = "V3";--<Resolver method> [V1 : MoveDirection / V2 : LookVector / V3 : Velocity Recalc / V4 : Delta / V5 : 0 Pred]
            ResolverPred = {
                ["v1"] = 1.15; -- 1.15 - 2 [recommended]
                ["v2"] = 1.25; -- 1.25 - 2 [recommended]
                ["v3"] = 58.5; -- 58.5 - 62.5 [recommended]
                ["v4"] = 3.25; -- 3.25 - 5 [recommended]
            };
        };
        Toggled = false;

    };

    ---------------------------------------------------- [ OBJECTS ]
    Objects = {
        Intro = {};
        Assets = {};
    };
    ---------------------------------------------------- [ SETTINGS ]
    Settings = {
        Mode = "Streamable"; --<Script type> [Streamable / Gui]
        Setting = "Keybind"; -- <Setting Type> [Keybind / Chat]
        Folder = "voidv3"; -- workspace folder
        Keybinds = {
            Lock = "Q";
            Silent = "M";
            Panic = "K";
            FakeMacro = "Z";
        };
        FakeMacro = {
            Mode = "automatic detection"; --<Macro mode> [3rd Person / first Person / automatic detection]
            Toggled = false;
            Method = "virtual"; --<Macro method> [virtual (uses virtualinputmanager) / keypress (uses keypress / mouse functions related)]
        };
        AntiAimviewer = {
            Mode = "Offset"; --<Mode type> [Offset : real mouse pos + custom velocity / Random : random velocity]
            X = {[0] = -5; [1] = 10;};
            Y = {[0] = -1.5; [1] = 1;};
            Z = {[0] = -5; [1] = 10;};
        };
        Panic = {
            Enabled = true;
        };
        FPS = {
            Boost = false; -- this will use a fps booster script, which void v3 doesn't have any rights to but still useful
            UnlockFPS = true;
            MaxFPSCap = 999; -- Anything higher than 1K can crash if attempted to cap max fps to that value
        };
        Mod_Detect = {
            Enabled = true;
            Method = "Kick"; --<Info Method> [Kick / Notification]
            Rank = 233;
        }; -- auto kick if the game is from a group and any player that is in the group with a rank higher or equal to the rank index will automatically trigger mod detection
        KICK_REASONS = {
            MOD_JOINED = "[beta] - void v3 detected a mod / admin join!";
        };
    };
    ---------------------------------------------------- [ STARTUP ]
    Startup = {
        DesiredConsoleWatermark = "basic";
        Notification = {
            Enabled = false;
            Data = {
                Title = "Void";
                Description = "[beta] - void v3 loaded in %.2f seconds";
                Duration = 1;
            };
        }; -- Notification
        Watermark = {
            Enabled = false;
            Text = "Void V3";
            Font = "Monospace";
            Color = Color3.fromRGB(255, 255, 255);
            Outline = true;
            Size = 28;
        }; -- Watermark at the top left of the screen
        Intro = {
            Enabled = true;
            Data = {
                IntroType = "Game"; -- <Intro Type> [Game / Console / Both]
                Game = {
                    Image = {
                        ID = 12140499119;
                    };
                    Sound = {
                        Enabled = true;
                        ID = 1091083826;
                        Volume = 1.5;
                    };
                    Watermark = {
                        Enabled = true;
                        Text = "[beta] - void v3 loading...";
                        Font = "Plex";
                        TextSize = 13;
                        Color = Color3.fromRGB(184, 65, 200)
                    }; -- Will make a new text instance using Drawing.new with the desired watermark;
                };
                Console = {
                    WATERMARK_COLOR = "@@LIGHT_MAGENTA@@";
                    Duration = 1;
                };
            };
        };
    }; -- Actions on startup
    Watermarks = {
        basic = 
([[
    _    __      _     __   _    _______
    | |  / /___  (_)___/ /  | |  / /__  /
    | | / / __ \/ / __  /   | | / / /_ < 
    | |/ / /_/ / / /_/ /    | |/ /___/ / 
    |___/\____/_/\__,_/     |___//____/  
]]);
        old =
([[
                                                                              
                                                                .--,-``-.     
                                                               /   /     '.   
       ,---.            ,--,         ,---,               ,---./ ../        ;  
      /__./|   ,---.  ,--.'|       ,---.'|              /__./|\ ``\  .`-    ' 
 ,---.;  ; |  '   ,'\ |  |,        |   | :         ,---.;  ; | \___\/   \   : 
/___/ \  | | /   /   |`--'_        |   | |        /___/ \  | |      \   :   | 
\   ;  \ ' |.   ; ,. :,' ,'|     ,--.__| |        \   ;  \ ' |      /  /   /  
 \   \  \: |'   | |: :'  | |    /   ,'   |         \   \  \: |      \  \   \  
  ;   \  ' .'   | .; :|  | :   .   '  /  |          ;   \  ' .  ___ /   :   | 
   \   \   '|   :    |'  : |__ '   ; |:  |           \   \   ' /   /\   /   : 
    \   `  ; \   \  / |  | '.'||   | '/  '            \   `  ;/ ,,/  ',-    . 
     :   \ |  `----'  ;  :    ;|   :    :|             :   \ |\ ''\        ;  
      '---"           |  ,   /  \   \  /                '---"  \   \     .'   
                       ---`-'    `----'                         `--`-,,-'     
                                                                              
]]);
        new =
([[
    $$\    $$\           $$\       $$\       $$\    $$\  $$$$$$\  
    $$ |   $$ |          \__|      $$ |      $$ |   $$ |$$ ___$$\ 
    $$ |   $$ | $$$$$$\  $$\  $$$$$$$ |      $$ |   $$ |\_/   $$ |
    \$$\  $$  |$$  __$$\ $$ |$$  __$$ |      \$$\  $$  |  $$$$$ / 
     \$$\$$  / $$ /  $$ |$$ |$$ /  $$ |       \$$\$$  /   \___$$\ 
      \$$$  /  $$ |  $$ |$$ |$$ |  $$ |        \$$$  /  $$\   $$ |
       \$  /   \$$$$$$  |$$ |\$$$$$$$ |         \$  /   \$$$$$$  |
        \_/     \______/ \__| \_______|          \_/     \______/     
]]);
        new2 =
([[
    /$$    /$$          /$$       /$$       /$$    /$$  /$$$$$$ 
    | $$   | $$         |__/      | $$      | $$   | $$ /$$__  $$
    | $$   | $$ /$$$$$$  /$$  /$$$$$$$      | $$   | $$|__/  \ $$
    |  $$ / $$//$$__  $$| $$ /$$__  $$      |  $$ / $$/   /$$$$$/
     \  $$ $$/| $$  \ $$| $$| $$  | $$       \  $$ $$/   |___  $$
      \  $$$/ | $$  | $$| $$| $$  | $$        \  $$$/   /$$  \ $$
       \  $/  |  $$$$$$/| $$|  $$$$$$$         \  $/   |  $$$$$$/
        \_/    \______/ |__/ \_______/          \_/     \______/     
]]);
        gg =
([[
    .----------------.  .----------------.  .----------------.  .----------------.   .----------------.  .----------------. 
    | .--------------. || .--------------. || .--------------. || .--------------. | | .--------------. || .--------------. |
    | | ____   ____  | || |     ____     | || |     _____    | || |  ________    | | | | ____   ____  | || |    ______    | |
    | ||_  _| |_  _| | || |   .'    `.   | || |    |_   _|   | || | |_   ___ `.  | | | ||_  _| |_  _| | || |   / ____ `.  | |
    | |  \ \   / /   | || |  /  .--.  \  | || |      | |     | || |   | |   `. \ | | | |  \ \   / /   | || |   `'  __) |  | |
    | |   \ \ / /    | || |  | |    | |  | || |      | |     | || |   | |    | | | | | |   \ \ / /    | || |   _  |__ '.  | |
    | |    \ ' /     | || |  \  `--'  /  | || |     _| |_    | || |  _| |___.' / | | | |    \ ' /     | || |  | \____) |  | |
    | |     \_/      | || |   `.____.'   | || |    |_____|   | || | |________.'  | | | |     \_/      | || |   \______.'  | |
    | |              | || |              | || |              | || |              | | | |              | || |              | |
    | '--------------' || '--------------' || '--------------' || '--------------' | | '--------------' || '--------------' |
     '----------------'  '----------------'  '----------------'  '----------------'   '----------------'  '----------------' 
]])
    };

    Version = "V3";
};

--[[ FILE STUFF ]]--
if not isfolder(getgenv().Void.Settings.Folder) then 
    makefolder(getgenv().Void.Settings.Folder);
    makefolder(getgenv().Void.Settings.Folder .. "/da-hood");
end;
if not isfile(getgenv().Void.Settings.Folder .. "/da-hood/voidinfo.json") then 
    writefile(getgenv().Void.Settings.Folder .. "/da-hood/voidinfo.json", HttpService:JSONEncode({
        Loaded_Amount = 0;
        Last_Execution = os.time();
    }));
end;
writefile(getgenv().Void.Settings.Folder .. "/da-hood/voidinfo.json", HttpService:JSONEncode({
    Loaded_Amount = HttpService:JSONDecode(readfile(getgenv().Void.Settings.Folder .. "/da-hood/voidinfo.json"))["Loaded_Amount"] + 1; 
    Last_Execution = os.time();
}));
----------------------------------------------------------------------
-- notification (idk why it would error but still)
SendNotification = function(...) 
    local CACHE_TITLE = ({...})[1];
    local CACHE_DESCRIPTION = ({...})[2];
    local CACHE_DURATION = ({...})[2];

    xpcall(function()
        StarterGui:SetCore("SendNotification", {
            Title = CACHE_TITLE or "Void V3";
            Text = CACHE_DESCRIPTION or "[@] NO DESCRIPTION PASSED!";
            Duration = CACHE_DURATION or 2;
        });
    end, function(err)
        error(err);
    end)
end;
-- protect gui function
ProtectGui = function(GUI) 
    if syn then 
        return syn.protect_gui(GUI);
    elseif gethui then
        GUI.Parent = gethui();
    else
        GUI.Parent = CoreGui;
    end
end;
----------------------------------------------------------------------------------
-- anti detector
DetectAnti = function(bodypart) 
    local is_x_spoofed = (bodypart.Velocity.X > 40 and true or bodypart.Velocity.X < -5 and true or false);
    local is_y_spoofed = (bodypart.Velocity.Y > 40 and true or bodypart.Velocity.Y < -5 and true or false);
    local is_z_spoofed = (bodypart.Velocity.Z > 40 and true or bodypart.Velocity.Z < -5 and true or false);

    return (is_x_spoofed == true and true or is_y_spoofed == true and true or is_z_spoofed == true and true or false);
end;
-- get nearest
GetNearest = function(method)
    local cache_distance = math.huge;
    local cache_player = nil;

    -- mouse
    if string.lower(method) == "mouse" then 
        for index, player in next, Players:GetPlayers() do 
            if player and player ~= Players.LocalPlayer then 
                local isvisible = workspace.CurrentCamera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position);
                if (isvisible) then 
                    if (player.Character.HumanoidRootPart.Position - Players.LocalPlayer:GetMouse().Hit.Position).Magnitude < cache_distance then 
                        cache_distance = (player.Character.HumanoidRootPart.Position - Players.LocalPlayer:GetMouse().Hit.Position).Magnitude;
                        cache_player = player;
                    end;
                end;
            end;
        end;
    -- character
    elseif string.lower(method) == "character" then
        for index, player in next, Players:GetPlayers() do 
            if player and player ~= Players.LocalPlayer then 
                local isvisible = workspace.CurrentCamera:WorldToViewportPoint(player.Character.Position);
                if (isvisible) then 
                    if (player.Character.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude < cache_distance then 
                        cache_distance = (player.Character.HumanoidRootPart.Position - game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position).Magnitude;
                        cache_player = player;
                    end;
                end;
            end;
        end;
    end; -- end
    return cache_player;
end;
-- get nearest point
GetNearest_POINT = function(entity, F_type)
    if not entity then return end;
    -- F_type is find type
    local cache_body_part = nil;
    local max_distance = nil;
    if string.lower(F_type) == "silent" then 
        for index, instance in next, entity:GetChildren() do 
            if instance:IsA("BasePart") then 
                if (instance.Position - Players.LocalPlayer:GetMouse().Hit.Position).Magnitude < max_distance then 
                    max_distance = (instance.Position - Players.LocalPlayer:GetMouse().Hit.Position).Magnitude;
                    cache_body_part = instance;
                end;
            end;
        end;
    end;
    return (cache_body_part or entity:FindFirstChild("HumanoidRootPart"));
end;
-- timmy functions i made in a hurry
InstanceFunctions = {
    MakeInstance = function(Instance_Type, Properties) 
        local cache_instance = Instance.new(Instance_Type);
        for index, key in next, Properties do 
            cache_instance[index] = key;
        end;
        return cache_instance;
    end;
    SetInstance = function(_Instance, Properties) 
        for index, key in next, Properties do 
            _Instance[index] = key;
        end;
    end;
};
----------------------------------------------------------------------
-- pred gen
-- thanks to offender
Generate_Pred = function(Ping, Range) 
    local cache_prediction = 0;
    if string.lower(tostring(Range)) == "close" then 
        cache_prediction += 0.1 + (Ping / 1250) * 1.05 + ((Ping / 1000) * (Ping / 1500) * 1.040);
    elseif string.lower(tostring(Range)) == "mid" then
        cache_prediction += 0.1 + (Ping / 2000) + ((Ping / 1000) * (Ping / 1500) * 1.025);
    elseif string.lower(tostring(Range)) == "far" then
        cache_prediction += 0.1 + (Ping / 2500) * 0.95 + ((Ping / 1000) * (Ping / 1500) * 0.95);
    end
    return cache_prediction;
end;
----------------------------------------------------------------------
-- vel calc for silent
PredictTarget = function(Player)
    if not Player then return Players.LocalPlayer:GetMouse().Hit.Position; end; -- incase there is no player
    local CACHE_CHARACTER = Player.Character;

    local LastPosTarget = CACHE_CHARACTER.HumanoidRootPart.Position;
    -- last pos
    local LastTime = tick();
    -- last time
    --------------------------------------------------------------------
    local CurrentPosTarget = CACHE_CHARACTER.HumanoidRootPart.Position;
    -- current pos
    local CurrentTime = LastTime + typeof(getgenv().Void.Cache.Elapsed) == "number" and getgenv().Void.Cache.Elapsed or wait(0.00350);
    -- current time
    --------------------------------------------------------------------
    local oldTargetVelocity = CACHE_CHARACTER.HumanoidRootPart.Velocity;
    -- old target velocity

    local CACHE_PART = (
        -- Main Part
        getgenv().Void.Silent.AimingMethod.UseMainPart == true and CACHE_CHARACTER[getgenv().Void.Silent.MainPart] or
        -- Random Part
        getgenv().Void.Silent.AimingMethod.UseRandomPart == true and CACHE_CHARACTER[getgenv().Void.Silent.Parts[math.random(1, #getgenv().Void.Silent.Parts)]] or
        -- Nearest Part
        getgenv().Void.Silent.AimingMethod.UseNearestPart == true and GetNearest_POINT(CACHE_CHARACTER, "Silent") or
        CACHE_CHARACTER["HumanoidRootPart"] -- Default
    ) or CACHE_CHARACTER.HumanoidRootPart;

    if getgenv().Void.Silent.UseResolver.Enabled == true then 
        CACHE_CHARACTER.HumanoidRootPart.Velocity = Vector3.new(
            -- X Axis
            (0 + (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v1" and (CACHE_CHARACTER.Humanoid.MoveDirection * getgenv().Void.Silent.UseResolver.ResolverPred["v1"] * CACHE_CHARACTER.Humanoid.WalkSpeed).X) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v2" and (CACHE_CHARACTER.HumanoidRootPart.CFrame.LookVector * getgenv().Void.Silent.UseResolver.ResolverPred["v1"] * CACHE_CHARACTER.Humanoid.WalkSpeed).X) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v3" and ( (CurrentPosTarget - LastPosTarget) * getgenv().Void.Silent.UseResolver.ResolverPred["v3"] ).X) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v4" and ( (CurrentPosTarget - LastPosTarget) / ((LastTime - CurrentTime) + getgenv().Void.Silent.UseResolver.ResolverPred["v4"] / 100) ).X) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v5" and (0)) ),
            -- Y Axis
            (0 + (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v1" and (CACHE_CHARACTER.Humanoid.MoveDirection * getgenv().Void.Silent.UseResolver.ResolverPred["v1"] * CACHE_CHARACTER.Humanoid.WalkSpeed).Y) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v2" and (CACHE_CHARACTER.HumanoidRootPart.CFrame.LookVector * getgenv().Void.Silent.UseResolver.ResolverPred["v1"] * CACHE_CHARACTER.Humanoid.WalkSpeed).Y) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v3" and ( (CurrentPosTarget - LastPosTarget) * getgenv().Void.Silent.UseResolver.ResolverPred["v3"] ).Y) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v4" and ( (CurrentPosTarget - LastPosTarget) / ((LastTime - CurrentTime) + getgenv().Void.Silent.UseResolver.ResolverPred["v4"] / 100) ).Y) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v5" and (0)) ),
            -- Z Axis
            (0 + (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v1" and (CACHE_CHARACTER.Humanoid.MoveDirection * getgenv().Void.Silent.UseResolver.ResolverPred["v1"] * CACHE_CHARACTER.Humanoid.WalkSpeed).Z) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v2" and (CACHE_CHARACTER.HumanoidRootPart.CFrame.LookVector * getgenv().Void.Silent.UseResolver.ResolverPred["v1"] * CACHE_CHARACTER.Humanoid.WalkSpeed).Z) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v3" and ( (CurrentPosTarget - LastPosTarget) * getgenv().Void.Silent.UseResolver.ResolverPred["v3"] ).Z) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v4" and ( (CurrentPosTarget - LastPosTarget) / ((LastTime - CurrentTime) + getgenv().Void.Silent.UseResolver.ResolverPred["v4"] / 100) ).Z) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v5" and (0)) )
        );
        CACHE_CHARACTER.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(
            -- X Axis
            (0 + (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v1" and (CACHE_CHARACTER.Humanoid.MoveDirection * getgenv().Void.Silent.UseResolver.ResolverPred["v1"] * CACHE_CHARACTER.Humanoid.WalkSpeed).X) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v2" and (CACHE_CHARACTER.HumanoidRootPart.CFrame.LookVector * getgenv().Void.Silent.UseResolver.ResolverPred["v1"] * CACHE_CHARACTER.Humanoid.WalkSpeed).X) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v3" and ( (CurrentPosTarget - LastPosTarget) * getgenv().Void.Silent.UseResolver.ResolverPred["v3"] ).X) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v4" and ( (CurrentPosTarget - LastPosTarget) / ((LastTime - CurrentTime) + getgenv().Void.Silent.UseResolver.ResolverPred["v4"] / 100) ).X) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v5" and (0)) ),
            -- Y Axis
            (0 + (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v1" and (CACHE_CHARACTER.Humanoid.MoveDirection * getgenv().Void.Silent.UseResolver.ResolverPred["v1"] * CACHE_CHARACTER.Humanoid.WalkSpeed).Y) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v2" and (CACHE_CHARACTER.HumanoidRootPart.CFrame.LookVector * getgenv().Void.Silent.UseResolver.ResolverPred["v1"] * CACHE_CHARACTER.Humanoid.WalkSpeed).Y) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v3" and ( (CurrentPosTarget - LastPosTarget) * getgenv().Void.Silent.UseResolver.ResolverPred["v3"] ).Y) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v4" and ( (CurrentPosTarget - LastPosTarget) / ((LastTime - CurrentTime) + getgenv().Void.Silent.UseResolver.ResolverPred["v4"] / 100) ).Y) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v5" and (0)) ),
            -- Z Axis
            (0 + (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v1" and (CACHE_CHARACTER.Humanoid.MoveDirection * getgenv().Void.Silent.UseResolver.ResolverPred["v1"] * CACHE_CHARACTER.Humanoid.WalkSpeed).Z) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v2" and (CACHE_CHARACTER.HumanoidRootPart.CFrame.LookVector * getgenv().Void.Silent.UseResolver.ResolverPred["v1"] * CACHE_CHARACTER.Humanoid.WalkSpeed).Z) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v3" and ( (CurrentPosTarget - LastPosTarget) * getgenv().Void.Silent.UseResolver.ResolverPred["v3"] ).Z) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v4" and ( (CurrentPosTarget - LastPosTarget) / ((LastTime - CurrentTime) + getgenv().Void.Silent.UseResolver.ResolverPred["v4"] / 100) ).Z) or (string.lower(getgenv().Void.Silent.UseResolver.ResolverMethod) == "v5" and (0)) )
        ); 
    end; -- this is mostly from my script copeware thats why it looks cancerous
    return ((CACHE_PART or CACHE_CHARACTER[getgenv().Void.Silent.MainPart]).Position) + ((CACHE_PART or CACHE_CHARACTER[getgenv().Void.Silent.MainPart]).Velocity * (getgenv().Void.Silent.Prediction.Pred));
end;
getgenv().Void.Objects.Assets = game:GetDescendants();
getgenv().Void.Cache.LoadConsoleWatermark = function()
    local CACHED_DATA = HttpService:JSONDecode(readfile(getgenv().Void.Settings.Folder .. "/da-hood/voidinfo.json"));
    rconsoleclear();
    if syn then 
        rconsoleclear();
    else
        rconsoleclose();
    end
    rconsolename(string.format("Void %s [BETA]", getgenv().Void.Version or "V3"));
    rconsoleprint("@@LIGHT_GRAY@@")
    rconsoleprint("[beta] - void is ready to be executed, press [enter] to load");
    local CACHE_INPUT = rconsoleinput();
    if (CACHE_INPUT) == "\13" then 
        rconsoleclear();
    end;
    rconsoleprint("@@MAGENTA@@");
    rconsoleprint(string.format("[beta] - void is loading for %s...\n", Players.LocalPlayer.Name));
    rconsoleprint(string.format("[beta] - void total executions: %d", CACHED_DATA.Loaded_Amount));
    task.wait(1);
    if syn then 
        rconsoleclear();
    else
        rconsoleclose();
    end
    repeat task.wait() until game:IsLoaded();
    rconsoleclear();
    rconsolename(string.format("Void %s [BETA]", getgenv().Void.Version or "V3"));
    rconsoleprint(getgenv().Void.Startup.Intro.Data.Console.WATERMARK_COLOR or "@@LIGHT_MAGENTA@@");
    rconsoleprint(getgenv().Void.Watermarks[string.lower(getgenv().Void.Startup.DesiredConsoleWatermark) or "basic"]);
    rconsoleprint("\n");
end;
getgenv().Void.Cache.LoadGameWatermark = function() 
    getgenv().Void.Objects.Intro.INTRO_BLUR = Instance.new("BlurEffect", game.Lighting);
    getgenv().Void.Objects.Intro.INTRO_BLUR.Size = 0;
    task.wait(.85);
    TweenService:Create(getgenv().Void.Objects.Intro.INTRO_BLUR, TweenInfo.new(1), {Size = 20;}):Play();

    getgenv().Void.Objects.Intro.INTRO_GUI = Instance.new("ScreenGui", game:GetService("CoreGui"));


    getgenv().Void.Objects.Intro.INTRO_IMAGE = Instance.new("ImageLabel", getgenv().Void.Objects.Intro.INTRO_GUI);
    getgenv().Void.Objects.Intro.INTRO_IMAGE.AnchorPoint = Vector2.new(0.5, 0.5);
    getgenv().Void.Objects.Intro.INTRO_IMAGE.Position = UDim2.new(0.5, 0, 1, 0);
    getgenv().Void.Objects.Intro.INTRO_IMAGE.Size = UDim2.new(0, 256, 0, 256);
    getgenv().Void.Objects.Intro.INTRO_IMAGE.Image = string.format("http://www.roblox.com/asset/?id=%d", getgenv().Void.Startup.Intro.Data.Game.Image.ID);
    getgenv().Void.Objects.Intro.INTRO_IMAGE.ImageTransparency = 1;
    getgenv().Void.Objects.Intro.INTRO_IMAGE.BorderSizePixel = 0;
    getgenv().Void.Objects.Intro.INTRO_IMAGE.BackgroundTransparency = 1;
    getgenv().Void.Objects.Intro.INTRO_IMAGE.Visible = true;

    task.wait(1);
    TweenService:Create(getgenv().Void.Objects.Intro.INTRO_IMAGE, TweenInfo.new(1.05), {ImageTransparency = 0;}):Play();
    TweenService:Create(getgenv().Void.Objects.Intro.INTRO_IMAGE, TweenInfo.new(1), {Position = UDim2.new(0.5, 0, 0.5, 0);}):Play();

    getgenv().Void.Objects.Intro.INTRO_TEXT = Drawing.new("Text");
    getgenv().Void.Objects.Intro.INTRO_TEXT.Text = "[beta] - void v3 is loading..";
    getgenv().Void.Objects.Intro.INTRO_TEXT.Color = getgenv().Void.Startup.Intro.Data.Game.Watermark.Color or Color3.fromRGB(255, 255, 255);
    getgenv().Void.Objects.Intro.INTRO_TEXT.Outline = true;
    getgenv().Void.Objects.Intro.INTRO_TEXT.Font = Drawing.Fonts[getgenv().Void.Startup.Intro.Data.Game.Watermark.Font];
    getgenv().Void.Objects.Intro.INTRO_TEXT.Position = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2);
    getgenv().Void.Objects.Intro.INTRO_TEXT.Size = 13;
    getgenv().Void.Objects.Intro.INTRO_TEXT.Visible = true;
    getgenv().Void.Objects.Intro.INTRO_TEXT.Center = true;

    getgenv().Void.Objects.Intro.INTRO_SOUND = Instance.new("Sound", workspace);
    getgenv().Void.Objects.Intro.INTRO_SOUND.SoundId = string.format("rbxassetid://%s", tostring(getgenv().Void.Startup.Intro.Data.Game.Sound.ID));
    getgenv().Void.Objects.Intro.INTRO_SOUND.Volume = getgenv().Void.Startup.Intro.Data.Game.Sound.Volume;

    if (getgenv().Void.Startup.Intro.Data.Game.Sound.Enabled) == true then 
        getgenv().Void.Objects.Intro.INTRO_SOUND:Play();
    end;
    task.wait(math.random(1, 2));
    TweenService:Create(getgenv().Void.Objects.Intro.INTRO_BLUR, TweenInfo.new(1.25), {Size = 0;}):Play();
    task.wait(1.25);
    pcall(function() getgenv().Void.Objects.Intro.INTRO_BLUR:Destroy(); end);

    TweenService:Create(getgenv().Void.Objects.Intro.INTRO_IMAGE, TweenInfo.new(1.25), {ImageTransparency = 1;}):Play();
    TweenService:Create(getgenv().Void.Objects.Intro.INTRO_IMAGE, TweenInfo.new(1), {Position = UDim2.new(0.5, 0, 0.15, 0);}):Play();
    pcall(function() getgenv().Void.Objects.Intro.INTRO_IMAGE:Destroy(); end);

    getgenv().Void.Objects.Intro.INTRO_TEXT.Visible = false;
    pcall(function() getgenv().Void.Objects.Intro.INTRO_TEXT:Remove(); end);

end;
if getgenv().Void.Startup.Intro.Enabled == true then
    if string.lower(getgenv().Void.Startup.Intro.Data.IntroType) == "console" then 
        getgenv().Void.Cache.LoadConsoleWatermark();
    elseif string.lower(getgenv().Void.Startup.Intro.Data.IntroType) == "game" then
        getgenv().Void.Cache.LoadGameWatermark();
    elseif string.lower(getgenv().Void.Startup.Intro.Data.IntroType) == "both" then
        getgenv().Void.Cache.LoadConsoleWatermark();
        getgenv().Void.Cache.LoadGameWatermark();
    end;
end;
----------------------------------------------------------------------
getgenv().Void.Cache.WatermarkText = Drawing.new("Text");
getgenv().Void.Cache.WatermarkText.Visible = false;

if not (getgenv().Void.Connections) then getgenv().Void.Connections = {}; end;

table.insert(getgenv().Void.Connections, RunService.RenderStepped:Connect(function() 
    -- Watermark Text
    getgenv().Void.Cache.WatermarkText.Font = getgenv().Void.Startup.Watermark.Font or "UI";
    getgenv().Void.Cache.WatermarkText.Color = getgenv().Void.Startup.Watermark.Color or Color3.fromRGB(127, 59, 30);
    getgenv().Void.Cache.WatermarkText.Outline = getgenv().Void.Startup.Watermark.Outline or true;
    getgenv().Void.Cache.WatermarkText.Size = getgenv().Void.Startup.Watermark.Size;
    getgenv().Void.Cache.WatermarkText.Visible = getgenv().Void.Startup.Watermark.Enabled;
    getgenv().Void.Cache.WatermarkText.Text = getgenv().Void.Startup.Watermark.Text;
    getgenv().Void.Cache.WatermarkText.Position = Vector2.new(5, 50);
end))
----------------------------------------------------------------------
-- Memory Spoofer
local PerformanceStats = CoreGui:WaitForChild("RobloxGui"):WaitForChild("PerformanceStats", 2);
local DevConsole = CoreGui:WaitForChild("DevConsoleMaster", 2);

if PerformanceStats ~= nil then
    for index, key in next, PerformanceStats:GetDescendants() do 
        if key:IsA("TextLabel") and key.Text == "Mem" then
            table.insert(getgenv().Void.Connections, key.Parent.ValueLabel:GetPropertyChangedSignal("Text"):Connect(function() 
                getgenv().Void.Cache.MemorySpoofer.SpoofedMem += tonumber(string.format("%.2f", math.random() + math.random(-1, 1) ));
                if (getgenv().Void.Cache.MemorySpoofer.SpoofedMem < math.random(getgenv().Void.Cache.MemorySpoofer.SpoofMem_Positive[0], getgenv().Void.Cache.MemorySpoofer.SpoofMem_Positive[1])) then 
                    getgenv().Void.Cache.MemorySpoofer.SpoofedMem += math.random() + math.random(1, 5);
                elseif (getgenv().Void.Cache.MemorySpoofer.SpoofedMem > math.random(getgenv().Void.Cache.MemorySpoofer.SpoofMem_Negative[0], getgenv().Void.Cache.MemorySpoofer.SpoofMem_Negative[1])) then
                    getgenv().Void.Cache.MemorySpoofer.SpoofedMem -= math.random() + math.random(1, 8);
                end;
                key.Parent.ValueLabel.Text = string.format("%.2f MB", getgenv().Void.Cache.MemorySpoofer.SpoofedMem);
                if PerformanceStats:FindFirstChild("PS_Viewer") then 
                    for index, key in next, PerformanceStats:FindFirstChild("PS_Viewer"):GetDescendants() do 
                        if key:IsA("TextLabel") and string.find(key.Text, "Current") then 
                            key.Text = string.format("Current: %.2f MB", getgenv().Void.Cache.MemorySpoofer.SpoofedMem);
                        end;
                        if key:IsA("TextLabel") and string.find(key.Text, "Average") then 
                            key.Text = string.format("Average: %.2f MB", getgenv().Void.Cache.MemorySpoofer.SpoofedMem + math.random() + math.random(0, 0.15));
                        end;
                    end
                end;
            end));
        end
    end;
end;
table.insert(getgenv().Void.Connections, RunService.RenderStepped:Connect(function()
    if DevConsole ~= nil then 
        for index, key in next, DevConsole:GetDescendants() do 
            if key:IsA("TextButton") and key.Name == "MemoryUsage_MB" then 
                    getgenv().Void.Cache.MemorySpoofer.SpoofedMem_Console += tonumber(math.random(1, 3));
                    if (getgenv().Void.Cache.MemorySpoofer.SpoofedMem_Console < math.random(getgenv().Void.Cache.MemorySpoofer.SpoofMem_Positive[0], getgenv().Void.Cache.MemorySpoofer.SpoofMem_Positive[1])) then 
                        getgenv().Void.Cache.MemorySpoofer.SpoofedMem_Console += math.random(1, 5);
                    elseif (getgenv().Void.Cache.MemorySpoofer.SpoofedMem_Console > math.random(getgenv().Void.Cache.MemorySpoofer.SpoofMem_Negative[0], getgenv().Void.Cache.MemorySpoofer.SpoofMem_Negative[1])) then
                        getgenv().Void.Cache.MemorySpoofer.SpoofedMem_Console -= math.random(1, 8);
                    end;
                    key.Text = string.format("%d MB", getgenv().Void.Cache.MemorySpoofer.SpoofedMem_Console);
            end;
        end
    end;
    task.wait(.5);
end))
hookfunction(gcinfo, function(...) 
    return tonumber(OldFunctions[0]()) - math.random(125, 284);
end);
hookfunction(collectgarbage, function(method) 
    if method == "count" then 
        return getgenv().Void.Cache.MemorySpoofer.SpoofedMem;
    else
        return OldFunctions[1](method);
    end;
end);
----------------------------------------------------------------------
-- Fake macro
table.insert(getgenv().Void.Connections, UserInputService.InputBegan:Connect(function(Input, IsTXTBoxFocused)
    if not IsTXTBoxFocused then
        if Input.KeyCode == Enum.KeyCode[getgenv().Void.Settings.Keybinds.FakeMacro] then
            getgenv().Void.Settings.FakeMacro.Toggled = not getgenv().Void.Settings.FakeMacro.Toggled;
            if getgenv().Void.Settings.FakeMacro.Toggled == true then 
                if string.lower(getgenv().Void.Settings.FakeMacro.Mode) == "automatic detection" then 
                    if Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Head") and Players.LocalPlayer.Character:FindFirstChild("Head").LocalTransparencyModifier == 1 then 
                        if getgenv().Void.Settings.FakeMacro.Method == "keypress" and isrbxactive() == true then 
                            repeat
                                RunService.RenderStepped:Wait();
                                keypress(0x49);
                                RunService.RenderStepped:Wait();
                                keyrelease(0x49);
                                RunService.RenderStepped:Wait();
                                keypress(0x4F);
                                RunService.RenderStepped:Wait();
                                keyrelease(0x4F);
                                RunService.RenderStepped:Wait();
                            until getgenv().Void.Settings.FakeMacro.Toggled == false;
                        elseif getgenv().Void.Settings.FakeMacro.Method == "virtual" then
                            repeat

                                RunService.RenderStepped:Wait();
                                VirtualInputManager:SendKeyEvent(true, "I", false, game);
                                RunService.RenderStepped:Wait();
                                VirtualInputManager:SendKeyEvent(true, "O", false, game);
                                RunService.RenderStepped:Wait();
                            until getgenv().Void.Settings.FakeMacro.Toggled == false;
                        end
                    elseif Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Head")  then
                        if getgenv().Void.Settings.FakeMacro.Method == "keypress" and isrbxactive() == true then 
                            repeat
                                RunService.RenderStepped:Wait();
                                keypress(0x49);
                                RunService.RenderStepped:Wait();
                                keyrelease(0x49);
                                RunService.RenderStepped:Wait();
                                keypress(0x4F);
                                RunService.RenderStepped:Wait();
                                keyrelease(0x4F);
                                RunService.RenderStepped:Wait();
                            until getgenv().Void.Settings.FakeMacro.Toggled == false;
                        elseif getgenv().Void.Settings.FakeMacro.Method == "virtual" then
                            repeat
                                RunService.RenderStepped:Wait();
                                VirtualInputManager:SendKeyEvent(true, "I", false, game);
                                RunService.RenderStepped:Wait();
                                VirtualInputManager:SendKeyEvent(true, "O", false, game);
                                RunService.RenderStepped:Wait();
                            until getgenv().Void.Settings.FakeMacro.Toggled == false;
                        end
                    end
                elseif string.lower(getgenv().Void.Settings.FakeMacro.Mode) == "3rd person" then
                    if getgenv().Void.Settings.FakeMacro.Method == "keypress" and isrbxactive() == true then 
                        repeat
                            RunService.RenderStepped:Wait();
                            keypress(0x49);
                            RunService.RenderStepped:Wait();
                            keyrelease(0x49);
                            RunService.RenderStepped:Wait();
                            keypress(0x4F);
                            RunService.RenderStepped:Wait();
                            keyrelease(0x4F);
                            RunService.RenderStepped:Wait();
                        until getgenv().Void.Settings.FakeMacro.Toggled == false;
                    elseif getgenv().Void.Settings.FakeMacro.Method == "virtual" then
                        repeat
                            RunService.RenderStepped:Wait();
                            VirtualInputManager:SendKeyEvent(true, "I", false, game);
                            RunService.RenderStepped:Wait();
                            VirtualInputManager:SendKeyEvent(true, "O", false, game);
                            RunService.RenderStepped:Wait();
                        until getgenv().Void.Settings.FakeMacro.Toggled == false;
                    end
                elseif string.lower(getgenv().Void.Settings.FakeMacro.Mode) == "first person" then
                    if getgenv().Void.Settings.FakeMacro.Method == "keypress" and isrbxactive() == true then 
                        repeat
                            RunService.RenderStepped:Wait();
                            keypress(0x49);
                            RunService.RenderStepped:Wait();
                            keyrelease(0x49);
                            RunService.RenderStepped:Wait();
                            keypress(0x4F);
                            RunService.RenderStepped:Wait();
                            keyrelease(0x4F);
                            RunService.RenderStepped:Wait();
                        until getgenv().Void.Settings.FakeMacro.Toggled == false;
                    elseif getgenv().Void.Settings.FakeMacro.Method == "virtual" then
                        repeat
                            RunService.RenderStepped:Wait();
                            VirtualInputManager:SendKeyEvent(true, "I", false, game);
                            RunService.RenderStepped:Wait();
                            VirtualInputManager:SendKeyEvent(true, "O", false, game);
                            RunService.RenderStepped:Wait();
                        until getgenv().Void.Settings.FakeMacro.Toggled == false;
                    end
                end

            end
        end;
        if Input.KeyCode == Enum.KeyCode[getgenv().Void.Settings.Keybinds.Panic] then 
            if getgenv().Void.Settings.Panic.Enabled == true then 
                for index, connection in next, getgenv().Void.Connections do 
                    pcall(function() 
                        connection:Disconnect();
                    end)
                end;
                hookfunction(gcinfo, OldFunctions[0]);
                hookfunction(collectgarbage, OldFunctions[1]);
                pcall(function()
                    for index, key in next, getgenv().Void.Cache do 
                        key:Destroy();
                        key:Remove();
                        key.Parent = nil;
                    end
                    getgenv().Void.Cache.Lock.Target = nil;
                    getgenv().Void.Cache.Lock.Toggled = false;
                end);
                game_metatable.__namecall = old_namecall;
                getgenv().Void = nil;
                setfenv(1, {});
            end;
        end;
        if Input.KeyCode == Enum.KeyCode[getgenv().Void.Settings.Keybinds.Silent] then 
            getgenv().Void.Silent.Toggled = not getgenv().Void.Silent.Toggled;
        end;
    end;
end));
----------------------------------------------------------------------
table.insert(getgenv().Void.Connections, RunService.RenderStepped:Connect(function()
    if (getgenv().Void.Settings.Mod_Detect.Enabled) == true then 
        for index, player in next, Players:GetPlayers() do 
            if isGroupGame == true then 
                if player:IsInGroup(getGroupId) and player:GetRankInGroup(getGroupId) >= getgenv().Void.Settings.Mod_Detect.Rank then
                    if string.lower(getgenv().Void.Settings.Mod_Detect.Method) == "kick" then 
                        Players.LocalPlayer:Kick
                    elseif string.lower(getgenv().Void.Settings.Mod_Detect.Method) == "notification" then
                        SendNotification("void v3", ((getgenv().Void.Settings.KICK_REASONS.MOD_JOINED):match("void") and getgenv().Void.Settings.KICK_REASONS.MOD_JOINED or "[beta] - void v3 - mod detected"), 5);
                    end;
                end;
            end
        end
    end;
end));
----------------------------------------------------------------------
if getgenv().Void.Startup.Notification.Enabled == true then 
    SendNotification("Void V3", string.format("[beta] - void v3 loaded in %.2f seconds", tick() - getgenv().Void.Cache.Execution or tick()));
elseif getgenv().Void.Startup.Intro.Enabled == true and string.lower(getgenv().Void.Startup.Intro.Data.IntroType) == "console" then
    rconsoleprint("\n");
    rconsoleprint(string.format("Void %s [BETA] loaded in %.2f seconds!", getgenv().Void.Version, tick() - getgenv().Void.Cache.Execution or tick() ))
    task.wait(1);
    rconsoleclear();
    if syn then 
        rconsoleclear();
    else
        rconsoleclose();
    end;
end;
----------------------------------------------------------------------
if (getgenv().Void.Settings.FPS.Boost) == true then 
    loadstring(game:HttpGet("https://pastebin.com/raw/0b5Z49Jp"))();
end;
if (getgenv().Void.Settings.FPS.UnlockFPS) == true then
    setfpscap(getgenv().Void.Settings.FPS.MaxFPSCap or 999);
end;
table.insert(getgenv().Void.Connections, RunService.RenderStepped:Connect(function() 
    if getgenv().Void.Silent.Prediction.AutomaticPred.Enabled == true then 
        if string.lower(getgenv().Void.Silent.Prediction.AutomaticPred.Mode) == "advanced" then 
            getgenv().Void.Silent.Prediction.Pred = Generate_Pred(Stats.Network.ServerStatsItem["Data Ping"]:GetValue(), getgenv().Void.Silent.Prediction.AutomaticPred.Range)
        elseif string.lower(getgenv().Void.Silent.Prediction.AutomaticPred.Mode) == "default" then
            getgenv().Void.Silent.Prediction.Pred =
            -- 30 Ping
            (Stats.Network.ServerStatsItem["Data Ping"]:GetValue() >= 30 and Stats.Network.ServerStatsItem["Data Ping"]:GetValue() <= 39) and getgenv().Void.Silent.Prediction.AutomaticPred.PingPreds[30] or
            -- 40 Ping
            (Stats.Network.ServerStatsItem["Data Ping"]:GetValue() >= 40 and Stats.Network.ServerStatsItem["Data Ping"]:GetValue() <= 49) and getgenv().Void.Silent.Prediction.AutomaticPred.PingPreds[40] or
            -- 50 Ping
            (Stats.Network.ServerStatsItem["Data Ping"]:GetValue() >= 50 and Stats.Network.ServerStatsItem["Data Ping"]:GetValue() <= 59) and getgenv().Void.Silent.Prediction.AutomaticPred.PingPreds[50] or
            -- 60 Ping
            (Stats.Network.ServerStatsItem["Data Ping"]:GetValue() >= 60 and Stats.Network.ServerStatsItem["Data Ping"]:GetValue() <= 69) and getgenv().Void.Silent.Prediction.AutomaticPred.PingPreds[60] or
            -- 70 Ping
            (Stats.Network.ServerStatsItem["Data Ping"]:GetValue() >= 70 and Stats.Network.ServerStatsItem["Data Ping"]:GetValue() <= 79) and getgenv().Void.Silent.Prediction.AutomaticPred.PingPreds[70] or
            -- 80 Ping
            (Stats.Network.ServerStatsItem["Data Ping"]:GetValue() >= 80 and Stats.Network.ServerStatsItem["Data Ping"]:GetValue() <= 89) and getgenv().Void.Silent.Prediction.AutomaticPred.PingPreds[80] or
            -- 90 Ping
            (Stats.Network.ServerStatsItem["Data Ping"]:GetValue() >= 90 and Stats.Network.ServerStatsItem["Data Ping"]:GetValue() <= 99) and getgenv().Void.Silent.Prediction.AutomaticPred.PingPreds[90] or
            -- 100 Ping
            (Stats.Network.ServerStatsItem["Data Ping"]:GetValue() >= 100 and Stats.Network.ServerStatsItem["Data Ping"]:GetValue() <= 109) and getgenv().Void.Silent.Prediction.AutomaticPred.PingPreds[100] or
            -- 110 Ping
            (Stats.Network.ServerStatsItem["Data Ping"]:GetValue() >= 110 and Stats.Network.ServerStatsItem["Data Ping"]:GetValue() <= 119) and getgenv().Void.Silent.Prediction.AutomaticPred.PingPreds[110] or
            -- 120 Ping
            (Stats.Network.ServerStatsItem["Data Ping"]:GetValue() >= 120 and Stats.Network.ServerStatsItem["Data Ping"]:GetValue() <= 129) and getgenv().Void.Silent.Prediction.AutomaticPred.PingPreds[120] or
            -- 130 Ping
            (Stats.Network.ServerStatsItem["Data Ping"]:GetValue() >= 130 and Stats.Network.ServerStatsItem["Data Ping"]:GetValue() <= 139) and getgenv().Void.Silent.Prediction.AutomaticPred.PingPreds[130] or
            -- 140 Ping
            (Stats.Network.ServerStatsItem["Data Ping"]:GetValue() >= 140 and Stats.Network.ServerStatsItem["Data Ping"]:GetValue() <= 149) and getgenv().Void.Silent.Prediction.AutomaticPred.PingPreds[140] or
            -- >140 Ping
            (Stats.Network.ServerStatsItem["Data Ping"]:GetValue() >= 150) andD getgenv().Void.Silent.Prediction.AutomaticPred.PingPreds[140] + (Stats.Network.ServerStatsItem["Data Ping"]:GetValue() / (Stats.Network.ServerStatsItem["Data Ping"]:GetValue() - (Stats.Network.ServerStatsItem["Data Ping"]:GetValue() - 5) )); -- This is the worst thing i ever made
        end;
    end;
end));
----------------------------------------------------------------------
----------------------------------------------------------------------
-- FOV Circle
table.insert(getgenv().Void.Connections, RunService.RenderStepped:Connect(function()
    getgenv().Void.Silent.FOV.Visuals.Circle._DRAWING_FOV.Visible = getgenv().Void.Silent.FOV.UseFOV;
    getgenv().Void.Silent.FOV.Visuals.Circle._DRAWING_FOV.Color = getgenv().Void.Silent.FOV.Visuals.Circle.Color;
    getgenv().Void.Silent.FOV.Visuals.Circle._DRAWING_FOV.Filled = getgenv().Void.Silent.FOV.Visuals.Circle.Filled;
    getgenv().Void.Silent.FOV.Visuals.Circle._DRAWING_FOV.Transparency = getgenv().Void.Silent.FOV.Visuals.Circle.Transparency;
    getgenv().Void.Silent.FOV.Visuals.Circle._DRAWING_FOV.NumSides = getgenv().Void.Silent.FOV.Visuals.Circle.NumSides;
    getgenv().Void.Silent.FOV.Visuals.Circle._DRAWING_FOV.Thickness = getgenv().Void.Silent.FOV.Visuals.Circle.Thickness;
    getgenv().Void.Silent.FOV.Visuals.Circle._DRAWING_FOV.Radius = getgenv().Void.Silent.Radius;
    getgenv().Void.Silent.FOV.Visuals.Circle._DRAWING_FOV.Position = Players.LocalPlayer:GetMouse().Hit.Position;
end))
----------------------------------------------------------------------
-- remote hook
local game_mt = getrawmetatable(game);
local old_nmc = game_mt.__namecall;
setreadonly(game_mt, false);
game_mt.__namecall = newcclosure(function(...) -- define varargs
    local cache_args = {...}; -- im not just gonna modify ({...}) cuz thats gonna fk up the whole hook
    if getnamecallmethod() == "FireServer" and getgenv().Void.Silent.Toggled == true and cache_args[2] == getgenv().Void.Silent.ARGUMENT_INDICATOR then
        cache_args[3] = PredictTarget(GetNearest(getgenv().Void.Silent.Method));
        return old_nmc(unpack(cache_args));
    end;
    return old_nmc(...);
end)
---------------------------------------------------------------------- [ SILENT AIM ]

-- blizex wtf is "discord join module" lil bro
JoinModule.Prompt({ 
    invite = "https://discord.gg/closet", 
    name = "Void V3" 
}) -- Discord
JoinModule.Join("https://discord.gg/closet");
