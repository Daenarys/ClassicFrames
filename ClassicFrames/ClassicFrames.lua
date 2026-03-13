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

    print("|cff33ff99Classic Frames|r: Updated to v" .. ClassicFramesVersion)
end