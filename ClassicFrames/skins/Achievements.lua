local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AchievementUI" then
		ApplyFilterDropDown(AchievementFrameFilterDropdown)

		hooksecurefunc('AchievementFrameSummary_UpdateAchievements', function()
			for i = 1, ACHIEVEMENTUI_MAX_SUMMARY_ACHIEVEMENTS do
				local button = _G["AchievementFrameSummaryAchievement"..i]
				if ( button ) then
					if ( button.accountWide ) then
						button.titleBar:SetAlpha(1)
					else
						button.titleBar:SetAlpha(0.5)
					end
				end
			end
		end)
	end
end)