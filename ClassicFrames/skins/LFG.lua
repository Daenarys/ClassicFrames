if not _G.PVEFrame then return end

PVEFramePortrait:SetSize(61, 61)
PVEFramePortrait:ClearAllPoints()
PVEFramePortrait:SetPoint("TOPLEFT", -6, 8)

GroupFinderFrame:HookScript("OnShow", function()
	SetPortraitToTexture(PVEFramePortrait, "Interface\\LFGFrame\\UI-LFG-PORTRAIT")
end)

LFDQueueFrameSpecific.ScrollBar:SetSize(25, 560)
LFDQueueFrameSpecific.ScrollBar:ClearAllPoints()
LFDQueueFrameSpecific.ScrollBar:SetPoint("TOPLEFT", LFDQueueFrameSpecific.ScrollBox, "TOPRIGHT", 2, 3)
LFDQueueFrameSpecific.ScrollBar:SetPoint("BOTTOMLEFT", LFDQueueFrameSpecific.ScrollBox, "BOTTOMRIGHT", 5, -1)

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

LFGDungeonReadyDialogCloseButton:SetSize(32, 32)
LFGDungeonReadyDialogCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
LFGDungeonReadyDialogCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-HideButton-Up")
LFGDungeonReadyDialogCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-HideButton-Down")
LFGDungeonReadyDialogCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
LFGDungeonReadyDialogCloseButton:ClearAllPoints()
LFGDungeonReadyDialogCloseButton:SetPoint("TOPRIGHT", -2, -2)

LFGDungeonReadyDialogBottomArt:SetSize(287, 72)
LFGDungeonReadyDialogBottomArt:SetTexture("Interface\\LFGFrame\\UI-LFG-FILIGREE")
LFGDungeonReadyDialogBottomArt:SetTexCoord(0, 0.5605, 0, 0.5625)
LFGDungeonReadyDialogBottomArt:ClearAllPoints()
LFGDungeonReadyDialogBottomArt:SetPoint("BOTTOM", 0, 55)

LFGDungeonReadyStatusCloseButton:SetSize(32, 32)
LFGDungeonReadyStatusCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
LFGDungeonReadyStatusCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-HideButton-Up")
LFGDungeonReadyStatusCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-HideButton-Down")
LFGDungeonReadyStatusCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
LFGDungeonReadyStatusCloseButton:ClearAllPoints()
LFGDungeonReadyStatusCloseButton:SetPoint("TOPRIGHT", -2, -2)

LFGListInviteDialog.RoleIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
ApplyDialogBorder(LFDReadyCheckPopup.Border)
ApplyDialogBorder(LFDRoleCheckPopup.Border)
ApplyDialogBorder(LFGDungeonReadyStatus.Border)
ApplyDialogBorder(LFGInvitePopup.Border)
ApplyDialogBorder(LFGListApplicationDialog.Border)
ApplyDialogBorder(LFGListCreateRoleDialog.Border)
ApplyDialogBorder(LFGListInviteDialog.Border)

LFDQueueFrameRoleButtonLeader:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDQueueFrameRoleButtonLeader:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("GUIDE"))
LFDQueueFrameRoleButtonLeader:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDQueueFrameRoleButtonLeader:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("GUIDE"))

LFDQueueFrameRoleButtonHealer:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDQueueFrameRoleButtonHealer:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))
LFDQueueFrameRoleButtonHealer:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDQueueFrameRoleButtonHealer:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))

LFDQueueFrameRoleButtonDPS:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDQueueFrameRoleButtonDPS:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))
LFDQueueFrameRoleButtonDPS:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDQueueFrameRoleButtonDPS:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))

LFDQueueFrameRoleButtonTank:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDQueueFrameRoleButtonTank:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("TANK"))
LFDQueueFrameRoleButtonTank:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
LFDQueueFrameRoleButtonTank:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("TANK"))

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

