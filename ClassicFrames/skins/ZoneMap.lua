local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_BattlefieldMap" then
		ApplyCloseButton(BattlefieldMapFrame.BorderFrame.CloseButton)
		BattlefieldMapFrame.BorderFrame.CloseButton:ClearAllPoints()
		BattlefieldMapFrame.BorderFrame.CloseButton:SetPoint("TOPRIGHT", 5, 9)
		BattlefieldMapFrame.BorderFrame.CloseButton:SetFrameLevel(3)

		if (BattlefieldMapFrame.BorderFrame.CloseButtonBorder == nil) then
			BattlefieldMapFrame.BorderFrame.CloseButtonBorder = BattlefieldMapFrame.BorderFrame:CreateTexture(nil, "BORDER")
			BattlefieldMapFrame.BorderFrame.CloseButtonBorder:SetSize(32, 32)
			BattlefieldMapFrame.BorderFrame.CloseButtonBorder:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Corner")
			BattlefieldMapFrame.BorderFrame.CloseButtonBorder:SetPoint("TOPRIGHT", 1, 5)
		end
	end
end)