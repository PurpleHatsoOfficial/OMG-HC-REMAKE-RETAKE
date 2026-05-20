---====== Load spawner ======---


local Spawner = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/DOORS-Entity-Spawner-V2/main/init.luau"))()


---====== Create entity ======---


local entity = Spawner:Create({
	Entity = {
		Name = "A-60",
		Asset = "rbxassetid://85615143036194",
		HeightOffset = 0
	},
	Lights = {
		Flicker = {
			Enabled = false,
			Duration = 2
		},
		Shatter = false,
		Repair = true
	},
	Earthquake = {
		Enabled = false
	},
	CameraShake = {
		Enabled = true,
		Range = 100,
		Values = {1.5, 20, 0.1, 1} -- Magnitude, Roughness, FadeIn, FadeOut
	},
	Movement = {
		Speed = 320,
		Delay = 2,
		Reversed = false
	},
	Rebounding = {
		Enabled = true,
		Type = "Ambush", -- "Blitz"
		Min = 5,
		Max = 9,
		Delay = 1
	},
	Damage = {
		Enabled = true,
		IgnoreHiding = false,
		Range = 40,
		Amount = 150
	},
	Crucifixion = {
		Enabled = true,
		Range = 40,
		Resist = true,
		Break = true
	},
	Death = {
		Type = "Curious", -- "Guiding"
		Hints = {"You died to entity designated as A-60", "Hints", "Go", "Here"},
		Cause = "A-60"
	}
})


---====== Debug entity ======---


entity:SetCallback("OnSpawned", function()
    print("Entity has spawned")
end)


entity:SetCallback("OnStartMoving", function()
    print("Entity has started moving")
end)


entity:SetCallback("OnEnterRoom", function(room: Model, firstTime: boolean)
    if firstTime == true then
        print("Entity has entered room: ".. room.Name.. " for the first time")
    else
        print("Entity has entered room: ".. room.Name.. " again")
    end
end)


entity:SetCallback("OnLookAt", function(lineOfSight: boolean)
	if lineOfSight == true then
		print("Player is looking at entity")
	else
		print("Player view is obstructed by something")
	end
end)


entity:SetCallback("OnRebounding", function(startOfRebound: boolean)
    if startOfRebound == true then
        print("Entity has started rebounding")
	else
        print("Entity has finished rebounding")
	end
end)


entity:SetCallback("OnDespawning", function()
    print("Entity is despawning")
end)


entity:SetCallback("OnDespawned", function()
    print("Entity has despawned")
end)


entity:SetCallback("OnDamagePlayer", function(newHealth: number)
	if newHealth <= 0 then
		print("Entity has killed the player")
	else
		print("Entity has damaged the player")
	end
end)


--[[


DEVELOPER NOTE:
By overwriting 'CrucifixionOverwrite' the default crucifixion callback will be replaced with your custom callback.


entity:SetCallback("CrucifixionOverwrite", function()
    print("Custom crucifixion callback")
end)


]]--


---====== Run entity ======---


entity:Run(true)