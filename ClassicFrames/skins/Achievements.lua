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

		AchievementFrameCategories.ScrollBar:ClearAllPoints()
		AchievementFrameCategories.ScrollBar:SetPoint("TOPLEFT", AchievementFrameCategories.ScrollBox, "TOPRIGHT", 7, 0)
		AchievementFrameCategories.ScrollBar:SetPoint("BOTTOMLEFT", AchievementFrameCategories.ScrollBox, "BOTTOMRIGHT", 7, -2)

		ApplyScrollBarHybrid(AchievementFrameCategories.ScrollBar)
		ApplyScrollBarThumb(AchievementFrameCategories.ScrollBar.Track.Thumb)

		AchievementFrameAchievements.ScrollBar:ClearAllPoints()
		AchievementFrameAchievements.ScrollBar:SetPoint("TOPLEFT", AchievementFrameAchievements.ScrollBox, "TOPRIGHT", 7, -2)
		AchievementFrameAchievements.ScrollBar:SetPoint("BOTTOMLEFT", AchievementFrameAchievements.ScrollBox, "BOTTOMRIGHT", 7, -2)

		ApplyScrollBarHybrid(AchievementFrameAchievements.ScrollBar)
		ApplyScrollBarThumb(AchievementFrameAchievements.ScrollBar.Track.Thumb)

		AchievementFrameStats.ScrollBar:ClearAllPoints()
		AchievementFrameStats.ScrollBar:SetPoint("TOPLEFT", AchievementFrameStats.ScrollBox, "TOPRIGHT", 7, -2)
		AchievementFrameStats.ScrollBar:SetPoint("BOTTOMLEFT", AchievementFrameStats.ScrollBox, "BOTTOMRIGHT", 7, -2)

		ApplyScrollBarHybrid(AchievementFrameStats.ScrollBar)
		ApplyScrollBarThumb(AchievementFrameStats.ScrollBar.Track.Thumb)

		ApplyScrollBarHybrid(AchievementFrameComparison.AchievementContainer.ScrollBar)
		ApplyScrollBarThumb(AchievementFrameComparison.AchievementContainer.ScrollBar.Track.Thumb)

		ApplyScrollBarHybrid(AchievementFrameComparison.StatContainer.ScrollBar)
		ApplyScrollBarThumb(AchievementFrameComparison.StatContainer.ScrollBar.Track.Thumb)

		AchievementFrame.SearchResults.CloseButton:SetSize(32, 32)
		AchievementFrame.SearchResults.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		AchievementFrame.SearchResults.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		AchievementFrame.SearchResults.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		AchievementFrame.SearchResults.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		AchievementFrame.SearchResults.CloseButton:ClearAllPoints()
		AchievementFrame.SearchResults.CloseButton:SetPoint("TOPRIGHT", 4, 2)

		ApplyScrollBarHybrid(AchievementFrame.SearchResults.ScrollBar, true)
		ApplyScrollBarThumb(AchievementFrame.SearchResults.ScrollBar.Track.Thumb)

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