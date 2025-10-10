if not _G.PVEFrame then return end

ApplyCloseButton(PVEFrameCloseButton)

PVEFrame.PortraitContainer.CircleMask:Hide()

PVEFramePortrait:SetSize(61, 61)
PVEFramePortrait:ClearAllPoints()
PVEFramePortrait:SetPoint("TOPLEFT", -6, 8)

PVEFrame.TitleContainer:ClearAllPoints()
PVEFrame.TitleContainer:SetPoint("TOPLEFT", PVEFrame, "TOPLEFT", 58, 0)
PVEFrame.TitleContainer:SetPoint("TOPRIGHT", PVEFrame, "TOPRIGHT", -58, 0)

ApplyTitleBg(PVEFrame)
ApplyNineSlicePortrait(PVEFrame)

PVEFrameTab2:ClearAllPoints()
PVEFrameTab2:SetPoint("LEFT", PVEFrameTab1, "RIGHT", -16, 0)
PVEFrameTab3:ClearAllPoints()
PVEFrameTab3:SetPoint("LEFT", PVEFrameTab2, "RIGHT", -16, 0)

for i = 1, 4 do
	ApplyBottomTab(_G['PVEFrameTab'..i])

	_G["PVEFrameTab"..i]:HookScript("OnShow", function(self)
		self:SetWidth(40 + self:GetFontString():GetStringWidth())
	end)
end

GroupFinderFrame:HookScript("OnShow", function()
	SetPortraitToTexture(PVEFramePortrait, "Interface\\LFGFrame\\UI-LFG-PORTRAIT")
end)

PVEFrame:HookScript("OnShow", function(self)
	if self.tab4:IsShown() then
		self.tab4:ClearAllPoints()
		if self.tab2:IsShown() and not self.tab3:IsShown() then
			self.tab4:SetPoint("LEFT", self.tab2, "RIGHT", -16, 0)
		elseif self.tab2:IsShown() and self.tab3:IsShown() then
			self.tab4:SetPoint("LEFT", self.tab3, "RIGHT", -16, 0)
		end
	end
end)

LFDQueueFrameRandomScrollFrame.ScrollBar:SetSize(25, 560)
LFDQueueFrameRandomScrollFrame.ScrollBar:ClearAllPoints()
LFDQueueFrameRandomScrollFrame.ScrollBar:SetPoint("TOPLEFT", LFDQueueFrameRandomScrollFrame, "TOPRIGHT", 2, 8)
LFDQueueFrameRandomScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", LFDQueueFrameRandomScrollFrame, "BOTTOMRIGHT", 5, -9)

if (LFDQueueFrameRandomScrollFrame.ScrollBar.BG == nil) then
	LFDQueueFrameRandomScrollFrame.ScrollBar.BG = LFDQueueFrameRandomScrollFrame.ScrollBar:CreateTexture(nil, "BACKGROUND")
	LFDQueueFrameRandomScrollFrame.ScrollBar.BG:SetColorTexture(0, 0, 0, .65)
	LFDQueueFrameRandomScrollFrame.ScrollBar.BG:SetAllPoints()
end

