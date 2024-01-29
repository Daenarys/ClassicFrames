local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_MajorFactions" then
		MajorFactionRenownFrame.CloseButton:SetSize(32, 32)
		MajorFactionRenownFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		MajorFactionRenownFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		MajorFactionRenownFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		MajorFactionRenownFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		MajorFactionRenownFrame.CloseButton:ClearAllPoints()
		MajorFactionRenownFrame.CloseButton:SetPoint("TOPRIGHT", 1, 1)
		UIPanelCloseButton_SetBorderAtlas(MajorFactionRenownFrame.CloseButton, "UI-Frame-Oribos-ExitButtonBorder", -1, 1, textureKit);
	end
end)