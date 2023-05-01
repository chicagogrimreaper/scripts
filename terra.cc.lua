--[[
TERRA.CC
SOURCE HACKED BY: sturmgeist#0001
ORIGINAL OWNER: idk he keeps changing his tag 🔥
ISTHISSCRIPTSKIDDED: ✅
]]

getgenv().JoinTheDiscord = "https://discord.gg/SXQvSGme7F";
getgenv().deepwokenscript_IsSkidded = yes or true; -- Yes is not variable xd = nil so then we do or statement and it true gg

if getgenv().deepwokenscriptran == true or not Drawing then
	return
end

if type(_G.espCons) == 'table' and type(_G.espDrawings) == 'table' then
	for i,v in pairs(_G.espCons) do
		pcall(function()
			v:Disconnect()
		end)
	end
	for i,v in pairs(_G.espDrawings) do
		pcall(function()
			v:Remove()
		end)
	end
	table.clear(_G.espCons)
	print('restarted the script')
end

--for self, risky mode makes text red and add [RISKY] to the tooltip

local scriptSettings = {
	visual = {
		showDistance = false,
		showHealth = true, 
		textColor = Color3.fromRGB(255,0,0)
	},
	toggles = {
		speed = false,
		speedAmount = 16,
		jp = false,
		jpAmount = 50,
		fly = false,
		noclip = false,
		nofall = true,
		noacid = false,
		knocked = false,
		espSettings = {
			espEnabled = true,
			espMobEnabled = true,
			espChestEnabled = true,
			espBagsEnabled = true,
			espWhirlpoolEnabled = true,
			espOwlEnabled = true,
		},
	},
}

local protectedInstances = {}
local spoofedprops = {}
local hooks = {}


_G.espCons = {}
_G.espDrawings = {}
_G.scriptSettings = scriptSettings

local methods = {
	'FindFirstChild',
	'FindFirstChildOfClass',
	'GetChildren',
	'GetDescendants',
	'WaitForChild',
	'FindFirstChildWhichIsA',
	'FindFirstDescendant',
	'FindFirstAncestorWhichIsA',
	'FindFirstAncestorOfClass',
	'FindFirstAncestor',
	'findFirstChild',
	'findFirstChildWhichIsA',
	'findFirstChildOfClass',
	'getChildren',
	'children',
	'getDescendants'
}

local evmethods = {
	"ChildAdded",
	"ChildRemoved",
	"DescendantRemoving",
	"DescendantAdded",
	"childAdded",
	"childRemoved",
	"descendantRemoving",
	"descendantAdded",
	"Changed",
}
local connectionses = {}

local plrs = game:GetService('Players')
local localplr = plrs.LocalPlayer
local char = localplr.Character
local backpack = localplr.Backpack
local mouse = localplr:GetMouse()

FLYING = false
QEfly = true
flyspeed = 1
vehicleflyspeed = 1

local function GetParents(Object)
	local Parents = { Object.Parent };
	local CurrentParent = Object.Parent;
	while CurrentParent ~= game and CurrentParent ~= nil do
		CurrentParent = CurrentParent.Parent;
		table.insert(Parents, CurrentParent)
	end
	return Parents;
end

function getRoot(charac)
	local rootPart = charac and (charac:FindFirstChild('HumanoidRootPart') or charac:FindFirstChild('Torso') or charac:FindFirstChild('UpperTorso')) or (localplr.Character:FindFirstChild('HumanoidRootPart') or localplr.Character:FindFirstChild('Torso') or localplr.Character:FindFirstChild('UpperTorso'))
	return rootPart
end

function getTorso(plr)
	local charac = typeof(plr) == 'Model' and plr or plr and plr.Character
	local torsoPart = charac and (charac:FindFirstChild('Torso') or charac:FindFirstChild('UpperTorso')) or (localplr.Character:FindFirstChild('Torso') or localplr.Character:FindFirstChild('UpperTorso'))
	return torsoPart
end

