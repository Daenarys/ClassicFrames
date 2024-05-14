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
	frame.PartyMemberOverlay.PVPIcon:SetPoint("TOPLEFT", -9, -23)
	frame.PartyMemberOverlay.Disconnect:SetPoint("LEFT", -7, -9)
	frame.Portrait:ClearAllPoints()
	frame.Portrait:SetPoint("TOPLEFT", 7, -14)
	frame.HealthBar:SetFrameLevel(2)
	frame.HealthBar.OverAbsorbGlow:SetDrawLayer("ARTWORK", 7)
	frame.HealthBar.OverAbsorbGlow:SetParent(frame)
	frame.HealthBar.LeftText:SetParent(frame)
	frame.HealthBar.RightText:SetParent(frame)
	frame.HealthBar.CenterText:SetParent(frame)
	frame.ManaBar:SetFrameLevel(2)
	frame.ManaBar.LeftText:SetParent(frame)
	frame.ManaBar.RightText:SetParent(frame)
	frame.ManaBar.CenterText:SetParent(frame)

	hooksecurefunc(frame, "ToPlayerArt", function(self)
		self.Texture:SetTexture("Interface\\TargetingFrame\\UI-PartyFrame")

		self.Name:SetWidth(0)

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

		self.HealthBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
		self.HealthBar.HealthBarMask:Hide()

		self.HealthBar.Background:SetSize(72, 20)
		self.HealthBar.Background:ClearAllPoints()
		self.HealthBar.Background:SetPoint("TOPLEFT", self, 45, -19)
		self.HealthBar.Background:SetColorTexture(0, 0, 0, 0.5)
		self.HealthBar.Background:SetDrawLayer("BACKGROUND", -7)
		self.HealthBar.Background:Show()
		
		self.ManaBar.ManaBarMask:Hide()

		if not UnitIsConnected(self:GetUnit()) then
			self.HealthBar:SetStatusBarColor(0.5, 0.5, 0.5)
			self.HealthBar.LeftText:SetAlpha(0)
			self.HealthBar.RightText:SetAlpha(0)
			self.HealthBar.CenterText:SetAlpha(0)
			self.ManaBar:SetAlpha(0)
			self.ManaBar.LeftText:SetAlpha(0)
			self.ManaBar.RightText:SetAlpha(0)
			self.ManaBar.CenterText:SetAlpha(0)
		else
			self.HealthBar:SetStatusBarColor(0, 1, 0)
			self.HealthBar.LeftText:SetAlpha(1)
			self.HealthBar.RightText:SetAlpha(1)
			self.HealthBar.CenterText:SetAlpha(1)
			self.ManaBar:SetAlpha(1)
			self.ManaBar.LeftText:SetAlpha(1)
			self.ManaBar.RightText:SetAlpha(1)
			self.ManaBar.CenterText:SetAlpha(1)
		end
	end)

	hooksecurefunc(frame, "UpdateNameTextAnchors", function(self)
		self.Name:SetPoint("TOPLEFT", self, "TOPLEFT", 49, -6.5);
	end)

	hooksecurefunc(frame, "UpdateAssignedRoles", function(self)
		local roleIcon = self.PartyMemberOverlay.RoleIcon;
		local role = UnitGroupRolesAssigned(self:GetUnit());

		if IsInInstance() then
			roleIcon:SetSize(19, 19)
			roleIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES")
			roleIcon:ClearAllPoints();
			roleIcon:SetPoint("TOPLEFT", 7, -41)
			if ( role == "TANK" or role == "HEALER" or role == "DAMAGER") then
				roleIcon:SetTexCoord(GetTexCoordsForRoleSmallCircle(role));
				roleIcon:Show();
			else
				roleIcon:Hide();
			end
		else
			roleIcon:Hide()
		end
	end)

	hooksecurefunc(frame, "UpdateNotPresentIcon", function(self)
		if UnitInOtherParty(self:GetUnit()) then
			self.NotPresentIcon.texture:SetTexture("Interface\\LFGFrame\\LFG-Eye")
			self.NotPresentIcon.texture:SetTexCoord(0.125, 0.25, 0.25, 0.5)
		end
	end)
end