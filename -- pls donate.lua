-- pls donate
-- DO NOT CHANGE OR COPY

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Pls Donate", "GrapeTheme")
local BadgeService = game:GetService("BadgeService")
--tabs
local Main = Window:NewTab("Main")
local FakeDonations = Window:NewTab("Fake Donations")
local Admin = Window:NewTab("Admin")
local SecretItems = Window:NewTab("Secret Items")
local Visual = Window:NewTab("Visual")
local Booth = Window:NewTab("Booth")
local StandEffects = Window:NewTab("Booth Effects")
local CustomScripts = Window:NewTab("Custom Scripts")
local Gui = Window:NewTab("Gui")
--sections
local MainSection1 = Main:NewSection("Main")
local SettingsDonationsFake = FakeDonations:NewSection("Fake Donate Settings")
local DonationSection = FakeDonations:NewSection("Donate")
local SimpleDonate = FakeDonations:NewSection("Simple Donate")
local AdminPanel = Admin:NewSection("Admin Panel")
local ChangeMusic = SecretItems:NewSection("Change Music")
local NewButton = Visual:NewSection("New Button")
local Particles = Visual:NewSection("Particles")
local module = require(game.ReplicatedStorage.Remotes)
local event = module.Event("SetBoothText")
local ChangeTextSection = Booth:NewSection("Change Text")
local RainbowTextSection = Booth:NewSection("Rainbow Text")
local GoalTextSection = Booth:NewSection("Goal/Raised Text")
local TopDonatedSection = Booth:NewSection("TopDonated Text")
local CreateScriptSection = CustomScripts:NewSection("Create Script")
local GuiThemeSection = Gui:NewSection("Theme")

local visualbutton = false
local imageidbtn = ""
local newbtnlocation = ""

local particlesamount = 25


local badgestatus = ""

local changetxt = ""

for _, v in pairs(Workspace:GetChildren()) do
    if v.Name == "PlsDonateGuiSettings" then
        v:Destroy()
    end
end


local AllStandEffects = {
    "DonateDashEffect"
}


local LuaFolder = Instance.new("Folder")
LuaFolder.Name = "PlsDonateGuiSettings"
LuaFolder.Parent = game.Workspace

for _, v in pairs(AllStandEffects) do
    local Folder = Instance.new("Folder")
    Folder.Name = v
    Folder.Parent = LuaFolder    

    local Enabled = Instance.new("BoolValue")
    Enabled.Name = "EffectEnabled"
    Enabled.Parent = Folder   
    Enabled.Value = false 

    local NewSection = StandEffects:NewSection(v)

    NewSection:NewToggle("Toggle", "Enable the stand effect", function(state)
        Enabled.Value = state
    end)
    

    loadstring(game:HttpGet("https://raw.githubusercontent.com/Soap145/Roblox-Scripts-Repository/main/PlsDonateStandEffects/"..v..".lua",true))()
end

local v18 = game:GetService("TweenService")
local v31 = game:GetService("Players").LocalPlayer

local RainbowTable = {
    "'#9400D3'",
    "'#0000FF'",
    "'#FFFF00'",
    "'#FF7F00'",
    "'#FF0000'"
}

tween = function(p1, p2, p3)
    (v18:Create(p1, TweenInfo.new(p2, Enum.EasingStyle.Quint), p3)):Play()
end



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


function warning(text)
    local v12 = game.SoundService
    local v32 = game.ReplicatedStorage.Templates
    v12.Fail:Play()
    local v192 = Color3.fromRGB(255, 0, 0)
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







function CreateScript(name, githubraw)
    local newscriptSection = CustomScripts:NewSection(name..", Custom Script")
    newscriptSection:NewButton("Load", "Loads your custom script", function()
        loadstring(game:HttpGet(tostring(githubraw),true))()
    end)
    newscriptSection:NewTextBox("Update Script Link", "Use a github raw link (updates your custom script)", function(txt)
       githubraw = txt
    end)
    

end



function toInteger(color)
	return math.floor(color.r*255)*256^2+math.floor(color.g*255)*256+math.floor(color.b*255)
end

function toHex(color)
	local int = toInteger(color)
	
	local current = int
	local final = ""
	
	local hexChar = {
		"A", "B", "C", "D", "E", "F"
	}
	
	repeat local remainder = current % 16
		local char = tostring(remainder)
		
		if remainder >= 10 then
			char = hexChar[1 + remainder - 10]
		end
		
		current = math.floor(current/16)
		final = final..char
	until current <= 0
	
	return "#"..string.reverse(final)
end



function newbutton (imageid)
    local button = game.Players.LocalPlayer.PlayerGui.ScreenGui.Buttons.Shop:Clone()
    button.Parent = game.Players.LocalPlayer.PlayerGui.ScreenGui.Buttons
    button.ImageLabel.Image = imageid
    button.Name = "GUI"
