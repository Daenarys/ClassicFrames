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
		or (owner == WorldMapFrame.overlayFrames[1])
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

local SubDialogSkin = CreateFrame("Frame", nil, UIParent, "DialogBorderDarkTemplate")
ApplyDialogBorder(SubDialogSkin)
SubDialogSkin:Hide()

local TooltipSkin = CreateFrame("Frame", nil, UIParent, "TooltipBackdropTemplate")
TooltipSkin:Hide()

local SubTooltipSkin = CreateFrame("Frame", nil, UIParent, "TooltipBackdropTemplate")
SubTooltipSkin:Hide()

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
		DialogSkin:SetPoint("TOPLEFT", menu, "TOPLEFT", -8, 5)
		DialogSkin:SetPoint("BOTTOMRIGHT", menu, "BOTTOMRIGHT", 8, 2)
		DialogSkin:SetFrameLevel(menu:GetFrameLevel())
		DialogSkin:Show()
	else
		DialogSkin:Hide()
		TooltipSkin:SetParent(menu)
		TooltipSkin:ClearAllPoints()
		TooltipSkin:SetPoint("TOPLEFT", menu, "TOPLEFT", -3, -1)
		TooltipSkin:SetPoint("BOTTOMRIGHT", menu, "BOTTOMRIGHT", 3, 7)
		TooltipSkin:SetFrameLevel(menu:GetFrameLevel())
		TooltipSkin:Show()
	end

	menuDescription:AddMenuAcquiredCallback(function(self)
		select(1, self:GetRegions()):SetAlpha(0)
		if IsDialogMenu(owner) then
			SubTooltipSkin:Hide()
			SubDialogSkin:SetParent(self)
			SubDialogSkin:ClearAllPoints()
			SubDialogSkin:SetPoint("TOPLEFT", self, "TOPLEFT", -8, 5)
			SubDialogSkin:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 8, 2)
			SubDialogSkin:SetFrameLevel(self:GetFrameLevel())
			SubDialogSkin:Show()
		else
			SubDialogSkin:Hide()
			SubTooltipSkin:SetParent(self)
			SubTooltipSkin:ClearAllPoints()
			SubTooltipSkin:SetPoint("TOPLEFT", self, "TOPLEFT", -3, -1)
			SubTooltipSkin:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 3, 7)
			SubTooltipSkin:SetFrameLevel(self:GetFrameLevel())
			SubTooltipSkin:Show()
		end
	end)
end

local manager = _G.Menu.GetManager()
if manager then
	hooksecurefunc(manager, "OpenMenu", SkinMenu)
	hooksecurefunc(manager, "OpenContextMenu", SkinMenu)
end