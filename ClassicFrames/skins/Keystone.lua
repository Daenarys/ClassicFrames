local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ChallengesUI" then
		ApplyCloseButton(ChallengesKeystoneFrame.CloseButton, true)
		ChallengesKeystoneFrame.CloseButton:ClearAllPoints()
		ChallengesKeystoneFrame.CloseButton:SetPoint("TOPRIGHT", -4, -4)
	end
end)