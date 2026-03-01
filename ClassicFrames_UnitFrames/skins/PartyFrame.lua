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
		self.HealthBarContainer.HealthBar:SetStatusBarColor(0, 1, 0)
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

hooksecurefunc("CompactRaidGroup_UpdateLayout", function(frame)
	local firstUnitFrame = _G[frame:GetName().."Member1"]
	local lastUnitFrame = _G[frame:GetName().."Member5"]

	if frame.borderFrame:IsShown() then
		frame.borderFrame:ClearAllPoints()
		frame.borderFrame:SetPoint("TOPLEFT", firstUnitFrame, "TOPLEFT", -3, 5)
		frame.borderFrame:SetPoint("BOTTOMRIGHT", lastUnitFrame, "BOTTOMRIGHT", 8, -6)

		frame.borderFrame.Background:SetAlpha(0)

		if (frame.borderFrame.TopLeft == nil) then
			frame.borderFrame.TopLeft = frame.borderFrame:CreateTexture(nil, "ARTWORK")
			frame.borderFrame.TopLeft:SetSize(32, 32)
			frame.borderFrame.TopLeft:SetTexture("Interface\\RaidFrame\\RaidBorder-UpperLeft")
			frame.borderFrame.TopLeft:SetPoint("TOPLEFT", -5, 0)
		end

		if (frame.borderFrame.TopRight == nil) then
			frame.borderFrame.TopRight = frame.borderFrame:CreateTexture(nil, "ARTWORK")
			frame.borderFrame.TopRight:SetSize(32, 32)
			frame.borderFrame.TopRight:SetTexture("Interface\\RaidFrame\\RaidBorder-UpperRight")
			frame.borderFrame.TopRight:SetPoint("TOPRIGHT")
		end

		if (frame.borderFrame.BottomLeft == nil) then
			frame.borderFrame.BottomLeft = frame.borderFrame:CreateTexture(nil, "ARTWORK")
			frame.borderFrame.BottomLeft:SetSize(32, 32)
			frame.borderFrame.BottomLeft:SetTexture("Interface\\RaidFrame\\RaidBorder-BottomLeft")
			frame.borderFrame.BottomLeft:SetPoint("BOTTOMLEFT", -5, 0)
		end

		if (frame.borderFrame.BottomRight == nil) then
			frame.borderFrame.BottomRight = frame.borderFrame:CreateTexture(nil, "ARTWORK")
			frame.borderFrame.BottomRight:SetSize(32, 32)
			frame.borderFrame.BottomRight:SetTexture("Interface\\RaidFrame\\RaidBorder-BottomRight")
			frame.borderFrame.BottomRight:SetPoint("BOTTOMRIGHT")
		end

		if (frame.borderFrame.Top == nil) then
			frame.borderFrame.Top = frame.borderFrame:CreateTexture(nil, "ARTWORK")
			frame.borderFrame.Top:SetSize(0, 16)
			frame.borderFrame.Top:SetTexture("Interface\\RaidFrame\\RaidBorder-UpperMiddle")
			frame.borderFrame.Top:SetHorizTile(true)
			frame.borderFrame.Top:SetPoint("TOPLEFT", frame.borderFrame.TopLeft, "TOPRIGHT", 0, 1)
			frame.borderFrame.Top:SetPoint("TOPRIGHT", frame.borderFrame.TopRight, "TOPLEFT", 0, 1)
		end

		if (frame.borderFrame.Bottom == nil) then
			frame.borderFrame.Bottom = frame.borderFrame:CreateTexture(nil, "ARTWORK")
			frame.borderFrame.Bottom:SetSize(0, 16)
			frame.borderFrame.Bottom:SetTexture("Interface\\RaidFrame\\RaidBorder-BottomMiddle")
			frame.borderFrame.Bottom:SetHorizTile(true)
			frame.borderFrame.Bottom:SetPoint("BOTTOMLEFT", frame.borderFrame.BottomLeft, "BOTTOMRIGHT", 0, -4)
			frame.borderFrame.Bottom:SetPoint("BOTTOMRIGHT", frame.borderFrame.BottomRight, "BOTTOMLEFT", 0, -4)
		end

		if (frame.borderFrame.Left == nil) then
			frame.borderFrame.Left = frame.borderFrame:CreateTexture(nil, "ARTWORK")
			frame.borderFrame.Left:SetSize(16, 0)
			frame.borderFrame.Left:SetTexture("Interface\\RaidFrame\\RaidBorder-Left")
			frame.borderFrame.Left:SetVertTile(true)
			frame.borderFrame.Left:SetPoint("TOPLEFT", frame.borderFrame.TopLeft, "BOTTOMLEFT", -1, 0)
			frame.borderFrame.Left:SetPoint("BOTTOMLEFT", frame.borderFrame.BottomLeft, "TOPLEFT", -1, 0)
		end

		if (frame.borderFrame.Right == nil) then
			frame.borderFrame.Right = frame.borderFrame:CreateTexture(nil, "ARTWORK")
			frame.borderFrame.Right:SetSize(16, 0)
			frame.borderFrame.Right:SetTexture("Interface\\RaidFrame\\RaidBorder-Right")
			frame.borderFrame.Right:SetVertTile(true)
			frame.borderFrame.Right:SetPoint("TOPRIGHT", frame.borderFrame.TopRight, "BOTTOMRIGHT", 2, 0)
			frame.borderFrame.Right:SetPoint("BOTTOMRIGHT", frame.borderFrame.BottomRight, "TOPRIGHT", 2, 0)
		end
	end
end)