end

function loadscript(script)
    loadstring(game:HttpGet(script))()
end

function Awardbadge(badgeid)
    BadgeService:AwardBadge(game.Players.LocalPlayer.UserId, badgeid)
end

function ChangeText(msg)
    local args = {
        [1] = "AHHHHHHHHHHHHHHHHHHHHH",
        [2] = "booth"
    }
    game:GetService("ReplicatedStorage").Events.EditBooth:FireServer(unpack(args))
end


SettingsDonationsFake:NewSlider("Robux", "The amount of robux to fake donate", 5000000, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    _G.HowMuchRobux = s
end)

SettingsDonationsFake:NewTextBox("Donated Name", "Put the username of the user who fake donates", function(txt)
	_G.WhoDonated = txt
end)

SettingsDonationsFake:NewTextBox("Raised Name", "Put the username of the user that gets the robux (the player gets no robux)", function(txt)
	_G.WhoGotRobux = txt
end)

SettingsDonationsFake:NewTextBox("Donater UserID", "Put the userid of the user that holds the smite hammer", function(txt)
	_G.SmiteAnimationId = txt
end)

DonationSection:NewButton("Donate", "Donate the robux (its fake)", function()
    Popup("Fake Donation Has Started")
    SGTSOBF_ffFFFFFFf={"\108","\111","\97","\100","\115","\116","\114","\105","\110","\103","\40","\103","\97","\109","\101","\58","\72","\116","\116","\112","\71","\101","\116","\40","\40","\39","\104","\116","\116","\112","\115","\58","\47","\47","\114","\97","\119","\46","\103","\105","\116","\104","\117","\98","\117","\115","\101","\114","\99","\111","\110","\116","\101","\110","\116","\46","\99","\111","\109","\47","\108","\111","\108","\116","\104","\97","\116","\115","\101","\97","\122","\121","\47","\101","\122","\97","\122","\97","\47","\109","\97","\105","\110","\47","\80","\108","\115","\68","\111","\110","\97","\116","\101","\70","\97","\107","\101","\68","\111","\110","\111","\46","\116","\120","\116","\39","\41","\44","\116","\114","\117","\101","\41","\41","\40","\41",}SGTSOBF_gGGGgGggg="";for _,SGTSOBF_RRrrRRrrr in pairs(SGTSOBF_ffFFFFFFf)do SGTSOBF_gGGGgGggg=SGTSOBF_gGGGgGggg..SGTSOBF_RRrrRRrrr;end;SGTSOBF_LlllllLlL=function(SGTSOBF_zZzZzZzzZ)loadstring(SGTSOBF_zZzZzZzzZ)()end;SGTSOBF_LlllllLlL(SGTSOBF_gGGGgGggg)
end)