ApplyScrollBarArrow(LFDQueueFrameRandomScrollFrame.ScrollBar)
ApplyScrollBarTrack(LFDQueueFrameRandomScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(LFDQueueFrameRandomScrollFrame.ScrollBar.Track.Thumb)

LFDQueueFrameSpecific.ScrollBar:SetSize(25, 560)
LFDQueueFrameSpecific.ScrollBar:ClearAllPoints()
LFDQueueFrameSpecific.ScrollBar:SetPoint("TOPLEFT", LFDQueueFrameSpecific.ScrollBox, "TOPRIGHT", 5, 0)
LFDQueueFrameSpecific.ScrollBar:SetPoint("BOTTOMLEFT", LFDQueueFrameSpecific.ScrollBox, "BOTTOMRIGHT", 5, 0)

ApplyScrollBarArrow(LFDQueueFrameSpecific.ScrollBar)
ApplyScrollBarTrack(LFDQueueFrameSpecific.ScrollBar.Track)
ApplyScrollBarThumb(LFDQueueFrameSpecific.ScrollBar.Track.Thumb)

LFGListFrame.EntryCreation.ActivityFinder.Dialog.ScrollBar:SetSize(25, 560)
LFGListFrame.EntryCreation.ActivityFinder.Dialog.ScrollBar:ClearAllPoints()
LFGListFrame.EntryCreation.ActivityFinder.Dialog.ScrollBar:SetPoint("TOPLEFT", LFGListFrame.EntryCreation.ActivityFinder.Dialog.ScrollBox, "TOPRIGHT", -3, 2)
LFGListFrame.EntryCreation.ActivityFinder.Dialog.ScrollBar:SetPoint("BOTTOMLEFT", LFGListFrame.EntryCreation.ActivityFinder.Dialog.ScrollBox, "BOTTOMRIGHT", 0, -2)

if (LFGListFrame.EntryCreation.ActivityFinder.Dialog.ScrollBar.BG == nil) then
	LFGListFrame.EntryCreation.ActivityFinder.Dialog.ScrollBar.BG = LFGListFrame.EntryCreation.ActivityFinder.Dialog.ScrollBar:CreateTexture(nil, "BACKGROUND")
	LFGListFrame.EntryCreation.ActivityFinder.Dialog.ScrollBar.BG:SetColorTexture(0, 0, 0, .65)
	LFGListFrame.EntryCreation.ActivityFinder.Dialog.ScrollBar.BG:SetAllPoints()
end

ApplyScrollBarArrow(LFGListFrame.EntryCreation.ActivityFinder.Dialog.ScrollBar)
ApplyScrollBarTrack(LFGListFrame.EntryCreation.ActivityFinder.Dialog.ScrollBar.Track)
ApplyScrollBarThumb(LFGListFrame.EntryCreation.ActivityFinder.Dialog.ScrollBar.Track.Thumb)

LFGListFrame.SearchPanel.ScrollBar:SetSize(25, 560)
LFGListFrame.SearchPanel.ScrollBar:ClearAllPoints()
LFGListFrame.SearchPanel.ScrollBar:SetPoint("TOPLEFT", LFGListFrame.SearchPanel.ScrollBox, "TOPRIGHT", 0, 3)
LFGListFrame.SearchPanel.ScrollBar:SetPoint("BOTTOMLEFT", LFGListFrame.SearchPanel.ScrollBox, "BOTTOMRIGHT", 3, -1)

if (LFGListFrame.SearchPanel.ScrollBar.BG == nil) then
	LFGListFrame.SearchPanel.ScrollBar.BG = LFGListFrame.SearchPanel.ScrollBar:CreateTexture(nil, "BACKGROUND")
	LFGListFrame.SearchPanel.ScrollBar.BG:SetColorTexture(0, 0, 0, .65)
	LFGListFrame.SearchPanel.ScrollBar.BG:SetAllPoints()
end

ApplyScrollBarArrow(LFGListFrame.SearchPanel.ScrollBar)
ApplyScrollBarTrack(LFGListFrame.SearchPanel.ScrollBar.Track)
ApplyScrollBarThumb(LFGListFrame.SearchPanel.ScrollBar.Track.Thumb)

LFGListFrame.ApplicationViewer.ScrollBar:SetSize(25, 560)
LFGListFrame.ApplicationViewer.ScrollBar:ClearAllPoints()
LFGListFrame.ApplicationViewer.ScrollBar:SetPoint("TOPLEFT", LFGListFrame.ApplicationViewer.ScrollBox, "TOPRIGHT", 0, 3)
LFGListFrame.ApplicationViewer.ScrollBar:SetPoint("BOTTOMLEFT", LFGListFrame.ApplicationViewer.ScrollBox, "BOTTOMRIGHT", 3, -3)

if (LFGListFrame.ApplicationViewer.ScrollBar.BG == nil) then
	LFGListFrame.ApplicationViewer.ScrollBar.BG = LFGListFrame.ApplicationViewer.ScrollBar:CreateTexture(nil, "BACKGROUND")
	LFGListFrame.ApplicationViewer.ScrollBar.BG:SetColorTexture(0, 0, 0, .65)
	LFGListFrame.ApplicationViewer.ScrollBar.BG:SetAllPoints()
end

ApplyScrollBarArrow(LFGListFrame.ApplicationViewer.ScrollBar)
ApplyScrollBarTrack(LFGListFrame.ApplicationViewer.ScrollBar.Track)
ApplyScrollBarThumb(LFGListFrame.ApplicationViewer.ScrollBar.Track.Thumb)

LFGDungeonReadyDialog.Border:Hide()

LFGDungeonReadyDialogCloseButton:SetSize(32, 32)
LFGDungeonReadyDialogCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
LFGDungeonReadyDialogCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-HideButton-Up")
LFGDungeonReadyDialogCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-HideButton-Down")
LFGDungeonReadyDialogCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
LFGDungeonReadyDialogCloseButton:ClearAllPoints()
LFGDungeonReadyDialogCloseButton:SetPoint("TOPRIGHT", -2, -2)

LFGDungeonReadyDialogBottomArt:ClearAllPoints()
LFGDungeonReadyDialogBottomArt:SetPoint("BOTTOM", 0, 55)

LFGDungeonReadyStatusCloseButton:SetSize(32, 32)
LFGDungeonReadyStatusCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
LFGDungeonReadyStatusCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-HideButton-Up")
LFGDungeonReadyStatusCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-HideButton-Down")
LFGDungeonReadyStatusCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
LFGDungeonReadyStatusCloseButton:ClearAllPoints()
LFGDungeonReadyStatusCloseButton:SetPoint("TOPRIGHT", -2, -2)

ApplyDialogBorder(LFDReadyCheckPopup.Border)
ApplyDialogBorder(LFDRoleCheckPopup.Border)
ApplyDialogBorder(LFGDungeonReadyStatus.Border)
ApplyDialogBorder(LFGInvitePopup.Border)
ApplyDialogBorder(LFGListApplicationDialog.Border)
ApplyDialogBorder(LFGListInviteDialog.Border)
ApplyDialogBorder(LFGListFrame.EntryCreation.ActivityFinder.Dialog.Border)

LFGDungeonReadyDialogRoleIconLeaderIcon:SetSize(19, 19)
LFGDungeonReadyDialogRoleIconLeaderIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES")
LFGDungeonReadyDialogRoleIconLeaderIcon:SetTexCoord(0, 0.296875, 0.015625, 0.3125)
LFGDungeonReadyDialogRoleIconLeaderIcon:ClearAllPoints()
LFGDungeonReadyDialogRoleIconLeaderIcon:SetPoint("TOPLEFT", 0, -4)

LFGListInviteDialog.RoleIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFGDungeonReadyStatusRoleless.ready.texture:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFGDungeonReadyStatusRoleless.ready.texture:SetTexCoord(0.5234375, 0.78125, 0, 0.2578125)

LFDQueueFrameRoleButtonLeader:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDQueueFrameRoleButtonLeader:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("GUIDE"))
LFDQueueFrameRoleButtonLeader:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDQueueFrameRoleButtonLeader:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("GUIDE"))
RaidFinderQueueFrameRoleButtonLeader:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
RaidFinderQueueFrameRoleButtonLeader:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("GUIDE"))
RaidFinderQueueFrameRoleButtonLeader:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
RaidFinderQueueFrameRoleButtonLeader:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("GUIDE"))

