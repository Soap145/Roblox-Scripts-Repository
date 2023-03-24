local fontdecoder = {}

function fontdecoder.DecodeFontDescendants(location, filename, types)
    local data = {}
    local allGood = false
    for _, object in pairs(location:GetDescendants()) do
        for _, type in pairs(types) do
        if object.ClassName == type then
            local success, response = pcall(function()
                table.insert(data, object:GetFullName()..", Font: "..object.FontFace..", Font Weight:"..object.FontFace.Weight.."\n")
                allGood = true
            end)
            if not success then
                warn("[Font Decoder] Type ("..type..") Is Not Supported We Could Not Save Your File! [Response: "..response.."] Response Might Not Be Accurate!")
                allGood = false
                return
            end
        end
        end
    end
    if allGood then
        print("[Font Decoder] Your File Has Saved!")
        writefile(filename..".txt", data)
    else
        warn("[Font Decoder] File Has Not Saved!")
    end
end
function fontdecoder.DecodeFontChildren(location, filename, types)

end
