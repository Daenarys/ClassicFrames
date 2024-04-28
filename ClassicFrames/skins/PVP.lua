if not _G.PVPFrame then return end

PVPFrame.DPSIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
PVPFrame.DPSIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))
PVPFrame.DPSIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
PVPFrame.DPSIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))

PVPFrame.HealerIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
PVPFrame.HealerIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))
PVPFrame.HealerIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
PVPFrame.HealerIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))

PVPFrame.TankIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
PVPFrame.TankIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("TANK"))
PVPFrame.TankIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
PVPFrame.TankIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("TANK"))

hooksecurefunc("PVP_UpdateAvailableRoleButton", function(button, canBeRole)
	if not (canBeRole) then
		SetDesaturation(button:GetDisabledTexture(), true)
		if not button.cover then
			button.cover = button:CreateTexture(nil, "OVERLAY")
			button.cover:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
			button.cover:SetTexCoord(0, 0.2617, 0.5234, 0.7851)
			button.cover:SetAllPoints()
			button.cover:SetAlpha(0.7)
		end
	end
end)

hooksecurefunc('PVP_DisableRoleButton', function(button)
	if not button.cover then
		button.cover = button:CreateTexture(nil, "OVERLAY")
		button.cover:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		button.cover:SetTexCoord(0, 0.2617, 0.5234, 0.7851)
		button.cover:SetAllPoints()
		button.cover:SetAlpha(0.5)
		button.cover:Show()
	else
		button.cover:Show()
	end
end)

hooksecurefunc('PVP_EnableRoleButton', function(button)
	SetDesaturation(button:GetNormalTexture(), false)
	if button.cover then
		button.cover:Hide()
	end
end)

for _, roleButton in pairs({
	_G.PVPFrame.DPSIcon,
	_G.PVPFrame.HealerIcon,
	_G.PVPFrame.TankIcon,
}) do
	local checkButton = roleButton.checkButton or roleButton.CheckButton

	checkButton:SetScale(1)
	checkButton:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
	checkButton:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
	checkButton:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
	checkButton:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
	checkButton:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
end

_G.PVPFrame:HookScript("OnShow", function(self)
	self:ClearAllPoints()
	self:SetPoint("TOPLEFT", 16, -116)
end)