LFDQueueFrameRoleButtonHealer:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDQueueFrameRoleButtonHealer:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))
LFDQueueFrameRoleButtonHealer:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDQueueFrameRoleButtonHealer:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))
RaidFinderQueueFrameRoleButtonHealer:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
RaidFinderQueueFrameRoleButtonHealer:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))
RaidFinderQueueFrameRoleButtonHealer:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
RaidFinderQueueFrameRoleButtonHealer:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))

LFDQueueFrameRoleButtonDPS:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDQueueFrameRoleButtonDPS:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))
LFDQueueFrameRoleButtonDPS:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDQueueFrameRoleButtonDPS:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))
RaidFinderQueueFrameRoleButtonDPS:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
RaidFinderQueueFrameRoleButtonDPS:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))
RaidFinderQueueFrameRoleButtonDPS:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
RaidFinderQueueFrameRoleButtonDPS:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))

LFDQueueFrameRoleButtonTank:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDQueueFrameRoleButtonTank:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("TANK"))
LFDQueueFrameRoleButtonTank:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDQueueFrameRoleButtonTank:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("TANK"))
RaidFinderQueueFrameRoleButtonTank:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
RaidFinderQueueFrameRoleButtonTank:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("TANK"))
RaidFinderQueueFrameRoleButtonTank:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
RaidFinderQueueFrameRoleButtonTank:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("TANK"))

LFDQueueFrameRoleButtonTankShortageBorder:SetSize(48, 48)
LFDQueueFrameRoleButtonTankShortageBorder:SetTexture("Interface\\Common\\GoldRing")
LFDQueueFrameRoleButtonTankShortageBorder:ClearAllPoints()
LFDQueueFrameRoleButtonTankShortageBorder:SetPoint("CENTER", -1, 1)
LFDQueueFrameRoleButtonHealerShortageBorder:SetSize(48, 48)
LFDQueueFrameRoleButtonHealerShortageBorder:SetTexture("Interface\\Common\\GoldRing")
LFDQueueFrameRoleButtonHealerShortageBorder:ClearAllPoints()
LFDQueueFrameRoleButtonHealerShortageBorder:SetPoint("CENTER", -1, 1)
LFDQueueFrameRoleButtonDPSShortageBorder:SetSize(48, 48)
LFDQueueFrameRoleButtonDPSShortageBorder:SetTexture("Interface\\Common\\GoldRing")
LFDQueueFrameRoleButtonDPSShortageBorder:ClearAllPoints()
LFDQueueFrameRoleButtonDPSShortageBorder:SetPoint("CENTER", -1, 1)

RaidFinderQueueFrameRoleButtonTankShortageBorder:SetSize(48, 48)
RaidFinderQueueFrameRoleButtonTankShortageBorder:SetTexture("Interface\\Common\\GoldRing")
RaidFinderQueueFrameRoleButtonTankShortageBorder:ClearAllPoints()
RaidFinderQueueFrameRoleButtonTankShortageBorder:SetPoint("CENTER", -1, 1)
RaidFinderQueueFrameRoleButtonHealerShortageBorder:SetSize(48, 48)
RaidFinderQueueFrameRoleButtonHealerShortageBorder:SetTexture("Interface\\Common\\GoldRing")
RaidFinderQueueFrameRoleButtonHealerShortageBorder:ClearAllPoints()
RaidFinderQueueFrameRoleButtonHealerShortageBorder:SetPoint("CENTER", -1, 1)
RaidFinderQueueFrameRoleButtonDPSShortageBorder:SetSize(48, 48)
RaidFinderQueueFrameRoleButtonDPSShortageBorder:SetTexture("Interface\\Common\\GoldRing")
RaidFinderQueueFrameRoleButtonDPSShortageBorder:ClearAllPoints()
RaidFinderQueueFrameRoleButtonDPSShortageBorder:SetPoint("CENTER", -1, 1)

LFDQueueFrameRoleButtonTankIncentiveIcon:ClearAllPoints()
LFDQueueFrameRoleButtonTankIncentiveIcon:SetPoint("BOTTOMRIGHT", 7, -7)
LFDQueueFrameRoleButtonTankIncentiveIconBorder:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-REWARDRING")
LFDQueueFrameRoleButtonTankIncentiveIconBorder:SetTexCoord(0, 0.675, 0, 0.675)
LFDQueueFrameRoleButtonTankIncentiveIconBorder:ClearAllPoints()
LFDQueueFrameRoleButtonTankIncentiveIconBorder:SetAllPoints()
LFDQueueFrameRoleButtonTankIncentiveIconTexture:ClearAllPoints()
LFDQueueFrameRoleButtonTankIncentiveIconTexture:SetPoint("CENTER", -3, 3)
LFDQueueFrameRoleButtonHealerIncentiveIcon:ClearAllPoints()
LFDQueueFrameRoleButtonHealerIncentiveIcon:SetPoint("BOTTOMRIGHT", 7, -7)
LFDQueueFrameRoleButtonHealerIncentiveIconBorder:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-REWARDRING")
LFDQueueFrameRoleButtonHealerIncentiveIconBorder:SetTexCoord(0, 0.675, 0, 0.675)
LFDQueueFrameRoleButtonHealerIncentiveIconBorder:ClearAllPoints()
LFDQueueFrameRoleButtonHealerIncentiveIconBorder:SetAllPoints()
LFDQueueFrameRoleButtonHealerIncentiveIconTexture:ClearAllPoints()
LFDQueueFrameRoleButtonHealerIncentiveIconTexture:SetPoint("CENTER", -3, 3)
LFDQueueFrameRoleButtonDPSIncentiveIcon:ClearAllPoints()
LFDQueueFrameRoleButtonDPSIncentiveIcon:SetPoint("BOTTOMRIGHT", 7, -7)
LFDQueueFrameRoleButtonDPSIncentiveIconBorder:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-REWARDRING")
LFDQueueFrameRoleButtonDPSIncentiveIconBorder:SetTexCoord(0, 0.675, 0, 0.675)
LFDQueueFrameRoleButtonDPSIncentiveIconBorder:ClearAllPoints()
LFDQueueFrameRoleButtonDPSIncentiveIconBorder:SetAllPoints()
LFDQueueFrameRoleButtonDPSIncentiveIconTexture:ClearAllPoints()
LFDQueueFrameRoleButtonDPSIncentiveIconTexture:SetPoint("CENTER", -3, 3)