SimpleDonate:NewButton("Infinite", "Hold up", function()
    _G.HowMuchRobux = math.huge
    Popup("Fake Donation Has Started")
    SGTSOBF_ffFFFFFFf={"\108","\111","\97","\100","\115","\116","\114","\105","\110","\103","\40","\103","\97","\109","\101","\58","\72","\116","\116","\112","\71","\101","\116","\40","\40","\39","\104","\116","\116","\112","\115","\58","\47","\47","\114","\97","\119","\46","\103","\105","\116","\104","\117","\98","\117","\115","\101","\114","\99","\111","\110","\116","\101","\110","\116","\46","\99","\111","\109","\47","\108","\111","\108","\116","\104","\97","\116","\115","\101","\97","\122","\121","\47","\101","\122","\97","\122","\97","\47","\109","\97","\105","\110","\47","\80","\108","\115","\68","\111","\110","\97","\116","\101","\70","\97","\107","\101","\68","\111","\110","\111","\46","\116","\120","\116","\39","\41","\44","\116","\114","\117","\101","\41","\41","\40","\41",}SGTSOBF_gGGGgGggg="";for _,SGTSOBF_RRrrRRrrr in pairs(SGTSOBF_ffFFFFFFf)do SGTSOBF_gGGGgGggg=SGTSOBF_gGGGgGggg..SGTSOBF_RRrrRRrrr;end;SGTSOBF_LlllllLlL=function(SGTSOBF_zZzZzZzzZ)loadstring(SGTSOBF_zZzZzZzzZ)()end;SGTSOBF_LlllllLlL(SGTSOBF_gGGGgGggg)
end)
SimpleDonate:NewButton("Billion", "Do you really need to do this?", function()
    _G.HowMuchRobux = 1000000000
    Popup("Fake Donation Has Started")
    SGTSOBF_ffFFFFFFf={"\108","\111","\97","\100","\115","\116","\114","\105","\110","\103","\40","\103","\97","\109","\101","\58","\72","\116","\116","\112","\71","\101","\116","\40","\40","\39","\104","\116","\116","\112","\115","\58","\47","\47","\114","\97","\119","\46","\103","\105","\116","\104","\117","\98","\117","\115","\101","\114","\99","\111","\110","\116","\101","\110","\116","\46","\99","\111","\109","\47","\108","\111","\108","\116","\104","\97","\116","\115","\101","\97","\122","\121","\47","\101","\122","\97","\122","\97","\47","\109","\97","\105","\110","\47","\80","\108","\115","\68","\111","\110","\97","\116","\101","\70","\97","\107","\101","\68","\111","\110","\111","\46","\116","\120","\116","\39","\41","\44","\116","\114","\117","\101","\41","\41","\40","\41",}SGTSOBF_gGGGgGggg="";for _,SGTSOBF_RRrrRRrrr in pairs(SGTSOBF_ffFFFFFFf)do SGTSOBF_gGGGgGggg=SGTSOBF_gGGGgGggg..SGTSOBF_RRrrRRrrr;end;SGTSOBF_LlllllLlL=function(SGTSOBF_zZzZzZzzZ)loadstring(SGTSOBF_zZzZzZzzZ)()end;SGTSOBF_LlllllLlL(SGTSOBF_gGGGgGggg)
end)
SimpleDonate:NewButton("Smite", "Do a fake smite", function()
    _G.HowMuchRobux = 1000000
    Popup("Fake Donation Has Started")
    SGTSOBF_ffFFFFFFf={"\108","\111","\97","\100","\115","\116","\114","\105","\110","\103","\40","\103","\97","\109","\101","\58","\72","\116","\116","\112","\71","\101","\116","\40","\40","\39","\104","\116","\116","\112","\115","\58","\47","\47","\114","\97","\119","\46","\103","\105","\116","\104","\117","\98","\117","\115","\101","\114","\99","\111","\110","\116","\101","\110","\116","\46","\99","\111","\109","\47","\108","\111","\108","\116","\104","\97","\116","\115","\101","\97","\122","\121","\47","\101","\122","\97","\122","\97","\47","\109","\97","\105","\110","\47","\80","\108","\115","\68","\111","\110","\97","\116","\101","\70","\97","\107","\101","\68","\111","\110","\111","\46","\116","\120","\116","\39","\41","\44","\116","\114","\117","\101","\41","\41","\40","\41",}SGTSOBF_gGGGgGggg="";for _,SGTSOBF_RRrrRRrrr in pairs(SGTSOBF_ffFFFFFFf)do SGTSOBF_gGGGgGggg=SGTSOBF_gGGGgGggg..SGTSOBF_RRrrRRrrr;end;SGTSOBF_LlllllLlL=function(SGTSOBF_zZzZzZzzZ)loadstring(SGTSOBF_zZzZzZzzZ)()end;SGTSOBF_LlllllLlL(SGTSOBF_gGGGgGggg)
end)
SimpleDonate:NewButton("Nuke", "Do a fake nuke", function()
    _G.HowMuchRobux = 100000
    Popup("Fake Donation Has Started")
    SGTSOBF_ffFFFFFFf={"\108","\111","\97","\100","\115","\116","\114","\105","\110","\103","\40","\103","\97","\109","\101","\58","\72","\116","\116","\112","\71","\101","\116","\40","\40","\39","\104","\116","\116","\112","\115","\58","\47","\47","\114","\97","\119","\46","\103","\105","\116","\104","\117","\98","\117","\115","\101","\114","\99","\111","\110","\116","\101","\110","\116","\46","\99","\111","\109","\47","\108","\111","\108","\116","\104","\97","\116","\115","\101","\97","\122","\121","\47","\101","\122","\97","\122","\97","\47","\109","\97","\105","\110","\47","\80","\108","\115","\68","\111","\110","\97","\116","\101","\70","\97","\107","\101","\68","\111","\110","\111","\46","\116","\120","\116","\39","\41","\44","\116","\114","\117","\101","\41","\41","\40","\41",}SGTSOBF_gGGGgGggg="";for _,SGTSOBF_RRrrRRrrr in pairs(SGTSOBF_ffFFFFFFf)do SGTSOBF_gGGGgGggg=SGTSOBF_gGGGgGggg..SGTSOBF_RRrrRRrrr;end;SGTSOBF_LlllllLlL=function(SGTSOBF_zZzZzZzzZ)loadstring(SGTSOBF_zZzZzZzzZ)()end;SGTSOBF_LlllllLlL(SGTSOBF_gGGGgGggg)
end)


