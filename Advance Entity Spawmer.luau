local fix=game:GetService("ReplicatedStorage")
local mc=fix:FindFirstChild("ModulesClient")if not mc then return end
local fi=fix:FindFirstChild("ClientModules")if fi then fi:Destroy()task.wait()end
local e=Instance.new("Folder")e.Name="ClientModules"e.Parent=fix
for _,o in ipairs(mc:GetChildren())do o:Clone().Parent=e end
local Spawner = loadstring(game:HttpGet('https://raw.githubusercontent.com/MuhXd/DoorSuff/main/OtherSuff/DoorEntitySpawn%2BSource'))()
local sound = Instance.new("Sound")
sound.SoundId = "rbxassetid://715673747"
sound.Volume = 0
sound.Parent = game:GetService("SoundService")

-- Legg til Distortion (Forvrengning)
local distortion = Instance.new("DistortionSoundEffect")
distortion.Level = 0.5 -- Juster mellom 0 og 1 for mer/mindre effekt
distortion.Parent = sound

-- Legg til Reverb (Romklang)
local reverb = Instance.new("ReverbSoundEffect")
reverb.DecayTime = 5 -- Hvor lenge lyden "henger" igjen
reverb.WetLevel = -5 -- Hvor tydelig effekten er
reverb.Parent = sound

-- Vent til lyden er lastet
if not sound.IsLoaded then
    sound.Loaded:Wait()
end

sound.PlaybackSpeed = 0.7
sound:Play()

-- Tving startposisjon til 20 sekunder
sound.TimePosition = 20

sound.Ended:Connect(function()
    sound:Destroy()
end)
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera

local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
    camara.CFrame = camara.CFrame * shakeCf
end)

camShake:Start()

-- ShakeOnce(magnitude, roughness, fadeInTime, fadeOutTime)
camShake:ShakeOnce(0, 25, 0.25, 0.25)
Wait(0.5) local CameraShaker = require(game.ReplicatedStorage.CameraShaker)
local camara = game.Workspace.CurrentCamera

local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)
    camara.CFrame = camara.CFrame * shakeCf
end)

camShake:Start()

-- ShakeOnce(magnitude, roughness, fadeInTime, fadeOutTime)
camShake:ShakeOnce(0, 25, 1, 1)


-- Create entity

local entity = Spawner.createEntity({

    CustomName = "A-60", -- Custom name of your entity

    Model = "https://github.com/PurpleHatsoOfficial/OMG-HC-REMAKE-RETAKE/raw/refs/heads/main/V3%20A60%20Reimagine.rbxm", -- Can be GitHub file or rbxassetid

    Speed = 400, -- Percentage, 100 = default Rush speed

    DelayTime = 7, -- Time before starting cycles (seconds)

    HeightOffset = 0,

    CanKill = true,

    NoDieOnCrouching = false,

    NoHiding = false,

    AntiCrucifix = false,

    KillRange = 50,

    OneRoom = false,

    DieOnLook = false,

    BreakLights = false,

    BackwardsMovement = false,

     MovementDeath = {

        false, -- Turned On?

        '1',  --- '1'= 'Instant Without Being Looked out' | '2' = 'With Being Looked At'

    },

    FlickerLights = {

        True, -- Enabled/Disabled

        5, -- Time (seconds)

    },

    Cycles = {

        Min = 8,

        Max = 15,

        WaitTime = 2,

    },

    CamShake = {

        true, -- Enabled/Disabled

        {20.5,30,0,2,1,6}, -- Shake values (don't change if you don't know)

        75, -- Shake start distance (from Entity to you)

    },

    Jumpscare = {

        true, -- Enabled/Disabled

        {

            Type = "2", -- "Normal" or 1 | "Pop" or 2 | "endlessdoorsrebound" or "Rebound" or 3 | More coming Soon

            Image1 = "rbxassetid://80920400744997", -- Image1 url

            Image2 = "rbxassetid://80920400744997", -- Image2 url

            Shake = true,

            Sound1 = {

                "0", -- SoundId Link or Roblox ID

                { Volume = 3 }, -- Sound properties

            },

            Sound2 = {

                "103879029437685", -- SoundId Link or Roblox ID

                { Volume = 6 }, -- Sound properties

            },

            Flashing = {

                true, -- Enabled/Disabled

                Color3.fromRGB(255, 255, 255), -- Color

            },

            Tease = {

                true, -- Enabled/Disabled

                Min = 1,

                Max = 3,

            },

        },

    },

    Color = 'GuidingLight', -- CuriousLight ( Yellow ) | GuidingLight ( Blue )

    DiffrentMessages = false,

    CustomDialog = {  

        {"A-60 has seen you.", "It will consume anyone on sight.", "It takes a bit to fully spawn in", "so you can use that to your advantage."}, -- Death Messages

        {"Stop Dieing"},

        {"Bruh", "Use what you have learned from Rush!"},

        {"It seems like Template is causing quite the ruckus...", "Hide in a closet or bed as quickly as possible!"},

         {"I have told You What to do", "YOU JUST HAVE A SKILL ISSUE"}

    }

})

