function CfPlayerFrame_OnLoad(self)
	PlayerFrameHealthBar.LeftText = PlayerFrameHealthBarTextLeft;
	PlayerFrameHealthBar.RightText = PlayerFrameHealthBarTextRight;
	PlayerFrameManaBar.LeftText = PlayerFrameManaBarTextLeft;
	PlayerFrameManaBar.RightText = PlayerFrameManaBarTextRight;

	CfUnitFrame_Initialize(self, "player", CfPlayerName, PlayerPortrait,
						 PlayerFrameHealthBar, PlayerFrameHealthBarText,
						 PlayerFrameManaBar, PlayerFrameManaBarText,
						 PlayerFrameFlash, nil, nil,
						 CfPlayerFrameMyHealPredictionBar, CfPlayerFrameOtherHealPredictionBar,
						 CfPlayerFrameTotalAbsorbBar, CfPlayerFrameTotalAbsorbBarOverlay, CfPlayerFrameOverAbsorbGlow,
						 CfPlayerFrameOverHealAbsorbGlow, CfPlayerFrameHealAbsorbBar, CfPlayerFrameHealAbsorbBarLeftShadow,
						 CfPlayerFrameHealAbsorbBarRightShadow, CfPlayerFrameManaCostPredictionBar);

	self.statusCounter = 0;
	self.statusSign = -1;
	CombatFeedback_Initialize(self, PlayerHitIndicator, 30);
	CfPlayerFrame_Update();
	self:RegisterEvent("PLAYER_LEVEL_CHANGED");
	self:RegisterEvent("UNIT_FACTION");
	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("PLAYER_ENTER_COMBAT");
	self:RegisterEvent("PLAYER_LEAVE_COMBAT");
	self:RegisterEvent("PLAYER_REGEN_DISABLED");
	self:RegisterEvent("PLAYER_REGEN_ENABLED");
	self:RegisterEvent("PLAYER_UPDATE_RESTING");
	self:RegisterEvent("PARTY_LEADER_CHANGED");
	self:RegisterEvent("GROUP_ROSTER_UPDATE");
	self:RegisterEvent("READY_CHECK");
	self:RegisterEvent("READY_CHECK_CONFIRM");
	self:RegisterEvent("READY_CHECK_FINISHED");
	self:RegisterEvent("UNIT_ENTERED_VEHICLE");
	self:RegisterEvent("UNIT_ENTERING_VEHICLE");
	self:RegisterEvent("UNIT_EXITING_VEHICLE");
	self:RegisterEvent("UNIT_EXITED_VEHICLE");
	self:RegisterEvent("PVP_TIMER_UPDATE");
	self:RegisterEvent("PLAYER_ROLES_ASSIGNED");
	self:RegisterEvent("HONOR_LEVEL_UPDATE");
	self:RegisterEvent("QUEST_SESSION_JOINED");
	self:RegisterEvent("QUEST_SESSION_LEFT");
	self:RegisterUnitEvent("UNIT_COMBAT", "player", "vehicle");
	self:RegisterUnitEvent("UNIT_MAXPOWER", "player", "vehicle");

	PlayerAttackBackground:SetVertexColor(0.8, 0.1, 0.1);
	PlayerAttackBackground:SetAlpha(0.4);

	self:SetClampRectInsets(20, 0, 0, 0);
end

--This is overwritten in LocalizationPost for different languages.
function CfPlayerFrame_UpdateLevelTextAnchor(level)
	if ( level >= 100 ) then
		CfPlayerLevelText:SetPoint("CENTER", PlayerFrameTexture, "CENTER", -62, -17);
	else
		CfPlayerLevelText:SetPoint("CENTER", PlayerFrameTexture, "CENTER", -61, -17);
	end
end

function CfPlayerFrame_Update()
	if ( UnitExists("player") ) then
		CfPlayerFrame_UpdateLevel();
		CfPlayerFrame_UpdatePartyLeader();
		CfPlayerFrame_UpdatePvPStatus();
		CfPlayerFrame_UpdateStatus();
	end
end

function CfPlayerFrame_UpdateLevel()
	if ( UnitExists("player") ) then
		local level = UnitLevel(CfPlayerFrame.unit);
		local effectiveLevel = UnitEffectiveLevel(CfPlayerFrame.unit);
		if ( effectiveLevel ~= level ) then
			CfPlayerLevelText:SetVertexColor(0.1, 1.0, 0.1, 1.0);
		else
			CfPlayerLevelText:SetVertexColor(1.0, 0.82, 0.0, 1.0);
		end
		CfPlayerFrame_UpdateLevelTextAnchor(effectiveLevel);
		CfPlayerLevelText:SetText(effectiveLevel);
	end
