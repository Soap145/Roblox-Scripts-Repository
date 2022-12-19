local EffectName = "DonateDashEffect"
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



function ChangeStandText(text)
    require(game.ReplicatedStorage.Remotes).Event("SetBoothText"):FireServer(text, "booth")
end

local SettingsFolder = game.Workspace.PlsDonateGuiSettings[EffectName]



while true do
    if SettingsFolder.EffectEnabled.Value == true then
        for i, v in pairs(Effect) do
            if SettingsFolder.EffectEnabled.Value == false then
                return
            end
            ChangeStandText(v)
            wait(1)
        end
    else
        wait()
    end
end



