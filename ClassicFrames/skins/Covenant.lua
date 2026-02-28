local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_CovenantPreviewUI" then
		if _G.CovenantPreviewFrame then
			CovenantPreviewFrame.CloseButton:SetSize(32, 32)
			CovenantPreviewFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			CovenantPreviewFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			CovenantPreviewFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			CovenantPreviewFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		end
	elseif name == "Blizzard_CovenantRenown" then
		if _G.CovenantRenownFrame then
			CovenantRenownFrame.CloseButton:SetSize(32, 32)
			CovenantRenownFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			CovenantRenownFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			CovenantRenownFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			CovenantRenownFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		end
	elseif name == "Blizzard_CovenantSanctum" then
		if _G.CovenantSanctumFrame then
			CovenantSanctumFrame.CloseButton:SetSize(32, 32)
			CovenantSanctumFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			CovenantSanctumFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			CovenantSanctumFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			CovenantSanctumFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		end
	elseif name == "Blizzard_Soulbinds" then
		if _G.SoulbindViewer then
			SoulbindViewer.CloseButton:SetSize(32, 32)
			SoulbindViewer.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			SoulbindViewer.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			SoulbindViewer.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			SoulbindViewer.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		end
	end
end)