function getHum(char)
	local humanoid = char and (char:FindFirstChildOfClass('Humanoid')) or (localplr.Character:FindFirstChildOfClass('Humanoid'))
	return humanoid
end

table.insert(connectionses,localplr.CharacterAdded:Connect(function(charac)
	char = charac
	backpack = localplr.Backpack
end))

local clonefunc = game.Clone

local function foundInTable(instance)
	if typeof(instance) == 'Instance' then
		for i,v in pairs(spoofedprops) do
			if v.instance == instance then
				return true
			end
		end
		return false
	end
end

local camera = workspace.CurrentCamera
local function applyEspToObject(obj, showDist, showHealth, showHealthPrecentage )
	if typeof(obj) == 'Instance' then
		local humanoid = obj.Parent:FindFirstChildOfClass('Humanoid')
		local text = Drawing.new('Text')
		text.Text = string.format('%s',humanoid and humanoid.Parent.Name or obj.Name)
		if showDist then
			text.Text = string.format('%s [%d]',humanoid and humanoid.Parent.Name or obj.Name, (getRoot().Position - obj.Position).Magnitude)
		elseif showHealth then
			if humanoid then
				text.Text = string.format([[ %s [%d]
				[%d/%d] ]],humanoid and humanoid.Parent.Name or obj.Name, (getRoot().Position - obj.Position).Magnitude,humanoid and humanoid.Health or 0,humanoid and humanoid.MaxHealth or 0)
				if showHealthPrecentage then
					text.Text = string.format([[ %s [%d]
				[%d/%d] [%d %s] ]],humanoid and humanoid.Parent.Name or obj.Name, (getRoot().Position - obj.Position).Magnitude,humanoid and humanoid.Health or 0,humanoid and humanoid.MaxHealth or 0,math.floor(humanoid.Health + 0.5),'%')
				end
			end
		end
		text.Outline = true
		text.Center = true
		text.Color = Color3.fromRGB(255, 255, 255)
		text.Position = Vector2.new(50,50)
		text.Visible = true

		con = nil; con = game:GetService('RunService').RenderStepped:Connect(function()	
			if scriptSettings.toggles.espSettings.espEnabled == true then
				if obj == nil or obj.Parent == nil or not obj:GetFullName():find(workspace.Name) then
					con:Disconnect()
					text:Remove()
				end
				local vec, onscreen = camera:WorldToViewportPoint(obj.Position)
				if onscreen then
					if text then
						text.Visible = true
						text.Position = Vector2.new(vec.X, vec.Y)
						text.Text = string.format(' %s '..(showDist and string.format('[%d]',(getRoot().Position - obj.Position).Magnitude) or '')..
							(showHealth and string.format([[

[%d/%d] ]],humanoid and humanoid.Health or 0,humanoid and humanoid.MaxHealth or 0) or '')
								..(showHealthPrecentage and (showHealth and string.format('[%d%s]',math.floor(0.5 + humanoid.health),'%%') or string.format([[

[%d%s] ]],math.floor(0.5 + humanoid.Health),'%%') ) ),(humanoid and humanoid.Parent.Name or obj.Name))

					end
				else
					text.Visible = false
				end
			else
				text.Visible = false
			end
		end)
		table.insert(_G.espCons, con)
		table.insert(_G.espDrawings, text)
	end
end

