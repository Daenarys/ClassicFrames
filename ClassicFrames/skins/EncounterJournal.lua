local function ApplyEJDropDown(frame)
	frame.Arrow:Hide()
	frame.Background:Hide()

	if (frame.UpLeft == nil) then
		frame.UpLeft = frame:CreateTexture(nil, "ARTWORK")
		frame.UpLeft:SetSize(13, 26)
		frame.UpLeft:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
		frame.UpLeft:SetTexCoord(0.90039063, 0.95117188, 0.04980469, 0.07519531)
		frame.UpLeft:SetPoint("TOPLEFT")
	end

	if (frame.UpRight == nil) then
		frame.UpRight = frame:CreateTexture(nil, "ARTWORK")
		frame.UpRight:SetSize(13, 26)
		frame.UpRight:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
		frame.UpRight:SetTexCoord(0.90039063, 0.95117188, 0.04980469, 0.07519531)
		frame.UpRight:SetPoint("TOPRIGHT")
	end

	if (frame.UpMiddle == nil) then
		frame.UpMiddle = frame:CreateTexture(nil, "ARTWORK")
		frame.UpMiddle:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures_Tile")
		frame.UpMiddle:SetTexCoord(0, 1, 0.00195313, 0.05273438)
		frame.UpMiddle:SetPoint("TOPLEFT", frame.UpLeft, "TOPRIGHT")
		frame.UpMiddle:SetPoint("BOTTOMRIGHT", frame.UpRight, "BOTTOMLEFT")
	end

	if (frame.DownLeft == nil) then
		frame.DownLeft = frame:CreateTexture(nil, "ARTWORK")
		frame.DownLeft:SetSize(13, 26)
		frame.DownLeft:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
		frame.DownLeft:SetTexCoord(0.63476563, 0.68554688, 0.06738281, 0.09277344)
		frame.DownLeft:SetPoint("TOPLEFT")
		frame.DownLeft:Hide()
	end

	if (frame.DownRight == nil) then
		frame.DownRight = frame:CreateTexture(nil, "ARTWORK")
		frame.DownRight:SetSize(13, 26)
		frame.DownRight:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
		frame.DownRight:SetTexCoord(0.63476563, 0.68554688, 0.06738281, 0.09277344)
		frame.DownRight:SetPoint("TOPRIGHT")
		frame.DownRight:Hide()
	end

	if (frame.DownMiddle == nil) then
		frame.DownMiddle = frame:CreateTexture(nil, "ARTWORK")
		frame.DownMiddle:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures_Tile")
		frame.DownMiddle:SetTexCoord(0, 1, 0.05664063, 0.10742188)
		frame.DownMiddle:SetPoint("TOPLEFT", frame.DownLeft, "TOPRIGHT")
		frame.DownMiddle:SetPoint("BOTTOMRIGHT", frame.DownRight, "BOTTOMLEFT")
		frame.DownMiddle:Hide()
	end

	if (frame.HighLeft == nil) then
		frame.HighLeft = frame:CreateTexture(nil, "HIGHLIGHT")
		frame.HighLeft:SetSize(13, 26)
		frame.HighLeft:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
		frame.HighLeft:SetTexCoord(0.72656250, 0.77734375, 0.06738281, 0.09277344)
		frame.HighLeft:SetPoint("TOPLEFT")
	end

	if (frame.HighRight == nil) then
		frame.HighRight = frame:CreateTexture(nil, "HIGHLIGHT")
		frame.HighRight:SetSize(13, 26)
		frame.HighRight:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
		frame.HighRight:SetTexCoord(0.72656250, 0.77734375, 0.06738281, 0.09277344)
		frame.HighRight:SetPoint("TOPRIGHT")
	end

	if (frame.HighMiddle == nil) then
		frame.HighMiddle = frame:CreateTexture(nil, "HIGHLIGHT")
		frame.HighMiddle:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures_Tile")
		frame.HighMiddle:SetTexCoord(0, 1, 0.11132813, 0.16210938)
		frame.HighMiddle:SetPoint("TOPLEFT", frame.HighLeft, "TOPRIGHT")
		frame.HighMiddle:SetPoint("BOTTOMRIGHT", frame.HighRight, "BOTTOMLEFT")
	end

	frame.Text:ClearAllPoints()
	frame.Text:SetPoint("CENTER", 0, -1)
	frame.Text:SetFontObject(GameFontNormalSmall)
	frame.Text:SetTextColor(0.973, 0.902, 0.581)

	hooksecurefunc(frame, "OnButtonStateChanged", function(self)
		self.Text:SetTextColor(0.973, 0.902, 0.581)
	end)

	local l, t, _, b, r = frame.UpLeft:GetTexCoord()
	frame.UpLeft:SetTexCoord(l, l + (r-l)/2, t, b)
	l, t, _, b, r = frame.UpRight:GetTexCoord()
	frame.UpRight:SetTexCoord(l + (r-l)/2, r, t, b)

	l, t, _, b, r = frame.DownLeft:GetTexCoord();
	frame.DownLeft:SetTexCoord(l, l + (r-l)/2, t, b);
	l, t, _, b, r = frame.DownRight:GetTexCoord();
	frame.DownRight:SetTexCoord(l + (r-l)/2, r, t, b);

	l, t, _, b, r = frame.HighLeft:GetTexCoord();
	frame.HighLeft:SetTexCoord(l, l + (r-l)/2, t, b)
	l, t, _, b, r = frame.HighRight:GetTexCoord()
	frame.HighRight:SetTexCoord(l + (r-l)/2, r, t, b)

	frame:HookScript("OnMouseDown", function(self)
		self.UpLeft:Hide()
		self.UpRight:Hide()
		self.UpMiddle:Hide()

		self.DownLeft:Show()
		self.DownRight:Show()
		self.DownMiddle:Show()

		self.Text:SetPoint("CENTER", 3, -2)
	end)

	frame:HookScript("OnMouseUp", function(self)
		self.UpLeft:Show()
		self.UpRight:Show()
		self.UpMiddle:Show()

		self.DownLeft:Hide()
		self.DownRight:Hide()
		self.DownMiddle:Hide()

		self.Text:SetPoint("CENTER", 0, -1)
	end)