-----[[ Advanced Sctipting ]]-----

entity.Debug.OnEntityMoving = function(Invincible,Hiding,plrCollisionPoint)

print("Invincible: "..tostring(Invincible))

print("Player to Entity Collision (None hiding Point): "..tostring(plrCollisionPoint))

print("Hiding: "..tostring(Hiding))

end

       

entity.Debug.OnEntitySpawned = function()

    print("Entity has spawned:")


    local TweenService = game:GetService("TweenService")

    local cue2 = Instance.new("Sound")

    cue2.Parent = workspace.Claim.RushNew

    cue2.Name = "Idle"

    cue2.SoundId = "rbxassetid://8256091246"

    cue2.Volume = 0

    cue2.Pitch = 4

    local shift = Instance.new("PitchShiftSoundEffect")

    shift.Octave = 0.5

    shift.Parent = cue2

    local distort = Instance.new("DistortionSoundEffect")

    distort.Level = 0.9

    distort.Parent = cue2

 cue2.RollOffMaxDistance = 90

 cue2.RollOffMinDistance = 5

 cue2.RollOffMode = Enum.RollOffMode.LinearSquare

    local TW = TweenService:Create(cue2, TweenInfo.new(1.5),{Pitch = 0})

    local TW1 = TweenService:Create(cue2, TweenInfo.new(0.5),{Pitch = 8})

    local TW2 = TweenService:Create(cue2, TweenInfo.new(1.5),{Volume = 0})

local TW3 = TweenService:Create(cue2, TweenInfo.new(1.5),{Volume = 1})

    cue2:Play()

    TW3:Play()

    wait(9.5)

    TW1:Play()

    wait(0.5)

 workspace.Claim.RushNew.Anchored = false

 workspace.Claim.RushNew.CanCollide = false

    TW:Play()

    TW2:Play()

    wait(2)

    workspace.Claim:Destroy()

    death:Destroy()

    cue:Destroy()

end

entity.Debug.OnEntityDespawned = function()

    print("Entity has despawned:")

local CameraShaker = require(game.ReplicatedStorage.CameraShaker)

local camara = game.Workspace.CurrentCamera

local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)

 camara.CFrame = camara.CFrame * shakeCf

end)

camShake:Start()

camShake:ShakeOnce(5,25,20,2,2)

game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(255, 0, 0)

game.Lighting.MainColorCorrection.Contrast = 0

local tween = game:GetService("TweenService")

tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5), {Contrast = 0}):Play()

local TweenService = game:GetService("TweenService")

local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(10),{TintColor = Color3.fromRGB(255, 255, 255)})

TW:Play()

end

entity.Debug.OnEntityStartMoving = function()

    print("Entity has started moving:")
local A60 = game.Workspace:WaitForChild("A-60")
local main = A60:WaitForChild("Main")
local face = main:WaitForChild("Face")

-- Tabell med Texture ID-ene dine
local ids = {
	"rbxassetid://114576464482524",
	"rbxassetid://16827233220",
	"rbxassetid://16827260352"
}

print("Starter bilde-loop for A-60...")

-- Løkke som bytter bilde hvert 0.1 sekund
while true do
	for _, id in pairs(ids) do
		face.Texture = id
		task.wait(0.1)
	end
end


end

entity.Debug.OnEntityFinishedRebound = function()

    print("Entity has finished rebound:")

end

entity.Debug.OnEntityEnteredRoom = function(entityTable, room)

    print("Entity:", "has entered room:",room)

end

entity.Debug.OnLookAtEntity = function()

    print("Player has looked at entity:")

end

entity.Debug.OnDeath = function()

    warn("Player has died.")

local id = "16882783745"
local assetPath = "rbxassetid://" .. id

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Загружаем объект
local objects = game:GetObjects(assetPath)
local model = objects[1] -- Берем первый объект из списка

if model then
    model.Parent = game.Workspace
    
    -- Установка позиции перед игроком
    local spawnPos = rootPart.CFrame * CFrame.new(0, 1, -8)
    
    if model:IsA("Model") then
        model:PivotTo(spawnPos)
    else
        model.CFrame = spawnPos
    end
    
    -- Красный свет для атмосферы Hardcore
    local light = Instance.new("PointLight")
    light.Color = Color3.fromRGB(255, 0, 0)
    light.Range = 25
    light.Brightness = 10
    light.Parent = (model:IsA("Model") and (model.PrimaryPart or model:FindFirstChildWhichIsA("BasePart"))) or model

    print("А-60 появился! Исчезнет через 3 секунды...")
Wait(0.25)
local camera = game:GetService("Workspace").CurrentCamera

-- Lås kameraet (du kan ikke lenger bevege det)
camera.CameraType = Enum.CameraType.Scriptable

print("Skjermen er nå låst")

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local lp = Players.LocalPlayer
local pGui = lp:WaitForChild("PlayerGui")