local function betterSetProperty(object, index, value, customFunction)

	local cons = {}
	if typeof(value) == 'Instance' then
		for _,con in pairs(evmethods) do
			for i,v in pairs(getconnections(value[con])) do
				table.insert(cons, v)
				v:Disable()
			end
		end
		for _,parent in pairs(GetParents(value)) do
			if parent and parent.Parent ~= nil then
				for _,con in pairs(evmethods) do
					for i,v in pairs(getconnections(parent[con])) do
						table.insert(cons, v)
						v:Disable()
					end
				end
			end
		end
	end

	if object:GetPropertyChangedSignal(index) then
		for i,v in pairs(getconnections(object:GetPropertyChangedSignal(index))) do
			table.insert(cons, v)
			v:Disable()
		end
	end

	for _,con in pairs(evmethods) do
		for i,v in pairs(getconnections(object[con])) do
			table.insert(cons, v)
			v:Disable()
		end
	end

	for _,parent in pairs(GetParents(object)) do
		if parent and parent.Parent ~= nil then
			for _,con in pairs(evmethods) do
				for i,v in pairs(getconnections(parent[con])) do
					table.insert(cons, v)
					v:Disable()
				end
			end
		end
	end

	for i,v in pairs(getconnections(game.ItemChanged)) do
		table.insert(cons, v)
		v:Disable()
	end
	for i,v in pairs(getconnections(game.itemChanged)) do
		table.insert(cons, v)
		v:Disable()
	end

	if customFunction then
		customFunction(object, index, value)
	else
		object[index] = value
	end

	for i,v in pairs(cons) do
		v:Enable()
	end
end

local function protectInstance(instance)
	if typeof(instance) == 'Instance' then
		local arch = instance.Archivable
		betterSetProperty(instance,'Archivable',true)
		local cloned = clonefunc(instance)
		local prop = table.insert(protectedInstances,{instance = instance})
		betterSetProperty(instance,'Archivable',arch)
	end
end

local function unprotectInstance(instance)
	if typeof(instance) == 'Instance' then
		for i,v in pairs(protectedInstances) do
			if v.instance == instance then
				v.instance = nil
			end
		end
	end
end

local function spoofProp(instance,prop)
	if typeof(instance) == 'Instance' then
		local arch = instance.Archivable
		betterSetProperty(instance,'Archivable',true)
		local cloned = clonefunc(instance)
		local prop = table.insert(spoofedprops,{instance = instance, prop = prop, clone = cloned})
		betterSetProperty(instance,'Archivable',arch)
	end
end

local function unspoofProp(instance)
	if typeof(instance) == 'Instance' then
		for i,v in pairs(spoofedprops) do
			if v.instance == instance then
				v.instance = nil
				v.clone = nil
				v.prop = nil
			end
		end
	end
end

oldnc = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
	local args = {...}
	local method = getnamecallmethod()

	if not checkcaller() then
		if self ~= nil then
			local callingmethod = getnamecallmethod()
			if callingmethod == "IsA" or callingmethod == "isA" then
				for i,v in pairs(protectedInstances) do
					if self == v.instance then
						return false
					end
				end
			end
			if not table.find(methods,callingmethod) then
				return oldnc(self, ...)
			end
			local result = oldnc(self, ...)
			if result then
				if typeof(result) == 'Instance' then
					for i,v in pairs(protectedInstances) do
						if v.instance == result then
							return nil
						end
					end
				elseif typeof(result) == 'table' then
					for _,x in pairs(result) do
						for i,v in pairs(protectedInstances) do
							if x == v.instance then
								table.remove(result,_)
							end
						end
					end
					return result
				end
			end
		end
	end
	return oldnc(self, ...)
end))


-- couldve added all of the hook functions in here, but i wanna keep it more seperated and nice so yeah
oldindex = hookmetamethod(game, "__index", newcclosure(function(self, key)
	local method = getnamecallmethod()

	if self ~= nil then
		if not checkcaller() then
			if key == "IsA" or key == "isA" then
				for i,v in pairs(protectedInstances) do
					if self == v.instance then
						return false
					end
				end
			end

			for i,v in pairs(spoofedprops) do
				if self == v.instance and key == v.prop and not checkcaller() then
					if v.clone ~= nil then
						return oldindex(v.clone, key)
					end
				end

				if key == 'Parent' and (self == v.clone or self == v.instance) and not checkcaller() then
					return oldindex(v.instance, key)
				end
			end
			return oldindex(self, key)
		end
	end
	return oldindex(self, key)
end))

