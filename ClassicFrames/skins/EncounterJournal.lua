local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_EncounterJournal" then
		ApplyCloseButton(EncounterJournalCloseButton)

		EncounterJournalPortrait:SetSize(61, 61)
		EncounterJournalPortrait:ClearAllPoints()
		EncounterJournalPortrait:SetPoint("TOPLEFT", -6, 8)

		EncounterJournal.TitleContainer:ClearAllPoints()
		EncounterJournal.TitleContainer:SetPoint("TOPLEFT", EncounterJournal, "TOPLEFT", 58, 0)
		EncounterJournal.TitleContainer:SetPoint("TOPRIGHT", EncounterJournal, "TOPRIGHT", -58, 0)

		EncounterJournalMonthlyActivitiesFrame.HelpButton.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

		ApplyTitleBg(EncounterJournal)
		ApplyNineSlicePortrait(EncounterJournal)

		ApplyBottomTab(EncounterJournalJourneysTab)
		ApplyBottomTab(EncounterJournalMonthlyActivitiesTab)
		ApplyBottomTab(EncounterJournalSuggestTab)
		ApplyBottomTab(EncounterJournalDungeonTab)
		ApplyBottomTab(EncounterJournalRaidTab)
		ApplyBottomTab(EncounterJournal.TutorialsTab)

		EncounterJournal:HookScript("OnShow", function(self)
			EncounterJournalMonthlyActivitiesTab:ClearAllPoints()
			EncounterJournalMonthlyActivitiesTab:SetPoint("LEFT", EncounterJournalJourneysTab, "RIGHT", -15, 0)
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
			EncounterJournal.TutorialsTab:ClearAllPoints()
			EncounterJournal.TutorialsTab:SetPoint("LEFT", EncounterJournalRaidTab, "RIGHT", -15, 0)

			EncounterJournalJourneysTab:SetWidth(40 + EncounterJournalJourneysTab:GetFontString():GetStringWidth())
			EncounterJournalMonthlyActivitiesTab:SetWidth(40 + EncounterJournalMonthlyActivitiesTab:GetFontString():GetStringWidth())
			EncounterJournalSuggestTab:SetWidth(40 + EncounterJournalSuggestTab:GetFontString():GetStringWidth())
			EncounterJournalDungeonTab:SetWidth(40 + EncounterJournalDungeonTab:GetFontString():GetStringWidth())
			EncounterJournalRaidTab:SetWidth(40 + EncounterJournalRaidTab:GetFontString():GetStringWidth())
			EncounterJournal.TutorialsTab:SetWidth(40 + EncounterJournal.TutorialsTab:GetFontString():GetStringWidth())
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
		EncounterJournalSearchResults.ScrollBar:SetPoint("TOPLEFT", EncounterJournalSearchResults.ScrollBox, "TOPRIGHT", -7, 1)
		EncounterJournalSearchResults.ScrollBar:SetPoint("BOTTOMLEFT", EncounterJournalSearchResults.ScrollBox, "BOTTOMRIGHT", 7, -2)

		if (EncounterJournalSearchResults.ScrollBar.BG == nil) then
			EncounterJournalSearchResults.ScrollBar.BG = EncounterJournalSearchResults.ScrollBar:CreateTexture(nil, "BACKGROUND")
			EncounterJournalSearchResults.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			EncounterJournalSearchResults.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(EncounterJournalSearchResults.ScrollBar)
		ApplyScrollBarTrack(EncounterJournalSearchResults.ScrollBar.Track)
		ApplyScrollBarThumb(EncounterJournalSearchResults.ScrollBar.Track.Thumb)

		EncounterJournalJourneysFrame.ScrollBar:SetWidth(25)
		EncounterJournalJourneysFrame.ScrollBar:SetPoint("LEFT", EncounterJournalJourneysFrame.JourneysList, "RIGHT", -32, 0)

		if (EncounterJournalJourneysFrame.ScrollBar.BG == nil) then
			EncounterJournalJourneysFrame.ScrollBar.BG = EncounterJournalJourneysFrame.ScrollBar:CreateTexture(nil, "BACKGROUND")
			EncounterJournalJourneysFrame.ScrollBar.BG:SetColorTexture(0, 0, 0, .5)
			EncounterJournalJourneysFrame.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(EncounterJournalJourneysFrame.ScrollBar)
		ApplyScrollBarTrack(EncounterJournalJourneysFrame.ScrollBar.Track)
		ApplyScrollBarThumb(EncounterJournalJourneysFrame.ScrollBar.Track.Thumb)

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

		ApplyScrollBarArrowNoPos(EncounterJournalMonthlyActivitiesFrame.ScrollBar)
		ApplyScrollBarThumb(EncounterJournalMonthlyActivitiesFrame.ScrollBar.Track.Thumb)

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

		ApplyScrollBarArrowNoPos(EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar)
		ApplyScrollBarThumb(EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Track.Thumb)

		EncounterJournalInstanceSelect.ScrollBar.Track.Begin:Hide()
		EncounterJournalInstanceSelect.ScrollBar.Track.End:Hide()
		EncounterJournalInstanceSelect.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrowNoPos(EncounterJournalInstanceSelect.ScrollBar)
		ApplyScrollBarThumb(EncounterJournalInstanceSelect.ScrollBar.Track.Thumb)

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

		ApplyScrollBarArrowNoPos(EncounterJournalEncounterFrameInfo.BossesScrollBar)
		ApplyScrollBarThumb(EncounterJournalEncounterFrameInfo.BossesScrollBar.Track.Thumb)

		ApplyScrollBarArrowNoPos(EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar)

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

		ApplyScrollBarArrowNoPos(EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar)
		ApplyScrollBarThumb(EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.Track.Thumb)

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

		ApplyScrollBarArrowNoPos(EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar)
		ApplyScrollBarThumb(EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Track.Thumb)

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

		ApplyScrollBarArrowNoPos(EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar)
		ApplyScrollBarThumb(EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.Track.Thumb)

		ApplyDropDown(EncounterJournalInstanceSelect.ExpansionDropdown)

		ApplyEJDropDown(EncounterJournalEncounterFrameInfo.LootContainer.filter)
		EncounterJournalEncounterFrameInfo.LootContainer.filter:SetPoint("TOPLEFT", EncounterJournal, "TOPRIGHT", -361, -77)
		hooksecurefunc(EncounterJournalEncounterFrameInfo.LootContainer.filter, "UpdateText", function(self)
			self.Text:SetText(GEAR_FILTER)
		end)

		ApplyEJDropDown(EncounterJournalEncounterFrameInfo.LootContainer.slotFilter)
		EncounterJournalEncounterFrameInfo.LootContainer.slotFilter:SetPoint("LEFT", EncounterJournalEncounterFrameInfo.LootContainer.filter, "RIGHT", 9, 0)

		ApplyEJDropDown(EncounterJournalEncounterFrameInfoDifficulty)
		EncounterJournalEncounterFrameInfoDifficulty:SetPoint("TOPRIGHT", -6, -13)
	end
end)