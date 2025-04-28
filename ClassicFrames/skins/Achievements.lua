local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AchievementUI" then
		AchievementFrameCloseButton:SetSize(32, 32)
		AchievementFrameCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		AchievementFrameCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		AchievementFrameCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		AchievementFrameCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		AchievementFrameCloseButton:ClearAllPoints()
		AchievementFrameCloseButton:SetPoint("TOPRIGHT", 3, 4)

		AchievementFrameCategories.ScrollBar:SetSize(25, 560)
		AchievementFrameCategories.ScrollBar:ClearAllPoints()
		AchievementFrameCategories.ScrollBar:SetPoint("TOPLEFT", AchievementFrameCategories.ScrollBox, "TOPRIGHT", -1, 3)
		AchievementFrameCategories.ScrollBar:SetPoint("BOTTOMLEFT", AchievementFrameCategories.ScrollBox, "BOTTOMRIGHT", 1, -5)

		if (AchievementFrameCategories.ScrollBar.BG == nil) then
			AchievementFrameCategories.ScrollBar.BG = AchievementFrameCategories.ScrollBar:CreateTexture(nil, "BACKGROUND")
			AchievementFrameCategories.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			AchievementFrameCategories.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(AchievementFrameCategories.ScrollBar)
		ApplyScrollBarTrack(AchievementFrameCategories.ScrollBar.Track)
		ApplyScrollBarThumb(AchievementFrameCategories.ScrollBar.Track.Thumb)

		AchievementFrameAchievements.ScrollBar:SetSize(25, 560)
		AchievementFrameAchievements.ScrollBar:ClearAllPoints()
		AchievementFrameAchievements.ScrollBar:SetPoint("TOPLEFT", AchievementFrameAchievements.ScrollBox, "TOPRIGHT", -1, 3)
		AchievementFrameAchievements.ScrollBar:SetPoint("BOTTOMLEFT", AchievementFrameAchievements.ScrollBox, "BOTTOMRIGHT", 1, -5)

		if (AchievementFrameAchievements.ScrollBar.BG == nil) then
			AchievementFrameAchievements.ScrollBar.BG = AchievementFrameAchievements.ScrollBar:CreateTexture(nil, "BACKGROUND")
			AchievementFrameAchievements.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			AchievementFrameAchievements.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(AchievementFrameAchievements.ScrollBar)
		ApplyScrollBarTrack(AchievementFrameAchievements.ScrollBar.Track)
		ApplyScrollBarThumb(AchievementFrameAchievements.ScrollBar.Track.Thumb)

		AchievementFrameStats.ScrollBar:SetSize(25, 560)
		AchievementFrameStats.ScrollBar:ClearAllPoints()
		AchievementFrameStats.ScrollBar:SetPoint("TOPLEFT", AchievementFrameStats.ScrollBox, "TOPRIGHT", -1, 3)
		AchievementFrameStats.ScrollBar:SetPoint("BOTTOMLEFT", AchievementFrameStats.ScrollBox, "BOTTOMRIGHT", 1, -5)

		if (AchievementFrameStats.ScrollBar.BG == nil) then
			AchievementFrameStats.ScrollBar.BG = AchievementFrameStats.ScrollBar:CreateTexture(nil, "BACKGROUND")
			AchievementFrameStats.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			AchievementFrameStats.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(AchievementFrameStats.ScrollBar)
		ApplyScrollBarTrack(AchievementFrameStats.ScrollBar.Track)
		ApplyScrollBarThumb(AchievementFrameStats.ScrollBar.Track.Thumb)

		AchievementFrameComparison.AchievementContainer.ScrollBar:SetSize(25, 560)
		AchievementFrameComparison.AchievementContainer.ScrollBar:ClearAllPoints()
		AchievementFrameComparison.AchievementContainer.ScrollBar:SetPoint("TOPLEFT", AchievementFrameComparison.Summary, "TOPRIGHT", 0, -4)
		AchievementFrameComparison.AchievementContainer.ScrollBar:SetPoint("BOTTOMLEFT", AchievementFrameComparison.AchievementContainer, "BOTTOMRIGHT", 0, 4)

		if (AchievementFrameComparison.AchievementContainer.ScrollBar.BG == nil) then
			AchievementFrameComparison.AchievementContainer.ScrollBar.BG = AchievementFrameComparison.AchievementContainer.ScrollBar:CreateTexture(nil, "BACKGROUND")
			AchievementFrameComparison.AchievementContainer.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			AchievementFrameComparison.AchievementContainer.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(AchievementFrameComparison.AchievementContainer.ScrollBar)
		ApplyScrollBarTrack(AchievementFrameComparison.AchievementContainer.ScrollBar.Track)
		ApplyScrollBarThumb(AchievementFrameComparison.AchievementContainer.ScrollBar.Track.Thumb)

		AchievementFrameComparison.StatContainer.ScrollBar:SetSize(25, 560)
		AchievementFrameComparison.StatContainer.ScrollBar:ClearAllPoints()
		AchievementFrameComparison.StatContainer.ScrollBar:SetPoint("TOPLEFT", AchievementFrameComparison.Summary, "TOPRIGHT", 2, -4)
		AchievementFrameComparison.StatContainer.ScrollBar:SetPoint("BOTTOMLEFT", AchievementFrameComparison.StatContainer, "BOTTOMRIGHT", -2, 4)

		if (AchievementFrameComparison.StatContainer.ScrollBar.BG == nil) then
			AchievementFrameComparison.StatContainer.ScrollBar.BG = AchievementFrameComparison.StatContainer.ScrollBar:CreateTexture(nil, "BACKGROUND")
			AchievementFrameComparison.StatContainer.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			AchievementFrameComparison.StatContainer.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(AchievementFrameComparison.StatContainer.ScrollBar)
		ApplyScrollBarTrack(AchievementFrameComparison.StatContainer.ScrollBar.Track)
		ApplyScrollBarThumb(AchievementFrameComparison.StatContainer.ScrollBar.Track.Thumb)

		AchievementFrame.SearchResults.CloseButton:SetSize(32, 32)
		AchievementFrame.SearchResults.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		AchievementFrame.SearchResults.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		AchievementFrame.SearchResults.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		AchievementFrame.SearchResults.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		AchievementFrame.SearchResults.CloseButton:ClearAllPoints()
		AchievementFrame.SearchResults.CloseButton:SetPoint("TOPRIGHT", 4, 2)

		AchievementFrame.SearchResults.ScrollBar:SetSize(25, 560)
		AchievementFrame.SearchResults.ScrollBar:ClearAllPoints()
		AchievementFrame.SearchResults.ScrollBar:SetPoint("TOPLEFT", AchievementFrame.SearchResults.ScrollBox, "TOPRIGHT", -5, 2)
		AchievementFrame.SearchResults.ScrollBar:SetPoint("BOTTOMLEFT", AchievementFrame.SearchResults.ScrollBox, "BOTTOMRIGHT", 5, -1)

		if (AchievementFrame.SearchResults.ScrollBar.BG == nil) then
			AchievementFrame.SearchResults.ScrollBar.BG = AchievementFrame.SearchResults.ScrollBar:CreateTexture(nil, "BACKGROUND")
			AchievementFrame.SearchResults.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			AchievementFrame.SearchResults.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(AchievementFrame.SearchResults.ScrollBar)
		ApplyScrollBarTrack(AchievementFrame.SearchResults.ScrollBar.Track)
		ApplyScrollBarThumb(AchievementFrame.SearchResults.ScrollBar.Track.Thumb)

		ApplySearchBox(AchievementFrame.SearchBox)
		ApplyFilterDropDown(AchievementFrameFilterDropdown)

		hooksecurefunc('AchievementFrameSummary_Refresh', function()
			for i = 1, ACHIEVEMENTUI_MAX_SUMMARY_ACHIEVEMENTS do
				local button = _G["AchievementFrameSummaryAchievement"..i];
				if ( button ) then
					if ( button.accountWide ) then
						button.TitleBar:SetAlpha(1)
					else
						button.TitleBar:SetAlpha(0.5)
					end
				end
			end
		end)
	end
end)