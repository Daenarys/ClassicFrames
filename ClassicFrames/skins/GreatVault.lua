local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_WeeklyRewards" then
		ApplyCloseButton(WeeklyRewardsFrame.CloseButton, true)
		WeeklyRewardsFrame.CloseButton:ClearAllPoints()
		WeeklyRewardsFrame.CloseButton:SetPoint("TOPRIGHT", -5, -4)
	end
end)