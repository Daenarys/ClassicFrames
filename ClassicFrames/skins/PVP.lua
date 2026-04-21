local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_PVPUI" then
		HonorFrame.SpecificScrollBar:ClearAllPoints()
		HonorFrame.SpecificScrollBar:SetPoint("TOPLEFT", HonorFrame.SpecificScrollBox, "TOPRIGHT", 6, 2)
		HonorFrame.SpecificScrollBar:SetPoint("BOTTOMLEFT", HonorFrame.SpecificScrollBox, "BOTTOMRIGHT", 6, -4)

		ApplyScrollBarHybrid(HonorFrame.SpecificScrollBar)
		ApplyScrollBarThumb(HonorFrame.SpecificScrollBar.Track.Thumb)

		TrainingGroundsFrame.SpecificTrainingGroundList.ScrollBar:ClearAllPoints()
		TrainingGroundsFrame.SpecificTrainingGroundList.ScrollBar:SetPoint("TOPLEFT", TrainingGroundsFrame.SpecificTrainingGroundList.ScrollBox, "TOPRIGHT", 6, 2)
		TrainingGroundsFrame.SpecificTrainingGroundList.ScrollBar:SetPoint("BOTTOMLEFT", TrainingGroundsFrame.SpecificTrainingGroundList.ScrollBox, "BOTTOMRIGHT", 6, -4)

		ApplyScrollBarHybrid(TrainingGroundsFrame.SpecificTrainingGroundList.ScrollBar)
		ApplyScrollBarThumb(TrainingGroundsFrame.SpecificTrainingGroundList.ScrollBar.Track.Thumb)

		for _, roleButton in pairs({
			_G.HonorFrame.RoleList.DPSIcon,
			_G.HonorFrame.RoleList.HealerIcon,
			_G.HonorFrame.RoleList.TankIcon,
			_G.ConquestFrame.RoleList.DPSIcon,
			_G.ConquestFrame.RoleList.HealerIcon,
			_G.ConquestFrame.RoleList.TankIcon,
			_G.TrainingGroundsFrame.RoleList.DPSIcon,
			_G.TrainingGroundsFrame.RoleList.HealerIcon,
			_G.TrainingGroundsFrame.RoleList.TankIcon,
		}) do
			local checkButton = roleButton.checkButton or roleButton.CheckButton

			ApplyCheckBox(checkButton)
			checkButton:SetSize(24, 24)
			checkButton:SetScale(1)
			checkButton:ClearAllPoints()
			checkButton:SetPoint("BOTTOMLEFT", -5, -5)
		end

		HonorFrame.RoleList.DPSIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorFrame.RoleList.DPSIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))
		HonorFrame.RoleList.DPSIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorFrame.RoleList.DPSIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))
		ConquestFrame.RoleList.DPSIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		ConquestFrame.RoleList.DPSIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))
		ConquestFrame.RoleList.DPSIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		ConquestFrame.RoleList.DPSIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))
		TrainingGroundsFrame.RoleList.DPSIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		TrainingGroundsFrame.RoleList.DPSIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))
		TrainingGroundsFrame.RoleList.DPSIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		TrainingGroundsFrame.RoleList.DPSIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))

		HonorFrame.RoleList.HealerIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorFrame.RoleList.HealerIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))
		HonorFrame.RoleList.HealerIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorFrame.RoleList.HealerIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))
		ConquestFrame.RoleList.HealerIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		ConquestFrame.RoleList.HealerIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))
		ConquestFrame.RoleList.HealerIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		ConquestFrame.RoleList.HealerIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))
		TrainingGroundsFrame.RoleList.HealerIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		TrainingGroundsFrame.RoleList.HealerIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))
		TrainingGroundsFrame.RoleList.HealerIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		TrainingGroundsFrame.RoleList.HealerIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))

		HonorFrame.RoleList.TankIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorFrame.RoleList.TankIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("TANK"))
		HonorFrame.RoleList.TankIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorFrame.RoleList.TankIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("TANK"))
		ConquestFrame.RoleList.TankIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		ConquestFrame.RoleList.TankIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("TANK"))
		ConquestFrame.RoleList.TankIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		ConquestFrame.RoleList.TankIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("TANK"))
		TrainingGroundsFrame.RoleList.TankIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		TrainingGroundsFrame.RoleList.TankIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("TANK"))
		TrainingGroundsFrame.RoleList.TankIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		TrainingGroundsFrame.RoleList.TankIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("TANK"))

		ApplyDropDown(HonorFrameTypeDropdown)
		ApplyDropDown(TrainingGroundsFrameTypeDropdown)

		HonorFrameTypeDropdown:SetWidth(175)
		HonorFrameTypeDropdown:SetPoint("BOTTOMRIGHT", HonorFrame.Inset, "TOPRIGHT", -11, 5)
		HonorFrameTypeDropdown.Text:SetJustifyH("RIGHT")
		HonorFrameTypeDropdown.Text:SetPoint("TOPLEFT", 9, -7)

		TrainingGroundsFrameTypeDropdown:SetWidth(175)
		TrainingGroundsFrameTypeDropdown:SetPoint("BOTTOMRIGHT", TrainingGroundsFrame.Inset, "TOPRIGHT", -11, 5)
		TrainingGroundsFrameTypeDropdown.Text:SetJustifyH("RIGHT")
		TrainingGroundsFrameTypeDropdown.Text:SetPoint("TOPLEFT", 9, -7)
	end
