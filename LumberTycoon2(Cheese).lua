local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

local Version = 1.12

local Window = Library.CreateLib("Cheese V"..Version, "Serpent")

function Notify(Text, Duration)
   --[[ game:GetService("StarterGui"):SetCore("SendNotification",{
        Title = "Cheese",
        Text = Text,
        Duration = Duration,
        })
return--]]
local sendNotice = game.ReplicatedStorage.Notices.SendUserNotice
sendNotice:Fire(Text)
end


--TABS
local PlayerTab = Window:NewTab("Player")
local DupeTab = Window:NewTab("Dupe")
local SlotTab = Window:NewTab("Slot")
local CameraTab = Window:NewTab("Camera")
--TAB[SLOT]STUFF
local SlotToLoad = -1
local CurrentSlot = game.Players.LocalPlayer.CurrentSaveSlot.Value
local AxeDupeSection = DupeTab:NewSection("Axe Dupe")
local SlotSection = SlotTab:NewSection("Slot Settings")
local LocalPlayerSection = PlayerTab:NewSection("Player")
local CameraSection = CameraTab:NewSection("Camera")
local test1 = false

local CheeseFolder = Instance.new("Folder")
CheeseFolder.Name = "CheeseFolder"
CheeseFolder.Parent = workspace

local BlacklistWalls = Instance.new('Folder')
BlacklistWalls.Name = "Blacklist_Walls"
BlacklistWalls.Parent = CheeseFolder


LocalPlayerSection:NewSlider("Walk Speed", "Sets your walkspeed", 500, 0, function(s) 
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

LocalPlayerSection:NewSlider("Jump Power", "Sets your jumppower", 500, 0, function(s) 
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

LocalPlayerSection:NewKeybind("Toggle Cheese", "Enables or Disables if you want to see cheese", Enum.KeyCode.M, function()
	Library:ToggleUI()
end)
loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()


CameraSection:NewButton("Add Free Camera", "Adds cinamatic mode", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Soap145/Roblox-Scripts-Repository/main/cameratype(notsafe).lua",true))()
    Notify("Cinamatic Mode Added (How To Use) \n WASD = MOVEMENT \n Q = DOWN \n E = UP \n MOUSEWHEEL = ZOOM")
end)



 SlotSection:NewToggle("Disable All Blacklist Walls (BETA)", "Disables all blacklist walls", function(state)
    if state then
        for _, v in pairs(game.Workspace.Effects:GetChildren()) do
            v.Parent = BlacklistWalls
        end
        Notify("Disabled All Blacklist Walls")
    else
        for _, v in pairs(game.Workspace.CheeseFolder.Blacklist_Walls:GetChildren()) do
            v.Parent = workspace.Effects
        end
        Notify("Enabled All Blacklist Walls")
    end
end)



LocalPlayerSection:NewToggle("Music", "If you want some beats", function(state)
    if state then
        game.Players.LocalPlayer.Music.Value = true
    else
        game.Players.LocalPlayer.Music.Value = false
    end
end)


AxeDupeSection:NewDropdown("Slot", "The slot you want to load", {"Slot 1", "Slot 2", "Slot 3", "Slot 4", "Slot 5", "Slot 6"}, function(currentOption)
    if currentOption == "Slot 1" then
        SlotToLoad = 1
    elseif currentOption == "Slot 2" then
        SlotToLoad = 2
    elseif currentOption == "Slot 3" then
        SlotToLoad = 3
    elseif currentOption == "Slot 4" then
        SlotToLoad = 4
    elseif currentOption == "Slot 5" then
        SlotToLoad = 5
    elseif currentOption == "Slot 6" then
        SlotToLoad = 6
    else
        Notify("Not A Slot", 5)
    end
end)
AxeDupeSection:NewButton("Load Slot", "Loads your selected slot", function()
    if CurrentSlot == -1 then
        CurrentSlot = SlotToLoad
        game.ReplicatedStorage.LoadSaveRequests.RequestLoad:InvokeServer(SlotToLoad)

        Notify("Loading Slot, Please Wait 5-15 Seconds", 5)
    else
        Notify("Please Unload Your Slot In Order To Load One", 5)
    end
end)
AxeDupeSection:NewButton("Save Slot", "Saves your slot", function()
    if CurrentSlot == -1 then
        Notify("Please load Your Slot In Order To Save", 5)
    else
        game.ReplicatedStorage.LoadSaveRequests.RequestSave:InvokeServer(SlotToLoad)
        Notify("Saved Slot", 5)
    end
end)




AxeDupeSection:NewButton("Dupe Inventory (ALPHA)", "Dupes all your axes in your inventory", function()
   -- InstantReload()

    game.Workspace[game.Players.LocalPlayer.Name].Humanoid.Health = 0
    game.ReplicatedStorage.LoadSaveRequests.RequestLoad:InvokeServer(SlotToLoad)

end)


AxeDupeSection:NewButton("Count Axes", "Count your axes", function()
    local amount = 0


    for _, item in pairs(game.Players.LocalPlayer.ToolFolder:GetChildren()) do
        amount = amount + 1
    end

    Notify("You Have "..amount.." Axe(s) In Your Backpack")
 
 end)
 




