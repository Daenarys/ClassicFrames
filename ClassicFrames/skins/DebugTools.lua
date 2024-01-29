local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_DebugTools" then
		TableAttributeDisplay.CloseButton:SetSize(32, 32)
		TableAttributeDisplay.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		TableAttributeDisplay.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		TableAttributeDisplay.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		TableAttributeDisplay.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		TableAttributeDisplay.CloseButton:ClearAllPoints()
		TableAttributeDisplay.CloseButton:SetPoint("TOPRIGHT", 2, 1)
	end
end)