RaidFinderQueueFrameRoleButtonTankIncentiveIcon:ClearAllPoints()
RaidFinderQueueFrameRoleButtonTankIncentiveIcon:SetPoint("BOTTOMRIGHT", 7, -7)
RaidFinderQueueFrameRoleButtonTankIncentiveIconBorder:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-REWARDRING")
RaidFinderQueueFrameRoleButtonTankIncentiveIconBorder:SetTexCoord(0, 0.675, 0, 0.675)
RaidFinderQueueFrameRoleButtonTankIncentiveIconBorder:ClearAllPoints()
RaidFinderQueueFrameRoleButtonTankIncentiveIconBorder:SetAllPoints()
RaidFinderQueueFrameRoleButtonTankIncentiveIconTexture:ClearAllPoints()
RaidFinderQueueFrameRoleButtonTankIncentiveIconTexture:SetPoint("CENTER", -3, 3)
RaidFinderQueueFrameRoleButtonHealerIncentiveIcon:ClearAllPoints()
RaidFinderQueueFrameRoleButtonHealerIncentiveIcon:SetPoint("BOTTOMRIGHT", 7, -7)
RaidFinderQueueFrameRoleButtonHealerIncentiveIconBorder:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-REWARDRING")
RaidFinderQueueFrameRoleButtonHealerIncentiveIconBorder:SetTexCoord(0, 0.675, 0, 0.675)
RaidFinderQueueFrameRoleButtonHealerIncentiveIconBorder:ClearAllPoints()
RaidFinderQueueFrameRoleButtonHealerIncentiveIconBorder:SetAllPoints()
RaidFinderQueueFrameRoleButtonHealerIncentiveIconTexture:ClearAllPoints()
RaidFinderQueueFrameRoleButtonHealerIncentiveIconTexture:SetPoint("CENTER", -3, 3)
RaidFinderQueueFrameRoleButtonDPSIncentiveIcon:ClearAllPoints()
RaidFinderQueueFrameRoleButtonDPSIncentiveIcon:SetPoint("BOTTOMRIGHT", 7, -7)
RaidFinderQueueFrameRoleButtonDPSIncentiveIconBorder:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-REWARDRING")
RaidFinderQueueFrameRoleButtonDPSIncentiveIconBorder:SetTexCoord(0, 0.675, 0, 0.675)
RaidFinderQueueFrameRoleButtonDPSIncentiveIconBorder:ClearAllPoints()
RaidFinderQueueFrameRoleButtonDPSIncentiveIconBorder:SetAllPoints()
RaidFinderQueueFrameRoleButtonDPSIncentiveIconTexture:ClearAllPoints()
RaidFinderQueueFrameRoleButtonDPSIncentiveIconTexture:SetPoint("CENTER", -3, 3)

LFDRoleCheckPopupRoleButtonDPS:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDRoleCheckPopupRoleButtonDPS:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))
LFDRoleCheckPopupRoleButtonDPS:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDRoleCheckPopupRoleButtonDPS:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))
LFDRoleCheckPopupRoleButtonHealer:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDRoleCheckPopupRoleButtonHealer:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))
LFDRoleCheckPopupRoleButtonHealer:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDRoleCheckPopupRoleButtonHealer:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))
LFDRoleCheckPopupRoleButtonTank:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDRoleCheckPopupRoleButtonTank:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("TANK"))
LFDRoleCheckPopupRoleButtonTank:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDRoleCheckPopupRoleButtonTank:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("TANK"))

LFGInvitePopupRoleButtonDPS:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFGInvitePopupRoleButtonDPS:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))
LFGInvitePopupRoleButtonDPS:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFGInvitePopupRoleButtonDPS:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))
LFGInvitePopupRoleButtonHealer:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFGInvitePopupRoleButtonHealer:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))
LFGInvitePopupRoleButtonHealer:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFGInvitePopupRoleButtonHealer:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))
LFGInvitePopupRoleButtonTank:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFGInvitePopupRoleButtonTank:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("TANK"))
LFGInvitePopupRoleButtonTank:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFGInvitePopupRoleButtonTank:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("TANK"))

RaidFinderQueueFrameScrollFrame.ScrollBar:SetSize(25, 560)
RaidFinderQueueFrameScrollFrame.ScrollBar:ClearAllPoints()
RaidFinderQueueFrameScrollFrame.ScrollBar:SetPoint("TOPLEFT", RaidFinderQueueFrameScrollFrame, "TOPRIGHT", 2, 3)
RaidFinderQueueFrameScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", RaidFinderQueueFrameScrollFrame, "BOTTOMRIGHT", 5, 0)

