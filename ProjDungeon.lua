local Modules = {
	["Libary"] = loadstring(game:HttpGet("https://raw.githubusercontent.com/Baseplate-LUA/LegoHacks/main/UI%20Lib.lua"))(),
}

Modules.Libary.new({size = Vector2.new(315,250),name = "Project Slayers",mousedisable = true})

local Tabs = {
	["Main"] = Modules.Libary.newtab({name = "Main"}),
}

local Sections = {
	["Main Tab"] = {
		["Dungeon"] = Modules.Libary.newsection({name = "Dungeon",tab = Tabs["Main"] ,side = "left",size = 250}),
	},

}

--[[
   _____                _         _   _ _ _  __      __        _       _     _             ______           _           _              _    _          
  / ____|              | |       | \ | (_) | \ \    / /       (_)     | |   | |           |  ____|         | |         | |            | |  | |         
 | |     _ __ ___  __ _| |_ ___  |  \| |_| |  \ \  / /_ _ _ __ _  __ _| |__ | | ___  ___  | |__ ___  _ __  | |     __ _| |_ ___ _ __  | |  | |___  ___ 
 | |    | '__/ _ \/ _` | __/ _ \ | . ` | | |   \ \/ / _` | '__| |/ _` | '_ \| |/ _ \/ __| |  __/ _ \| '__| | |    / _` | __/ _ \ '__| | |  | / __|/ _ \
 | |____| | |  __/ (_| | ||  __/ | |\  | | |    \  / (_| | |  | | (_| | |_) | |  __/\__ \ | | | (_) | |    | |___| (_| | ||  __/ |    | |__| \__ \  __/
  \_____|_|  \___|\__,_|\__\___| |_| \_|_|_|     \/ \__,_|_|  |_|\__,_|_.__/|_|\___||___/ |_|  \___/|_|    |______\__,_|\__\___|_|     \____/|___/\___|
                                                                                                                                                                                                                       
]]

local variables = {
	["FishFarm"] = false,
	["Busy"] = false,
	["NoClip"] = false,
	["WalkSpeed"] = 0,
	["SetTime"] = false,
	["ClockTime"] = 12,
	["TeleportScale"] = 200,
	["AttackWaitTime"] = 1,
	["AutoAttack"] = false,
	["LastAttack"] = 0,
	["Debug"] = false,
	["BossFarm"] = false,
	["CurrentBoss"] = false,
	["Attacking"] = false,
	["OldNoclip"] = false,
	["KillFarm"] = false
}