------The default setup function
local texCoords = {
	["Raid-AggroFrame"] = {  0.00781250, 0.55468750, 0.00781250, 0.27343750 },
	["Raid-TargetFrame"] = { 0.00781250, 0.55468750, 0.28906250, 0.55468750 },
}

hooksecurefunc("DefaultCompactUnitFrameSetup", function(frame)
	local displayBorder = EditModeManagerFrame:ShouldRaidFrameDisplayBorder(frame.groupType)
	local isPowerBarShowing = frame.powerBar and frame.powerBar:IsShown()
	local powerBarUsedHeight = isPowerBarShowing and 8 or 0

	frame.healthBar:SetStatusBarTexture("Interface\\RaidFrame\\Raid-Bar-Hp-Fill")
	frame.healthBar:GetStatusBarTexture():SetDrawLayer("BORDER")

	frame.powerBar:SetStatusBarTexture("Interface\\RaidFrame\\Raid-Bar-Resource-Fill")
	frame.powerBar:GetStatusBarTexture():SetDrawLayer("BORDER")
	frame.powerBar.background:SetTexture("Interface\\RaidFrame\\Raid-Bar-Resource-Background")

	frame.selectionHighlight:SetTexture("Interface\\RaidFrame\\Raid-FrameHighlights")
	frame.selectionHighlight:SetTexCoord(unpack(texCoords["Raid-TargetFrame"]))
	frame.selectionHighlight:SetAllPoints(frame)

	frame.aggroHighlight:SetTexture("Interface\\RaidFrame\\Raid-FrameHighlights")
	frame.aggroHighlight:SetTexCoord(unpack(texCoords["Raid-AggroFrame"]))
	frame.aggroHighlight:SetAllPoints(frame)

	if (frame.horizTopBorder == nil) then
		frame.horizTopBorder = frame:CreateTexture(nil, "BORDER")
		frame.horizTopBorder:ClearAllPoints()
		frame.horizTopBorder:SetPoint("BOTTOMLEFT", frame, "TOPLEFT", 0, -7)
		frame.horizTopBorder:SetPoint("BOTTOMRIGHT", frame, "TOPRIGHT", 0, -7)
		frame.horizTopBorder:SetTexture("Interface\\RaidFrame\\Raid-HSeparator")
		frame.horizTopBorder:SetHorizTile(true)
		frame.horizTopBorder:SetHeight(8)
	end

	if (frame.horizBottomBorder == nil) then
		frame.horizBottomBorder = frame:CreateTexture(nil, "BORDER")
		frame.horizBottomBorder:ClearAllPoints()
		frame.horizBottomBorder:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", 0, 1)
		frame.horizBottomBorder:SetPoint("TOPRIGHT", frame, "BOTTOMRIGHT", 0, 1)
		frame.horizBottomBorder:SetTexture("Interface\\RaidFrame\\Raid-HSeparator")
		frame.horizBottomBorder:SetHorizTile(true)
		frame.horizBottomBorder:SetHeight(8)
	end

	if (frame.vertLeftBorder == nil) then
		frame.vertLeftBorder = frame:CreateTexture(nil, "BORDER")
		frame.vertLeftBorder:ClearAllPoints()
		frame.vertLeftBorder:SetPoint("TOPRIGHT", frame, "TOPLEFT", 7, 0)
		frame.vertLeftBorder:SetPoint("BOTTOMRIGHT", frame, "BOTTOMLEFT", 7, 0)
		frame.vertLeftBorder:SetTexture("Interface\\RaidFrame\\Raid-VSeparator")
		frame.vertLeftBorder:SetVertTile(true)
		frame.vertLeftBorder:SetWidth(8)
	end

	if (frame.vertRightBorder == nil) then
		frame.vertRightBorder = frame:CreateTexture(nil, "BORDER")
		frame.vertRightBorder:ClearAllPoints()
		frame.vertRightBorder:SetPoint("TOPLEFT", frame, "TOPRIGHT", -1, 0)
		frame.vertRightBorder:SetPoint("BOTTOMLEFT", frame, "BOTTOMRIGHT", -1, 0)
		frame.vertRightBorder:SetTexture("Interface\\RaidFrame\\Raid-VSeparator")
		frame.vertRightBorder:SetVertTile(true)
		frame.vertRightBorder:SetWidth(8)
	end

	if (frame.horizDivider == nil) then
		frame.horizDivider = frame:CreateTexture(nil, "BORDER")
		frame.horizDivider:ClearAllPoints()
		frame.horizDivider:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", 0, 1 + powerBarUsedHeight)
		frame.horizDivider:SetPoint("TOPRIGHT", frame, "BOTTOMRIGHT", 0, 1 + powerBarUsedHeight)
		frame.horizDivider:SetTexture("Interface\\RaidFrame\\Raid-HSeparator")
		frame.horizDivider:SetHorizTile(true)
		frame.horizDivider:SetHeight(8)
	end

	if ( displayBorder ) then
		frame.horizTopBorder:Show()
		frame.horizBottomBorder:Show()
		frame.vertLeftBorder:Show()
		frame.vertRightBorder:Show()
		frame.horizDivider:Show()
		if ( isPowerBarShowing ) then
			frame.horizDivider:Show()
		else
			frame.horizDivider:Hide()
		end
	else
		frame.horizTopBorder:Hide()
		frame.horizBottomBorder:Hide()
		frame.vertLeftBorder:Hide()
		frame.vertRightBorder:Hide()
		frame.horizDivider:Hide()
	end
end)

