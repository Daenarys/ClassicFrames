local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AchievementUI" then
		ApplyCloseButton(AchievementFrameCloseButton, true)
		AchievementFrameCloseButton:ClearAllPoints()
		AchievementFrameCloseButton:SetPoint("TOPRIGHT", 3, 4)

		AchievementFrameCategories.ScrollBar:ClearAllPoints()
		AchievementFrameCategories.ScrollBar:SetPoint("TOPLEFT", AchievementFrameCategories.ScrollBox, "TOPRIGHT", 7, 5)
		AchievementFrameCategories.ScrollBar:SetPoint("BOTTOMLEFT", AchievementFrameCategories.ScrollBox, "BOTTOMRIGHT", 7, -6)

		ApplyScrollBarHybrid(AchievementFrameCategories.ScrollBar, true)
		ApplyScrollBarThumb(AchievementFrameCategories.ScrollBar.Track.Thumb)

		AchievementFrameAchievements.ScrollBar:ClearAllPoints()
		AchievementFrameAchievements.ScrollBar:SetPoint("TOPLEFT", AchievementFrameAchievements.ScrollBox, "TOPRIGHT", 7, 3)
		AchievementFrameAchievements.ScrollBar:SetPoint("BOTTOMLEFT", AchievementFrameAchievements.ScrollBox, "BOTTOMRIGHT", 7, -6)

		ApplyScrollBarHybrid(AchievementFrameAchievements.ScrollBar, true)
		ApplyScrollBarThumb(AchievementFrameAchievements.ScrollBar.Track.Thumb)

		AchievementFrameStats.ScrollBar:ClearAllPoints()
		AchievementFrameStats.ScrollBar:SetPoint("TOPLEFT", AchievementFrameStats.ScrollBox, "TOPRIGHT", 7, 3)
		AchievementFrameStats.ScrollBar:SetPoint("BOTTOMLEFT", AchievementFrameStats.ScrollBox, "BOTTOMRIGHT", 7, -6)

		ApplyScrollBarHybrid(AchievementFrameStats.ScrollBar, true)
		ApplyScrollBarThumb(AchievementFrameStats.ScrollBar.Track.Thumb)

		ApplyScrollBarHybrid(AchievementFrameComparison.AchievementContainer.ScrollBar, true)
		ApplyScrollBarThumb(AchievementFrameComparison.AchievementContainer.ScrollBar.Track.Thumb)

		ApplyScrollBarHybrid(AchievementFrameComparison.StatContainer.ScrollBar, true)
		ApplyScrollBarThumb(AchievementFrameComparison.StatContainer.ScrollBar.Track.Thumb)

		ApplyCloseButton(AchievementFrame.SearchResults.CloseButton, true)
		AchievementFrame.SearchResults.CloseButton:ClearAllPoints()
		AchievementFrame.SearchResults.CloseButton:SetPoint("TOPRIGHT", 4, 2)

		ApplyScrollBarHybrid(AchievementFrame.SearchResults.ScrollBar, true, true)
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