for _, roleButton in pairs({
	_G.LFDRoleCheckPopupRoleButtonDPS,
	_G.LFDRoleCheckPopupRoleButtonHealer,
	_G.LFDRoleCheckPopupRoleButtonTank,
	_G.LFDQueueFrameRoleButtonHealer,
	_G.LFDQueueFrameRoleButtonDPS,
	_G.LFDQueueFrameRoleButtonLeader,
	_G.LFDQueueFrameRoleButtonTank,
	_G.LFGListCreateRoleDialog.DamagerButton,
	_G.LFGListCreateRoleDialog.HealerButton,
	_G.LFGListCreateRoleDialog.TankButton,
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

	LFGDungeonReadyDialog.Border:Hide()

	local DUNGEON_BACKDROP_TABLE = {
		bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
		tile = true,
		edge = true,
		tileSize = 32,
		edgeSize = 32,
		insets = { left = 11, right = 12, top = 12, bottom = 11 }}
	
	local RAID_BACKDROP_TABLE = {
		bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Gold-Border",
		tile = true,
		edge = true,
		tileSize = 32,
		edgeSize = 32,
		insets = { left = 11, right = 12, top = 12, bottom = 11 }}

	LFGDungeonReadyDialogRoleIconTexture:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
	LFGDungeonReadyDialogRoleIconTexture:SetAllPoints()

	LFGDungeonReadyDialogRoleIconLeaderIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES")
	LFGDungeonReadyDialogRoleIconLeaderIcon:SetTexCoord(0, 0.296875, 0.015625, 0.3125)

	LFGDungeonReadyDialog:CreateTexture("LFGDungeonReadyDialogfiligree", "OVERLAY")
	LFGDungeonReadyDialog.filigree = LFGDungeonReadyDialogfiligree

	local showRole = true	-- scenarios will set this to false
	if ( subtypeID == LFG_SUBTYPEID_RAID ) then
		LFGDungeonReadyDialog.filigree:SetTexture("Interface\\LFGFrame\\LFR-Texture")
		LFGDungeonReadyDialog.filigree:SetTexCoord(0.00195313, 0.57617188, 0.58593750, 0.78125000)
		LFGDungeonReadyDialog.filigree:SetSize(294, 50)
		LFGDungeonReadyDialog.filigree:SetPoint("TOPLEFT", 7, -8)
		LFGDungeonReadyDialog.bottomArt:SetTexture("Interface\\LFGFrame\\LFR-Texture")
		LFGDungeonReadyDialog.bottomArt:SetTexCoord(0.00195313, 0.55273438, 0.29296875, 0.57812500)
		LFGDungeonReadyDialog.bottomArt:SetSize(282, 73)
		LFGDungeonReadyDialog:SetBackdrop(RAID_BACKDROP_TABLE)
	else
		LFGDungeonReadyDialog.filigree:SetTexture("Interface\\LFGFrame\\UI-LFG-FILIGREE")
		LFGDungeonReadyDialog.filigree:SetTexCoord(0.02734, 0.59765, 0.578125, 1.0)
		LFGDungeonReadyDialog.filigree:SetSize(292, 54)
		LFGDungeonReadyDialog.filigree:SetPoint("TOPLEFT", 7, -3)
		LFGDungeonReadyDialog.bottomArt:SetTexture("Interface\\LFGFrame\\UI-LFG-FILIGREE")
		if ( subtypeID == LFG_SUBTYPEID_SCENARIO or subtypeID == LFG_SUBTYPEID_FLEXRAID ) then
			showRole = false
			LFGDungeonReadyDialog.bottomArt:SetTexCoord(0.0, 0.18, 0.0, 0.5625)
		else
			LFGDungeonReadyDialog.bottomArt:SetTexCoord(0.0, 0.5605, 0.0, 0.5625)
		end
		LFGDungeonReadyDialog.bottomArt:SetSize(287, 72)
		LFGDungeonReadyDialog:SetBackdrop(DUNGEON_BACKDROP_TABLE)
	end

	if _G.LFGDungeonReadyDialogRoleIcon:IsShown() then
		local _, _, _, _, _, _, role = GetLFGProposal()
		if role == 'DAMAGER' then
			_G.LFGDungeonReadyDialogRoleIconTexture:SetTexCoord(GetTexCoordsForRole("DAMAGER"))
		elseif role == 'TANK' then
			_G.LFGDungeonReadyDialogRoleIconTexture:SetTexCoord(GetTexCoordsForRole("TANK"))
		elseif role == 'HEALER' then
			_G.LFGDungeonReadyDialogRoleIconTexture:SetTexCoord(GetTexCoordsForRole("HEALER"))
		end
	end
end)

hooksecurefunc('LFGDungeonReadyDialog_UpdateRewards', function(dungeonID, role)
	local doneToday, moneyAmount, moneyVar, experienceGained, experienceVar, numRewards, spellID = GetLFGDungeonRewards(dungeonID)

	for i = 1, LFD_MAX_REWARDS do
		local reward = LFGDungeonReadyDialogRewardsFrame.Rewards[i]
		reward:SetSize(40, 40)
	end

	if _G.LFGDungeonReadyDialogRewardsFrameReward1 then
		LFGDungeonReadyDialogRewardsFrameReward1Texture:SetSize(30, 30)
		LFGDungeonReadyDialogRewardsFrameReward1Texture:SetPoint("CENTER", -3, 3)
		LFGDungeonReadyDialogRewardsFrameReward1Border:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-REWARDRING")
		LFGDungeonReadyDialogRewardsFrameReward1Border:SetTexCoord(0, 0.675, 0, 0.675)
		LFGDungeonReadyDialogRewardsFrameReward1Border:SetAllPoints()
	end
	if _G.LFGDungeonReadyDialogRewardsFrameReward2 then
		LFGDungeonReadyDialogRewardsFrameReward2Texture:SetSize(30, 30)
		LFGDungeonReadyDialogRewardsFrameReward2Texture:SetPoint("CENTER", -3, 3)
		LFGDungeonReadyDialogRewardsFrameReward2Border:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-REWARDRING")
		LFGDungeonReadyDialogRewardsFrameReward2Border:SetTexCoord(0, 0.675, 0, 0.675)
		LFGDungeonReadyDialogRewardsFrameReward2Border:SetAllPoints()
	end
end)

hooksecurefunc('QueueStatusEntry_SetFullDisplay', function(entry, _, _, _, isTank, isHealer, isDPS, totalTanks, totalHealers, totalDPS, tankNeeds, healerNeeds, dpsNeeds)
	if not entry then return end

	local nextRoleIcon = 1
	if ( isDPS ) then
		local icon = entry["RoleIcon"..nextRoleIcon]
		icon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		icon:SetTexCoord(GetTexCoordsForRole("DAMAGER"))
		icon:Show()
		nextRoleIcon = nextRoleIcon + 1
	end
	if ( isHealer ) then
		local icon = entry["RoleIcon"..nextRoleIcon]
		icon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		icon:SetTexCoord(GetTexCoordsForRole("HEALER"))
		icon:Show()
		nextRoleIcon = nextRoleIcon + 1
	end
	if ( isTank ) then
		local icon = entry["RoleIcon"..nextRoleIcon]
		icon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		icon:SetTexCoord(GetTexCoordsForRole("TANK"))
		icon:Show()
		nextRoleIcon = nextRoleIcon + 1
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

	if role == 'DAMAGER' then
		button.texture:SetTexCoord(GetTexCoordsForRole("DAMAGER"))
	elseif role == 'TANK' then
		button.texture:SetTexCoord(GetTexCoordsForRole("TANK"))
	elseif role == 'HEALER' then
		button.texture:SetTexCoord(GetTexCoordsForRole("HEALER"))
	end

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

	if buttonRole == 'DAMAGER' then
		button.texture:SetTexCoord(GetTexCoordsForRole("DAMAGER"))
	elseif buttonRole == 'TANK' then
		button.texture:SetTexCoord(GetTexCoordsForRole("TANK"))
	elseif buttonRole == 'HEALER' then
		button.texture:SetTexCoord(GetTexCoordsForRole("HEALER"))
	end

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
	}

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
	}

	--Note that icons are numbered from right to left
	local iconIndex = numPlayers
	for i=1, #iconOrder do
		for j=1, displayData[iconOrder[i]] do
			self.Icons[iconIndex]:SetAtlas(LFG_LIST_GROUP_DATA_ATLASES[iconOrder[i]], false)
			iconIndex = iconIndex - 1
			if ( iconIndex < 1 ) then
				return
			end
		end
	end