end

function CfPlayerFrame_UpdatePartyLeader()
	if ( UnitIsGroupLeader("player") ) then
		if ( HasLFGRestrictions() ) then
			PlayerGuideIcon:Show();
			PlayerLeaderIcon:Hide();
		else
			PlayerLeaderIcon:Show()
			PlayerGuideIcon:Hide();
		end
	else
		PlayerLeaderIcon:Hide();
		PlayerGuideIcon:Hide();
	end
end

function CfPlayerFrame_CanPlayPVPUpdateSound()
	return not PlayerPVPIcon:IsShown() and not PlayerPrestigePortrait:IsShown();
end

function CfPlayerFrame_UpdatePvPStatus()
	local factionGroup, factionName = UnitFactionGroup("player");
	if ( UnitIsPVPFreeForAll("player") ) then
		if ( CfPlayerFrame_CanPlayPVPUpdateSound() ) then
			PlaySound(SOUNDKIT.IG_PVP_UPDATE);
		end
		local honorLevel = UnitHonorLevel("player");
		local honorRewardInfo = C_PvP.GetHonorRewardInfo(honorLevel);
		if (honorRewardInfo) then
			PlayerPrestigePortrait:SetAtlas("honorsystem-portrait-neutral", false);
			PlayerPrestigeBadge:SetTexture(honorRewardInfo.badgeFileDataID);
			PlayerPrestigePortrait:Show();
			PlayerPrestigeBadge:Show();
			PlayerPVPIcon:Hide();
		else
			PlayerPrestigePortrait:Hide();
			PlayerPrestigeBadge:Hide();
			PlayerPVPIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-FFA");
			PlayerPVPIcon:Show();
		end

		-- Setup newbie tooltip
		PlayerPVPIconHitArea.tooltipTitle = PVPFFA;
		PlayerPVPIconHitArea.tooltipText = NEWBIE_TOOLTIP_PVPFFA;
		PlayerPVPIconHitArea:Show();

		CfPlayerPVPTimerText:Hide();
		CfPlayerPVPTimerText.timeLeft = nil;
	elseif ( factionGroup and factionGroup ~= "Neutral" and UnitIsPVP("player") ) then
		if ( CfPlayerFrame_CanPlayPVPUpdateSound() ) then
			PlaySound(SOUNDKIT.IG_PVP_UPDATE);
		end

		local honorLevel = UnitHonorLevel("player");
		local honorRewardInfo = C_PvP.GetHonorRewardInfo(honorLevel);
		if (honorRewardInfo) then
			-- ugly special case handling for mercenary mode
			if ( UnitIsMercenary("player") ) then
				if ( factionGroup == "Horde" ) then
					factionGroup = "Alliance";
				elseif ( factionGroup == "Alliance" ) then
					factionGroup = "Horde";
				end
			end

			PlayerPrestigePortrait:SetAtlas("honorsystem-portrait-"..factionGroup, false);
			PlayerPrestigeBadge:SetTexture(honorRewardInfo.badgeFileDataID);
			PlayerPrestigePortrait:Show();
			PlayerPrestigeBadge:Show();
			PlayerPVPIcon:Hide();
		else
			PlayerPrestigePortrait:Hide();
			PlayerPrestigeBadge:Hide();
			PlayerPVPIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-"..factionGroup);

			-- ugly special case handling for mercenary mode
			if ( UnitIsMercenary("player") ) then
				if ( factionGroup == "Horde" ) then
					PlayerPVPIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-Alliance");
				elseif ( factionGroup == "Alliance" ) then
					PlayerPVPIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-Horde");
				end
			end
		end

		PlayerPVPIcon:Show();

		-- Setup newbie tooltip
		PlayerPVPIconHitArea.tooltipTitle = factionName;
		PlayerPVPIconHitArea.tooltipText = _G["NEWBIE_TOOLTIP_"..strupper(factionGroup)];
		PlayerPVPIconHitArea:Show();
	else
		PlayerPrestigePortrait:Hide();
		PlayerPrestigeBadge:Hide();
		PlayerPVPIcon:Hide();
		PlayerPVPIconHitArea:Hide();
		CfPlayerPVPTimerText:Hide();
		CfPlayerPVPTimerText.timeLeft = nil;
	end
