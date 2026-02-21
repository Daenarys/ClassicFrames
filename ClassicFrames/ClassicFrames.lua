local AddonName, Addon = ...
local CURRENT_VERSION = C_AddOns.GetAddOnMetadata(AddonName, 'Version')

local frame = CreateFrame("Frame")
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function()
    --version update
    if ClassicFramesVersion then
        if ClassicFramesVersion ~= CURRENT_VERSION then
            Addon:UpdateVersion()
        end
    else
        ClassicFramesVersion = CURRENT_VERSION
    end
end)

function Addon:UpdateVersion()
    ClassicFramesVersion = CURRENT_VERSION

    print("|A:gmchat-icon-blizz:16:16|aClassic |cff00c0ffFrames|r: Updated to v" .. ClassicFramesVersion)
end