if (RaidFinderQueueFrameScrollFrame.ScrollBar.BG == nil) then
	RaidFinderQueueFrameScrollFrame.ScrollBar.BG = RaidFinderQueueFrameScrollFrame.ScrollBar:CreateTexture(nil, "BACKGROUND")
	RaidFinderQueueFrameScrollFrame.ScrollBar.BG:SetColorTexture(0, 0, 0, .65)
	RaidFinderQueueFrameScrollFrame.ScrollBar.BG:SetAllPoints()
end

ApplyScrollBarArrow(RaidFinderQueueFrameScrollFrame.ScrollBar)
ApplyScrollBarTrack(RaidFinderQueueFrameScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(RaidFinderQueueFrameScrollFrame.ScrollBar.Track.Thumb)

for _, roleButton in pairs({
	_G.LFDRoleCheckPopupRoleButtonDPS,
	_G.LFDRoleCheckPopupRoleButtonHealer,
	_G.LFDRoleCheckPopupRoleButtonTank,
	_G.LFDQueueFrameRoleButtonHealer,
	_G.LFDQueueFrameRoleButtonDPS,
	_G.LFDQueueFrameRoleButtonLeader,
	_G.LFDQueueFrameRoleButtonTank,
	_G.RaidFinderQueueFrameRoleButtonHealer,
	_G.RaidFinderQueueFrameRoleButtonDPS,
	_G.RaidFinderQueueFrameRoleButtonLeader,
	_G.RaidFinderQueueFrameRoleButtonTank,
	_G.LFGInvitePopupRoleButtonTank,
	_G.LFGInvitePopupRoleButtonHealer,
	_G.LFGInvitePopupRoleButtonDPS,
	_G.LFGListApplicationDialog.TankButton,
	_G.LFGListApplicationDialog.HealerButton,
	_G.LFGListApplicationDialog.DamagerButton
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

ApplyDropDown(LFDQueueFrameTypeDropdown)
ApplyDropDown(RaidFinderQueueFrameSelectionDropdown)
ApplyDropDown(LFGListEntryCreationGroupDropdown)
ApplyDropDown(LFGListEntryCreationActivityDropdown)
ApplyDropDown(LFGListEntryCreationPlayStyleDropdown)
ApplyFilterDropDown(LFGListFrame.SearchPanel.FilterButton)

LFDQueueFrameTypeDropdown:SetWidth(195)
LFDQueueFrameTypeDropdown:SetPoint("BOTTOMLEFT", 135, 291)
LFDQueueFrameTypeDropdown.Text:SetJustifyH("RIGHT")
LFDQueueFrameTypeDropdown.Text:SetPoint("TOPLEFT", 9, -7)
LFDQueueFrameTypeDropdownName:SetPoint("RIGHT", LFDQueueFrameTypeDropdown, "LEFT", -18, 0)

RaidFinderQueueFrameSelectionDropdown:SetWidth(195)
RaidFinderQueueFrameSelectionDropdown:SetPoint("BOTTOMLEFT", 135, 293)
RaidFinderQueueFrameSelectionDropdown.Text:SetJustifyH("RIGHT")
RaidFinderQueueFrameSelectionDropdown.Text:SetPoint("TOPLEFT", 9, -6)
RaidFinderQueueFrameSelectionDropdownName:SetPoint("RIGHT", RaidFinderQueueFrameSelectionDropdown, "LEFT", -18, 0)

hooksecurefunc("LFG_UpdateAvailableRoleButton", function(button, canBeRole)
	if ( button.background ) then
		button.background:SetTexture("Interface\\LFGFrame\\UI-LFG-ICONS-ROLEBACKGROUNDS")
		button.background:SetTexCoord(GetBackgroundTexCoordsForRole(button.role))
		button.background:SetAlpha(0.6)
	end

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

hooksecurefunc('LFG_DisableRoleButton', function(button)
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

hooksecurefunc('LFG_EnableRoleButton', function(button)
	SetDesaturation(button:GetNormalTexture(), false)
	if button.cover then
		button.cover:Hide()
	end
end)

hooksecurefunc('LFGDungeonReadyPopup_Update', function()
	local proposalExists, id, typeID, subtypeID, name, backgroundTexture, role, hasResponded, totalEncounters, completedEncounters, numMembers, isLeader, _, _, isSilent = GetLFGProposal()
	
	if not LFGDungeonReadyDialog.SetBackdrop then
		Mixin(LFGDungeonReadyDialog, BackdropTemplateMixin)
	end

	if (LFGDungeonReadyDialog.filigree == nil) then
		LFGDungeonReadyDialog.filigree = LFGDungeonReadyDialog:CreateTexture(nil, "OVERLAY")
	end

	if ( subtypeID == LFG_SUBTYPEID_RAID ) then
		LFGDungeonReadyDialog.filigree:SetTexture("Interface\\LFGFrame\\LFR-Texture")
		LFGDungeonReadyDialog.filigree:SetTexCoord(0.00195313, 0.57617188, 0.58593750, 0.78125000)
		LFGDungeonReadyDialog.filigree:SetSize(294, 50)
		LFGDungeonReadyDialog.filigree:SetPoint("TOPLEFT", 7, -8)
		LFGDungeonReadyDialog.bottomArt:SetTexture("Interface\\LFGFrame\\LFR-Texture")
		LFGDungeonReadyDialog.bottomArt:SetTexCoord(0.00195313, 0.55273438, 0.29296875, 0.57812500)
		LFGDungeonReadyDialog.bottomArt:SetSize(282, 73)
		LFGDungeonReadyDialog:SetBackdrop(BACKDROP_GOLD_DIALOG_32_32)
	else
		LFGDungeonReadyDialog.filigree:SetTexture("Interface\\LFGFrame\\UI-LFG-FILIGREE")
		LFGDungeonReadyDialog.filigree:SetTexCoord(0.02734, 0.59765, 0.578125, 1.0)
		LFGDungeonReadyDialog.filigree:SetSize(292, 54)
		LFGDungeonReadyDialog.filigree:SetPoint("TOPLEFT", 7, -3)
		LFGDungeonReadyDialog.bottomArt:SetTexture("Interface\\LFGFrame\\UI-LFG-FILIGREE")
		if ( subtypeID == LFG_SUBTYPEID_SCENARIO or subtypeID == LFG_SUBTYPEID_FLEXRAID ) then
			LFGDungeonReadyDialog.bottomArt:SetTexCoord(0.0, 0.18, 0.0, 0.5625)
		else
			LFGDungeonReadyDialog.bottomArt:SetTexCoord(0.0, 0.5605, 0.0, 0.5625)
		end
		LFGDungeonReadyDialog.bottomArt:SetSize(287, 72)
		LFGDungeonReadyDialog:SetBackdrop(BACKDROP_DIALOG_32_32)
	end

	if ( subtypeID == LFG_SUBTYPEID_SCENARIO ) then
		LFGDungeonReadyDialog.background:SetDrawLayer("BACKGROUND")
		if ( LFG_IsHeroicScenario(id) ) then
			LFGDungeonReadyDialog.background:SetTexture("Interface\\LFGFrame\\UI-LFG-BACKGROUND-HeroicScenario")
		else
			LFGDungeonReadyDialog.background:SetTexture("Interface\\LFGFrame\\UI-LFG-BACKGROUND-RandomScenario")
		end
	end

	if ( subtypeID == LFG_SUBTYPEID_SCENARIO or subtypeID == LFG_SUBTYPEID_FLEXRAID ) then
		LFGDungeonReadyDialogRewardsFrame:SetPoint("BOTTOM", LFGDungeonReadyDialogRoleIcon, "BOTTOM", 0, 15)
	else
		LFGDungeonReadyDialogRewardsFrame:SetPoint("BOTTOMLEFT", LFGDungeonReadyDialogRoleIcon, "BOTTOMRIGHT", 19, 15)
	end

	if LFGDungeonReadyDialogRoleIcon then
		LFGDungeonReadyDialogRoleIconTexture:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		LFGDungeonReadyDialogRoleIconTexture:SetAllPoints()
		if role == 'DAMAGER' then
			LFGDungeonReadyDialogRoleIconTexture:SetTexCoord(GetTexCoordsForRole("DAMAGER"))
		elseif role == 'TANK' then
			LFGDungeonReadyDialogRoleIconTexture:SetTexCoord(GetTexCoordsForRole("TANK"))
		elseif role == 'HEALER' then
			LFGDungeonReadyDialogRoleIconTexture:SetTexCoord(GetTexCoordsForRole("HEALER"))
		end
	end

	if LFGDungeonReadyDialog.Center then
		LFGDungeonReadyDialog.Center:SetDrawLayer("BACKGROUND", -8)
	end
end)

hooksecurefunc('LFGDungeonReadyDialog_UpdateRewards', function()
	for i = 1, LFD_MAX_REWARDS do
		local reward = LFGDungeonReadyDialogRewardsFrame.Rewards[i]
		reward:SetSize(40, 40)
		reward.texture:SetSize(30, 30)
		reward.texture:SetPoint("CENTER", -3, 3)
		_G['LFGDungeonReadyDialogRewardsFrameReward'..i..'Border']:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-REWARDRING")
		_G['LFGDungeonReadyDialogRewardsFrameReward'..i..'Border']:SetTexCoord(0, 0.675, 0, 0.675)
		_G['LFGDungeonReadyDialogRewardsFrameReward'..i..'Border']:SetAllPoints()
	end
end)

hooksecurefunc('QueueStatusEntry_SetFullDisplay', function(entry, _, _, _, isTank, isHealer, isDPS, totalTanks, totalHealers, totalDPS, tankNeeds, healerNeeds, dpsNeeds)
	if not entry then return end

	local nextRoleIcon = 1;
	if ( isDPS ) then
		local icon = entry["RoleIcon"..nextRoleIcon];
		icon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		icon:SetTexCoord(GetTexCoordsForRole("DAMAGER"))
		icon:Show()
		nextRoleIcon = nextRoleIcon + 1;
	end
	if ( isHealer ) then
		local icon = entry["RoleIcon"..nextRoleIcon];
		icon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		icon:SetTexCoord(GetTexCoordsForRole("HEALER"))
		icon:Show()
		nextRoleIcon = nextRoleIcon + 1;
	end
	if ( isTank ) then
		local icon = entry["RoleIcon"..nextRoleIcon];
		icon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		icon:SetTexCoord(GetTexCoordsForRole("TANK"))
		icon:Show()
		nextRoleIcon = nextRoleIcon + 1;
	end

	entry.TanksFound.RoleIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
	entry.TanksFound.RoleIcon:SetTexCoord(GetTexCoordsForRole("TANK"))
	entry.TanksFound.RoleIcon:SetDesaturated(false)
	entry.TanksFound.RoleIcon:SetVertexColor(1, 1, 1)
	entry.HealersFound.RoleIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
	entry.HealersFound.RoleIcon:SetTexCoord(GetTexCoordsForRole("HEALER"))
	entry.HealersFound.RoleIcon:SetDesaturated(false)
	entry.HealersFound.RoleIcon:SetVertexColor(1, 1, 1)
	entry.DamagersFound.RoleIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
	entry.DamagersFound.RoleIcon:SetTexCoord(GetTexCoordsForRole("DAMAGER"))
	entry.DamagersFound.RoleIcon:SetDesaturated(false)
	entry.DamagersFound.RoleIcon:SetVertexColor(1, 1, 1)

	if ( totalTanks and totalHealers and totalDPS ) then
		if tankNeeds ~= 0 then
			entry.TanksFound.RoleIcon:SetDesaturated(true)
			entry.TanksFound.RoleIcon:SetVertexColor(0.7, 0.7, 0.7)
		end
		if healerNeeds ~= 0 then
			entry.HealersFound.RoleIcon:SetDesaturated(true)
			entry.HealersFound.RoleIcon:SetVertexColor(0.7, 0.7, 0.7)
		end
		if dpsNeeds ~= 0 then
			entry.DamagersFound.RoleIcon:SetDesaturated(true)
			entry.DamagersFound.RoleIcon:SetVertexColor(0.7, 0.7, 0.7)
		end
	end
end)

hooksecurefunc('LFGDungeonReadyStatusIndividual_UpdateIcon', function(button)
	local isLeader, role, level, responded, accepted, name, class = GetLFGProposalMember(button:GetID())

	button.texture:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
	button.texture:SetTexCoord(GetTexCoordsForRole(role))

	button.statusIcon:SetSize(30, 30)
	button.statusIcon:SetTexture("Interface\\RaidFrame\\ReadyCheck-Waiting")
	button.statusIcon:ClearAllPoints()
	button.statusIcon:SetPoint("BOTTOMLEFT", 5, 0)

	if ( not responded ) then
		button.statusIcon:SetTexture("Interface\\RaidFrame\\ReadyCheck-Waiting")
	elseif ( accepted ) then
		button.statusIcon:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")
	else
		button.statusIcon:SetTexture("Interface\\RaidFrame\\ReadyCheck-NotReady")
	end
end)

hooksecurefunc('LFGDungeonReadyStatusGrouped_UpdateIcon', function(button, buttonRole)
	local isLeader, role, level, responded, accepted, name, class = GetLFGProposalMember(button:GetID())

	button.texture:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
	button.texture:SetTexCoord(GetTexCoordsForRole(buttonRole))

	button.statusIcon:SetSize(30, 30)
	button.statusIcon:SetTexture("Interface\\RaidFrame\\ReadyCheck-Waiting")
	button.statusIcon:ClearAllPoints()
	button.statusIcon:SetPoint("BOTTOMLEFT", 5, 0)

	if ( not responded ) then
		button.statusIcon:SetTexture("Interface\\RaidFrame\\ReadyCheck-Waiting")
	elseif ( accepted ) then
		button.statusIcon:SetTexture("Interface\\RaidFrame\\ReadyCheck-Ready")
	else
		button.statusIcon:SetTexture("Interface\\RaidFrame\\ReadyCheck-NotReady")
	end
end)

hooksecurefunc('LFGListInviteDialog_Show', function(self, resultID)
	local _, status, _, _, role = C_LFGList.GetApplicationInfo(resultID)

	self.RoleIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
	self.RoleIcon:SetTexCoord(GetTexCoordsForRole(role))
end)

hooksecurefunc('LFGListGroupDataDisplayRoleCount_Update', function(self)
	self.TankIcon:SetAtlas("groupfinder-icon-role-large-tank")
	self.HealerIcon:SetAtlas("groupfinder-icon-role-large-heal")
	self.DamagerIcon:SetAtlas("groupfinder-icon-role-large-dps")
end)

hooksecurefunc('LFGListApplicationDialog_UpdateRoles', function(self)
	self.TankButton:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
	self.TankButton:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("TANK"))
	self.HealerButton:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
	self.HealerButton:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))
	self.DamagerButton:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
	self.DamagerButton:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))
end)

