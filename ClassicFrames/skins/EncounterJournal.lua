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

		ApplyCloseButton(EncounterJournalSearchResultsCloseButton, true)
		EncounterJournalSearchResultsCloseButton:ClearAllPoints()
		EncounterJournalSearchResultsCloseButton:SetPoint("TOPRIGHT", 7, 2)

		ApplyScrollBarHybrid(EncounterJournalSearchResults.ScrollBar, true, true)
		ApplyScrollBarThumb(EncounterJournalSearchResults.ScrollBar.Track.Thumb)

		EncounterJournalJourneysFrame.ScrollBar.Track.Begin:Hide()
		EncounterJournalJourneysFrame.ScrollBar.Track.End:Hide()
		EncounterJournalJourneysFrame.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(EncounterJournalJourneysFrame.ScrollBar, true)
		ApplyScrollBarThumb(EncounterJournalJourneysFrame.ScrollBar.Track.Thumb)

		EncounterJournalMonthlyActivitiesFrame.ScrollBar.Track.Begin:Hide()
		EncounterJournalMonthlyActivitiesFrame.ScrollBar.Track.End:Hide()
		EncounterJournalMonthlyActivitiesFrame.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(EncounterJournalMonthlyActivitiesFrame.ScrollBar, true)
		ApplyScrollBarThumb(EncounterJournalMonthlyActivitiesFrame.ScrollBar.Track.Thumb)

		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Track.Begin:Hide()
		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Track.End:Hide()
		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar, true)
		ApplyScrollBarThumb(EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar.Track.Thumb)

		EncounterJournalInstanceSelect.ScrollBar.Track.Begin:Hide()
		EncounterJournalInstanceSelect.ScrollBar.Track.End:Hide()
		EncounterJournalInstanceSelect.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(EncounterJournalInstanceSelect.ScrollBar, true)
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

		ApplyScrollBarArrow(EncounterJournalEncounterFrameInfo.BossesScrollBar, true)
		ApplyScrollBarThumb(EncounterJournalEncounterFrameInfo.BossesScrollBar.Track.Thumb)

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

		ApplyScrollBarArrow(EncounterJournalEncounterFrameInfoOverviewScrollFrame.ScrollBar, true)
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

		ApplyScrollBarArrow(EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar, true)
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

		ApplyScrollBarArrow(EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar, true)
		ApplyScrollBarThumb(EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar.Track.Thumb)

		ApplyScrollBarArrow(EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar, true)

		ApplyDropDown(EncounterJournalInstanceSelect.ExpansionDropdown)
		ApplyDropDown(EncounterJournalEncounterFrameInfo.LootContainer.filter)
		ApplyDropDown(EncounterJournalEncounterFrameInfo.LootContainer.slotFilter)
		ApplyDropDown(EncounterJournalEncounterFrameInfoDifficulty)
	end
end)