hooksecurefunc("CompactUnitFrame_UpdateAggroHighlight", function(frame)
	if frame.aggroHighlight then
		local status = UnitThreatSituation(frame.displayedUnit)
		if ( status and status > 0 ) then
			frame.aggroHighlight:SetVertexColor(GetThreatStatusColor(status))
		end
	end
end)

hooksecurefunc("CompactUnitFrame_UpdateHealthColor", function(frame)
	if frame.background then
		frame.background:SetTexture("Interface\\RaidFrame\\Raid-Bar-Hp-Bg")
		frame.background:SetTexCoord(0, 1, 0, 0.53125)
	end
end)

hooksecurefunc("CompactUnitFrame_UpdateRoleIcon", function(frame)
	if not frame.roleIcon then
		return
	end

	local role = UnitGroupRolesAssigned(frame.unit)
	if ( frame.optionTable.displayRoleIcon and (role == "TANK" or role == "HEALER" or role == "DAMAGER") ) then
		frame.roleIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES")
		frame.roleIcon:SetTexCoord(GetTexCoordsForOldRoleSmallCircle(role))
		frame.roleIcon:SetSize(12, 12)
	end
end)

hooksecurefunc("CompactRaidFrameManager_UpdateOptionsFlowContainer", function()
	local isLeader = UnitIsGroupLeader("player")
	local isAssist = UnitIsGroupAssistant("player")
	local isLeaderOrAssist = isLeader or isAssist

	CompactRaidFrameManager.Background:SetAlpha(0)
	CompactRaidFrameManager.toggleButtonBack:SetAlpha(0)
	CompactRaidFrameManager.toggleButtonForward:SetAlpha(0)

	if (CompactRaidFrameManager.TopLeft == nil) then
		CompactRaidFrameManager.TopLeft = CompactRaidFrameManager:CreateTexture(nil, "ARTWORK")
		CompactRaidFrameManager.TopLeft:SetSize(32, 32)
		CompactRaidFrameManager.TopLeft:SetTexture("Interface\\RaidFrame\\RaidPanel-UpperLeft")
		CompactRaidFrameManager.TopLeft:SetPoint("TOPLEFT", -10, 0)
	end

	if (CompactRaidFrameManager.TopRight == nil) then
		CompactRaidFrameManager.TopRight = CompactRaidFrameManager:CreateTexture(nil, "ARTWORK")
		CompactRaidFrameManager.TopRight:SetSize(32, 32)
		CompactRaidFrameManager.TopRight:SetTexture("Interface\\RaidFrame\\RaidPanel-UpperRight")
	end

	if (CompactRaidFrameManager.BottomLeft == nil) then
		CompactRaidFrameManager.BottomLeft = CompactRaidFrameManager:CreateTexture(nil, "ARTWORK")
		CompactRaidFrameManager.BottomLeft:SetSize(32, 32)
		CompactRaidFrameManager.BottomLeft:SetTexture("Interface\\RaidFrame\\RaidPanel-BottomLeft")
		CompactRaidFrameManager.BottomLeft:SetPoint("BOTTOMLEFT", -10, 0)
	end

	if (CompactRaidFrameManager.BottomRight == nil) then
		CompactRaidFrameManager.BottomRight = CompactRaidFrameManager:CreateTexture(nil, "ARTWORK")
		CompactRaidFrameManager.BottomRight:SetSize(32, 32)
		CompactRaidFrameManager.BottomRight:SetTexture("Interface\\RaidFrame\\RaidPanel-BottomRight")
	end

	if (CompactRaidFrameManager.Top == nil) then
		CompactRaidFrameManager.Top = CompactRaidFrameManager:CreateTexture(nil, "ARTWORK")
		CompactRaidFrameManager.Top:SetSize(0, 16)
		CompactRaidFrameManager.Top:SetTexture("Interface\\RaidFrame\\RaidPanel-UpperMiddle")
		CompactRaidFrameManager.Top:SetHorizTile(true)
		CompactRaidFrameManager.Top:SetPoint("TOPLEFT", CompactRaidFrameManager.TopLeft, "TOPRIGHT", 0, 1)
		CompactRaidFrameManager.Top:SetPoint("TOPRIGHT", CompactRaidFrameManager.TopRight, "TOPLEFT", 0, 1)
	end

	if (CompactRaidFrameManager.Bottom == nil) then
		CompactRaidFrameManager.Bottom = CompactRaidFrameManager:CreateTexture(nil, "ARTWORK")
		CompactRaidFrameManager.Bottom:SetSize(0, 16)
		CompactRaidFrameManager.Bottom:SetTexture("Interface\\RaidFrame\\RaidPanel-BottomMiddle")
		CompactRaidFrameManager.Bottom:SetHorizTile(true)
		CompactRaidFrameManager.Bottom:SetPoint("BOTTOMLEFT", CompactRaidFrameManager.BottomLeft, "BOTTOMRIGHT", 0, -4)
		CompactRaidFrameManager.Bottom:SetPoint("BOTTOMRIGHT", CompactRaidFrameManager.BottomRight, "BOTTOMLEFT", 0, -4)
	end

	if (CompactRaidFrameManager.Right == nil) then
		CompactRaidFrameManager.Right = CompactRaidFrameManager:CreateTexture(nil, "ARTWORK")
		CompactRaidFrameManager.Right:SetSize(16, 0)
		CompactRaidFrameManager.Right:SetTexture("Interface\\RaidFrame\\RaidPanel-Right")
		CompactRaidFrameManager.Right:SetVertTile(true)
		CompactRaidFrameManager.Right:SetPoint("TOPRIGHT", CompactRaidFrameManager.TopRight, "BOTTOMRIGHT", 2, 0)
		CompactRaidFrameManager.Right:SetPoint("BOTTOMRIGHT", CompactRaidFrameManager.BottomRight, "TOPRIGHT", 2, 0)
	end

	if (CompactRaidFrameManager.Bg == nil) then
		CompactRaidFrameManager.Bg = CompactRaidFrameManager:CreateTexture(nil, "ARTWORK")
		CompactRaidFrameManager.Bg:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock", true, true)
		CompactRaidFrameManager.Bg:SetPoint("TOPLEFT", CompactRaidFrameManager.TopLeft, "TOPLEFT", 7, -6)
		CompactRaidFrameManager.Bg:SetPoint("BOTTOMRIGHT", CompactRaidFrameManager.BottomRight, "BOTTOMRIGHT", -7, 7)
	end

	if (CompactRaidFrameManager.ToggleButton == nil) then
		CompactRaidFrameManager.ToggleButton = CompactRaidFrameManager:CreateTexture(nil, "OVERLAY")
		CompactRaidFrameManager.ToggleButton:SetSize(16, 64)
		CompactRaidFrameManager.ToggleButton:SetTexture("Interface\\RaidFrame\\RaidPanel-Toggle")
		CompactRaidFrameManager.ToggleButton:SetTexCoord(0, 0.5, 0, 1)
		CompactRaidFrameManager.ToggleButton:SetPoint("CENTER", CompactRaidFrameManager.toggleButtonForward, "CENTER")
	end

	if CompactRaidFrameManager.dividerVerticalPool then
		CompactRaidFrameManager.dividerVerticalPool:ReleaseAll()
	end

	if CompactRaidFrameManager.dividerHorizontalPool then
		CompactRaidFrameManager.dividerHorizontalPool:ReleaseAll()
	end

	if ( CompactRaidFrameManager.collapsed ) then
		if isLeaderOrAssist then
			CompactRaidFrameManager.TopRight:SetPoint("TOPRIGHT", -4, 0)
			CompactRaidFrameManager.BottomRight:SetPoint("BOTTOMRIGHT", -4, 206)
			CompactRaidFrameManager.toggleButtonBack:SetPoint("RIGHT", -13, 104)
			CompactRaidFrameManager.toggleButtonForward:SetPoint("RIGHT", -13, 104)
		else
			CompactRaidFrameManager.TopRight:SetPoint("TOPRIGHT", -4, 0)
			CompactRaidFrameManager.BottomRight:SetPoint("BOTTOMRIGHT", -4, 140)
			CompactRaidFrameManager.toggleButtonBack:SetPoint("RIGHT", -13, 70)
			CompactRaidFrameManager.toggleButtonForward:SetPoint("RIGHT", -13, 70)
		end
	else
		CompactRaidFrameManager.TopRight:SetPoint("TOPRIGHT")
		CompactRaidFrameManager.BottomRight:SetPoint("BOTTOMRIGHT")
		CompactRaidFrameManager.toggleButtonBack:SetPoint("RIGHT", -9, 0)
		CompactRaidFrameManager.toggleButtonForward:SetPoint("RIGHT", -9, 0)
	end
end)

