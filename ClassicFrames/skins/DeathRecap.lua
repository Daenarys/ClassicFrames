local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_DeathRecap" then
		DeathRecapFrame.CloseXButton:SetSize(32, 32)
		DeathRecapFrame.CloseXButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		DeathRecapFrame.CloseXButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		DeathRecapFrame.CloseXButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		DeathRecapFrame.CloseXButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
	end
end)