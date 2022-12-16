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
local SlotTab = Window:NewTab("Slot")
--TAB[SLOT]STUFF
local SlotToLoad = -1
local CurrentSlot = game.Players.LocalPlayer.CurrentSaveSlot.Value
local SlotLoad = SlotTab:NewSection("Slot Load/Save")
local test1 = false
function InstantReload(  )
    game.ReplicatedStorage.LoadSaveRequests.RequestLoad:InvokeServer(CurrentSlot) return
end
while test1 do
    InstantReload()
    test1 = false
end
SlotLoad:NewDropdown("Slot", "The slot you want to load", {"Slot 1", "Slot 2", "Slot 3", "Slot 4", "Slot 5", "Slot 6"}, function(currentOption)
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
SlotLoad:NewButton("Load Slot", "Loads your selected slot", function()
    if CurrentSlot == -1 then
        CurrentSlot = SlotToLoad
        game.ReplicatedStorage.LoadSaveRequests.RequestLoad:InvokeServer(SlotToLoad)

        Notify("Loading Slot, Please Wait 5-15 Seconds", 5)
    else
        Notify("Please Unload Your Slot In Order To Load One", 5)
    end
end)
SlotLoad:NewButton("Save Slot", "Saves your slot", function()
    if CurrentSlot == -1 then
        Notify("Please load Your Slot In Order To Save", 5)
    else
        game.ReplicatedStorage.LoadSaveRequests.RequestSave:InvokeServer(SlotToLoad)
        Notify("Saved Slot", 5)
    end
end)

SlotLoad:NewButton("test axe dupe", "beta", function()
   -- InstantReload()
   test1 = true
    print('it works')
    game.Workspace[game.Players.LocalPlayer.Name].Humanoid.Health = 0
   -- game.ReplicatedStorage.LoadSaveRequests.RequestLoad:InvokeServer(SlotToLoad)

end)



