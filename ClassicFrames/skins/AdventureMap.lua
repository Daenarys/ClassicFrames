local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AdventureMap" then
		AdventureMapQuestChoiceDialog.CloseButton:SetSize(32, 32)
		AdventureMapQuestChoiceDialog.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		AdventureMapQuestChoiceDialog.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		AdventureMapQuestChoiceDialog.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		AdventureMapQuestChoiceDialog.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		AdventureMapQuestChoiceDialog.CloseButton:ClearAllPoints()
		AdventureMapQuestChoiceDialog.CloseButton:SetPoint("TOPRIGHT", 3, -9)

		AdventureMapQuestChoiceDialog.Background:SetTexture("Interface\\Addons\\ClassicFrames\\icons\\AdventureMap")
		AdventureMapQuestChoiceDialog.Background:SetTexCoord(0.000976562, 0.34375, 0.000976562, 0.428711)
	end
end)