end

function CfPlayerFrame_OnEvent(self, event, ...)
	CfUnitFrame_OnEvent(self, event, ...);

	local arg1, arg2, arg3, arg4, arg5 = ...;
	if ( event == "PLAYER_LEVEL_CHANGED" ) then
		CfPlayerFrame_Update();
	elseif ( event == "UNIT_COMBAT" ) then
		if ( arg1 == self.unit ) then
			CombatFeedback_OnCombatEvent(self, arg2, arg3, arg4, arg5);
		end
	elseif ( event == "UNIT_FACTION" ) then
		if ( arg1 == "player" ) then
			CfPlayerFrame_UpdatePvPStatus();
		end
	elseif ( event == "PLAYER_ENTERING_WORLD" ) then
		CfUnitFrame_Update(self);
		CfPlayerFrame_ToPlayerArt(self);
		self.inCombat = nil;
		self.onHateList = nil;
		CfPlayerFrame_Update();
		CfPlayerFrame_UpdateStatus();
		CfPlayerFrame_UpdateRolesAssigned();

		if ( IsPVPTimerRunning() ) then
			CfPlayerPVPTimerText:Show();
			CfPlayerPVPTimerText.timeLeft = GetPVPTimer();
		else
			CfPlayerPVPTimerText:Hide();
			CfPlayerPVPTimerText.timeLeft = nil;
		end

		QuestSessionSync.Icon:SetShown(C_QuestSession.HasJoined());
	elseif ( event == "PLAYER_ENTER_COMBAT" ) then
		self.inCombat = 1;
		CfPlayerFrame_UpdateStatus();
	elseif ( event == "PLAYER_LEAVE_COMBAT" ) then
		self.inCombat = nil;
		CfPlayerFrame_UpdateStatus();
	elseif ( event == "PLAYER_REGEN_DISABLED" ) then
		self.onHateList = 1;
		CfPlayerFrame_UpdateStatus();
	elseif ( event == "PLAYER_REGEN_ENABLED" ) then
		self.onHateList = nil;
		CfPlayerFrame_UpdateStatus();
	elseif ( event == "PLAYER_UPDATE_RESTING" ) then
		CfPlayerFrame_UpdateStatus();
	elseif ( event == "PARTY_LEADER_CHANGED" or event == "GROUP_ROSTER_UPDATE" ) then
		CfPlayerFrame_UpdateGroupIndicator();
		CfPlayerFrame_UpdatePartyLeader();
		CfPlayerFrame_UpdateReadyCheck();
	elseif ( event == "READY_CHECK" or event == "READY_CHECK_CONFIRM" ) then
		CfPlayerFrame_UpdateReadyCheck();
	elseif ( event == "READY_CHECK_FINISHED" ) then
		ReadyCheck_Finish(PlayerFrameReadyCheck, DEFAULT_READY_CHECK_STAY_TIME);
	elseif ( event == "UNIT_ENTERING_VEHICLE" ) then
		if ( arg1 == "player" ) then
			if ( arg2 ) then
				CfPlayerFrame_AnimateOut(self);
			else
				if ( CfPlayerFrame.state == "vehicle" ) then
					CfPlayerFrame_AnimateOut(self);
				end
			end
		end
	elseif ( event == "UNIT_ENTERED_VEHICLE" ) then
		if ( arg1 == "player" ) then
			self.inSeat = true;
			CfPlayerFrame_UpdateArt(self);
		end
	elseif ( event == "UNIT_EXITING_VEHICLE" ) then
		if ( arg1 == "player" ) then
			if ( self.state == "vehicle" ) then
				CfPlayerFrame_AnimateOut(self);
			end
		end
	elseif ( event == "UNIT_EXITED_VEHICLE" ) then
		if ( arg1 == "player" ) then
			self.inSeat = true;
			CfPlayerFrame_UpdateArt(self);
		end
	elseif ( event == "PVP_TIMER_UPDATE" ) then
		if ( IsPVPTimerRunning() ) then
			CfPlayerPVPTimerText:Show();
			CfPlayerPVPTimerText.timeLeft = GetPVPTimer();
		else
			CfPlayerPVPTimerText:Hide();
			CfPlayerPVPTimerText.timeLeft = nil;
		end
	elseif ( event == "PLAYER_ROLES_ASSIGNED" ) then
		CfPlayerFrame_UpdateRolesAssigned();
	elseif ( event == "HONOR_LEVEL_UPDATE" ) then
		CfPlayerFrame_UpdatePvPStatus();
	elseif ( event == "QUEST_SESSION_JOINED" ) then
		QuestSessionSync.Icon:Show();
	elseif ( event == "QUEST_SESSION_LEFT" ) then
		QuestSessionSync.Icon:Hide();
	end
