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
end

local frameAdded = CreateFrame("Frame")
frameAdded:RegisterEvent("NAME_PLATE_UNIT_ADDED")
frameAdded:SetScript("OnEvent", function(self, event, unit)
    HandleNamePlateAdded(unit)
end)