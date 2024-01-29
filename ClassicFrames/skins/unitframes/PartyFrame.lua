CfPartyMemberFrameMixin= {};

function CfPartyMemberFrameMixin:UpdateArt()
	local unit = "party"..self.layoutIndex;
	if ( UnitHasVehicleUI(unit) and UnitIsConnected(unit) ) then
		local vehicleType = UnitVehicleSkin(unit);
		self:ToVehicleArt(vehicleType);
	else
		self:ToPlayerArt();
	end
end

function CfPartyMemberFrameMixin:ToPlayerArt()
	self.state = "player";
	local PartyMemberOverlayInfo = self.PartyMemberOverlay.Info;
	PartyMemberOverlayInfo.VehicleTexture:Hide();
	PartyMemberOverlayInfo.Texture:Show();
	self.Portrait:SetPoint("TOPLEFT", 7, -6);
	PartyMemberOverlayInfo.LeaderIcon:SetPoint("TOPLEFT", 0, 0);
	PartyMemberOverlayInfo.PVPIcon:SetPoint("TOPLEFT", -9, -15);
	PartyMemberOverlayInfo.Disconnect:SetPoint("LEFT", -7, -1);

	self.overrideName = nil;

	CfUnitFrame_SetUnit(self, "party"..self.layoutIndex, self.HealthBar, self.ManaBar);
	self:UpdateMember();

	CfUnitFrame_Update(self, true)
end

function CfPartyMemberFrameMixin:ToVehicleArt(vehicleType)
	self.state = "vehicle";
	local PartyMemberOverlayInfo = self.PartyMemberOverlay.Info;
	PartyMemberOverlayInfo.Texture:Hide();
	if ( vehicleType == "Natural" ) then
		PartyMemberOverlayInfo.VehicleTexture:SetTexture("Interface\\Vehicles\\UI-Vehicles-PartyFrame-Organic");
	else
		PartyMemberOverlayInfo.VehicleTexture:SetTexture("Interface\\Vehicles\\UI-Vehicles-PartyFrame");
	end
	PartyMemberOverlayInfo.VehicleTexture:Show();
	self.Portrait:SetPoint("TOPLEFT", 4, -9);
	PartyMemberOverlayInfo.LeaderIcon:SetPoint("TOPLEFT", -3, 0);
	PartyMemberOverlayInfo.PVPIcon:SetPoint("TOPLEFT", -12, -15);
	PartyMemberOverlayInfo.Disconnect:SetPoint("LEFT", -10, -1);

	self.overrideName = "party"..self.layoutIndex;

	self:UpdateMember();

	CfUnitFrame_Update(self, true)
end

function CfPartyMemberFrameMixin:Setup()
	local id = self.layoutIndex;
	self.noTextPrefix = true;

	local PartyMemberOverlayInfo = self.PartyMemberOverlay.Info;
	self.HealthBar.LeftText = PartyMemberOverlayInfo.HealthBarTextLeft;
	self.HealthBar.RightText = PartyMemberOverlayInfo.HealthBarTextRight;
	self.ManaBar.LeftText = PartyMemberOverlayInfo.ManaBarTextLeft;
	self.ManaBar.RightText = PartyMemberOverlayInfo.ManaBarTextRight;

	CfUnitFrame_Initialize(self, "party"..id,  PartyMemberOverlayInfo.Name, self.Portrait,
		   self.HealthBar, PartyMemberOverlayInfo.HealthBarText,
		   self.ManaBar, PartyMemberOverlayInfo.ManaBarText,
		   self.Flash, nil, nil, PartyMemberOverlayInfo.MyHealPredictionBar, PartyMemberOverlayInfo.OtherHealPredictionBar,
		   self.TotalAbsorbBar, self.TotalAbsorbBarOverlay, PartyMemberOverlayInfo.OverAbsorbGlow,
		   PartyMemberOverlayInfo.OverHealAbsorbGlow, PartyMemberOverlayInfo.HealAbsorbBar, PartyMemberOverlayInfo.HealAbsorbBarLeftShadow,
		   PartyMemberOverlayInfo.HealAbsorbBarRightShadow);
	SetTextStatusBarTextZeroText(self.HealthBar, DEAD);

	self.statusCounter = 0;
	self.statusSign = -1;
	self.unitHPPercent = 1;
	self:UpdateMember();
	self:UpdateLeader();
	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("GROUP_ROSTER_UPDATE");
	self:RegisterEvent("UPDATE_ACTIVE_BATTLEFIELD");
	self:RegisterEvent("PARTY_LEADER_CHANGED");
	self:RegisterEvent("PARTY_LOOT_METHOD_CHANGED");
	self:RegisterEvent("MUTELIST_UPDATE");
	self:RegisterEvent("IGNORELIST_UPDATE");
	self:RegisterEvent("UNIT_FACTION");
	self:RegisterEvent("READY_CHECK");
	self:RegisterEvent("READY_CHECK_CONFIRM");
	self:RegisterEvent("READY_CHECK_FINISHED");
	self:RegisterEvent("UNIT_ENTERED_VEHICLE");
	self:RegisterEvent("UNIT_EXITED_VEHICLE");
	self:RegisterEvent("UNIT_CONNECTION");
	self:RegisterEvent("PARTY_MEMBER_ENABLE");
	self:RegisterEvent("PARTY_MEMBER_DISABLE");
	self:RegisterEvent("UNIT_PHASE");
	self:RegisterEvent("UNIT_CTR_OPTIONS");
	self:RegisterEvent("UNIT_FLAGS");
	self:RegisterEvent("UNIT_OTHER_PARTY_CHANGED");
	self:RegisterEvent("INCOMING_SUMMON_CHANGED");

	self:UpdateArt();
	self:SetFrameLevel(2);
	self:UpdateNotPresentIcon();
	self:EnableMouse(false);
	
	self.initialized = true;