end

function CfPlayerFrame_UpdateRolesAssigned()
	local frame = CfPlayerFrame;
	local icon = _G[frame:GetName().."RoleIcon"];
	local role = UnitGroupRolesAssigned("player");

	if ( role == "TANK" or role == "HEALER" or role == "DAMAGER") then
		icon:SetTexCoord(GetTexCoordsForRoleSmallCircle(role));
		icon:Show();
	else
		icon:Hide();
	end
end

local function CfPlayerFrame_AnimPos(self, fraction)
	return "TOPLEFT", UIParent, "TOPLEFT", -19, fraction*140-4;
end

local PlayerFrameAnimTable = {
	totalTime = 0.3,
	updateFunc = "SetPoint",
	getPosFunc = CfPlayerFrame_AnimPos,
	}
function CfPlayerFrame_AnimateOut(self)
	self.inSeat = false;
	self.animFinished = false;
	self.inSequence = true;
	self.isAnimatedOut = true;
	if ( self:IsUserPlaced() ) then
		CfPlayerFrame_AnimFinished(CfPlayerFrame);
	else
		SetUpAnimation(CfPlayerFrame, PlayerFrameAnimTable, CfPlayerFrame_AnimFinished, false)
	end
end

function CfPlayerFrame_AnimFinished(self)
	self.animFinished = true;
	CfPlayerFrame_UpdateArt(self);
end

function CfPlayerFrame_IsAnimatedOut(self)
	return self.isAnimatedOut;
end

function CfPlayerFrame_UpdateArt(self)
	if ( self.inSeat ) then
		if ( self:IsUserPlaced() ) then
			CfPlayerFrame_SequenceFinished(CfPlayerFrame);
		elseif ( self.animFinished and self.inSequence ) then
			SetUpAnimation(CfPlayerFrame, PlayerFrameAnimTable, CfPlayerFrame_SequenceFinished, true)
		end
		if ( UnitHasVehiclePlayerFrameUI("player") ) then
			CfPlayerFrame_ToVehicleArt(self, UnitVehicleSkin("player"));
		else
			CfPlayerFrame_ToPlayerArt(self);
		end
	end
end

function CfPlayerFrame_SequenceFinished(self)
	self.isAnimatedOut = false;
	self.inSequence = false;
end

function CfPlayerFrame_ToVehicleArt(self, vehicleType)
	--Swap frame

	CfPlayerFrame.state = "vehicle";

	CfUnitFrame_SetUnit(self, "vehicle", PlayerFrameHealthBar, PlayerFrameManaBar);
	CfPlayerFrame_Update();

	PlayerFrameTexture:Hide();
	if ( vehicleType == "Natural" ) then
		PlayerFrameVehicleTexture:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame-Organic");
		PlayerFrameFlash:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame-Organic-Flash");
		PlayerFrameFlash:SetTexCoord(-0.02, 1, 0.07, 0.86);
		PlayerFrameHealthBar:SetWidth(103);
		PlayerFrameHealthBar:SetPoint("TOPLEFT",116,-41);
		PlayerFrameManaBar:SetWidth(103);
		PlayerFrameManaBar:SetPoint("TOPLEFT",116,-52);
	else
		PlayerFrameVehicleTexture:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame");
		PlayerFrameFlash:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame-Flash");
		PlayerFrameFlash:SetTexCoord(-0.02, 1, 0.07, 0.86);
		PlayerFrameHealthBar:SetWidth(100);
		PlayerFrameHealthBar:SetPoint("TOPLEFT",119,-41);
		PlayerFrameManaBar:SetWidth(100);
		PlayerFrameManaBar:SetPoint("TOPLEFT",119,-52);
	end
	PlayerFrame_ShowVehicleTexture();

	CfPlayerName:SetPoint("CENTER",50,23);
	PlayerLeaderIcon:SetPoint("TOPLEFT",40,-12);
	CfPlayerFrameGroupIndicator:SetPoint("BOTTOMLEFT", CfPlayerFrame, "TOPLEFT", 97, -13);

	PlayerFrameBackground:SetWidth(114);
	CfPlayerLevelText:Hide();