end)

ApplyDialogBorder(PVPReadyDialog.Border)

ApplyCloseButton(PVPReadyDialogCloseButton, true)
PVPReadyDialogCloseButton:ClearAllPoints()
PVPReadyDialogCloseButton:SetPoint("TOPRIGHT", -2, -2)

PVPReadyDialogBottomArt:SetSize(287, 72)
PVPReadyDialogBottomArt:SetTexture("Interface\\LFGFrame\\UI-LFG-FILIGREE")
PVPReadyDialogBottomArt:SetTexCoord(0, 0.5605, 0, 0.5625)
PVPReadyDialogBottomArt:ClearAllPoints()
PVPReadyDialogBottomArt:SetPoint("BOTTOM", 0, 55)

if (PVPReadyDialogFiligree == nil) then
	PVPReadyDialog:CreateTexture("PVPReadyDialogFiligree", "OVERLAY")
	PVPReadyDialogFiligree:SetTexture("Interface\\LFGFrame\\UI-LFG-FILIGREE")
	PVPReadyDialogFiligree:SetTexCoord(0.02734, 0.59765, 0.578125, 1.0)
	PVPReadyDialogFiligree:SetSize(292, 54)
	PVPReadyDialogFiligree:SetPoint("TOPLEFT", 7, -3)
end

hooksecurefunc('PVPReadyDialog_Display', function(self, _, _, isRated, queueType, _, role)
	if ( PVPHelper_QueueNeedsRoles(queueType, isRated) ) then
		self.bottomArt:SetTexCoord(0.0, 0.5605, 0.0, 0.5625)
	else
		self.bottomArt:SetTexCoord(0.0, 0.18, 0.0, 0.5625)
	end

	self.roleIcon.texture:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
	self.roleIcon.texture:SetTexCoord(GetTexCoordsForRole(role))
end)

PVPReadyPopup.RolelessButton.Texture:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
PVPReadyPopup.RolelessButton.Texture:SetTexCoord(0.5234375, 0.78125, 0, 0.2578125)

ApplyCloseButton(PVPMatchScoreboard.CloseButton, true)
PVPMatchScoreboard.CloseButton:ClearAllPoints()
PVPMatchScoreboard.CloseButton:SetPoint("TOPRIGHT", 3.6, 3)