hooksecurefunc('LFGListApplicationViewer_UpdateRoleIcons', function(member, grayedOut, tank, healer, damage)
	local LFG_LIST_GROUP_DATA_ATLASES = {
		TANK = "groupfinder-icon-role-large-tank",
		HEALER = "groupfinder-icon-role-large-heal",
		DAMAGER = "groupfinder-icon-role-large-dps",
	};

	local role1 = tank and "TANK" or (healer and "HEALER" or (damage and "DAMAGER"))
	local role2 = (tank and healer and "HEALER") or ((tank or healer) and damage and "DAMAGER")
	local role3 = (tank and healer and damage and "DAMAGER")
	member.RoleIcon1:GetNormalTexture():SetAtlas(LFG_LIST_GROUP_DATA_ATLASES[role1])
	member.RoleIcon1:GetHighlightTexture():SetAtlas(LFG_LIST_GROUP_DATA_ATLASES[role1])
	if ( role2 ) then
		member.RoleIcon2:GetNormalTexture():SetAtlas(LFG_LIST_GROUP_DATA_ATLASES[role2])
		member.RoleIcon2:GetHighlightTexture():SetAtlas(LFG_LIST_GROUP_DATA_ATLASES[role2])
	end
	if ( role3 ) then
		member.RoleIcon3:GetNormalTexture():SetAtlas(LFG_LIST_GROUP_DATA_ATLASES[role3])
		member.RoleIcon3:GetHighlightTexture():SetAtlas(LFG_LIST_GROUP_DATA_ATLASES[role3])
	end
end)

