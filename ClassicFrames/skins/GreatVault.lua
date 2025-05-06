local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_WeeklyRewards" then
		WeeklyRewardsFrame:HookScript("OnShow", function(self)
			self:ClearAllPoints()
			self:SetPoint("CENTER", 0, 39)
		end)
	end
end)