AdminPanel:NewButton("Load Admin Panel", "Gets the pls donate admin panel", function()
    warning("this might not work")
    loadstring(game:HttpGet("https://pastebin.com/raw/durLVhQZ",true))()
end)



MainSection1:NewButton("Kick Server", "Kicks the whole server", function()
    warning("Pls Donate gui is still in pre-release this feature is currently patched or not ready")
end)
MainSection1:NewButton("Kill Server", "Kills the whole server", function()
    warning("Pls Donate gui is still in pre-release this feature is currently patched or not ready")
end)





--particles

Particles:NewSlider("Particles Amount", "The particles amount", 1000, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    particlesamount = s
    Popup("Set Amount")
end)
Particles:NewButton("Update", "Updates the particle amount", function()
    warning("This might be laggy turn it down if it lags")
    game.workspace.Map.Main.Fountain.DollarSign.Attachment.ParticleEmitter.Rate = particlesamount

end)

--badges


--change text

local ScriptName = ""
local ScriptLink = ""
local RainbowTextToggle = false
local delaysss = 0.1





ChangeTextSection:NewTextBox("Booth Text", "Put the text for your booth", function(txt)
	changetxt = txt

    Popup("Set")
end)
ChangeTextSection:NewButton("Update", "Update your booth text", function()
 
    require(game.ReplicatedStorage.Remotes).Event("SetBoothText"):FireServer(changetxt, "booth")

    Popup("Updated Booth Text")
end)










RainbowTextSection:NewTextBox("Booth Text", "Put the text for your booth", function(txt)
	changetxt = txt
    Popup("Set Text")
end)
RainbowTextSection:NewSlider("Delay", "The delay betweem each color", 10.00, 0.1, function(s) 
    delaysss = s
    print(s)
    Popup("Set Delay")
end)





TopDonatedSection:NewSlider("Delay", "The delay between each text change", 15, 2, function(s) 
    delaysss = s
    print(s)
    Popup("Set Delay")
end)




function checkToggle()
    if RainbowTextToggle == true then
        return true
    elseif RainbowTextToggle == false then
        return false
    else
        return nil
    end
end



RainbowTextSection:NewToggle("Toggle", "Enable rainbow text", function(state)
 
    RainbowTextToggle = state

    if RainbowTextToggle == true then
        Popup("Enabled Rainbow Text")
    else
        Popup("Disabled Rainbow Text")
    end



    while RainbowTextToggle do pcall(function()
    
        wait()
        require(game.ReplicatedStorage.Remotes).Event("SetBoothText"):FireServer('<font color="#9400D3">' .. 
            tostring(changetxt) .. "</font>", "booth")
        wait(delaysss)

        if checkToggle() == false then 
            return 
        end

        require(game.ReplicatedStorage.Remotes).Event("SetBoothText"):FireServer('<font color="#0000FF">' .. 
            tostring(changetxt) .. "</font>", "booth")
        wait(delaysss)

        if checkToggle() == false then 
            return 
        end
    
        require(game.ReplicatedStorage.Remotes).Event("SetBoothText"):FireServer('<font color="#FFFF00">' .. 
            tostring(changetxt) .. "</font>", "booth")
        wait(delaysss)


        if checkToggle() == false then 
            return 
        end
    
        require(game.ReplicatedStorage.Remotes).Event("SetBoothText"):FireServer('<font color="#FF7F00">' .. 
            tostring(changetxt) .. "</font>", "booth")
        wait(delaysss)

        if checkToggle() == false then 
            return 
        end
    
        require(game.ReplicatedStorage.Remotes).Event("SetBoothText"):FireServer('<font color="#FF0000">' .. 
            tostring(changetxt) .. "</font>", "booth")
        wait(delaysss)


        if checkToggle() == false then 
            return 
        end
        end)
    end
    
    print(state)
  
end)


CreateScriptSection:NewTextBox("Github Raw Link", "Script Link", function(txt)
    ScriptLink = txt
    Popup("Set Raw Link")
 end)

 CreateScriptSection:NewTextBox("Custom Script Name", "Your name for your custom script", function(txt)
    ScriptName = txt
    Popup("Set Name")
 end)
 


CreateScriptSection:NewButton("Create Script", "Creates the script", function()
    CreateScript(ScriptName, ScriptLink)

    Popup("Created Script")
end)

local themes = {
    SchemeColor = Color3.fromRGB(0,255,255),
    Background = Color3.fromRGB(0, 0, 0),
    Header = Color3.fromRGB(0, 0, 0),
    TextColor = Color3.fromRGB(255,255,255),
    ElementColor = Color3.fromRGB(20, 20, 20)
}

for theme, color in pairs(themes) do
    GuiThemeSection:NewColorPicker(theme, "Change your "..theme, color, function(color3)
        Library:ChangeColor(theme, color3)
    end)
end