end

function CfPartyMemberFrameMixin:UpdateMember()
	if not CfPartyFrame:ShouldShow() then
		self:Hide();
		return;
	end
	local id = self.layoutIndex;
	local unit = "party"..id;
	if ( UnitExists(unit) ) then
		self:Show();
		CfUnitFrame_Update(self, true);
	else
		self:Hide();
	end
	self:UpdatePvPStatus();
	self:UpdateReadyCheck();
	self:UpdateOnlineStatus();
	self:UpdateNotPresentIcon();
end

function CfPartyMemberFrameMixin:UpdateMemberHealth(elapsed)
	if ( (self.unitHPPercent > 0) and (self.unitHPPercent <= 0.2) ) then
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
			alpha = (127  + (counter * 256)) / 255;
		else
			alpha = (255 - (counter * 256)) / 255;
		end
		self.Portrait:SetAlpha(alpha);
	end
end

function CfPartyMemberFrameMixin:UpdateLeader()
	local id = self.layoutIndex;
	local leaderIcon = self.PartyMemberOverlay.Info.LeaderIcon;
	local guideIcon = self.PartyMemberOverlay.Info.GuideIcon;

	if( UnitIsGroupLeader("party"..id) ) then
		if ( HasLFGRestrictions() ) then
			guideIcon:Show();
			leaderIcon:Hide();
		else
			leaderIcon:Show();
			guideIcon:Hide();
		end
	else
		guideIcon:Hide();
		leaderIcon:Hide();
	end
end

function CfPartyMemberFrameMixin:UpdatePvPStatus()
	local id = self.layoutIndex;
	local unit = "party"..id;
	local icon = self.PartyMemberOverlay.Info.PVPIcon;
	local factionGroup = UnitFactionGroup(unit);
	if ( UnitIsPVPFreeForAll(unit) ) then
		icon:SetTexture("Interface\\TargetingFrame\\UI-PVP-FFA");
		icon:Show();
	elseif ( factionGroup and factionGroup ~= "Neutral" and UnitIsPVP(unit) ) then
		icon:SetTexture("Interface\\GroupFrame\\UI-Group-PVP-"..factionGroup);
		icon:Show();
	else
		icon:Hide();
	end
end

function CfPartyMemberFrameMixin:UpdateAssignedRoles()
	local id = self.layoutIndex;
	local unit = "party"..id;
	local icon = self.PartyMemberOverlay.Info.RoleIcon;
	local role = UnitGroupRolesAssigned(unit);

	if ( role == "TANK" or role == "HEALER" or role == "DAMAGER") then
		icon:SetTexCoord(GetTexCoordsForRoleSmallCircle(role));
		icon:Show();
	else
		icon:Hide();
	end
end

function CfPartyMemberFrameMixin:UpdateReadyCheck()
	local id = self.layoutIndex;
	local partyID = "party"..id;

	local readyCheckFrame = self.ReadyCheck;
	local readyCheckStatus = GetReadyCheckStatus(partyID);
	if ( UnitName(partyID) and UnitIsConnected(partyID) and readyCheckStatus ) then
		if ( readyCheckStatus == "ready" ) then
			ReadyCheck_Confirm(readyCheckFrame, 1);
		elseif ( readyCheckStatus == "notready" ) then
			ReadyCheck_Confirm(readyCheckFrame, 0);
		else -- "waiting"
			ReadyCheck_Start(readyCheckFrame);
		end
	else
		readyCheckFrame:Hide();
	end
end

