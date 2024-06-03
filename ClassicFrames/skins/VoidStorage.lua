local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_VoidStorageUI" then
		VoidStorageBorderFrame.CloseButton:SetSize(32, 32)
		VoidStorageBorderFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		VoidStorageBorderFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		VoidStorageBorderFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		VoidStorageBorderFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		VoidStorageBorderFrame.CloseButton:ClearAllPoints()
		VoidStorageBorderFrame.CloseButton:SetPoint("TOPRIGHT", 4, 5)

		ApplySearchBox(VoidItemSearchBox)
	end
end)