local setByExploit = false
oldnewindex = hookmetamethod(game, "__newindex", newcclosure(function(self, key, new, ...)
	if self ~= nil then
		if checkcaller() then
			for i,v in pairs(spoofedprops) do
				if self == v.instance then
					if setByExploit == false then
						setByExploit = true
						print(self)
						print(v.prop)
						print('Bam Besk')
						betterSetProperty(self, key, new, oldnewindex)
						setByExploit = false
					end
				end
			end
		else
			for i,v in pairs(spoofedprops) do
				if self == v.instance and key == tostring(v.prop) then
					if v.clone ~= nil then
						return oldnewindex(v.clone, key, new, ...)
					end
				end
			end
		end
	end
	return oldnewindex(self, key, new, ...)
end))

for i,v in pairs(methods) do
	local old
	old = hookfunction(game[v],function(self, ...)

		if not checkcaller() then
			if self ~= nil then
				local result = old(self, ...)
				if result then
					if typeof(result) == 'Instance' then
						for i,v in pairs(protectedInstances) do
							if v.instance == result then
								return nil
							end
						end
					elseif typeof(result) == 'table' then
						for _,x in pairs(result) do
							for i,v in pairs(protectedInstances) do
								if x == v.instance then
									table.remove(result,_)
								end
							end
						end
						return result
					end
				end
			end
		else
			return old(self, ...)
		end
		return old(self, ...)
	end)
end