function CfPartyMemberFrameMixin:UpdateNotPresentIcon()
	local id = self.layoutIndex;
	local partyID = "party"..id;

	if ( UnitInOtherParty(partyID) ) then
		self:SetAlpha(0.6);
		self.NotPresentIcon.texture:SetAtlas("groupfinder-eye-single", true);
		self.NotPresentIcon.texture:SetTexCoord(0, 1, 0, 1);
		self.NotPresentIcon.Border:Show();
		self.NotPresentIcon.tooltip = PARTY_IN_PUBLIC_GROUP_MESSAGE;
		self.NotPresentIcon:Show();
	elseif ( C_IncomingSummon.HasIncomingSummon(self.unit) ) then
		local status = C_IncomingSummon.IncomingSummonStatus(self.unit);
		if(status == Enum.SummonStatus.Pending) then
			self.NotPresentIcon.texture:SetAtlas("Raid-Icon-SummonPending");
			self.NotPresentIcon.texture:SetTexCoord(0, 1, 0, 1);
			self.NotPresentIcon.tooltip = INCOMING_SUMMON_TOOLTIP_SUMMON_PENDING;
			self.NotPresentIcon.Border:Hide();
			self.NotPresentIcon:Show();
		elseif( status == Enum.SummonStatus.Accepted ) then
			self.NotPresentIcon.texture:SetAtlas("Raid-Icon-SummonAccepted");
			self.NotPresentIcon.texture:SetTexCoord(0, 1, 0, 1);
			self.NotPresentIcon.tooltip = INCOMING_SUMMON_TOOLTIP_SUMMON_ACCEPTED;
			self.NotPresentIcon.Border:Hide();
			self.NotPresentIcon:Show();
		elseif( status == Enum.SummonStatus.Declined ) then
			self.NotPresentIcon.texture:SetAtlas("Raid-Icon-SummonDeclined");
			self.NotPresentIcon.texture:SetTexCoord(0, 1, 0, 1);
			self.NotPresentIcon.tooltip = INCOMING_SUMMON_TOOLTIP_SUMMON_DECLINED;
			self.NotPresentIcon.Border:Hide();
			self.NotPresentIcon:Show();
		end
	else
		local phaseReason = UnitIsConnected(partyID) and UnitPhaseReason(partyID) or nil;
		if phaseReason then
			self:SetAlpha(0.6);
			self.NotPresentIcon.texture:SetTexture("Interface\\TargetingFrame\\UI-PhasingIcon");
			self.NotPresentIcon.texture:SetTexCoord(0.15625, 0.84375, 0.15625, 0.84375);
			self.NotPresentIcon.Border:Hide();
			self.NotPresentIcon.tooltip = PartyUtil.GetPhasedReasonString(phaseReason, partyID);
			self.NotPresentIcon:Show();
		else
			self:SetAlpha(1);
			self.NotPresentIcon:Hide();
		end
	end
end

function CfPartyMemberFrameMixin:OnEvent(event, ...)
	CfUnitFrame_OnEvent(self, event, ...);

	local arg1, arg2, arg3 = ...;
	local selfID = self.layoutIndex;

	local unit = "party"..selfID;

	if ( event == "PLAYER_ENTERING_WORLD" ) then
		if ( UnitExists("party"..self.layoutIndex) ) then
			self:UpdateMember();
			self:UpdateOnlineStatus();
			self:UpdateAssignedRoles();
		end
	elseif ( event == "GROUP_ROSTER_UPDATE" or event == "UPDATE_ACTIVE_BATTLEFIELD" ) then
		self:UpdateMember();
		self:UpdateArt();
		self:UpdateAssignedRoles();
		self:UpdateLeader();
	elseif ( event == "PARTY_LEADER_CHANGED" ) then
		self:UpdateLeader();
	elseif ( event == "UNIT_FACTION" ) then
		if ( arg1 == unit ) then
			self:UpdatePvPStatus();
		end
	elseif ( event == "READY_CHECK" or
		 event == "READY_CHECK_CONFIRM" ) then
		self:UpdateReadyCheck();
	elseif ( event == "READY_CHECK_FINISHED" ) then
		if (UnitExists("party"..self.layoutIndex)) then
			local finishTime = DEFAULT_READY_CHECK_STAY_TIME;
			if not CfPartyFrame:ShouldShow() then
				finishTime = 0;
			end
			ReadyCheck_Finish(self.ReadyCheck, finishTime);
		end
	elseif ( event == "UNIT_ENTERED_VEHICLE" ) then
		if ( arg1 == "party"..selfID ) then
			if ( arg2 and UnitIsConnected("party"..selfID) ) then
				self:ToVehicleArt(arg3);
			else
				self:ToPlayerArt();
			end
		end
	elseif ( event == "UNIT_EXITED_VEHICLE" ) then
		if ( arg1 == "party"..selfID ) then
			self:ToPlayerArt();
		end
	elseif ( event == "UNIT_CONNECTION" ) and ( arg1 == "party"..selfID ) then
		self:UpdateArt();
	elseif ( event == "UNIT_PHASE" or event == "PARTY_MEMBER_ENABLE" or event == "PARTY_MEMBER_DISABLE" or event == "UNIT_FLAGS" or event == "UNIT_CTR_OPTIONS") then
		if ( event ~= "UNIT_PHASE" or arg1 == unit ) then
			self:UpdateNotPresentIcon();
		end
	elseif ( event == "UNIT_OTHER_PARTY_CHANGED" and arg1 == unit ) then
		self:UpdateNotPresentIcon();
	elseif ( event == "INCOMING_SUMMON_CHANGED" ) then
		self:UpdateNotPresentIcon();
	end