-- Liste over alle ansiktene
local faces = {
    "14168728251", 
    "16827260352", 
    "16827233220", 
    "16827252649", 
    "16827226093",
    "16827208391",
    "105327900444602",
}
Wait(0.1)
-- Velg et tilfeldig ansikt
local randomFace = faces[math.random(1, #faces)]

-- Fjern gammel effekt
if pGui:FindFirstChild("A60_Hardcore") then pGui.A60_Hardcore:Destroy() end

-- Opprett UI
local sg = Instance.new("ScreenGui")
sg.Name = "A60_Hardcore"
sg.DisplayOrder = 9999
sg.IgnoreGuiInset = true
sg.Parent = pGui

local img = Instance.new("ImageLabel")
img.BackgroundTransparency = 1
img.AnchorPoint = Vector2.new(0.5, 0.5)
img.Position = UDim2.new(0.5, 0, 0.5, 0)
img.Size = UDim2.new(0, 0, 0, 0) 
img.Image = "rbxthumb://type=Asset&id=" .. randomFace .. "&w=420&h=420"

-- GJØR BILDET RØDT
img.ImageColor3 = Color3.fromRGB(255, 0, 0) 

img.Rotation = math.random(-10, 10)
img.ImageTransparency = 0
img.Parent = sg

-- 1. STRETCHED SKALERING
local scaleTween = TweenService:Create(img, TweenInfo.new(0.7, Enum.EasingStyle.Quad), {Size = UDim2.new(0, 850, 0, 500)})
scaleTween:Play()

-- Vent 0.5 sekunder
task.wait(1)

-- 2. FADE OUT
local fadeTween = TweenService:Create(img, TweenInfo.new(1), {ImageTransparency = 1})
fadeTween:Play()

-- Rydd opp
fadeTween.Completed:Connect(function()
    sg:Destroy()
end)



    -- Ждем 3 секунды и удаляем
    task.wait(1.5)

    model:Destroy()
    print("А-60 исчез.")
else
    warn("Не удалось загрузить модель.")
end
Wait(0.1)
-- Delta Executor Script: Slett alle "A-60"
for _, obj in ipairs(game:GetDescendants()) do
    if obj.Name == "A-60" then
        obj:Destroy()
    end
end
local CameraShaker = require(game.ReplicatedStorage.CameraShaker)

local camara = game.Workspace.CurrentCamera

local camShake = CameraShaker.new(Enum.RenderPriority.Camera.Value, function(shakeCf)

 camara.CFrame = camara.CFrame * shakeCf

end)

camShake:Start()

camShake:ShakeOnce(5,25,20,2,2)

game.Lighting.MainColorCorrection.TintColor = Color3.fromRGB(255, 0, 0)

game.Lighting.MainColorCorrection.Contrast = 0

local tween = game:GetService("TweenService")

tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(5), {Contrast = 0}):Play()

local TweenService = game:GetService("TweenService")

local TW = TweenService:Create(game.Lighting.MainColorCorrection, TweenInfo.new(10),{TintColor = Color3.fromRGB(255, 255, 255)})

TW:Play()



local func, setupval, getinfo, typeof, getgc, next = nil, debug.setupvalue or setupvalue, debug.getinfo or getinfo, typeof, getgc, next

for i,v in next, getgc(false) do

    if typeof(v) == "function" then

        local info = getinfo(v)

        if info.currentline == 54 and info.nups == 2 and info.is_vararg == 0 then

            func = v

            break

        end

    end

end

local function DeathHint(hints, type: string)

    setupval(func, 1, hints)

    if type ~= nil then

        setupval(func, 2, type)

    end

end

DeathHint({

    "You died to an enitity designated as A-60",

    "It can Apear at any moment, a loud scream will anounce its presence",

    "When you hear it spawn you must stay out of its reach as soon as possible",

    "It knows exactly where you are so hiding in different places will not work.."

}, "Blue") -- "Blue" or "Yellow"

function GitAud(soundgit,filename)

    SoundName=tostring(SoundName)

    local url=soundgit

    local FileName = filename

    writefile(FileName..".mp3", game:HttpGet(url))

    return (getcustomasset or getsynasset)(FileName..".mp3")

end

function CustomGitSound(soundlink, vol, filename)

    local Sound = Instance.new("Sound")

    Sound.SoundId = GitAud(soundlink, filename)

    Sound.Parent = workspace

    Sound.Volume = 0

    Sound:Play()

end

CustomGitSound("https://github.com/Kotyara19k-Doorsspawner/Random-files/raw/main/A60JumpscareOld.mp3", 1, "A60Scare")

end

------------------------

-- Run the created entity

Spawner.runEntity(entity)

local match = Instance.new("Sound")

match.PlaybackSpeed = 1.0

match.SoundId = "rbxassetid://111341009262238"

match.Volume = 9

match.Name = "ScreamA60"

match.Parent = workspace

match:Play()

wait(0)



Wait(1)
require(game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game).caption("A-60: Run Faster! I Wanna See You TRY!", true)