hooksecurefunc("CompactRaidFrameManager_Toggle",function()
	local isLeader = UnitIsGroupLeader("player")
	local isAssist = UnitIsGroupAssistant("player")
	local isLeaderOrAssist = isLeader or isAssist

	if ( CompactRaidFrameManager.collapsed ) then
		if isLeaderOrAssist then
			CompactRaidFrameManager.TopRight:SetPoint("TOPRIGHT", -4, 0)
			CompactRaidFrameManager.BottomRight:SetPoint("BOTTOMRIGHT", -4, 206)
			CompactRaidFrameManager.toggleButtonBack:SetPoint("RIGHT", -13, 104)
			CompactRaidFrameManager.toggleButtonForward:SetPoint("RIGHT", -13, 104)
		else
			CompactRaidFrameManager.TopRight:SetPoint("TOPRIGHT", -4, 0)
			CompactRaidFrameManager.BottomRight:SetPoint("BOTTOMRIGHT", -4, 140)
			CompactRaidFrameManager.toggleButtonBack:SetPoint("RIGHT", -13, 70)
			CompactRaidFrameManager.toggleButtonForward:SetPoint("RIGHT", -13, 70)
		end
	else
		CompactRaidFrameManager.TopRight:SetPoint("TOPRIGHT")
		CompactRaidFrameManager.BottomRight:SetPoint("BOTTOMRIGHT")
		CompactRaidFrameManager.toggleButtonBack:SetPoint("RIGHT", -9, 0)
		CompactRaidFrameManager.toggleButtonForward:SetPoint("RIGHT", -9, 0)
	end
end)

hooksecurefunc("CompactRaidFrameManager_Expand", function()
	CompactRaidFrameManager.ToggleButton:SetTexCoord(0.5, 1, 0, 1)
end)

hooksecurefunc("CompactRaidFrameManager_Collapse", function()
	CompactRaidFrameManager.ToggleButton:SetTexCoord(0, 0.5, 0, 1)
end)

ApplyDropDown(CompactRaidFrameManagerDisplayFrameModeControlDropdown)
ApplyDropDown(CompactRaidFrameManagerDisplayFrameRestrictPingsDropdown)