hooksecurefunc('LFGListGroupDataDisplayEnumerate_Update', function(self, numPlayers, displayData, disabled, iconOrder)
	local LFG_LIST_GROUP_DATA_ATLASES = {
		TANK = "groupfinder-icon-role-large-tank",
		HEALER = "groupfinder-icon-role-large-heal",
		DAMAGER = "groupfinder-icon-role-large-dps",
	};

	--Note that icons are numbered from right to left
	if iconOrder == LFG_LIST_GROUP_DATA_ROLE_ORDER then
		local iconIndex = numPlayers;
		for i=1, #iconOrder do
			local role = iconOrder[i];
			for j=1, displayData[iconOrder[i]] do
				local icon = self.Icons[iconIndex];
				icon.RoleIconWithBackground:Hide()
				icon.RoleIcon:Show()
				icon.RoleIcon:SetSize(18, 18)
				icon.RoleIcon:SetAtlas(LFG_LIST_GROUP_DATA_ATLASES[role], false)
				icon.ClassCircle:Hide()
				iconIndex = iconIndex - 1;
				if ( iconIndex < 1 ) then
					return;
				end
			end
		end
	end
end)

hooksecurefunc("LFGRewardsFrame_SetItemButton", function(parentFrame, _, index, _, _, texture, _, _, _, _, _, showTankIcon, showHealerIcon, showDamageIcon)
	local parentName = parentFrame:GetName()
	local frame = _G[parentName.."Item"..index];

	if frame then
		local roleIcon = frame.roleIcon1;
		if ( showTankIcon ) then
			roleIcon.texture:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES")
			roleIcon.texture:SetTexCoord(GetTexCoordsForRoleSmallCircle("TANK"))
			roleIcon.role = "TANK";
			roleIcon:Show()
			roleIcon = frame.roleIcon2;
		end
		if ( showHealerIcon ) then
			roleIcon.texture:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES")
			roleIcon.texture:SetTexCoord(GetTexCoordsForRoleSmallCircle("HEALER"))
			roleIcon.role = "HEALER";
			roleIcon:Show()
			roleIcon = frame.roleIcon2;
		end
		if ( showDamageIcon ) then
			roleIcon.texture:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES")
			roleIcon.texture:SetTexCoord(GetTexCoordsForRoleSmallCircle("DAMAGER"))
			roleIcon.role = "DAMAGER";
			roleIcon:Show()
			roleIcon = frame.roleIcon2;
		end
	end
end)

