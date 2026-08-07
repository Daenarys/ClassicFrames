local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AchievementUI" then
		ACHIEVEMENTUI_MAX_SUMMARY_ACHIEVEMENTS = 4

		ApplyCloseButton(AchievementFrameCloseButton, true)
		AchievementFrameCloseButton:ClearAllPoints()
		AchievementFrameCloseButton:SetPoint("TOPRIGHT", 3, 4)

		AchievementFrame.Header.RightDDLInset:Show()

		AchievementFrame.HeaderDetails:Hide()
		AchievementFrame.HeaderDetails.Filters.SearchBox:SetParent(AchievementFrame)
		AchievementFrame.HeaderDetails.Filters.SearchBox:ClearAllPoints()
		AchievementFrame.HeaderDetails.Filters.SearchBox:SetPoint("TOPLEFT", AchievementFrame.Header.RightDDLInset, "TOPLEFT", 12, 2)

		AchievementFrameAchievements:ClearAllPoints()
		AchievementFrameAchievements:SetPoint("TOPLEFT", AchievementFrameCategories, "TOPRIGHT", 22, 0)
		AchievementFrameAchievements:SetPoint("BOTTOM", AchievementFrameCategories, "BOTTOM")

		AchievementFrameStats:ClearAllPoints()
		AchievementFrameStats:SetPoint("TOPLEFT", AchievementFrameCategories, "TOPRIGHT", 22, 0)
		AchievementFrameStats:SetPoint("BOTTOM", AchievementFrameCategories, "BOTTOM")

		AchievementFrameSummary:ClearAllPoints()
		AchievementFrameSummary:SetPoint("TOPLEFT", AchievementFrameCategories, "TOPRIGHT", 22, 1)
		AchievementFrameSummary:SetPoint("BOTTOM", AchievementFrameCategories, "BOTTOM")

		AchievementFrameSummaryCategories:ClearAllPoints()
		AchievementFrameSummaryCategories:SetPoint("TOPLEFT", AchievementFrameSummaryAchievements, "BOTTOMLEFT", 0, 6)
		AchievementFrameSummaryCategories:SetPoint("TOPRIGHT", AchievementFrameSummaryAchievements, "BOTTOMRIGHT", 0, 6)

		AchievementFrameCategories.ScrollBar:ClearAllPoints()
		AchievementFrameCategories.ScrollBar:SetPoint("TOPLEFT", AchievementFrameCategories.ScrollBox, "TOPRIGHT", 7, 0)
		AchievementFrameCategories.ScrollBar:SetPoint("BOTTOMLEFT", AchievementFrameCategories.ScrollBox, "BOTTOMRIGHT", 7, -3)

		ApplyScrollBarHybrid(AchievementFrameCategories.ScrollBar, true)
		ApplyScrollBarThumb(AchievementFrameCategories.ScrollBar.Track.Thumb)

		AchievementFrameAchievements.ScrollBar:ClearAllPoints()
		AchievementFrameAchievements.ScrollBar:SetPoint("TOPLEFT", AchievementFrameAchievements.ScrollBox, "TOPRIGHT", 7, -2)
		AchievementFrameAchievements.ScrollBar:SetPoint("BOTTOMLEFT", AchievementFrameAchievements.ScrollBox, "BOTTOMRIGHT", 7, -3)

		ApplyScrollBarHybrid(AchievementFrameAchievements.ScrollBar, true)
		ApplyScrollBarThumb(AchievementFrameAchievements.ScrollBar.Track.Thumb)

		AchievementFrameStats.ScrollBar:ClearAllPoints()
		AchievementFrameStats.ScrollBar:SetPoint("TOPLEFT", AchievementFrameStats.ScrollBox, "TOPRIGHT", 7, -2)
		AchievementFrameStats.ScrollBar:SetPoint("BOTTOMLEFT", AchievementFrameStats.ScrollBox, "BOTTOMRIGHT", 7, -3)

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
	end
end)