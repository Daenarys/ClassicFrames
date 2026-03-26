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

		ApplyScrollBarArrow(EncounterJournalSearchResults.ScrollBar)
		ApplyScrollBarTrack(EncounterJournalSearchResults.ScrollBar.Track)
		ApplyScrollBarThumb(EncounterJournalSearchResults.ScrollBar.Track.Thumb)

		ApplyScrollBarArrow(EncounterJournalJourneysFrame.ScrollBar)
		ApplyScrollBarTrack(EncounterJournalJourneysFrame.ScrollBar.Track)
		ApplyScrollBarThumb(EncounterJournalJourneysFrame.ScrollBar.Track.Thumb)

		EncounterJournalMonthlyActivitiesFrame.ScrollBar.Track.Begin:Hide()
		EncounterJournalMonthlyActivitiesFrame.ScrollBar.Track.End:Hide()
		EncounterJournalMonthlyActivitiesFrame.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(EncounterJournalMonthlyActivitiesFrame.ScrollBar)
		ApplyScrollBarThumb(EncounterJournalMonthlyActivitiesFrame.ScrollBar.Track.Thumb)

		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Track.Begin:Hide()
		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Track.End:Hide()
		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar)
		ApplyScrollBarThumb(EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Track.Thumb)

		EncounterJournalInstanceSelect.ScrollBar.Track.Begin:Hide()
		EncounterJournalInstanceSelect.ScrollBar.Track.End:Hide()
		EncounterJournalInstanceSelect.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(EncounterJournalInstanceSelect.ScrollBar)
		ApplyScrollBarThumb(EncounterJournalInstanceSelect.ScrollBar.Track.Thumb)

		EncounterJournalEncounterFrameInfo.BossesScrollBar.Track.Begin:Hide()
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Track.End:Hide()
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(EncounterJournalEncounterFrameInfo.BossesScrollBar)
		ApplyScrollBarThumb(EncounterJournalEncounterFrameInfo.BossesScrollBar.Track.Thumb)

		ApplyScrollBarArrow(EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar)

		EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.Track.Begin:Hide()
		EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.Track.End:Hide()
		EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar)
		ApplyScrollBarThumb(EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar.Track.Thumb)

		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Track.Begin:Hide()
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Track.End:Hide()
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar)
		ApplyScrollBarThumb(EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Track.Thumb)

		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.Track.Begin:Hide()
		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.Track.End:Hide()
		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar)
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