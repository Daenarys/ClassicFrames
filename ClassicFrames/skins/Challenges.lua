local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ChallengesUI" then
		hooksecurefunc(ChallengesFrame.WeeklyInfo.Child.WeeklyChest, "Update", function(self)
			if C_WeeklyRewards.HasAvailableRewards() then
				self.Icon:SetAtlas("mythicplus-greatvault-collect")
				self.Highlight:SetAtlas("mythicplus-greatvault-collect")
			elseif self:HasUnlockedRewards(Enum.WeeklyRewardChestThresholdType.Activities) then
				self.Icon:SetAtlas("mythicplus-greatvault-complete")
				self.Highlight:SetAtlas("mythicplus-greatvault-complete")
			elseif C_MythicPlus.GetOwnedKeystoneLevel() or (dungeonScore and dungeonScore > 0) then
				self.Icon:SetAtlas("mythicplus-greatvault-incomplete")
				self.Highlight:SetAtlas("mythicplus-greatvault-incomplete")
			end
		end)
	end
end)