end)

hooksecurefunc("LFGRewardsFrame_SetItemButton", function(parentFrame, _, index, _, _, texture, _, _, _, _, _, showTankIcon, showHealerIcon, showDamageIcon)
	local parentName = parentFrame:GetName()
	local frame = _G[parentName.."Item"..index]

	if frame then
		local roleIcon = frame.roleIcon1
		if ( showTankIcon ) then
			roleIcon.texture:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES")
			roleIcon.texture:SetTexCoord(GetTexCoordsForRoleSmallCircle("TANK"))
			roleIcon.role = "TANK"
			roleIcon:Show()
			roleIcon = frame.roleIcon2
		end
		if ( showHealerIcon ) then
			roleIcon.texture:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES")
			roleIcon.texture:SetTexCoord(GetTexCoordsForRoleSmallCircle("HEALER"))
			roleIcon.role = "HEALER"
			roleIcon:Show()
			roleIcon = frame.roleIcon2
		end
		if ( showDamageIcon ) then
			roleIcon.texture:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES")
			roleIcon.texture:SetTexCoord(GetTexCoordsForRoleSmallCircle("DAMAGER"))
			roleIcon.role = "DAMAGER"
			roleIcon:Show()
			roleIcon = frame.roleIcon2
		end
	end
end)