function sFLY(vfly)
	repeat task.wait() until localplr and char and (getRoot() ~= nil and getHum() ~= nil)
	repeat task.wait() until mouse
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end

	local T = getRoot()
	local CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
	local SPEED = 0

	local function FLY()
		FLYING = true
		local BG = Instance.new('BodyGyro')
		local BV = Instance.new('BodyVelocity')
		protectInstance(BG)
		protectInstance(BV)
		BG.P = 9e4
		BG.Parent = T
		BV.Parent = T
		BG.maxTorque = Vector3.new(9e9, 9e9, 9e9)
		BG.cframe = T.CFrame
		BV.velocity = Vector3.new(0, 0, 0)
		BV.maxForce = Vector3.new(9e9, 9e9, 9e9)

		task.spawn(function()
			repeat wait()
				if not vfly and getHum() ~= nil then
					--getHum().PlatformStand = true
				end
				if CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0 then
					SPEED = 50
				elseif not (CONTROL.L + CONTROL.R ~= 0 or CONTROL.F + CONTROL.B ~= 0 or CONTROL.Q + CONTROL.E ~= 0) and SPEED ~= 0 then
					SPEED = 0
				end
				if (CONTROL.L + CONTROL.R) ~= 0 or (CONTROL.F + CONTROL.B) ~= 0 or (CONTROL.Q + CONTROL.E) ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (CONTROL.F + CONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(CONTROL.L + CONTROL.R, (CONTROL.F + CONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
					lCONTROL = {F = CONTROL.F, B = CONTROL.B, L = CONTROL.L, R = CONTROL.R}
				elseif (CONTROL.L + CONTROL.R) == 0 and (CONTROL.F + CONTROL.B) == 0 and (CONTROL.Q + CONTROL.E) == 0 and SPEED ~= 0 then
					BV.velocity = ((workspace.CurrentCamera.CoordinateFrame.lookVector * (lCONTROL.F + lCONTROL.B)) + ((workspace.CurrentCamera.CoordinateFrame * CFrame.new(lCONTROL.L + lCONTROL.R, (lCONTROL.F + lCONTROL.B + CONTROL.Q + CONTROL.E) * 0.2, 0).p) - workspace.CurrentCamera.CoordinateFrame.p)) * SPEED
				else
					BV.velocity = Vector3.new(0, 0, 0)
				end
				BG.cframe = workspace.CurrentCamera.CoordinateFrame
			until not FLYING
			CONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			lCONTROL = {F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0}
			SPEED = 0
			BG:Destroy()
			BV:Destroy()
			if getHum() ~= nil then
				--getHum().PlatformStand = false
			end
		end)
	end
	flyKeyDown = mouse.KeyDown:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = (vfly and vehicleflyspeed or flyspeed)
		elseif KEY:lower() == 's' then
			CONTROL.B = - (vfly and vehicleflyspeed or flyspeed)
		elseif KEY:lower() == 'a' then
			CONTROL.L = - (vfly and vehicleflyspeed or flyspeed)
		elseif KEY:lower() == 'd' then 
			CONTROL.R = (vfly and vehicleflyspeed or flyspeed)
		elseif QEfly and KEY:lower() == 'e' then
			CONTROL.Q = (vfly and vehicleflyspeed or flyspeed)*2
		elseif QEfly and KEY:lower() == 'q' then
			CONTROL.E = -(vfly and vehicleflyspeed or flyspeed)*2
		end
		
		pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Track end)
	end)
	flyKeyUp = mouse.KeyUp:Connect(function(KEY)
		if KEY:lower() == 'w' then
			CONTROL.F = 0
		elseif KEY:lower() == 's' then
			CONTROL.B = 0
		elseif KEY:lower() == 'a' then
			CONTROL.L = 0
		elseif KEY:lower() == 'd' then
			CONTROL.R = 0
		elseif KEY:lower() == 'e' then
			CONTROL.Q = 0
		elseif KEY:lower() == 'q' then
			CONTROL.E = 0
		end
	end)
	FLY()
end

function NOFLY()
	FLYING = false
	if flyKeyDown or flyKeyUp then flyKeyDown:Disconnect() flyKeyUp:Disconnect() end
	if getHum() ~= nil then
		--[[
		spoofProp(getHum(), 'PlatformStand')
		getHum().PlatformStand = false
		]]
	end
	
	pcall(function() workspace.CurrentCamera.CameraType = Enum.CameraType.Custom end)
end

library:init()

local Window = library.NewWindow({
	title = "terra.cc",
	size = UDim2.new(0, 425, 0, 550)
})

local tabs = {
	main = Window:AddTab('Main'),
	visual = Window:AddTab('Visual'),
	misc = Window:AddTab('Misc'),

	Settings = library:CreateSettingsTab(Window),
}

local sections = {
	main = tabs.main:AddSection("Main", 1),
	enable = tabs.visual:AddSection("Esp", 1),
	mobesp = tabs.visual:AddSection("Mob Esp", 1),
	bags = tabs.visual:AddSection("Bag Esp", 1),
	owls = tabs.visual:AddSection("Owl Esp", 1),
	chests = tabs.visual:AddSection("Chest Esp", 1),
	whirlpools = tabs.visual:AddSection("Whirlpool Esp", 1),

}

-- START OF MAIN --

sections.main:AddToggle({
	enabled = true,
	text = "Fly",
	flag = "FlyToggle",
	tooltip = "Toggles the fly.",
	risky = false,
	callback = function(lol)
		if lol == false then
			NOFLY()
		else
			sFLY()
		end
	end
})

sections.main:AddSlider({
	text = "Fly Speed", 
	flag = 'fly_slider', 
	suffix = "", 
	value = 0,
	min = 1, 
	max = 15,
	increment = 0.5,
	tooltip = "Changes the fly speed",
	risky = false,
	callback = function(v) 
		flyspeed = v
		vehicleflyspeed = v
	end
})

sections.main:AddSeparator({
	text = "Humanoid modifications"
})

local speedToggled = false
sections.main:AddToggle({
	text = "Speedhack",
	tooltip = "Toggles the speed hack",
	risky = false,
	callback = function(v)
		local hum = getHum()
		if foundInTable(hum) == false then
			spoofProp(getHum(),'WalkSpeed')
			spoofProp(getHum(),'JumpHeight')
			spoofProp(getHum(),'JumpPower')
		end

		if v == true then
			hum.WalkSpeed = scriptSettings.toggles.speedAmount
		else
			hum.WalkSpeed = 16
		end
		speedToggled = v
	end
}):AddBind({
	text = "Speedhack",
	flag = "speed_toggle",
	nomouse = false,
	noindicator = false,
	tooltip = "Toggles the speed hack",
	mode = "toggle",
	bind = Enum.KeyCode.F1,
	risky = false,
	callback = function(v)
		local hum = getHum()
		if foundInTable(hum) == false then
			spoofProp(getHum(),'WalkSpeed')
			spoofProp(getHum(),'JumpHeight')
			spoofProp(getHum(),'JumpPower')
		end

		if v == true then
			hum.WalkSpeed = scriptSettings.toggles.speedAmount
		else
			hum.WalkSpeed = 16
		end
		speedToggled = v
	end
})

sections.main:AddSlider({
	text = "Speedhack amount", 
	flag = 'speed_Slider', 
	suffix = "", 
	value = 0,
	min = 16, 
	max = 150,
	increment = 1,
	tooltip = "Changes the players walk speed",
	risky = false,
	callback = function(v)
		local hum = getHum()
		if foundInTable(hum) == false then
			spoofProp(getHum(),'WalkSpeed')
			spoofProp(getHum(),'JumpHeight')
			spoofProp(getHum(),'JumpPower')
		end

		if speedToggled == true then
			getHum().WalkSpeed = v
		else
			getHum().WalkSpeed = 16
		end
		scriptSettings.toggles.speedAmount = v
	end
})

local jumpToggled = false
sections.main:AddToggle({
	text = "Jumphack",
	tooltip = "Toggles the jump hack",
	risky = false,
	callback = function(v)
		local hum = getHum()
		if foundInTable(hum) == false then
			spoofProp(getHum(),'JumpHeight')
			spoofProp(getHum(),'JumpPower')
			spoofProp(getHum(),'WalkSpeed')
		end

		if getHum().UseJumpPower then
			getHum().JumpPower = jumpToggled and v or 50
		else
			getHum().JumpHeight = jumpToggled and v or 7.2
		end
		jumpToggled = v
	end
}):AddBind({
	text = "Jumphack",
	flag = "jump_toggle",
	nomouse = false,
	noindicator = false,
	tooltip = "Toggles the jump hack",
	mode = "toggle",
	bind = Enum.KeyCode.F1,
	risky = false,
	callback = function(v)
		local hum = getHum()
		if foundInTable(hum) == false then
			spoofProp(getHum(),'JumpHeight')
			spoofProp(getHum(),'JumpPower')
			spoofProp(getHum(),'WalkSpeed')
		end

		if getHum().UseJumpPower then
			getHum().JumpPower = jumpToggled and v or 50
		else
			getHum().JumpHeight = jumpToggled and v or 7.2
		end
		jumpToggled = v
	end
})

sections.main:AddSlider({
	text = "Jumphack amount", 
	flag = 'jump_slider', 
	suffix = "", 
	value = 0,
	min = 50, 
	max = 150,
	increment = 1,
	tooltip = "Changes the players jump power",
	risky = false,
	callback = function(v)
		local hum = getHum()
		if foundInTable(hum) == false then
			spoofProp(getHum(),'JumpHeight')
			spoofProp(getHum(),'JumpPower')
			spoofProp(getHum(),'WalkSpeed')
		end

		if getHum().UseJumpPower then
			getHum().JumpPower = jumpToggled and v or 50
		else
			getHum().JumpHeight = jumpToggled and v or 7.2
		end
		scriptSettings.toggles.jpAmount = v
	end
})

sections.main:AddToggle({
	text = "Noclip",
	tooltip = "Toggles the noclip",
	risky = false,
	callback = function(v)
		scriptSettings.toggles.noclip = v
		for _, child in pairs(char:GetDescendants()) do
			if child:IsA("BasePart") and child.Name == 'Torso' or child.Name == 'Head' and  child:IsA('BasePart') then
				if foundInTable(child) then
					if child.CanCollide ~= nil then
						child.CanCollide = true
					end
				else
					spoofProp(child, 'CanCollide')
					if child.CanCollide ~= nil then
						child.CanCollide = true
					end
				end
			end
		end
	end
}):AddBind({
	text = "Noclip",
	flag = "noclip_toggle",
	nomouse = false,
	noindicator = false,
	tooltip = "Toggles the noclip",
	mode = "toggle",
	bind = Enum.KeyCode.F3,
	risky = false,
	callback = function(v)
		scriptSettings.toggles.noclip = v
		for _, child in pairs(char:GetDescendants()) do
			if child:IsA("BasePart") and child.Name == 'Torso' or child.Name == 'Head' and  child:IsA('BasePart') then
				if foundInTable(child) then
					if child.CanCollide ~= nil then
						child.CanCollide = true
					end
				else
					spoofProp(child, 'CanCollide')
					if child.CanCollide ~= nil then
						child.CanCollide = true
					end
				end
			end
		end
	end
})

sections.main:AddToggle({
	enabled = true,
	text = "Knocked Ownership",
	flag = "knocked_toggle",
	tooltip = "Makes you able to move when knocked.",
	risky = false,
	callback = function(lol)
		scriptSettings.toggles.knocked = lol
	end
}):AddBind({
	text = "Knocked Ownership",
	flag = "knocked_toggle",
	nomouse = false,
	noindicator = false,
	tooltip = "Makes you able to move when knocked.",
	mode = "toggle",
	bind = Enum.KeyCode.F3,
	risky = false,
	callback = function(v)
		scriptSettings.toggles.knocked = v
	end
})


-- FINISH OF MAIN --

-- START OF VISUAL --

sections.enable:AddToggle({
	enabled = true,
	text = "Toggle Esp",
	flag = "toggle_esp",
	tooltip = "Toggles the esp.",
	risky = false,
	callback = function(lol)
		scriptSettings.toggles.espSettings.espEnabled = lol
	end
})

sections.mobesp:AddToggle({
	enabled = true,
	text = "Enable",
	flag = "toggleMob_esp",
	tooltip = "Toggles the mob esp.",
	risky = false,
	callback = function(lol)
		scriptSettings.toggles.espSettings.espMobEnabled = lol
	end
})

sections.chests:AddToggle({
	enabled = true,
	text = "Enable",
	flag = "toggleChest_esp",
	tooltip = "Toggles the chest esp.",
	risky = false,
	callback = function(lol)
		scriptSettings.toggles.espSettings.espChestEnabled = lol
	end
})

sections.owls:AddToggle({
	enabled = true,
	text = "Enable",
	flag = "toggleOwl_esp",
	tooltip = "Toggles the owl esp.",
	risky = false,
	callback = function(lol)
		scriptSettings.toggles.espSettings.espOwlEnabled = lol
	end
})

sections.whirlpools:AddToggle({
	enabled = true,
	text = "Enable",
	flag = "toggleWhirlpool_esp",
	tooltip = "Toggles the whirlpool esp.",
	risky = false,
	callback = function(lol)
		scriptSettings.toggles.espSettings.espWhirlpoolEnabled = lol
	end
})

sections.bags:AddToggle({
	enabled = true,
	text = "Enable",
	flag = "toggleBags_esp",
	tooltip = "Toggles the bags esp.",
	risky = false,
	callback = function(lol)
		scriptSettings.toggles.espSettings.espBagsEnabled = lol
	end
})


-- END OF VISUAL --

table.insert(connectionses,game:GetService('RunService').RenderStepped:Connect(function()
	if scriptSettings.toggles.knocked == true then
		if getHum().Health <= 4 then
			if getHum().PlatformStand then
				local tool = backpack:FindFirstChildOfClass('Tool')
				getHum():UnequipTools()
				task.wait(.05)
				if tool then
					getHum():EquipTool(tool)
				end
			end
		end
	end
end))

table.insert(connectionses,game:GetService('RunService').Stepped:Connect(function()
	if scriptSettings.toggles.noclip == true then
		if char ~= nil then
			for _, child in pairs(char:GetDescendants()) do
				if child:IsA("BasePart") and child.Name ~= 'HumanoidRootPart' then
					if child.CanCollide == true then
						if not foundInTable(child) then
							spoofProp(child, 'CanCollide')
							child.CanCollide = false
						else
							child.CanCollide = false
						end
					end
				end
			end
		end
	end
end))

local a = library:SendNotification("fart", 6)
task.wait(2)
a:Remove()
