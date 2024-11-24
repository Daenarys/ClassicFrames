if not _G.PartyFrame then return end

for frame in PartyFrame.PartyMemberFramePool:EnumerateActive() do
	frame.Texture:SetSize(128, 64)
	frame.Texture:SetTexture("Interface\\TargetingFrame\\UI-PartyFrame")
	frame.Texture:ClearAllPoints()
	frame.Texture:SetPoint("TOPLEFT", 0, -10)
	frame.Texture:SetDrawLayer("ARTWORK", 7)
	frame.VehicleTexture:SetSize(128, 64)
	frame.VehicleTexture:SetTexture("Interface\\Vehicles\\UI-Vehicles-PartyFrame")
	frame.VehicleTexture:ClearAllPoints()
	frame.VehicleTexture:SetPoint("TOPLEFT", -8, -2)
	frame.VehicleTexture:SetDrawLayer("ARTWORK", 7)
	frame.Portrait:ClearAllPoints()
	frame.Portrait:SetPoint("TOPLEFT", 7, -14)
	frame.NotPresentIcon:ClearAllPoints()
	frame.NotPresentIcon:SetPoint("LEFT", frame, "RIGHT", 1, -3)
	frame.PartyMemberOverlay.LeaderIcon:SetSize(16, 16)
	frame.PartyMemberOverlay.LeaderIcon:SetTexture("Interface\\GroupFrame\\UI-Group-LeaderIcon")
	frame.PartyMemberOverlay.LeaderIcon:ClearAllPoints()
	frame.PartyMemberOverlay.LeaderIcon:SetPoint("TOPLEFT", 0, -8)
	frame.PartyMemberOverlay.GuideIcon:SetSize(19, 19)
	frame.PartyMemberOverlay.GuideIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES")
	frame.PartyMemberOverlay.GuideIcon:SetTexCoord(0, 0.296875, 0.015625, 0.3125)
	frame.PartyMemberOverlay.GuideIcon:ClearAllPoints()
	frame.PartyMemberOverlay.GuideIcon:SetPoint("TOPLEFT", 0, -8)
	frame.PartyMemberOverlay.PVPIcon:ClearAllPoints()
	frame.PartyMemberOverlay.PVPIcon:SetPoint("TOPLEFT", -9, -23)
	frame.PartyMemberOverlay.RoleIcon:SetSize(19, 19)
	frame.PartyMemberOverlay.RoleIcon:ClearAllPoints()
	frame.PartyMemberOverlay.RoleIcon:SetPoint("TOPLEFT", 7, -41)
	frame.PartyMemberOverlay.Disconnect:ClearAllPoints()
	frame.PartyMemberOverlay.Disconnect:SetPoint("LEFT", -7, -10)
	frame.HealthBarContainer:SetFrameLevel(2)
	frame.HealthBarContainer.HealthBar.OverAbsorbGlow:SetDrawLayer("ARTWORK", 7)
	frame.HealthBarContainer.HealthBar.OverAbsorbGlow:SetParent(frame)
	frame.HealthBarContainer.LeftText:SetParent(frame)
	frame.HealthBarContainer.RightText:SetParent(frame)
	frame.HealthBarContainer.CenterText:SetParent(frame)
	frame.ManaBar:SetFrameLevel(2)
	frame.ManaBar.LeftText:SetParent(frame)
	frame.ManaBar.RightText:SetParent(frame)
	frame.ManaBar.CenterText:SetParent(frame)

	if (frame.Background == nil) then
		frame.Background = frame:CreateTexture(nil, "BACKGROUND", nil, -7)
		frame.Background:SetSize(72, 20)
		frame.Background:SetPoint("TOPLEFT", 45, -19)
		frame.Background:SetColorTexture(0, 0, 0, 0.5)
	end

	hooksecurefunc(frame, "ToPlayerArt", function(self)
		self.Texture:SetTexture("Interface\\TargetingFrame\\UI-PartyFrame")

		self.Flash:SetSize(128, 64)
		self.Flash:SetTexture("Interface\\TargetingFrame\\UI-PartyFrame-Flash")
		self.Flash:SetPoint("TOPLEFT", -3, -6)
		self.Flash:SetDrawLayer("BACKGROUND", 0)

		self.PartyMemberOverlay.Status:SetSize(36, 36)
		self.PartyMemberOverlay.Status:SetTexture("Interface\\Buttons\\UI-Debuff-Overlays")
		self.PartyMemberOverlay.Status:SetTexCoord(0, 0.2734375, 0, 0.5625)
		self.PartyMemberOverlay.Status:ClearAllPoints()
		self.PartyMemberOverlay.Status:SetPoint("CENTER", self.Portrait, 0, 0)
		self.PartyMemberOverlay.Status:SetDrawLayer("ARTWORK", 0)

		self.HealthBarContainer.HealthBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")

		if not UnitIsConnected(self:GetUnit()) then
			self.HealthBarContainer.HealthBar:SetStatusBarColor(0.5, 0.5, 0.5)
			self.ManaBar:SetStatusBarColor(0.5, 0.5, 0.5)
		else
			self.HealthBarContainer.HealthBar:SetStatusBarColor(0, 1, 0)
		end
	end)

	hooksecurefunc(frame, "UpdateNameTextAnchors", function(self)
		self.Name:SetWidth(0)
		self.Name:SetPoint("TOPLEFT", 49, -7)
	end)

	hooksecurefunc(frame, "UpdateAssignedRoles", function(self)
		local icon = self.PartyMemberOverlay.RoleIcon
		local role = UnitGroupRolesAssignedEnum(self:GetUnit())

		icon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES")

		if role == Enum.LFGRole.Tank then
			icon:SetTexCoord(GetTexCoordsForRoleSmallCircle("TANK"))
			icon:Show()
		elseif role == Enum.LFGRole.Healer then
			icon:SetTexCoord(GetTexCoordsForRoleSmallCircle("HEALER"))
			icon:Show()
		elseif role == Enum.LFGRole.Damage then
			icon:SetTexCoord(GetTexCoordsForRoleSmallCircle("DAMAGER"))
			icon:Show()
		else
			icon:Hide()
		end
	end)

	hooksecurefunc(frame, "UpdateNotPresentIcon", function(self)
		if UnitInOtherParty(self:GetUnit()) then
			self.NotPresentIcon.texture:SetTexture("Interface\\LFGFrame\\LFG-Eye")
			self.NotPresentIcon.texture:SetTexCoord(0.125, 0.25, 0.25, 0.5)
		end
	end)
end

hooksecurefunc("CompactUnitFrame_UpdateCenterStatusIcon", function(frame)
	if ( frame.centerStatusIcon ) then
		if ( frame.optionTable.displayInOtherGroup and UnitInOtherParty(frame.unit) ) then
			frame.centerStatusIcon.texture:SetTexture("Interface\\LFGFrame\\LFG-Eye")
			frame.centerStatusIcon.texture:SetTexCoord(0.125, 0.25, 0.25, 0.5)
		end
	end
end)