end

function CfPlayerFrame_ToPlayerArt(self)
	--Unswap frame

	CfPlayerFrame.state = "player";

	CfUnitFrame_SetUnit(self, "player", PlayerFrameHealthBar, PlayerFrameManaBar);
	CfPlayerFrame_Update();

	PlayerFrameTexture:Show();
	PlayerFrame_HideVehicleTexture();
	CfPlayerName:SetPoint("CENTER",50,19);
	PlayerLeaderIcon:SetPoint("TOPLEFT",40,-12);
	CfPlayerFrameGroupIndicator:SetPoint("BOTTOMLEFT", CfPlayerFrame, "TOPLEFT", 97, -20);
	PlayerFrameHealthBar:SetWidth(119);
	PlayerFrameHealthBar:SetPoint("TOPLEFT",106,-41);
	PlayerFrameManaBar:SetWidth(119);
	PlayerFrameManaBar:SetPoint("TOPLEFT",106,-52);
	PlayerFrameBackground:SetWidth(119);
	CfPlayerLevelText:Show();
	PlayerFrameFlash:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash");
	PlayerFrameFlash:SetTexCoord(0.9453125, 0, 0, 0.181640625);
end

function CfPlayerFrame_UpdateReadyCheck()
	local readyCheckStatus = GetReadyCheckStatus("player");
	if ( readyCheckStatus ) then
		if ( readyCheckStatus == "ready" ) then
			ReadyCheck_Confirm(PlayerFrameReadyCheck, 1);
		elseif ( readyCheckStatus == "notready" ) then
			ReadyCheck_Confirm(PlayerFrameReadyCheck, 0);
		else -- "waiting"
			ReadyCheck_Start(PlayerFrameReadyCheck);
		end
	else
		PlayerFrameReadyCheck:Hide();
	end
end

function CfPlayerFrame_OnUpdate(self, elapsed)
	if ( PlayerStatusTexture:IsShown() ) then
		local alpha = 255;
		local counter = self.statusCounter + elapsed;
		local sign    = self.statusSign;

		if ( counter > 0.5 ) then
			sign = -sign;
			self.statusSign = sign;
		end
		counter = mod(counter, 0.5);
		self.statusCounter = counter;

		if ( sign == 1 ) then
			alpha = (55  + (counter * 400)) / 255;
		else
			alpha = (255 - (counter * 400)) / 255;
		end
		PlayerStatusTexture:SetAlpha(alpha);
		PlayerStatusGlow:SetAlpha(alpha);
	end

	if ( CfPlayerPVPTimerText.timeLeft ) then
		CfPlayerPVPTimerText.timeLeft = CfPlayerPVPTimerText.timeLeft - elapsed*1000;
		local timeLeft = CfPlayerPVPTimerText.timeLeft;
		if ( timeLeft < 0 ) then
			CfPlayerPVPTimerText:Hide()
		end
		CfPlayerPVPTimerText:SetFormattedText(SecondsToTimeAbbrev(floor(timeLeft/1000)));
	else
		CfPlayerPVPTimerText:Hide();
	end
	CombatFeedback_OnUpdate(self, elapsed);
end

function CfPlayerFrame_UpdateStatus()
	if ( UnitHasVehiclePlayerFrameUI("player") ) then
		PlayerStatusTexture:Hide()
		PlayerRestIcon:Hide()
		PlayerAttackIcon:Hide()
		PlayerRestGlow:Hide()
		PlayerAttackGlow:Hide()
		PlayerStatusGlow:Hide()
		PlayerAttackBackground:Hide()
	elseif ( IsResting() ) then
		PlayerStatusTexture:SetVertexColor(1.0, 0.88, 0.25, 1.0);
		PlayerStatusTexture:Show();
		PlayerRestIcon:Show();
		PlayerAttackIcon:Hide();
		PlayerRestGlow:Show();
		PlayerAttackGlow:Hide();
		PlayerStatusGlow:Show();
		PlayerAttackBackground:Hide();
	elseif ( CfPlayerFrame.inCombat ) then
		PlayerStatusTexture:SetVertexColor(1.0, 0.0, 0.0, 1.0);
		PlayerStatusTexture:Show();
		PlayerAttackIcon:Show();
		PlayerRestIcon:Hide();
		PlayerAttackGlow:Show();
		PlayerRestGlow:Hide();
		PlayerStatusGlow:Show();
		PlayerAttackBackground:Show();
	elseif ( CfPlayerFrame.onHateList ) then
		PlayerAttackIcon:Show();
		PlayerRestIcon:Hide();
		PlayerStatusGlow:Hide();
		PlayerAttackBackground:Hide();
	else
		PlayerStatusTexture:Hide();
		PlayerRestIcon:Hide();
		PlayerAttackIcon:Hide();
		PlayerStatusGlow:Hide();
		PlayerAttackBackground:Hide();
	end