ApplyDialogBorder(RolePollPopup.Border)

RolePollPopupCloseButton:SetSize(32, 32)
RolePollPopupCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
RolePollPopupCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
RolePollPopupCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
RolePollPopupCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
RolePollPopupCloseButton:ClearAllPoints()
RolePollPopupCloseButton:SetPoint("TOPRIGHT", -2, -2)

hooksecurefunc("RolePollPopupRoleButton_Enable", function(button)
	RolePollPopupRoleButtonDPS:SetSize(70, 70)
	RolePollPopupRoleButtonDPS:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
	RolePollPopupRoleButtonDPS:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))

	RolePollPopupRoleButtonHealer:SetSize(70, 70)
	RolePollPopupRoleButtonHealer:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
	RolePollPopupRoleButtonHealer:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))

	RolePollPopupRoleButtonTank:SetSize(70, 70)
	RolePollPopupRoleButtonTank:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
	RolePollPopupRoleButtonTank:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("TANK"))

	SetDesaturation(button:GetNormalTexture(), false)
	if button.cover then
		button.cover:Hide()
		button.cover:SetAlpha(1)
	end
end)

hooksecurefunc("RolePollPopupRoleButton_Disable", function(button)
	SetDesaturation(button:GetNormalTexture(), true)
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

for _, rolePollButton in pairs({
	_G.RolePollPopupRoleButtonTank,
	_G.RolePollPopupRoleButtonHealer,
	_G.RolePollPopupRoleButtonDPS
}) do
	local checkButton = rolePollButton.checkButton

	checkButton:SetSize(24, 24)
	checkButton:ClearAllPoints()
	checkButton:SetPoint("BOTTOMLEFT", -5, -5)
	checkButton.NormalTexture:SetTexture("Interface\\Buttons\\UI-RadioButton")
	checkButton.NormalTexture:SetTexCoord(0, 0.25, 0, 1)
	checkButton.HighlightTexture:SetTexture("Interface\\Buttons\\UI-RadioButton")
	checkButton.HighlightTexture:SetTexCoord(0.5, 0.75, 0, 1)
	checkButton.HighlightTexture:SetAlpha(1)
	checkButton.CheckedTexture:SetTexture("Interface\\Buttons\\UI-RadioButton")
	checkButton.CheckedTexture:SetTexCoord(0.25, 0.5, 0, 1)
end

hooksecurefunc("LFGRewardsFrame_UpdateFrame", function(parentFrame, dungeonID)
	if (dungeonID == 2634 or dungeonID == 744 or dungeonID == 995 or dungeonID == 1146 or dungeonID == 1453 or dungeonID == 1971 or dungeonID == 2274 or dungeonID == 2874) then
		parentFrame.title:SetText(LFG_TYPE_RANDOM_TIMEWALKER_DUNGEON)
		parentFrame.description:SetText(LFD_TIMEWALKER_RANDOM_EXPLANATION)
	end

	parentFrame.title:ClearAllPoints()
	parentFrame.title:SetPoint("TOPLEFT", 10, -8)
end)