PVPMatchScoreboard.Content.ScrollBar:ClearAllPoints()
PVPMatchScoreboard.Content.ScrollBar:SetPoint("TOPLEFT", PVPMatchScoreboard.Content, "TOPRIGHT", -16, -3)
PVPMatchScoreboard.Content.ScrollBar:SetPoint("BOTTOMLEFT", PVPMatchScoreboard.Content, "BOTTOMRIGHT", -16, 40)

ApplyScrollBarHybrid(PVPMatchScoreboard.Content.ScrollBar)
ApplyScrollBarThumb(PVPMatchScoreboard.Content.ScrollBar.Track.Thumb)

PVPScoreboardTab1:ClearAllPoints()
PVPScoreboardTab1:SetPoint("TOPLEFT", 0, 50)
PVPScoreboardTab2:ClearAllPoints()
PVPScoreboardTab2:SetPoint("LEFT", PVPScoreboardTab1, "RIGHT", -14, 0)
PVPScoreboardTab3:ClearAllPoints()
PVPScoreboardTab3:SetPoint("LEFT", PVPScoreboardTab2, "RIGHT", -14, 0)

for i = 1, 3 do
	ApplyBottomTab(_G['PVPScoreboardTab'..i])

	_G["PVPScoreboardTab"..i]:HookScript("OnShow", function(self)
		PVPScoreboardTab1:SetWidth(60 + PVPScoreboardTab1:GetFontString():GetStringWidth())
		PVPScoreboardTab2:SetWidth(40 + PVPScoreboardTab2:GetFontString():GetStringWidth())
		PVPScoreboardTab3:SetWidth(40 + PVPScoreboardTab3:GetFontString():GetStringWidth())
	end)
end

ApplyCloseButton(PVPMatchResults.CloseButton, true)
PVPMatchResults.CloseButton:ClearAllPoints()
PVPMatchResults.CloseButton:SetPoint("TOPRIGHT", 3.6, 3)

PVPMatchResults.content.scrollBar:ClearAllPoints()
PVPMatchResults.content.scrollBar:SetPoint("TOPLEFT", PVPMatchResults.content, "TOPRIGHT", -16, -3)
PVPMatchResults.content.scrollBar:SetPoint("BOTTOMLEFT", PVPMatchResults.content, "BOTTOMRIGHT", -16, 123)

ApplyScrollBarHybrid(PVPMatchResults.content.scrollBar)
ApplyScrollBarThumb(PVPMatchResults.content.scrollBar.Track.Thumb)

PVPScoreFrameTab1:ClearAllPoints()
PVPScoreFrameTab1:SetPoint("TOPLEFT", 0, 50)
PVPScoreFrameTab2:ClearAllPoints()
PVPScoreFrameTab2:SetPoint("LEFT", PVPScoreFrameTab1, "RIGHT", -14, 0)
PVPScoreFrameTab3:ClearAllPoints()
PVPScoreFrameTab3:SetPoint("LEFT", PVPScoreFrameTab2, "RIGHT", -14, 0)

for i = 1, 3 do
	ApplyBottomTab(_G['PVPScoreFrameTab'..i])

	_G["PVPScoreFrameTab"..i]:HookScript("OnShow", function(self)
		PVPScoreFrameTab1:SetWidth(60 + PVPScoreFrameTab1:GetFontString():GetStringWidth())
		PVPScoreFrameTab2:SetWidth(40 + PVPScoreFrameTab2:GetFontString():GetStringWidth())
		PVPScoreFrameTab3:SetWidth(40 + PVPScoreFrameTab3:GetFontString():GetStringWidth())
	end)
end

ApplyCloseButton(ReadyStatus.CloseButton, true)
ReadyStatus.CloseButton:ClearAllPoints()
ReadyStatus.CloseButton:SetPoint("TOPRIGHT", -2, -2)

ApplyDialogBorder(ReadyStatus.Border)