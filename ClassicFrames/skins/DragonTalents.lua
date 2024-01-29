local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_GenericTraitUI" then
		GenericTraitFrame.CloseButton:SetSize(32, 32)
		GenericTraitFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		GenericTraitFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		GenericTraitFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		GenericTraitFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		GenericTraitFrame.CloseButton:ClearAllPoints()
		GenericTraitFrame.CloseButton:SetPoint("TOPRIGHT")
		UIPanelCloseButton_SetBorderAtlas(GenericTraitFrame.CloseButton, "UI-Frame-Oribos-ExitButtonBorder", -1, 1);
	end
end)