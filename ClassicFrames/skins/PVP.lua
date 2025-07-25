local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_PVPUI" then
		PVPQueueFrame:HookScript("OnShow", function()
			if (UnitFactionGroup("player") == PLAYER_FACTION_GROUP[0]) then
				SetPortraitToTexture(PVEFramePortrait, "Interface\\Icons\\INV_BannerPVP_01")
			else
				SetPortraitToTexture(PVEFramePortrait, "Interface\\Icons\\INV_BannerPVP_02")
			end
		end)

		for _, roleButton in pairs({
			_G.HonorQueueFrame.RoleInset.DPSIcon,
			_G.HonorQueueFrame.RoleInset.HealerIcon,
			_G.HonorQueueFrame.RoleInset.TankIcon
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

		HonorQueueFrame.RoleInset.DPSIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorQueueFrame.RoleInset.DPSIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))
		HonorQueueFrame.RoleInset.DPSIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorQueueFrame.RoleInset.DPSIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))

		HonorQueueFrame.RoleInset.HealerIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorQueueFrame.RoleInset.HealerIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))
		HonorQueueFrame.RoleInset.HealerIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorQueueFrame.RoleInset.HealerIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))

		HonorQueueFrame.RoleInset.TankIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorQueueFrame.RoleInset.TankIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("TANK"))
		HonorQueueFrame.RoleInset.TankIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorQueueFrame.RoleInset.TankIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("TANK"))
	end
end)