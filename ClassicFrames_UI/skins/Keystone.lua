local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ChallengesUI" then
		ChallengesKeystoneFrame.CloseButton:SetSize(32, 32)
		ChallengesKeystoneFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		ChallengesKeystoneFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		ChallengesKeystoneFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		ChallengesKeystoneFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		ChallengesKeystoneFrame.CloseButton:ClearAllPoints()
		ChallengesKeystoneFrame.CloseButton:SetPoint("TOPRIGHT", -4, -4)
	end
end)