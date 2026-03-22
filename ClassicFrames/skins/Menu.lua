local function IsDialogMenu(owner)
    if not owner then return false end

    return (owner == AddonList.Dropdown)
        or (owner == LFDQueueFrameTypeDropdown)
        or (owner == RaidFinderQueueFrameSelectionDropdown)
        or (owner == LFGListEntryCreationGroupDropdown)
        or (owner == LFGListEntryCreationActivityDropdown)
        or (owner == LFGListEntryCreationPlayStyleDropdown)
        or (owner == HonorFrameTypeDropdown)
        or (owner == TrainingGroundsFrameTypeDropdown)
        or (owner == EditModeManagerFrame.LayoutDropdown)
        or (EncounterJournalInstanceSelect and owner == EncounterJournalInstanceSelect.ExpansionDropdown)
end

local DialogSkin = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
DialogSkin:SetBackdrop(BACKDROP_DARK_DIALOG_32_32)
DialogSkin:Hide()

local TooltipSkin = CreateFrame("Frame", nil, UIParent, "TooltipBackdropTemplate")
TooltipSkin:Hide()

local SubMenuSkin = CreateFrame("Frame", nil, UIParent, "TooltipBackdropTemplate")
SubMenuSkin:Hide()

local function SkinMenu(manager, owner, menuDescription)
    local menu = manager:GetOpenMenu()
    if not menu then return end

    select(1, menu:GetRegions()):SetAlpha(0)

    if IsDialogMenu(owner) then
        TooltipSkin:Hide()
        DialogSkin:SetParent(menu)
        DialogSkin:ClearAllPoints()
        DialogSkin:SetPoint("TOPLEFT", menu, "TOPLEFT", -8, 4)
        DialogSkin:SetPoint("BOTTOMRIGHT", menu, "BOTTOMRIGHT", 0, 4)
        DialogSkin:SetFrameLevel(menu:GetFrameLevel())
        DialogSkin:Show()
    else
        DialogSkin:Hide()
        TooltipSkin:SetParent(menu)
        TooltipSkin:ClearAllPoints()
        TooltipSkin:SetPoint("TOPLEFT", menu, "TOPLEFT", -4, 3)
        TooltipSkin:SetPoint("BOTTOMRIGHT", menu, "BOTTOMRIGHT", 1, 4)
        TooltipSkin:SetFrameLevel(menu:GetFrameLevel())
        TooltipSkin:Show()
    end

    menuDescription:AddMenuAcquiredCallback(function(self)
        select(1, self:GetRegions()):SetAlpha(0)
        SubMenuSkin:SetParent(self)
        SubMenuSkin:ClearAllPoints()
        SubMenuSkin:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 3)
        SubMenuSkin:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 4)
        SubMenuSkin:SetFrameLevel(self:GetFrameLevel())
        SubMenuSkin:Show()
    end)
end

local manager = _G.Menu.GetManager()
if manager then
    hooksecurefunc(manager, "OpenMenu", SkinMenu)
    hooksecurefunc(manager, "OpenContextMenu", SkinMenu)
end

local ATLAS_MAP = {
    ["common-dropdown-ticksquare"]             = {0.5,1,0,0.5},
    ["common-dropdown-icon-checkmark-yellow"]  = {0,0.5,0,0.5},
    ["common-dropdown-tickradial"]             = {0.5,1, 0.5,1},
    ["common-dropdown-icon-radialtick-yellow"] = {0,0.5,0.5,1},
}

hooksecurefunc(CompositorMixin, "AttachFontString", function(parent)
    if not parent.attachments then return end

    for _, widget in ipairs(parent.attachments) do
        local widgetType = widget:GetObjectType()
        if widgetType == "FontString" then
            widget:SetFontObject(GameFontHighlightSmallLeft)  
        elseif widgetType == "Texture" then
            local coords = ATLAS_MAP[widget:GetAtlas()]
            if coords then
                widget:SetSize(16, 16)
                widget:SetTexture([[Interface\Common\UI-DropDownRadioChecks]])
                widget:SetTexCoord(unpack(coords))
            end
        end
    end
end)