local function GetSafeNameplate(unit)
    local nameplate = C_NamePlate.GetNamePlateForUnit(unit, issecure())
    -- If there's no nameplate or the nameplate doesn't have a UnitFrame, return nils.
    if not nameplate or not nameplate.UnitFrame then return nil, nil end

    local frame = nameplate.UnitFrame
    -- If none of the above conditions are met, return both the nameplate and the frame.
    return nameplate, frame
end

local function HandleNamePlateAdded(unit)
    local nameplate, frame = GetSafeNameplate(unit)
    if not frame then return end

    frame.name:SetFontObject("SystemFont_LargeNamePlate")

    hooksecurefunc(frame, "UpdateAnchors", function()
        frame.name:ClearAllPoints()
        frame.name:SetPoint("BOTTOM", frame.HealthBarsContainer, "TOP", 0, 4)
        frame.name:SetJustifyH("CENTER")
    end)
end

local frameAdded = CreateFrame("Frame")
frameAdded:RegisterEvent("NAME_PLATE_UNIT_ADDED")
frameAdded:SetScript("OnEvent", function(self, event, unit)
    HandleNamePlateAdded(unit)
end)