--[[
  _____        __ _       _               _____                       _           _   ______                _   _                 
 |  __ \      / _(_)     (_)             |  __ \                     | |         | | |  ____|              | | (_)                
 | |  | | ___| |_ _ _ __  _ _ __   __ _  | |__) |___ _ __   ___  __ _| |_ ___  __| | | |__ _   _ _ __   ___| |_ _  ___  _ __  ___ 
 | |  | |/ _ \  _| | '_ \| | '_ \ / _` | |  _  // _ \ '_ \ / _ \/ _` | __/ _ \/ _` | |  __| | | | '_ \ / __| __| |/ _ \| '_ \/ __|
 | |__| |  __/ | | | | | | | | | | (_| | | | \ \  __/ |_) |  __/ (_| | ||  __/ (_| | | |  | |_| | | | | (__| |_| | (_) | | | \__ \
 |_____/ \___|_| |_|_| |_|_|_| |_|\__, | |_|  \_\___| .__/ \___|\__,_|\__\___|\__,_| |_|   \__,_|_| |_|\___|\__|_|\___/|_| |_|___/
                                   __/ |            | |                                                                           
                                  |___/             |_|                                                                           
]]

local Functions = {
	["DoM1s"] = function(RP)
		-- Script generated by SimpleSpy - credits to exxtremewa#9394
		-- This generator is IN DEVELOPMENT, not compatible with all types/classes yet

		local args = {
			[1] = "Scythe_Combat_Slash",
			[2] = game:GetService("Players")["LocalPlayer"],
			[3] = workspace:FindFirstChild(game.Players.LocalPlayer.Name),
			[4] = RP,
			[5] = workspace:FindFirstChild(game.Players.LocalPlayer.Name).Humanoid,
			[6] = 919,
		}

		game:GetService("ReplicatedStorage").Remotes["To_Server"]["Handle_Initiate_S_"]:InvokeServer(unpack(args))

	end,
	["TeleportTo"] = function(Pos, Bypass)
		if variables.Busy == false then
			variables.Busy = true
			local CurrentPos = game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position
			local HiddenPos1 = Vector3.new(CurrentPos.X, 0, CurrentPos.Z)

			local Pos1Speed = (CurrentPos - HiddenPos1).Magnitude / variables.TeleportScale

			local HiddenPos2 = Vector3.new(Pos.X, 0, Pos.Z)

			local Pos2Speed = (HiddenPos1 - HiddenPos2).Magnitude / variables.TeleportScale

			local EndPos = Pos

			local Pos3Speed = (HiddenPos2 - EndPos).Magnitude / variables.TeleportScale

			game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored = true
			local oldnoclip = variables.NoClip
			variables.NoClip = true

			game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), TweenInfo.new(Pos1Speed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {CFrame = CFrame.new(HiddenPos1)}):Play()
			wait(Pos1Speed)
			game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), TweenInfo.new(Pos2Speed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {CFrame = CFrame.new(HiddenPos2)}):Play()
			wait(Pos2Speed)
			game:GetService("TweenService"):Create(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"), TweenInfo.new(Pos3Speed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {CFrame = CFrame.new(EndPos + Vector3.new(0,8,0))}):Play()
			wait(Pos3Speed)

			if Bypass == false then
				local ray = nil

				repeat
					local Params = RaycastParams.new()
					Params.FilterType = Enum.RaycastFilterType.Blacklist
					Params.FilterDescendantsInstances = {game.Players.LocalPlayer.Character}
					ray = workspace:Raycast(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Position, Vector3.new(0,-20,0), Params)

				until ray ~= nil
			end
			variables.NoClip = oldnoclip
			game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored = false
			variables.Busy = false
		end
	end,
}

--[[
  ______                   _               _______    _     
 |  ____|                 (_)             |__   __|  | |    
 | |__ __ _ _ __ _ __ ___  _ _ __   __ _     | | __ _| |__  
 |  __/ _` | '__| '_ ` _ \| | '_ \ / _` |    | |/ _` | '_ \ 
 | | | (_| | |  | | | | | | | | | | (_| |    | | (_| | |_) |
 |_|  \__,_|_|  |_| |_| |_|_|_| |_|\__, |    |_|\__,_|_.__/ 
                                    __/ |                   
                                   |___/                    
]]


Modules.Libary.newtoggle({name = "Do shit idk", section = Sections["Main Tab"].Dungeon, tab = Tabs.Main, callback = function(v)
	if v == true then
		variables.KillFarm = true
	else
		variables.KillFarm = false
	end
end})

Modules.Libary.newbutton({name = "TP to safezone", section = Sections["Main Tab"].Dungeon, tab = Tabs["Main"], callback = function()
	if variables.Busy == false then
		Functions.TeleportTo(Vector3.new(6581.67, -38.5928, 1853.96), false)
	end
end})


Modules.Libary.newbutton({name = "TP to safezone", section = Sections["Main Tab"].Dungeon, tab = Tabs["Main"], callback = function()
	if variables.Busy == false then
		Functions.TeleportTo(Vector3.new(6581.67, -38.5928, 1853.96), false)
	end
end})

Modules.Libary.newbutton({name = "Reset", section = Sections["Main Tab"].Dungeon, tab = Tabs.Main, callback = function()
	if variables.Busy == false then
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = 0
		wait(1)
		game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Health = 0
	end
end})

-- Initialise Libary

Modules.Libary.init()
Modules.Libary.updatecursor()
--[[
  _____                                 _            _                       
 |  __ \                               (_)          | |                      
 | |__) |   _ _ __  ___  ___ _ ____   ___  ___ ___  | |     ___   ___  _ __  
 |  _  / | | | '_ \/ __|/ _ \ '__\ \ / / |/ __/ _ \ | |    / _ \ / _ \| '_ \ 
 | | \ \ |_| | | | \__ \  __/ |   \ V /| | (_|  __/ | |___| (_) | (_) | |_) |
 |_|  \_\__,_|_| |_|___/\___|_|    \_/ |_|\___\___| |______\___/ \___/| .__/ 
                                                                      | |    
                                                                      |_|    
]]

local EnemyTarget = nil

game["Run Service"].Stepped:Connect(function()
	if variables.NoClip == true then
		for _, child in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
			if child:IsA("BasePart") and child.CanCollide == true then
				child.CanCollide = false
			end
		end
	end
	
	if variables.KillFarm == true then
		if EnemyTarget == nil then
			if #game:GetService("Workspace").Mobs:GetChildren() > 0 then
				for _, v in pairs(game:GetService("Workspace").Mobs:GetChildren()) do
					local Enemy = v:FindFirstChildOfClass("Model")
					
					if Enemy:FindFirstChild("Humanoid") then
						if Enemy:FindFirstChild("Humanoid").Health > 0 then
							EnemyTarget = v:FindFirstChildOfClass("Model")
						end
					end
				end
			end
		else
			if EnemyTarget:FindFirstChild("HumanoidRootPart") then
				if EnemyTarget:FindFirstChildOfClass("Humanoid").Health > 0 then
					if variables.Attacking == false then
						if tick() > variables.LastAttack + variables.AttackWaitTime then
							print("We should attack")
							variables.Attacking = true
						end
					else
						if tick() > variables.LastAttack + variables.AttackWaitTime then
							variables.LastAttack = tick() + variables.AttackWaitTime
							for i = 1, 15 do

								spawn(function()
									Functions.DoM1s(EnemyTarget:FindFirstChild("HumanoidRootPart"))
								end)
							end
							variables.Attacking = false
						end
					end
				else
					EnemyTarget = nil
				end
			end
		end
	end
end)