end

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

		EncounterJournalJourneysFrame.ScrollBar:SetSize(25, 560)
		EncounterJournalJourneysFrame.ScrollBar:SetPoint("LEFT", EncounterJournalJourneysFrame.JourneysList, "RIGHT", -30, 0)

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

		ApplyDropDown(EncounterJournalInstanceSelect.ExpansionDropdown)

		ApplyEJDropDown(EncounterJournalEncounterFrameInfo.LootContainer.filter)
		EncounterJournalEncounterFrameInfo.LootContainer.filter:SetWidth(101)
		EncounterJournalEncounterFrameInfo.LootContainer.filter:SetPoint("TOPLEFT", EncounterJournal, "TOPRIGHT", -361, -77)
		hooksecurefunc(EncounterJournalEncounterFrameInfo.LootContainer.filter, "UpdateText", function(self)
			self.Text:SetText(GEAR_FILTER)
		end)

		ApplyEJDropDown(EncounterJournalEncounterFrameInfo.LootContainer.slotFilter)
		EncounterJournalEncounterFrameInfo.LootContainer.slotFilter:SetWidth(101)
		EncounterJournalEncounterFrameInfo.LootContainer.slotFilter:SetPoint("LEFT", EncounterJournalEncounterFrameInfo.LootContainer.filter, "RIGHT", 9, 0)

		ApplyEJDropDown(EncounterJournalEncounterFrameInfoDifficulty)
		EncounterJournalEncounterFrameInfoDifficulty:SetWidth(101)
		EncounterJournalEncounterFrameInfoDifficulty:SetPoint("TOPRIGHT", -6, -13)
	end
end)