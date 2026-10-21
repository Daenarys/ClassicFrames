local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AchievementUI" then
		ACHIEVEMENTUI_MAX_SUMMARY_ACHIEVEMENTS = 4

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

		hooksecurefunc("AchievementFrame_SetComparisonMode", function()
			AchievementFrame.Header.RightDDLInset:Show()
			AchievementFrame.HeaderDetails.Filters.SearchBox:ClearAllPoints()
			AchievementFrame.HeaderDetails.Filters.SearchBox:SetPoint("TOPLEFT", AchievementFrame.Header.RightDDLInset, "TOPLEFT", 12, 2)
		end)
	end
end)