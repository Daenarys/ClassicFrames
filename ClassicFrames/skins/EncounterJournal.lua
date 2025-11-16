local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_EncounterJournal" then
		ApplyCloseButton(EncounterJournalCloseButton)

		EncounterJournal.PortraitContainer.CircleMask:Hide()

		EncounterJournalPortrait:SetSize(61, 61)
		EncounterJournalPortrait:ClearAllPoints()
		EncounterJournalPortrait:SetPoint("TOPLEFT", -6, 8)

		EncounterJournal.TitleContainer:ClearAllPoints()
		EncounterJournal.TitleContainer:SetPoint("TOPLEFT", EncounterJournal, "TOPLEFT", 58, 0)
		EncounterJournal.TitleContainer:SetPoint("TOPRIGHT", EncounterJournal, "TOPRIGHT", -58, 0)

		EncounterJournalMonthlyActivitiesFrame.HelpButton.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

		ApplyTitleBg(EncounterJournal)
		ApplyNineSlicePortrait(EncounterJournal)

		ApplyBottomTab(EncounterJournalMonthlyActivitiesTab)
		ApplyBottomTab(EncounterJournalSuggestTab)
		ApplyBottomTab(EncounterJournalDungeonTab)
		ApplyBottomTab(EncounterJournalRaidTab)
		ApplyBottomTab(EncounterJournalLootJournalTab)

		EncounterJournal:HookScript("OnShow", function(self)
			EncounterJournalSuggestTab:ClearAllPoints()
			EncounterJournalSuggestTab:SetPoint("LEFT", EncounterJournalMonthlyActivitiesTab, "RIGHT", -15, 0)
			EncounterJournalDungeonTab:ClearAllPoints()
			if PlayerIsTimerunning() then
				EncounterJournalDungeonTab:SetPoint("LEFT", EncounterJournalMonthlyActivitiesTab, "RIGHT", -15, 0)
			else
				EncounterJournalDungeonTab:SetPoint("LEFT", EncounterJournalSuggestTab, "RIGHT", -15, 0)
			end
			EncounterJournalRaidTab:ClearAllPoints()
			EncounterJournalRaidTab:SetPoint("LEFT", EncounterJournalDungeonTab, "RIGHT", -15, 0)
			EncounterJournalLootJournalTab:ClearAllPoints()
			EncounterJournalLootJournalTab:SetPoint("LEFT", EncounterJournalRaidTab, "RIGHT", -15, 0)

			EncounterJournalMonthlyActivitiesTab:SetWidth(40 + EncounterJournalMonthlyActivitiesTab:GetFontString():GetStringWidth())
			EncounterJournalSuggestTab:SetWidth(40 + EncounterJournalSuggestTab:GetFontString():GetStringWidth())
			EncounterJournalDungeonTab:SetWidth(40 + EncounterJournalDungeonTab:GetFontString():GetStringWidth())
			EncounterJournalRaidTab:SetWidth(40 + EncounterJournalRaidTab:GetFontString():GetStringWidth())
			EncounterJournalLootJournalTab:SetWidth(40 + EncounterJournalLootJournalTab:GetFontString():GetStringWidth())
		end)

		EncounterJournalSearchResultsCloseButton:SetSize(32, 32)
		EncounterJournalSearchResultsCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		EncounterJournalSearchResultsCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		EncounterJournalSearchResultsCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		EncounterJournalSearchResultsCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		EncounterJournalSearchResultsCloseButton:ClearAllPoints()
		EncounterJournalSearchResultsCloseButton:SetPoint("TOPRIGHT", 7, 2)

		EncounterJournalSearchResults.ScrollBar:SetSize(25, 560)
		EncounterJournalSearchResults.ScrollBar:ClearAllPoints()
		EncounterJournalSearchResults.ScrollBar:SetPoint("TOPLEFT", EncounterJournalSearchResults.ScrollBox, "TOPRIGHT", -5, 2)
		EncounterJournalSearchResults.ScrollBar:SetPoint("BOTTOMLEFT", EncounterJournalSearchResults.ScrollBox, "BOTTOMRIGHT", 5, -1)

		if (EncounterJournalSearchResults.ScrollBar.BG == nil) then
			EncounterJournalSearchResults.ScrollBar.BG = EncounterJournalSearchResults.ScrollBar:CreateTexture(nil, "BACKGROUND")
			EncounterJournalSearchResults.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			EncounterJournalSearchResults.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(EncounterJournalSearchResults.ScrollBar)
		ApplyScrollBarTrack(EncounterJournalSearchResults.ScrollBar.Track)
		ApplyScrollBarThumb(EncounterJournalSearchResults.ScrollBar.Track.Thumb)
		
		EncounterJournalMonthlyActivitiesFrame.ScrollBar:SetWidth(20)
		EncounterJournalMonthlyActivitiesFrame.ScrollBar:ClearAllPoints()
		EncounterJournalMonthlyActivitiesFrame.ScrollBar:SetPoint("TOPLEFT", EncounterJournalMonthlyActivitiesFrame.ScrollBox, "TOPRIGHT", 8, 1)
		EncounterJournalMonthlyActivitiesFrame.ScrollBar:SetPoint("BOTTOMLEFT", EncounterJournalMonthlyActivitiesFrame.ScrollBox, "BOTTOMRIGHT", 8, 1)

		if (EncounterJournalMonthlyActivitiesFrame.ScrollBar.BG == nil) then
			EncounterJournalMonthlyActivitiesFrame.ScrollBar.BG = EncounterJournalMonthlyActivitiesFrame.ScrollBar:CreateTexture(nil, "BACKGROUND")
			EncounterJournalMonthlyActivitiesFrame.ScrollBar.BG:SetColorTexture(0, 0, 0, .5)
			EncounterJournalMonthlyActivitiesFrame.ScrollBar.BG:SetAllPoints()
		end

		EncounterJournalMonthlyActivitiesFrame.ScrollBar.Track.Begin:Hide()
		EncounterJournalMonthlyActivitiesFrame.ScrollBar.Track.End:Hide()
		EncounterJournalMonthlyActivitiesFrame.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarThumb(EncounterJournalMonthlyActivitiesFrame.ScrollBar.Track.Thumb)

		EncounterJournalMonthlyActivitiesFrame.ScrollBar.Back:SetSize(18, 16)
		EncounterJournalMonthlyActivitiesFrame.ScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
		EncounterJournalMonthlyActivitiesFrame.ScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
		EncounterJournalMonthlyActivitiesFrame.ScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
		EncounterJournalMonthlyActivitiesFrame.ScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

		EncounterJournalMonthlyActivitiesFrame.ScrollBar.Forward:SetSize(18, 16)
		EncounterJournalMonthlyActivitiesFrame.ScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
		EncounterJournalMonthlyActivitiesFrame.ScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
		EncounterJournalMonthlyActivitiesFrame.ScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
		EncounterJournalMonthlyActivitiesFrame.ScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")

		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar:SetWidth(20)
		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar:ClearAllPoints()
		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar:SetPoint("TOPLEFT", EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBox, "TOPRIGHT", 0, -2)
		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar:SetPoint("BOTTOMLEFT", EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBox, "BOTTOMRIGHT", 0, 0)

		if (EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.BG == nil) then
			EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.BG = EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar:CreateTexture(nil, "BACKGROUND")
			EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.BG:SetColorTexture(0, 0, 0, .5)
			EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.BG:SetAllPoints()
		end

		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Track.Begin:Hide()
		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Track.End:Hide()
		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarThumb(EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Track.Thumb)

		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Back:SetSize(18, 16)
		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Forward:SetSize(18, 16)
		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")

		EncounterJournalInstanceSelect.ScrollBar:ClearAllPoints()
		EncounterJournalInstanceSelect.ScrollBar:SetPoint("TOPLEFT", EncounterJournalInstanceSelect.ScrollBox, "TOPRIGHT", 12, -7)
		EncounterJournalInstanceSelect.ScrollBar:SetPoint("BOTTOMLEFT", EncounterJournalInstanceSelect.ScrollBox, "BOTTOMRIGHT", 12, -9)

		EncounterJournalInstanceSelect.ScrollBar.Track.Begin:Hide()
		EncounterJournalInstanceSelect.ScrollBar.Track.End:Hide()
		EncounterJournalInstanceSelect.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarThumb(EncounterJournalInstanceSelect.ScrollBar.Track.Thumb)

		EncounterJournalInstanceSelect.ScrollBar.Back:SetSize(18, 16)
		EncounterJournalInstanceSelect.ScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
		EncounterJournalInstanceSelect.ScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
		EncounterJournalInstanceSelect.ScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
		EncounterJournalInstanceSelect.ScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

		EncounterJournalInstanceSelect.ScrollBar.Forward:SetSize(18, 16)
		EncounterJournalInstanceSelect.ScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
		EncounterJournalInstanceSelect.ScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
		EncounterJournalInstanceSelect.ScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
		EncounterJournalInstanceSelect.ScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")

		EncounterJournal.LootJournalItems.ItemSetsFrame.ScrollBar:ClearAllPoints()
		EncounterJournal.LootJournalItems.ItemSetsFrame.ScrollBar:SetPoint("TOPLEFT", EncounterJournal.LootJournalItems.ItemSetsFrame.ScrollBox, "TOPRIGHT", 8, -1)
		EncounterJournal.LootJournalItems.ItemSetsFrame.ScrollBar:SetPoint("BOTTOMLEFT", EncounterJournal.LootJournalItems.ItemSetsFrame.ScrollBox, "BOTTOMRIGHT", 8, 0)

		EncounterJournal.LootJournalItems.ItemSetsFrame.ScrollBar.Track.Begin:Hide()
		EncounterJournal.LootJournalItems.ItemSetsFrame.ScrollBar.Track.End:Hide()
		EncounterJournal.LootJournalItems.ItemSetsFrame.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarThumb(EncounterJournal.LootJournalItems.ItemSetsFrame.ScrollBar.Track.Thumb)

		EncounterJournal.LootJournalItems.ItemSetsFrame.ScrollBar.Back:SetSize(18, 16)
		EncounterJournal.LootJournalItems.ItemSetsFrame.ScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
		EncounterJournal.LootJournalItems.ItemSetsFrame.ScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
		EncounterJournal.LootJournalItems.ItemSetsFrame.ScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
		EncounterJournal.LootJournalItems.ItemSetsFrame.ScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

		EncounterJournal.LootJournalItems.ItemSetsFrame.ScrollBar.Forward:SetSize(18, 16)
		EncounterJournal.LootJournalItems.ItemSetsFrame.ScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
		EncounterJournal.LootJournalItems.ItemSetsFrame.ScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
		EncounterJournal.LootJournalItems.ItemSetsFrame.ScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
		EncounterJournal.LootJournalItems.ItemSetsFrame.ScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")

		EncounterJournal.LootJournal.ScrollBar:ClearAllPoints()
		EncounterJournal.LootJournal.ScrollBar:SetPoint("TOPLEFT", EncounterJournal.LootJournal.ScrollBox, "TOPRIGHT", -12, -2)
		EncounterJournal.LootJournal.ScrollBar:SetPoint("BOTTOMLEFT", EncounterJournal.LootJournal.ScrollBox, "BOTTOMRIGHT", -12, 0)

		EncounterJournal.LootJournal.ScrollBar.Track.Begin:Hide()
		EncounterJournal.LootJournal.ScrollBar.Track.End:Hide()
		EncounterJournal.LootJournal.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarThumb(EncounterJournal.LootJournal.ScrollBar.Track.Thumb)

		EncounterJournal.LootJournal.ScrollBar.Back:SetSize(18, 16)
		EncounterJournal.LootJournal.ScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
		EncounterJournal.LootJournal.ScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
		EncounterJournal.LootJournal.ScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
		EncounterJournal.LootJournal.ScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

		EncounterJournal.LootJournal.ScrollBar.Forward:SetSize(18, 16)
		EncounterJournal.LootJournal.ScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
		EncounterJournal.LootJournal.ScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
		EncounterJournal.LootJournal.ScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
		EncounterJournal.LootJournal.ScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")

		EncounterJournalEncounterFrameInfo.BossesScrollBar:SetWidth(20)
		EncounterJournalEncounterFrameInfo.BossesScrollBar:ClearAllPoints()
		EncounterJournalEncounterFrameInfo.BossesScrollBar:SetPoint("TOPLEFT", EncounterJournalEncounterFrameInfo.BossesScrollBox, "TOPRIGHT", 4, -2)
		EncounterJournalEncounterFrameInfo.BossesScrollBar:SetPoint("BOTTOMLEFT", EncounterJournalEncounterFrameInfo.BossesScrollBox, "BOTTOMRIGHT", 4, 2)

		if (EncounterJournalEncounterFrameInfo.BossesScrollBar.BG == nil) then
			EncounterJournalEncounterFrameInfo.BossesScrollBar.BG = EncounterJournalEncounterFrameInfo.BossesScrollBar:CreateTexture(nil, "BACKGROUND")
			EncounterJournalEncounterFrameInfo.BossesScrollBar.BG:SetColorTexture(0, 0, 0, .25)
			EncounterJournalEncounterFrameInfo.BossesScrollBar.BG:SetAllPoints()
		end

		EncounterJournalEncounterFrameInfo.BossesScrollBar.Track.Begin:Hide()
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Track.End:Hide()
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Track.Middle:Hide()

		ApplyScrollBarThumb(EncounterJournalEncounterFrameInfo.BossesScrollBar.Track.Thumb)

		EncounterJournalEncounterFrameInfo.BossesScrollBar.Back:SetSize(18, 16)
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

		EncounterJournalEncounterFrameInfo.BossesScrollBar.Forward:SetSize(18, 16)
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")

		EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar.Back:SetSize(18, 16)
		EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
		EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
		EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
		EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

		EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar.Forward:SetSize(18, 16)
		EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
		EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
		EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
		EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")

		EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar:SetWidth(20)
		EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar:ClearAllPoints()
		EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar:SetPoint("TOPLEFT", EncounterJournalEncounterFrameInfoOverviewScrollFrame, "TOPRIGHT", -21, -2)
		EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", EncounterJournalEncounterFrameInfoOverviewScrollFrame, "BOTTOMRIGHT", -21, 2)

		if (EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.BG == nil) then
			EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.BG = EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar:CreateTexture(nil, "BACKGROUND")
			EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.BG:SetColorTexture(0, 0, 0, .25)
			EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.BG:SetAllPoints()
		end

		EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.Track.Begin:Hide()
		EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.Track.End:Hide()
		EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarThumb(EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.Track.Thumb)

		EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.Back:SetSize(18, 16)
		EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
		EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
		EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
		EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

		EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.Forward:SetSize(18, 16)
		EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
		EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
		EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
		EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")

		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar:SetWidth(20)
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar:ClearAllPoints()
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar:SetPoint("TOPLEFT", EncounterJournalEncounterFrameInfo.LootContainer.ScrollBox, "TOPRIGHT", -1, -5)
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar:SetPoint("BOTTOMLEFT", EncounterJournalEncounterFrameInfo.LootContainer.ScrollBox, "BOTTOMRIGHT", -1, 2)

		if (EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.BG == nil) then
			EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.BG = EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar:CreateTexture(nil, "BACKGROUND")
			EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.BG:SetColorTexture(0, 0, 0, .25)
			EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.BG:SetAllPoints()
		end

		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Track.Begin:Hide()
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Track.End:Hide()
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarThumb(EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Track.Thumb)

		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Back:SetSize(18, 16)
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Forward:SetSize(18, 16)
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")

		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar:SetWidth(20)
		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar:ClearAllPoints()
		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar:SetPoint("TOPLEFT", EncounterJournalEncounterFrameInfoDetailsScrollFrame, "TOPRIGHT", -21, -2)
		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", EncounterJournalEncounterFrameInfoDetailsScrollFrame, "BOTTOMRIGHT", -21, 2)

		if (EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.BG == nil) then
			EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.BG = EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar:CreateTexture(nil, "BACKGROUND")
			EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.BG:SetColorTexture(0, 0, 0, .25)
			EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.BG:SetAllPoints()
		end

		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.Track.Begin:Hide()
		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.Track.End:Hide()
		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarThumb(EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.Track.Thumb)

		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.Back:SetSize(18, 16)
		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.Forward:SetSize(18, 16)
		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")

		ApplyDropDown(EncounterJournal.LootJournalViewDropdown)
		ApplyDropDown(EncounterJournal.LootJournal.ClassDropdown)
		ApplyDropDown(EncounterJournal.LootJournal.RuneforgePowerDropdown)
		ApplyDropDown(EncounterJournal.LootJournalItems.ItemSetsFrame.ClassDropdown)
		ApplyDropDown(EncounterJournalInstanceSelect.ExpansionDropdown)
		ApplyDropDown(EncounterJournalEncounterFrameInfo.LootContainer.filter)
		ApplyDropDown(EncounterJournalEncounterFrameInfo.LootContainer.slotFilter)
		ApplyDropDown(EncounterJournalEncounterFrameInfoDifficulty)
	end
end)