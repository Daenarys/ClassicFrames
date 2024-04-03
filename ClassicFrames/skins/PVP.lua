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

PVPMatchScoreboard.Content.ScrollBar:SetSize(25, 560)
PVPMatchScoreboard.Content.ScrollBar:ClearAllPoints()
PVPMatchScoreboard.Content.ScrollBar:SetPoint("TOPLEFT", PVPMatchScoreboard.Content, "TOPRIGHT", -26, -2)
PVPMatchScoreboard.Content.ScrollBar:SetPoint("BOTTOMLEFT", PVPMatchScoreboard.Content, "BOTTOMRIGHT", -26, 40)

ApplyScrollBarArrow(PVPMatchScoreboard.Content.ScrollBar)
ApplyScrollBarTrack(PVPMatchScoreboard.Content.ScrollBar.Track)
ApplyScrollBarThumb(PVPMatchScoreboard.Content.ScrollBar.Track.Thumb)

PVPScoreboardTab2:ClearAllPoints()
PVPScoreboardTab2:SetPoint("LEFT", PVPScoreboardTab1, "RIGHT", -15, 0)
PVPScoreboardTab3:ClearAllPoints()
PVPScoreboardTab3:SetPoint("LEFT", PVPScoreboardTab2, "RIGHT", -15, 0)

for i = 1, 3 do
	ApplyBottomTab(_G['PVPScoreboardTab'..i])

	_G["PVPScoreboardTab"..i]:HookScript("OnShow", function(self)
		PVPScoreboardTab1:SetWidth(60 + PVPScoreboardTab1:GetFontString():GetStringWidth())
		PVPScoreboardTab2:SetWidth(40 + PVPScoreboardTab2:GetFontString():GetStringWidth())
		PVPScoreboardTab3:SetWidth(40 + PVPScoreboardTab3:GetFontString():GetStringWidth())
	end)
end

PVPMatchResults.content.scrollBar:SetSize(25, 560)
PVPMatchResults.content.scrollBar:ClearAllPoints()
PVPMatchResults.content.scrollBar:SetPoint("TOPLEFT", PVPMatchResults.content, "TOPRIGHT", -26, -2)
PVPMatchResults.content.scrollBar:SetPoint("BOTTOMLEFT", PVPMatchResults.content, "BOTTOMRIGHT", -26, 122)

ApplyScrollBarArrow(PVPMatchResults.content.scrollBar)
ApplyScrollBarTrack(PVPMatchResults.content.scrollBar.Track)
ApplyScrollBarThumb(PVPMatchResults.content.scrollBar.Track.Thumb)

PVPScoreFrameTab2:ClearAllPoints()
PVPScoreFrameTab2:SetPoint("LEFT", PVPScoreFrameTab1, "RIGHT", -15, 0)
PVPScoreFrameTab3:ClearAllPoints()
PVPScoreFrameTab3:SetPoint("LEFT", PVPScoreFrameTab2, "RIGHT", -15, 0)

for i = 1, 3 do
	ApplyBottomTab(_G['PVPScoreFrameTab'..i])

	_G["PVPScoreFrameTab"..i]:HookScript("OnShow", function(self)
		PVPScoreFrameTab1:SetWidth(60 + PVPScoreFrameTab1:GetFontString():GetStringWidth())
		PVPScoreFrameTab2:SetWidth(40 + PVPScoreFrameTab2:GetFontString():GetStringWidth())
		PVPScoreFrameTab3:SetWidth(40 + PVPScoreFrameTab3:GetFontString():GetStringWidth())
	end)
end

ReadyStatus.CloseButton:SetSize(32, 32)
ReadyStatus.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
ReadyStatus.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-HideButton-Up")
ReadyStatus.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-HideButton-Down")
ReadyStatus.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
ReadyStatus.CloseButton:ClearAllPoints()
ReadyStatus.CloseButton:SetPoint("TOPRIGHT", -2, -2)

ApplyDialogBorder(ReadyStatus.Border)