end

function CfPlayerFrame_UpdateGroupIndicator()
	CfPlayerFrameGroupIndicator:Hide();
	local name, rank, subgroup;
	if ( not IsInRaid() ) then
		CfPlayerFrameGroupIndicator:Hide();
		return;
	end
	local numGroupMembers = GetNumGroupMembers();
	for i=1, MAX_RAID_MEMBERS do
		if ( i <= numGroupMembers ) then
			name, rank, subgroup = GetRaidRosterInfo(i);
			-- Set the player's group number indicator
			if ( name == UnitName("player") ) then
				CfPlayerFrameGroupIndicatorText:SetText(GROUP.." "..subgroup);
				CfPlayerFrameGroupIndicator:SetWidth(CfPlayerFrameGroupIndicatorText:GetWidth()+40);
				CfPlayerFrameGroupIndicator:Show();
			end
		end
	end
end

function PlayerFrameMultiGroupFrame_OnLoad(self)
	self:RegisterEvent("GROUP_ROSTER_UPDATE");
	self:RegisterEvent("UPDATE_CHAT_COLOR");
	self:RegisterForClicks("LeftButtonUp", "RightButtonUp");
end

function PlayerFrameMultiGroupFrame_OnEvent(self, event, ...)
	if ( event == "GROUP_ROSTER_UPDATE" ) then
		if ( IsInGroup(LE_PARTY_CATEGORY_HOME) and IsInGroup(LE_PARTY_CATEGORY_INSTANCE) ) then
			self:Show();
		else
			self:Hide();
		end
	elseif ( event == "UPDATE_CHAT_COLOR" ) then
		local public = ChatTypeInfo["INSTANCE_CHAT"];
		local private = ChatTypeInfo["PARTY"];
		self.HomePartyIcon:SetVertexColor(private.r, private.g, private.b);
		self.InstancePartyIcon:SetVertexColor(public.r, public.g, public.b);
	end
end

function PlayerFrameMultiGroupframe_OnEnter(self)
	GameTooltip_SetDefaultAnchor(GameTooltip, self);
	self.homePlayers = GetHomePartyInfo(self.homePlayers);

	if ( IsInRaid(LE_PARTY_CATEGORY_HOME) ) then
		GameTooltip:SetText(PLAYER_IN_MULTI_GROUP_RAID_MESSAGE, nil, nil, nil, nil, true);
		GameTooltip:AddLine(format(MEMBER_COUNT_IN_RAID_LIST, #self.homePlayers + 1), 1, 1, 1, true);
	else
		GameTooltip:AddLine(PLAYER_IN_MULTI_GROUP_PARTY_MESSAGE, 1, 1, 1, true);
		local playerList = self.homePlayers[1] or "";
		for i=2, #self.homePlayers do
			playerList = playerList..PLAYER_LIST_DELIMITER..self.homePlayers[i];
		end
		GameTooltip:AddLine(format(MEMBERS_IN_PARTY_LIST, playerList));
	end
	GameTooltip:Show();
end

function PlayerFrame_ShowVehicleTexture()
	PlayerFrameVehicleTexture:Show();

	local _, class = UnitClass("player");
	if ( CfPlayerFrame.CfClassPowerBar ) then
		CfPlayerFrame.CfClassPowerBar:Hide();
	elseif ( class == "DEATHKNIGHT" ) then
		CfRuneFrame:Hide();
	end

	ComboPointPlayerFrame:Setup();
	CfEssencePlayerFrame:Setup();
end

function PlayerFrame_HideVehicleTexture()
	PlayerFrameVehicleTexture:Hide();

	local _, class = UnitClass("player");
	if ( CfPlayerFrame.CfClassPowerBar ) then
		CfPlayerFrame.CfClassPowerBar:Setup();
	elseif ( class == "DEATHKNIGHT" ) then
		CfRuneFrame:Show();
	end

	ComboPointPlayerFrame:Setup();
	CfEssencePlayerFrame:Setup();
end