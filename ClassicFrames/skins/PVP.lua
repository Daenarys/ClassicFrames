local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_PVPUI" then
		HonorFrame.SpecificScrollBar:SetSize(25, 560)
		HonorFrame.SpecificScrollBar:ClearAllPoints()
		HonorFrame.SpecificScrollBar:SetPoint("TOPLEFT", HonorFrame.SpecificScrollBox, "TOPRIGHT", -2, 3)
		HonorFrame.SpecificScrollBar:SetPoint("BOTTOMLEFT", HonorFrame.SpecificScrollBox, "BOTTOMRIGHT", 1, -1)

		ApplyScrollBarArrow(HonorFrame.SpecificScrollBar)
		ApplyScrollBarTrack(HonorFrame.SpecificScrollBar.Track)
		ApplyScrollBarThumb(HonorFrame.SpecificScrollBar.Track.Thumb)

		for _, roleButton in pairs({
			_G.HonorFrame.DPSIcon,
			_G.HonorFrame.HealerIcon,
			_G.HonorFrame.TankIcon,
			_G.ConquestFrame.DPSIcon,
			_G.ConquestFrame.HealerIcon,
			_G.ConquestFrame.TankIcon,
		}) do
			local checkButton = roleButton.checkButton or roleButton.CheckButton

			checkButton:SetSize(24, 24)
			checkButton:SetScale(1)
			checkButton:ClearAllPoints()
			checkButton:SetPoint("BOTTOMLEFT", -5, -5)
			checkButton:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
			checkButton:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
			checkButton:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
			checkButton:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
			checkButton:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
		end

		HonorFrame.DPSIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorFrame.DPSIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"));
		HonorFrame.DPSIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorFrame.DPSIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))
		ConquestFrame.DPSIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		ConquestFrame.DPSIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"));
		ConquestFrame.DPSIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		ConquestFrame.DPSIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))

		HonorFrame.HealerIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorFrame.HealerIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("HEALER"));
		HonorFrame.HealerIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorFrame.HealerIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))
		ConquestFrame.HealerIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		ConquestFrame.HealerIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("HEALER"));
		ConquestFrame.HealerIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		ConquestFrame.HealerIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))

		HonorFrame.TankIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorFrame.TankIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("TANK"));
		HonorFrame.TankIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorFrame.TankIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("TANK"))
		ConquestFrame.TankIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		ConquestFrame.TankIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("TANK"));
		ConquestFrame.TankIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		ConquestFrame.TankIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("TANK"))
	end
end)

PVPReadyDialogCloseButton:SetSize(32, 32)
PVPReadyDialogCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
PVPReadyDialogCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-HideButton-Up")
PVPReadyDialogCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-HideButton-Down")
PVPReadyDialogCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
PVPReadyDialogCloseButton:ClearAllPoints()
PVPReadyDialogCloseButton:SetPoint("TOPRIGHT", -2, -2)

ApplyDialogBorder(PVPReadyDialog.Border)

PVPReadyDialogRoleIcon.texture:SetTexture("Interface\\LFGFrame\\UI-LFG-ICONS-ROLEBACKGROUNDS")

hooksecurefunc('PVPReadyDialog_Display', function(self, _, _, _, queueType, _, role)
	if role == 'DAMAGER' then
		_G.PVPReadyDialogRoleIcon.texture:SetTexCoord(GetTexCoordsForRole("DAMAGER"))
	elseif role == 'TANK' then
		_G.PVPReadyDialogRoleIcon.texture:SetTexCoord(GetTexCoordsForRole("TANK"))
	elseif role == 'HEALER' then
		_G.PVPReadyDialogRoleIcon.texture:SetTexCoord(GetTexCoordsForRole("HEALER"))
	end
end)