end

function CfPartyMemberFrameMixin:OnUpdate(elapsed)
	if self.initialized then
		self:UpdateMemberHealth(elapsed);
	end
end

function CfPartyMemberFrameMixin:UpdateOnlineStatus()
	if ( not UnitIsConnected("party"..self.layoutIndex) ) then
		-- Handle disconnected state
		local healthBar = self.HealthBar;
		local unitHPMin, unitHPMax = healthBar:GetMinMaxValues();

		healthBar:SetValue(unitHPMax);
		healthBar:SetStatusBarColor(0.5, 0.5, 0.5);
		SetDesaturation(self.Portrait, true);
		self.PartyMemberOverlay.Info.Disconnect:Show();
		return;
	else
		SetDesaturation(self.Portrait, false);
		self.PartyMemberOverlay.Info.Disconnect:Hide();
	end
end

function CfPartyMemberFrameMixin:PartyMemberHealthCheck (value)
	local unitHPMin, unitHPMax, unitCurrHP;
	unitHPMin, unitHPMax = self.HealthBar:GetMinMaxValues();

	unitCurrHP = self.HealthBar:GetValue();
	if ( unitHPMax > 0 ) then
		self.unitHPPercent = unitCurrHP / unitHPMax;
	else
		self.unitHPPercent = 0;
	end
	if ( UnitIsDead("party"..self.layoutIndex) ) then
		self.Portrait:SetVertexColor(0.35, 0.35, 0.35, 1.0);
	elseif ( UnitIsGhost("party"..self.layoutIndex) ) then
		self.Portrait:SetVertexColor(0.2, 0.2, 0.75, 1.0);
	elseif ( (self.unitHPPercent > 0) and (self.unitHPPercent <= 0.2) ) then
		self.Portrait:SetVertexColor(1.0, 0.0, 0.0);
	else
		self.Portrait:SetVertexColor(1.0, 1.0, 1.0, 1.0);
	end
end

CfPartyFrameMixin={};

function CfPartyFrameMixin:OnLoad()
	local function PartyMemberFrameReset(framePool, frame)
		frame.layoutIndex = nil;
		FramePool_HideAndClearAnchors(framePool, frame);
	end

	self.PartyMemberFramePool = CreateFramePool("BUTTON", self, "CfPartyMemberFrameTemplate", PartyMemberFrameReset);
	self:RegisterEvent("GROUP_ROSTER_UPDATE");
end

function CfPartyFrameMixin:OnShow()
	self:InitializePartyMemberFrames();
	self:UpdatePartyFrames();
end

function CfPartyFrameMixin:ShouldShow()
	return ShouldShowPartyFrames() and not EditModeManagerFrame:UseRaidStylePartyFrames();
end

function CfPartyFrameMixin:InitializePartyMemberFrames()
	local memberFramesToSetup = {};
	
	self.PartyMemberFramePool:ReleaseAll();
	for i = 1, MAX_PARTY_MEMBERS do 	
		 local memberFrame = self.PartyMemberFramePool:Acquire();
		 memberFrame:SetPoint("TOPLEFT");
		 memberFrame.layoutIndex = i;
		 memberFramesToSetup[i] = memberFrame;
		 memberFrame:Show();
	end
	self:Layout();
	for _, frame in ipairs(memberFramesToSetup) do 
		frame:Setup();
	end
end

function CfPartyFrameMixin:UpdatePartyFrames()
	local showPartyFrames = self:ShouldShow();
	for memberFrame in self.PartyMemberFramePool:EnumerateActive() do
		if showPartyFrames then
			memberFrame:Show();
			memberFrame:UpdateMember();
		else
			memberFrame:Hide();
		end
	end
end

hooksecurefunc("UpdateRaidAndPartyFrames", function()
	CfPartyFrame:UpdatePartyFrames();
end)