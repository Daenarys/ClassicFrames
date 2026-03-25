local function IsDialogMenu(owner)
    if not owner then return false end

    return (owner == ContainerFrame1PortraitButton)
        or (owner == ContainerFrame2PortraitButton)
        or (owner == ContainerFrame3PortraitButton)
        or (owner == ContainerFrame4PortraitButton)
        or (owner == ContainerFrame5PortraitButton)
        or (owner == LFDQueueFrameTypeDropdown)
        or (owner == RaidFinderQueueFrameSelectionDropdown)
        or (owner == LFGListEntryCreationGroupDropdown)
        or (owner == LFGListEntryCreationActivityDropdown)
        or (owner == LFGListEntryCreationPlayStyleDropdown)
        or (owner == HonorFrameTypeDropdown)
        or (owner == TrainingGroundsFrameTypeDropdown)
        or (owner == FriendsFrameStatusDropdown)
        or (owner == WhoFrameDropdown)
        or (owner == DressUpFrameCustomSetDropdown)
        or (owner == CompactRaidFrameManagerDisplayFrameModeControlDropdown)
        or (owner == CompactRaidFrameManagerDisplayFrameRestrictPingsDropdown)
        or (owner == AddonList.Dropdown)
        or (owner == DelvesCompanionAbilityListFrame.DelvesCompanionRoleDropdown)
        or (owner == EditModeManagerFrame.LayoutDropdown)
        or (owner == GroupLootHistoryFrame.EncounterDropdown)
        or (owner == MerchantFrame.FilterDropdown)
        or (owner == ReportFrame.ReportingMajorCategoryDropdown)
        or (owner == TimeManagerAlarmTimeFrame.HourDropdown)
        or (owner == TimeManagerAlarmTimeFrame.MinuteDropdown)
        or (owner == TimeManagerAlarmTimeFrame.AMPMDropdown)
        or (AuctionHouseFrame and owner == AuctionHouseFrame.CommoditiesSellFrame.Duration.Dropdown)
        or (AuctionHouseFrame and owner == AuctionHouseFrame.ItemSellFrame.Duration.Dropdown)
        or (DelvesDifficultyPickerFrame and owner == DelvesDifficultyPickerFrame.Dropdown)
        or (EncounterJournalInstanceSelect and owner == EncounterJournalInstanceSelect.ExpansionDropdown)
        or (HeirloomsJournal and owner == HeirloomsJournal.ClassDropdown)
        or (ItemUpgradeFrame and owner == ItemUpgradeFrame.ItemInfo.Dropdown)
        or (PlayerSpellsFrame and owner == PlayerSpellsFrame.TalentsFrame.LoadSystem.Dropdown)
        or (WardrobeCollectionFrame and owner == WardrobeCollectionFrame.ClassDropdown)
        or (WardrobeCollectionFrame and owner == WardrobeCollectionFrame.ItemsCollectionFrame.WeaponDropdown)
end

local DialogSkin = CreateFrame("Frame", nil, UIParent, "DialogBorderDarkTemplate")
ApplyDialogBorder(DialogSkin)
DialogSkin:Hide()

local TooltipSkin = CreateFrame("Frame", nil, UIParent, "TooltipBackdropTemplate")
TooltipSkin:Hide()

local SubMenuSkin = CreateFrame("Frame", nil, UIParent, "TooltipBackdropTemplate")
SubMenuSkin:Hide()

local function SkinMenu(manager, owner, menuDescription)
    local menu = manager:GetOpenMenu()
    if not menu then return end

    if select(1, menu:GetRegions()):GetAtlas() == "common-dropdown-c-bg" then
        DialogSkin:Hide()
        TooltipSkin:Hide()
        return
    end

    select(1, menu:GetRegions()):SetAlpha(0)

    if IsDialogMenu(owner) then
        TooltipSkin:Hide()
        DialogSkin:SetParent(menu)
        DialogSkin:ClearAllPoints()
        DialogSkin:SetPoint("TOPLEFT", menu, "TOPLEFT", -10, 5)
        DialogSkin:SetPoint("BOTTOMRIGHT", menu, "BOTTOMRIGHT", 10, 2)
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