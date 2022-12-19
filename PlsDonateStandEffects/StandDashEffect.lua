local EffectName = "StandDashEffect"
local Effect = {
    "DONATE",
    "-ONATE",
    "D-NATE",
    "DO-ATE",
    "DON-TE",
    "DONA-E",
    "DONAT-",
    "DONATE",
    "DONAT-",
    "DONA-E",
    "DON-TE",
    "DO-ATE",
    "D-NATE",
    "-ONATE",
    "DONATE",
    "------",
    "DONATE",
    "------"
}


function Popup(text)
    local v12 = game.SoundService
    local v32 = game.ReplicatedStorage.Templates
    v12.Success:Play()
    local v192 = Color3.fromRGB(255, 255, 255)
    local v194 = tostring(text)
    spawn(function()
        local v198 = v32.PopupTemplate:Clone()
        v198.Text = v194
        v198.TextColor3 = v192
        v198.Parent = v31.PlayerGui.ScreenGui
        local v201 = {}
        v201.Position = UDim2.new(0, 0, 0.8, 0)
        tween(v198, 0.9, v201)
        wait(0.75)
        local v213 = {}
        v213.TextTransparency = 1
        tween(v198, 3, v213)
        wait(2)
        v198:Destroy()
    end)
end

function ChangeStandText(text)
    require(game.ReplicatedStorage.Remotes).Event("SetBoothText"):FireServer(text, "booth")
end

local SettingsFolder = game.Workspace.PlsDonateGuiSettings[EffectName]



while true do
    if SettingsFolder.EffectEnabled.Value == true then
        Popup(EffectName.." Has Started")
        for i, v in pairs(Effect) do
            if SettingsFolder.EffectEnabled.Value == false then
                Popup(EffectName.." Has Disabled")
                return
            end
            ChangeStandText(v)
            wait(0.3)
        end
    else
        wait()
    end
end



