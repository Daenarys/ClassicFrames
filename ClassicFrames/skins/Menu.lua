local function IsDialogMenu(owner)
    if not owner then return false end

    return (owner == LFDQueueFrameTypeDropdown)
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
        or (owner == ClubFinderGuildFinderFrame.OptionsList.ClubFilterDropdown)
        or (owner == ClubFinderGuildFinderFrame.OptionsList.ClubSizeDropdown)
        or (owner == ClubFinderCommunityAndGuildFinderFrame.OptionsList.ClubFilterDropdown)
        or (owner == ClubFinderCommunityAndGuildFinderFrame.OptionsList.SortByDropdown)
        or (owner == CooldownViewerSettings.LayoutDropdown)
        or (owner == DelvesCompanionAbilityListFrame.DelvesCompanionRoleDropdown)
        or (owner == EditModeManagerFrame.LayoutDropdown)
        or (owner == GearManagerPopupFrame.BorderBox.IconTypeDropdown)
        or (owner == GroupLootHistoryFrame.EncounterDropdown)
        or (owner == MerchantFrame.FilterDropdown)
        or (owner == ReportFrame.ReportingMajorCategoryDropdown)
        or (owner == TimeManagerAlarmTimeFrame.HourDropdown)
        or (owner == TimeManagerAlarmTimeFrame.MinuteDropdown)
        or (owner == TimeManagerAlarmTimeFrame.AMPMDropdown)
        or (AuctionHouseFrame and owner == AuctionHouseFrame.CommoditiesSellFrame.Duration.Dropdown)
        or (AuctionHouseFrame and owner == AuctionHouseFrame.ItemSellFrame.Duration.Dropdown)
        or (CalendarCreateEventFrame and owner == CalendarCreateEventFrame.EventTypeDropdown)
        or (CalendarCreateEventFrame and owner == CalendarCreateEventFrame.HourDropdown)
        or (CalendarCreateEventFrame and owner == CalendarCreateEventFrame.MinuteDropdown)
        or (CalendarCreateEventFrame and owner == CalendarCreateEventFrame.AMPMDropdown)
        or (DelvesDifficultyPickerFrame and owner == DelvesDifficultyPickerFrame.Dropdown)
        or (EncounterJournalInstanceSelect and owner == EncounterJournalInstanceSelect.ExpansionDropdown)
        or (HeirloomsJournal and owner == HeirloomsJournal.ClassDropdown)
        or (ItemUpgradeFrame and owner == ItemUpgradeFrame.ItemInfo.Dropdown)
        or (MacroPopupFrame and owner == MacroPopupFrame.BorderBox.IconTypeDropdown)
        or (PlayerSpellsFrame and owner == PlayerSpellsFrame.TalentsFrame.LoadSystem.Dropdown)
        or (WardrobeCollectionFrame and owner == WardrobeCollectionFrame.ItemsCollectionFrame.WeaponDropdown)
end

local DialogSkin = CreateFrame("Frame", nil, UIParent, "DialogBorderDarkTemplate")
ApplyDialogBorder(DialogSkin)
DialogSkin:Hide()

local TooltipSkin = CreateFrame("Frame", nil, UIParent, "TooltipBackdropTemplate")
TooltipSkin:Hide()

local SubMenuDialogSkin = CreateFrame("Frame", nil, UIParent, "DialogBorderDarkTemplate")
ApplyDialogBorder(SubMenuDialogSkin)
SubMenuDialogSkin:Hide()

local SubMenuTooltipSkin = CreateFrame("Frame", nil, UIParent, "TooltipBackdropTemplate")
SubMenuTooltipSkin:Hide()

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
        DialogSkin:SetPoint("BOTTOMRIGHT", menu, "BOTTOMRIGHT", 5, 2)
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
        if IsDialogMenu(owner) then
            SubMenuTooltipSkin:Hide()
            SubMenuDialogSkin:SetParent(self)
            SubMenuDialogSkin:ClearAllPoints()
            SubMenuDialogSkin:SetPoint("TOPLEFT", self, "TOPLEFT", -10, 5)
            SubMenuDialogSkin:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 5, 2)
            SubMenuDialogSkin:SetFrameLevel(self:GetFrameLevel())
            SubMenuDialogSkin:Show()
        else
            SubMenuDialogSkin:Hide()
            SubMenuTooltipSkin:SetParent(self)
            SubMenuTooltipSkin:ClearAllPoints()
            SubMenuTooltipSkin:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 3)
            SubMenuTooltipSkin:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 4)
            SubMenuTooltipSkin:SetFrameLevel(self:GetFrameLevel())
            SubMenuTooltipSkin:Show()
        end
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