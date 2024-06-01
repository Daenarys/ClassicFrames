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

		local function ApplyTierTab(frame)
			frame:SetHitRectInsets(-12, -12, 0, 0)

			frame.MiddleActive:SetSize(64, 36)
			frame.MiddleActive:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures_Tile")
			frame.MiddleActive:SetTexCoord(0, 1, 0.59960938, 0.66992188)
			frame.MiddleActive:ClearAllPoints()
			frame.MiddleActive:SetPoint("TOPLEFT")
			frame.MiddleActive:SetPoint("BOTTOMRIGHT")
			frame.MiddleActive:SetDrawLayer("OVERLAY")

			frame.LeftActive:SetSize(12, 36)
			frame.LeftActive:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
			frame.LeftActive:SetTexCoord(0.84570313, 0.86914063, 0.02246094, 0.05761719)
			frame.LeftActive:ClearAllPoints()
			frame.LeftActive:SetPoint("TOPRIGHT", frame, "TOPLEFT")
			frame.LeftActive:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT")
			frame.LeftActive:SetDrawLayer("OVERLAY")

			frame.RightActive:SetSize(12, 36)
			frame.RightActive:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
			frame.RightActive:SetTexCoord(0.87304688, 0.89648438, 0.05957031, 0.09472656)
			frame.RightActive:ClearAllPoints()
			frame.RightActive:SetPoint("TOPLEFT", frame, "TOPRIGHT")
			frame.RightActive:SetPoint("BOTTOMLEFT", frame, "BOTTOMRIGHT")
			frame.RightActive:SetDrawLayer("OVERLAY")

			frame.Middle:SetSize(64, 36)
			frame.Middle:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures_Tile")
			frame.Middle:SetTexCoord(0, 1, 0.67382813, 0.74414063)
			frame.Middle:ClearAllPoints()
			frame.Middle:SetPoint("TOPLEFT")
			frame.Middle:SetPoint("BOTTOMRIGHT")

			frame.Left:SetSize(12, 36)
			frame.Left:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
			frame.Left:SetTexCoord(0.81835938, 0.84179688, 0.02246094, 0.05761719)
			frame.Left:ClearAllPoints()
			frame.Left:SetPoint("TOPRIGHT", frame, "TOPLEFT")
			frame.Left:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT")

			frame.Right:SetSize(12, 36)
			frame.Right:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
			frame.Right:SetTexCoord(0.84570313, 0.86914063, 0.05957031, 0.09472656)
			frame.Right:ClearAllPoints()
			frame.Right:SetPoint("TOPLEFT", frame, "TOPRIGHT")
			frame.Right:SetPoint("BOTTOMLEFT", frame, "BOTTOMRIGHT")

			frame.MiddleHighlight:SetSize(64, 36)
			frame.MiddleHighlight:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures_Tile")
			frame.MiddleHighlight:SetTexCoord(0, 1, 0.52539063, 0.59570313)
			frame.MiddleHighlight:ClearAllPoints()
			frame.MiddleHighlight:SetPoint("TOPLEFT")
			frame.MiddleHighlight:SetPoint("BOTTOMRIGHT")

			frame.LeftHighlight:SetSize(12, 36)
			frame.LeftHighlight:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
			frame.LeftHighlight:SetTexCoord(0.81835938, 0.84179688, 0.05957031, 0.09472656)
			frame.LeftHighlight:ClearAllPoints()
			frame.LeftHighlight:SetPoint("TOPRIGHT", frame, "TOPLEFT")
			frame.LeftHighlight:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT")

			frame.RightHighlight:SetSize(12, 36)
			frame.RightHighlight:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
			frame.RightHighlight:SetTexCoord(0.87304688, 0.89648438, 0.02246094, 0.05761719)
			frame.RightHighlight:ClearAllPoints()
			frame.RightHighlight:SetPoint("TOPLEFT", frame, "TOPRIGHT")
			frame.RightHighlight:SetPoint("BOTTOMLEFT", frame, "BOTTOMRIGHT")

			if (frame.SelectedGlow == nil) then
				frame.SelectedGlow = frame:CreateTexture(nil, "OVERLAY")
				frame.SelectedGlow:SetSize(64, 15)
				frame.SelectedGlow:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
				frame.SelectedGlow:SetTexCoord(0.52343750, 0.64843750, 0.00097656, 0.01562500)
				frame.SelectedGlow:SetPoint("BOTTOMLEFT", -18, 0)
				frame.SelectedGlow:SetPoint("BOTTOMRIGHT", 18, 0)
				frame.SelectedGlow:Hide()
			end

			frame:SetNormalFontObject("GameFontNormalMed1")
			frame:SetHighlightFontObject("GameFontNormalMed1")

			hooksecurefunc("PanelTemplates_SelectTab", function()
				frame.Left:Show()
				frame.Middle:Show()
				frame.Right:Show()
				frame.Text:ClearAllPoints()
				frame.Text:SetPoint("CENTER", 0, -3)
				frame.Text:SetFontObject("GameFontNormalMed1")
			end)

			hooksecurefunc("PanelTemplates_DeselectTab", function()
				frame.Text:ClearAllPoints()
				frame.Text:SetPoint("CENTER", 0, -3)
			end)

			hooksecurefunc("PanelTemplates_TabResize", function()
				frame.Text:SetWidth(0)
			end)
		end

		ApplyTierTab(EncounterJournal.MonthlyActivitiesTab)
		ApplyTierTab(EncounterJournal.suggestTab)
		ApplyTierTab(EncounterJournal.dungeonsTab)
		ApplyTierTab(EncounterJournal.raidsTab)

		EncounterJournal:HookScript("OnShow", function()
			if C_PlayerInfo.IsTradingPostAvailable() then
				EncounterJournal.MonthlyActivitiesTab:ClearAllPoints()
				EncounterJournal.MonthlyActivitiesTab:SetPoint("BOTTOMLEFT", EncounterJournalInstanceSelect, "TOPLEFT", 25, -45)
			end
			EncounterJournal.raidsTab:ClearAllPoints()
			EncounterJournal.raidsTab:SetPoint("BOTTOMLEFT", EncounterJournal.dungeonsTab, "BOTTOMRIGHT", 35, 0)
		end)

		EncounterJournalEncounterFrame:HookScript("OnShow", function()
			if C_PlayerInfo.IsTradingPostAvailable() then
				EncounterJournal.MonthlyActivitiesTab:Hide()
			end
			if not PlayerGetTimerunningSeasonID() then
				EncounterJournal.suggestTab:Hide()
			end
			EncounterJournal.dungeonsTab:Hide()
			EncounterJournal.raidsTab:Hide()
			EncounterJournal.LootJournalTab:Hide()
		end)

		EncounterJournalInstanceSelect:HookScript("OnShow", function()
			if C_PlayerInfo.IsTradingPostAvailable() then
				EncounterJournal.MonthlyActivitiesTab:Show()
			end
			if not PlayerGetTimerunningSeasonID() then
				EncounterJournal.suggestTab:Show()
			end
			EncounterJournal.dungeonsTab:Show()
			EncounterJournal.raidsTab:Show()
			EncounterJournal.LootJournalTab:Hide()
		end)

		hooksecurefunc("EncounterJournal_CheckAndDisplaySuggestedContentTab", function()
			EncounterJournal.dungeonsTab:ClearAllPoints()
			if PlayerGetTimerunningSeasonID() then
				EncounterJournal.dungeonsTab:SetPoint("BOTTOMLEFT", EncounterJournal.MonthlyActivitiesTab, "BOTTOMRIGHT", 35, 0)
			else
				EncounterJournal.dungeonsTab:SetPoint("BOTTOMLEFT", EncounterJournal.suggestTab, "BOTTOMRIGHT", 35, 0)
				if EncounterJournalEncounterFrame:IsShown() then
					EncounterJournal.suggestTab:Hide()
				end
			end
		end)

		hooksecurefunc("EncounterJournal_CheckAndDisplayTradingPostTab", function()
			EncounterJournal.suggestTab:ClearAllPoints()
			if C_PlayerInfo.IsTradingPostAvailable() then
				EncounterJournal.suggestTab:SetPoint("BOTTOMLEFT", EncounterJournal.MonthlyActivitiesTab, "BOTTOMRIGHT", 35, 0)
				if EncounterJournalEncounterFrame:IsShown() then
					EncounterJournal.MonthlyActivitiesTab:Hide()
				end
			else
				EncounterJournal.suggestTab:SetPoint("BOTTOMLEFT", EncounterJournalInstanceSelect, "TOPLEFT", 25, -45)
			end
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
			EncounterJournalSearchResults.ScrollBar.BG = EncounterJournalSearchResults.ScrollBar:CreateTexture(nil, "BACKGROUND");
			EncounterJournalSearchResults.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			EncounterJournalSearchResults.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(EncounterJournalSearchResults.ScrollBar)
		ApplyScrollBarTrack(EncounterJournalSearchResults.ScrollBar.Track)
		ApplyScrollBarThumb(EncounterJournalSearchResults.ScrollBar.Track.Thumb)

		EncounterJournalMonthlyActivitiesFrame.HeaderContainer.Title:Hide()
		EncounterJournalMonthlyActivitiesFrame.HeaderContainer.Month:Hide()

		EncounterJournalMonthlyActivitiesFrame.Bg:ClearAllPoints()
		EncounterJournalMonthlyActivitiesFrame.Bg:SetPoint("TOPLEFT", 0, -3)
		EncounterJournalMonthlyActivitiesFrame.Bg:SetPoint("BOTTOMRIGHT")
		
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
		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar:SetPoint("TOPLEFT", EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBox, "TOPRIGHT", 0, -3)
		EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBar:SetPoint("BOTTOMLEFT", EncounterJournalMonthlyActivitiesFrame.FilterList.ScrollBox, "BOTTOMRIGHT", 0, -1)

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

		EncounterJournalInstanceSelect.ScrollBox:ClearAllPoints()
		EncounterJournalInstanceSelect.ScrollBox:SetPoint("TOPLEFT", 17, -54)

		EncounterJournalInstanceSelect.ScrollBar:ClearAllPoints()
		EncounterJournalInstanceSelect.ScrollBar:SetPoint("TOPLEFT", EncounterJournalInstanceSelect.ScrollBox, "TOPRIGHT", 10, 2)
		EncounterJournalInstanceSelect.ScrollBar:SetPoint("BOTTOMLEFT", EncounterJournalInstanceSelect.ScrollBox, "BOTTOMRIGHT", 10, -5)

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

		hooksecurefunc("EJInstanceSelect_UpdateTitle", function()
			EncounterJournalInstanceSelect.Title:Hide()

			EncounterJournal.MonthlyActivitiesTab:SetWidth(119)
			EncounterJournal.suggestTab:SetWidth(149)
			EncounterJournal.dungeonsTab:SetWidth(88)
			EncounterJournal.raidsTab:SetWidth(70)
		end)

		hooksecurefunc("EJ_ContentTab_Select", function(id)
			local tierData
			if ( id == EncounterJournal.suggestTab:GetID() or id == EncounterJournal.MonthlyActivitiesTab:GetID()) then
				tierData = GetEJTierData(EJSuggestTab_GetPlayerTierIndex())
			else
				tierData = GetEJTierData(EJ_GetCurrentTier())
			end

			if ( id == EncounterJournal.MonthlyActivitiesTab:GetID() ) then
				EncounterJournal.MonthlyActivitiesTab:GetFontString():SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
				EncounterJournal.MonthlyActivitiesTab:SetHeight(36)
				EncounterJournal.MonthlyActivitiesTab.SelectedGlow:Show()
				EncounterJournal.MonthlyActivitiesTab.SelectedGlow:SetVertexColor(tierData.r, tierData.g, tierData.b)
				EncounterJournal.suggestTab:GetFontString():SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
				EncounterJournal.suggestTab:SetHeight(32)
				EncounterJournal.suggestTab.SelectedGlow:Hide()
				EncounterJournal.dungeonsTab:GetFontString():SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
				EncounterJournal.dungeonsTab:SetHeight(32)
				EncounterJournal.dungeonsTab.SelectedGlow:Hide()
				EncounterJournal.raidsTab:GetFontString():SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
				EncounterJournal.raidsTab:SetHeight(32)
				EncounterJournal.raidsTab.SelectedGlow:Hide()
			elseif ( id == EncounterJournal.suggestTab:GetID() ) then
				EncounterJournal.MonthlyActivitiesTab:GetFontString():SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
				EncounterJournal.MonthlyActivitiesTab:SetHeight(32)
				EncounterJournal.MonthlyActivitiesTab.SelectedGlow:Hide()
				EncounterJournal.suggestTab:GetFontString():SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
				EncounterJournal.suggestTab:SetHeight(36)
				EncounterJournal.suggestTab.SelectedGlow:Show()
				EncounterJournal.suggestTab.SelectedGlow:SetVertexColor(1, 0.8, 0)
				EncounterJournal.dungeonsTab:GetFontString():SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
				EncounterJournal.dungeonsTab:SetHeight(32)
				EncounterJournal.dungeonsTab.SelectedGlow:Hide()
				EncounterJournal.raidsTab:GetFontString():SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
				EncounterJournal.raidsTab:SetHeight(32)
				EncounterJournal.raidsTab.SelectedGlow:Hide()
			elseif ( id == EncounterJournal.dungeonsTab:GetID() ) then
				EncounterJournal.MonthlyActivitiesTab:GetFontString():SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
				EncounterJournal.MonthlyActivitiesTab:SetHeight(32)
				EncounterJournal.MonthlyActivitiesTab.SelectedGlow:Hide()
				EncounterJournal.suggestTab:GetFontString():SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
				EncounterJournal.suggestTab:SetHeight(32)
				EncounterJournal.suggestTab.SelectedGlow:Hide()
				EncounterJournal.dungeonsTab:GetFontString():SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
				EncounterJournal.dungeonsTab:SetHeight(36)
				EncounterJournal.dungeonsTab.SelectedGlow:Show()
				EncounterJournal.dungeonsTab.SelectedGlow:SetVertexColor(tierData.r, tierData.g, tierData.b)
				EncounterJournal.raidsTab:GetFontString():SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
				EncounterJournal.raidsTab:SetHeight(32)
				EncounterJournal.raidsTab.SelectedGlow:Hide()
			elseif ( id == EncounterJournal.raidsTab:GetID() ) then
				EncounterJournal.MonthlyActivitiesTab:GetFontString():SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
				EncounterJournal.MonthlyActivitiesTab:SetHeight(32)
				EncounterJournal.MonthlyActivitiesTab.SelectedGlow:Hide()
				EncounterJournal.suggestTab:GetFontString():SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
				EncounterJournal.suggestTab:SetHeight(32)
				EncounterJournal.suggestTab.SelectedGlow:Hide()
				EncounterJournal.dungeonsTab:GetFontString():SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
				EncounterJournal.dungeonsTab:SetHeight(32)
				EncounterJournal.dungeonsTab.SelectedGlow:Hide()
				EncounterJournal.raidsTab:GetFontString():SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
				EncounterJournal.raidsTab:SetHeight(36)
				EncounterJournal.raidsTab.SelectedGlow:Show()
				EncounterJournal.raidsTab.SelectedGlow:SetVertexColor(tierData.r, tierData.g, tierData.b)
			end
		end)

		hooksecurefunc("EncounterJournal_TierDropDown_Select", function(_, tier)
			local tierData = GetEJTierData(tier)
			EncounterJournal.raidsTab.SelectedGlow:SetVertexColor(tierData.r, tierData.g, tierData.b)
			EncounterJournal.dungeonsTab.SelectedGlow:SetVertexColor(tierData.r, tierData.g, tierData.b)
		end)
	end
end)