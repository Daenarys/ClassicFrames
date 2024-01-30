local AURA_START_X = 5;
local AURA_START_Y = 32;
local AURA_OFFSET_Y = 3;
local LARGE_AURA_SIZE = 21;
local SMALL_AURA_SIZE = 17;
local AURA_ROW_WIDTH = 122;
local TOT_AURA_ROW_WIDTH = 101;
local NUM_TOT_AURA_ROWS = 2;

local PLAYER_UNITS = {
	player = true,
	vehicle = true,
	pet = true,
};

function TargetFrame_OnLoad(self, unit)
	self.statusCounter = 0;
	self.statusSign = -1;
	self.unitHPPercent = 1;

	local thisName = self:GetName();
	self.borderTexture = _G[thisName.."TextureFrameTexture"];
	self.highLevelTexture = _G[thisName.."TextureFrameHighLevelTexture"];
	self.pvpIcon = _G[thisName.."TextureFramePVPIcon"];
	self.prestigePortrait = _G[thisName.."TextureFramePrestigePortrait"];
	self.prestigeBadge = _G[thisName.."TextureFramePrestigeBadge"];
	self.leaderIcon = _G[thisName.."TextureFrameLeaderIcon"];
	self.raidTargetIcon = _G[thisName.."TextureFrameRaidTargetIcon"];
	self.questIcon = _G[thisName.."TextureFrameQuestIcon"];
	self.levelText = _G[thisName.."TextureFrameLevelText"];
	self.deadText = _G[thisName.."TextureFrameDeadText"];
	self.unconsciousText = _G[thisName.."TextureFrameUnconsciousText"];
	self.petBattleIcon = _G[thisName.."TextureFramePetBattleIcon"];
	self.TOT_AURA_ROW_WIDTH = TOT_AURA_ROW_WIDTH;

	if ( not self.showLevel ) then
		self.highLevelTexture:Hide();
		self.levelText:Hide();
	end
	local threatFrame;
	if ( self.showThreat ) then
		threatFrame = _G[thisName.."Flash"];
	end
	local portraitFrame;
	if ( self.showPortrait ) then
		portraitFrame = _G[thisName.."Portrait"];
	end

	_G[thisName.."HealthBar"].LeftText = _G[thisName.."TextureFrameHealthBarTextLeft"];
	_G[thisName.."HealthBar"].RightText = _G[thisName.."TextureFrameHealthBarTextRight"];
	_G[thisName.."ManaBar"].LeftText = _G[thisName.."TextureFrameManaBarTextLeft"];
	_G[thisName.."ManaBar"].RightText = _G[thisName.."TextureFrameManaBarTextRight"];

	CfUnitFrame_Initialize(self, unit, _G[thisName.."TextureFrameName"], portraitFrame,
						 _G[thisName.."HealthBar"], _G[thisName.."TextureFrameHealthBarText"],
						 _G[thisName.."ManaBar"], _G[thisName.."TextureFrameManaBarText"],
	                     threatFrame, "player", _G[thisName.."NumericalThreat"],
						 _G[thisName.."MyHealPredictionBar"], _G[thisName.."OtherHealPredictionBar"],
						 _G[thisName.."TotalAbsorbBar"], _G[thisName.."TotalAbsorbBarOverlay"], _G[thisName.."TextureFrameOverAbsorbGlow"],
						 _G[thisName.."TextureFrameOverHealAbsorbGlow"], _G[thisName.."HealAbsorbBar"],
						 _G[thisName.."HealAbsorbBarLeftShadow"], _G[thisName.."HealAbsorbBarRightShadow"]);

	self.auraPools = CreateFramePoolCollection();
	self.auraPools:CreatePool("FRAME", self, "CfTargetDebuffFrameTemplate");
	self.auraPools:CreatePool("FRAME", self, "CfTargetBuffFrameTemplate");

	TargetFrame_Update(self);
	self:RegisterEvent("PLAYER_ENTERING_WORLD");
	self:RegisterEvent("UNIT_HEALTH");
	if ( self.showLevel ) then
		self:RegisterEvent("UNIT_LEVEL");
	end
	self:RegisterEvent("UNIT_FACTION");
	if ( self.showClassification ) then
		self:RegisterEvent("UNIT_CLASSIFICATION_CHANGED");
	end
	if ( self.showLeader ) then
		self:RegisterEvent("PLAYER_FLAGS_CHANGED");
	end
	self:RegisterEvent("GROUP_ROSTER_UPDATE");
	self:RegisterEvent("RAID_TARGET_UPDATE");
	self:RegisterUnitEvent("UNIT_AURA", unit);
end

function TargetFrame_Update(self)
	if ( not (UnitExists(self.unit)) ) then
		self:Hide();
	else
		self:Show();
		if ( self.totFrame ) then
			TargetofTarget_Update(self.totFrame);
		end
		CfUnitFrame_Update(self);
		if ( self.showLevel ) then
			TargetFrame_CheckLevel(self);
		end
		TargetFrame_CheckFaction(self);
		if ( self.showClassification ) then
			TargetFrame_CheckClassification(self);
		end
		TargetFrame_CheckDead(self);
		if ( self.showLeader ) then
			if ( UnitLeadsAnyGroup(self.unit) ) then
				if ( HasLFGRestrictions() ) then
					self.leaderIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES");
					self.leaderIcon:SetTexCoord(0, 0.296875, 0.015625, 0.3125);
				else
					self.leaderIcon:SetTexture("Interface\\GroupFrame\\UI-Group-LeaderIcon");
					self.leaderIcon:SetTexCoord(0, 1, 0, 1);
				end
				self.leaderIcon:Show();
			else
				self.leaderIcon:Hide();
			end
		end
		TargetFrame_UpdateAuras(self);
		if ( self.portrait ) then
			self.portrait:SetAlpha(1.0);
		end
		TargetFrame_CheckBattlePet(self);
		if ( self.petBattleIcon ) then
			self.petBattleIcon:SetAlpha(1.0);
		end
	end
end

function TargetFrame_OnEvent(self, event, ...)
	CfUnitFrame_OnEvent(self, event, ...);

	local arg1 = ...;
	if ( event == "PLAYER_ENTERING_WORLD" ) then
		TargetFrame_Update(self);
	elseif ( event == "PLAYER_TARGET_CHANGED" ) then
		TargetFrame_Update(self);
		TargetFrame_UpdateRaidTargetIcon(self);
		if ( UnitExists(self.unit) and not C_PlayerInteractionManager.IsReplacingUnit()) then
			if ( UnitIsEnemy(self.unit, "player") ) then
				PlaySound(SOUNDKIT.IG_CREATURE_AGGRO_SELECT);
			elseif ( UnitIsFriend("player", self.unit) ) then
				PlaySound(SOUNDKIT.IG_CHARACTER_NPC_SELECT);
			else
				PlaySound(SOUNDKIT.IG_CREATURE_NEUTRAL_SELECT);
			end
		end
	elseif ( event == "UNIT_TARGETABLE_CHANGED" and arg1 == self.unit) then
		TargetFrame_Update(self);
		TargetFrame_UpdateRaidTargetIcon(self);
	elseif ( event == "UNIT_HEALTH" ) then
		if ( arg1 == self.unit ) then
			TargetFrame_CheckDead(self);
		end
	elseif ( event == "UNIT_LEVEL" ) then
		if ( arg1 == self.unit ) then
			TargetFrame_CheckLevel(self);
		end
	elseif ( event == "UNIT_FACTION" ) then
		if ( arg1 == self.unit or arg1 == "player" ) then
			TargetFrame_CheckFaction(self);
			if ( self.showLevel ) then
				TargetFrame_CheckLevel(self);
			end
		end
	elseif ( event == "UNIT_CLASSIFICATION_CHANGED" ) then
		if ( arg1 == self.unit ) then
			TargetFrame_CheckClassification(self);
		end
	elseif ( event == "UNIT_AURA" ) then
		if (arg1 == self.unit) then
			local unitAuraUpdateInfo = select(2, ...);
			TargetFrame_UpdateAuras(self, unitAuraUpdateInfo);
		end
	elseif ( event == "PLAYER_FLAGS_CHANGED" ) then
		if ( arg1 == self.unit ) then
			if ( UnitLeadsAnyGroup(self.unit) ) then
				self.leaderIcon:Show();
			else
				self.leaderIcon:Hide();
			end
		end
	elseif ( event == "GROUP_ROSTER_UPDATE" ) then
		if (self.unit == "focus") then
			TargetFrame_Update(self);
			if (not UnitExists(self.unit)) then
				ClearFocus();
			end
		else
			if ( self.totFrame ) then
				TargetofTarget_Update(self.totFrame);
			end
			TargetFrame_CheckFaction(self);
		end
	elseif ( event == "RAID_TARGET_UPDATE" ) then
		TargetFrame_UpdateRaidTargetIcon(self);
	elseif ( event == "PLAYER_FOCUS_CHANGED" ) then
		if ( UnitExists(self.unit) ) then
			self:Show();
			TargetFrame_Update(self);
			TargetFrame_UpdateRaidTargetIcon(self);
		else
			self:Hide();
		end
	end
end

function TargetFrame_OnHide(self)
	PlaySound(SOUNDKIT.INTERFACE_SOUND_LOST_TARGET_UNIT);
end

function TargetFrame_CheckLevel(self)
	local targetEffectiveLevel = UnitEffectiveLevel(self.unit);

	if ( UnitIsCorpse(self.unit) ) then
		self.levelText:Hide();
		self.highLevelTexture:Show();
	elseif ( UnitIsWildBattlePet(self.unit) or UnitIsBattlePetCompanion(self.unit) ) then
		local petLevel = UnitBattlePetLevel(self.unit);
		self.levelText:SetVertexColor(1.0, 0.82, 0.0);
		self.levelText:SetText( petLevel );
		self.levelText:Show();
		self.highLevelTexture:Hide();
	elseif ( targetEffectiveLevel > 0 ) then
		self.levelText:SetText(targetEffectiveLevel);
		if ( UnitCanAttack("player", self.unit) ) then
			local difficulty = C_PlayerInfo.GetContentDifficultyCreatureForPlayer(self.unit)
			local color = GetDifficultyColor(difficulty);
			self.levelText:SetVertexColor(color.r, color.g, color.b);
		else
			self.levelText:SetVertexColor(1.0, 0.82, 0.0);
		end
		TargetFrame_UpdateLevelTextAnchor(self, targetEffectiveLevel);
		self.levelText:Show();
		self.highLevelTexture:Hide();
	else
		self.levelText:Hide();
		self.highLevelTexture:Show();
	end
end

function TargetFrame_UpdateLevelTextAnchor(self, targetLevel)
	if ( targetLevel >= 100 ) then
		self.levelText:SetPoint("CENTER", 61, -17);
	else
		self.levelText:SetPoint("CENTER", 62, -17);
	end
end

function TargetFrame_CheckFaction(self)
	if ( not UnitPlayerControlled(self.unit) and UnitIsTapDenied(self.unit) ) then
		self.nameBackground:SetVertexColor(0.5, 0.5, 0.5);
		if ( self.portrait ) then
			self.portrait:SetVertexColor(0.5, 0.5, 0.5);
		end
	else
		self.nameBackground:SetVertexColor(UnitSelectionColor(self.unit));
		if ( self.portrait ) then
			self.portrait:SetVertexColor(1.0, 1.0, 1.0);
		end
	end

	if ( self.showPVP ) then
		local factionGroup = UnitFactionGroup(self.unit);
		if ( UnitIsPVPFreeForAll(self.unit) ) then
			local honorLevel = UnitHonorLevel(self.unit);
			local honorRewardInfo = C_PvP.GetHonorRewardInfo(honorLevel);
			if (honorRewardInfo) then
				self.prestigePortrait:SetAtlas("honorsystem-portrait-neutral", false);
				self.prestigeBadge:SetTexture(honorRewardInfo.badgeFileDataID);
				self.prestigePortrait:Show();
				self.prestigeBadge:Show();
				self.pvpIcon:Hide();
			else
				self.prestigePortrait:Hide();
				self.prestigeBadge:Hide();
				self.pvpIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-FFA");
				self.pvpIcon:Show();
			end
		elseif ( factionGroup and factionGroup ~= "Neutral" and UnitIsPVP(self.unit) ) then
			local honorLevel = UnitHonorLevel(self.unit);
			local honorRewardInfo = C_PvP.GetHonorRewardInfo(honorLevel);
			if (honorRewardInfo) then
				self.prestigePortrait:SetAtlas("honorsystem-portrait-"..factionGroup, false);
				self.prestigeBadge:SetTexture(honorRewardInfo.badgeFileDataID);
				self.prestigePortrait:Show();
				self.prestigeBadge:Show();
				self.pvpIcon:Hide();
			else
				self.prestigePortrait:Hide();
				self.prestigeBadge:Hide();
				self.pvpIcon:SetTexture("Interface\\TargetingFrame\\UI-PVP-"..factionGroup);
				self.pvpIcon:Show();
			end
		else
			self.prestigePortrait:Hide();
			self.prestigeBadge:Hide();
			self.pvpIcon:Hide();
		end
	end
end

function TargetFrame_CheckBattlePet(self)
	if ( UnitIsWildBattlePet(self.unit) or UnitIsBattlePetCompanion(self.unit) ) then
		local petType = UnitBattlePetType(self.unit);
		self.petBattleIcon:SetTexture("Interface\\TargetingFrame\\PetBadge-"..PET_TYPE_SUFFIX[petType]);
		self.petBattleIcon:Show();
	else
		self.petBattleIcon:Hide();
	end
end

function TargetFrame_CheckClassification(self, forceNormalTexture)
	local classification = UnitClassification(self.unit);
	self.nameBackground:Show();
	self.manabar.pauseUpdates = false;
	self.manabar:Show();
	TextStatusBar_UpdateTextString(self.manabar);
	self.threatIndicator:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash");

	if ( forceNormalTexture ) then
		self.borderTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame");
	elseif ( classification == "minus" ) then
		self.borderTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Minus");
		self.nameBackground:Hide();
		self.manabar.pauseUpdates = true;
		self.manabar:Hide();
		self.manabar.TextString:Hide();
		self.manabar.LeftText:Hide();
		self.manabar.RightText:Hide();
		forceNormalTexture = true;
	elseif ( classification == "worldboss" or classification == "elite" ) then
		self.borderTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite");
	elseif ( classification == "rareelite" ) then
		self.borderTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare-Elite");
	elseif ( classification == "rare" ) then
		self.borderTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare");
	else
		self.borderTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame");
		forceNormalTexture = true;
	end

	if ( forceNormalTexture ) then
		self.haveElite = nil;
		if ( classification == "minus" ) then
			self.Background:SetSize(119,12);
			self.Background:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 7, 47);
		else
			self.Background:SetSize(119,25);
			self.Background:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 7, 35);
		end
		if ( self.threatIndicator ) then
			if ( classification == "minus" ) then
				self.threatIndicator:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Minus-Flash");
				self.threatIndicator:SetTexCoord(0, 1, 0, 1);
				self.threatIndicator:SetWidth(256);
				self.threatIndicator:SetHeight(128);
				self.threatIndicator:SetPoint("TOPLEFT", self, "TOPLEFT", -24, 0);
			else
				self.threatIndicator:SetTexCoord(0, 0.9453125, 0, 0.181640625);
				self.threatIndicator:SetWidth(242);
				self.threatIndicator:SetHeight(93);
				self.threatIndicator:SetPoint("TOPLEFT", self, "TOPLEFT", -24, 0);
			end
		end
	else
		self.haveElite = true;
		CfTargetFrameBackground:SetSize(119,41);
		self.Background:SetSize(119,25);
		self.Background:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 7, 35);
		if ( self.threatIndicator ) then
			self.threatIndicator:SetTexCoord(0, 0.9453125, 0.181640625, 0.400390625);
			self.threatIndicator:SetWidth(242);
			self.threatIndicator:SetHeight(112);
			self.threatIndicator:SetPoint("TOPLEFT", self, "TOPLEFT", -22, 9);
		end
	end

	if (self.questIcon) then
		if (UnitIsQuestBoss(self.unit)) then
			self.questIcon:Show();
		else
			self.questIcon:Hide();
		end
	end
end

function TargetFrame_CheckDead(self)
	if ( (UnitHealth(self.unit) <= 0) and UnitIsConnected(self.unit) ) then
		if ( UnitIsUnconscious(self.unit) ) then
			self.unconsciousText:Show();
			self.deadText:Hide();
		else
			self.unconsciousText:Hide();
			self.deadText:Show();
		end
	else
		self.deadText:Hide();
		self.unconsciousText:Hide();
	end
end

function TargetFrame_OnUpdate(self, elapsed)
	if ( self.totFrame and self.totFrame:IsShown() ~= UnitExists(self.totFrame.unit) ) then
		TargetofTarget_Update(self.totFrame);
	end

	self.elapsed = (self.elapsed or 0) + elapsed;
	if ( self.elapsed > 0.5 ) then
		self.elapsed = 0;
		CfUnitFrame_UpdateThreatIndicator(self.threatIndicator, self.threatNumericIndicator, self.feedbackUnit);
	end
end

local function ShouldAuraBeLarge(caster)
	if not caster then
		return false;
	end

	for token, value in pairs(PLAYER_UNITS) do
		if UnitIsUnit(caster, token) or UnitIsOwnerOrControllerOfUnit(token, caster) then
			return value;
		end
	end
end

local AuraUpdateChangedType = EnumUtil.MakeEnum(
	"None",
	"Debuff",
	"Buff"
);

local function TargetFrame_ProcessAura(self, aura)
	if aura == nil or aura.icon == nil then
		return AuraUpdateChangedType.None;
	end

	if aura.isHelpful and not aura.isNameplateOnly then
		self.activeBuffs[aura.auraInstanceID] = aura;
		return AuraUpdateChangedType.Buff;
	elseif aura.isHarmful and TargetFrame_ShouldShowDebuffs(self.unit, aura.sourceUnit, aura.nameplateShowAll, aura.isFromPlayerOrPlayerPet) then
		self.activeDebuffs[aura.auraInstanceID] = aura;
		return AuraUpdateChangedType.Debuff;
	end

	return AuraUpdateChangedType.None;
end

local function TargetFrame_ParseAllAuras(self)
	if self.activeDebuffs == nil then
		self.activeDebuffs = TableUtil.CreatePriorityTable(AuraUtil.DefaultAuraCompare, TableUtil.Constants.AssociativePriorityTable);
		self.activeBuffs = TableUtil.CreatePriorityTable(AuraUtil.DefaultAuraCompare, TableUtil.Constants.AssociativePriorityTable);
	else
		self.activeDebuffs:Clear();
		self.activeBuffs:Clear();
	end

	local function HandleAura(aura)
		TargetFrame_ProcessAura(self, aura);
		return false;
	end

	local batchCount = nil;
	local usePackedAura = true;
	AuraUtil.ForEachAura(self.unit, AuraUtil.CreateFilterString(AuraUtil.AuraFilters.Helpful), batchCount, HandleAura, usePackedAura);
	AuraUtil.ForEachAura(self.unit, AuraUtil.CreateFilterString(AuraUtil.AuraFilters.Harmful, AuraUtil.AuraFilters.IncludeNameplateOnly), batchCount, HandleAura, usePackedAura);
end

function TargetFrame_UpdateAuras(self, unitAuraUpdateInfo)
	local debuffsChanged = false;
	local buffsChanged = false;

	if unitAuraUpdateInfo == nil or unitAuraUpdateInfo.isFullUpdate or self.activeDebuffs == nil then
		TargetFrame_ParseAllAuras(self);
		debuffsChanged = true;
		buffsChanged = true;
	else
		if unitAuraUpdateInfo.addedAuras ~= nil then
			for _, aura in ipairs(unitAuraUpdateInfo.addedAuras) do
				local type = TargetFrame_ProcessAura(self, aura);
				if type == AuraUpdateChangedType.Buff then
					buffsChanged = true;
				elseif type == AuraUpdateChangedType.Debuff then
					debuffsChanged = true;
				end
			end
		end

		if unitAuraUpdateInfo.updatedAuraInstanceIDs ~= nil then
			for _, auraInstanceID in ipairs(unitAuraUpdateInfo.updatedAuraInstanceIDs) do
				local wasInDebuff = self.activeDebuffs[auraInstanceID] ~= nil;
				local wasInBuff = self.activeBuffs[auraInstanceID] ~= nil;
				if wasInDebuff or wasInBuff then
					local newAura = C_UnitAuras.GetAuraDataByAuraInstanceID(self.unit, auraInstanceID);
					self.activeDebuffs[auraInstanceID] = nil;
					self.activeBuffs[auraInstanceID] = nil;
					local type = TargetFrame_ProcessAura(self, newAura);
					if type == AuraUpdateChangedType.Buff or wasInBuff then
						buffsChanged = true;
					end
					if type == AuraUpdateChangedType.Debuff or wasInDebuff then
						debuffsChanged = true;
					end
				end
			end
		end

		if unitAuraUpdateInfo.removedAuraInstanceIDs ~= nil then
			for _, auraInstanceID in ipairs(unitAuraUpdateInfo.removedAuraInstanceIDs) do
				if self.activeDebuffs[auraInstanceID] ~= nil then
					self.activeDebuffs[auraInstanceID] = nil;
					debuffsChanged = true;
				elseif self.activeBuffs[auraInstanceID] ~= nil then
					self.activeBuffs[auraInstanceID] = nil;
					buffsChanged = true;
				end
			end
		end
	end

	if not (buffsChanged or debuffsChanged) then
		return;
	end
	
	local playerIsTarget = UnitIsUnit(CfPlayerFrame.unit, self.unit);
	local numBuffs = 0;
	local numDebuffs = 0;
	self.auraPools:ReleaseAll();

	local function UpdateAuraFrame(frame, aura)
		frame.unit = self.unit;
		frame.auraInstanceID = aura.auraInstanceID;
		frame:EnableMouse(false);
		frame.Icon:SetTexture(aura.icon);

		local frameCount = frame.Count;
		if aura.applications > 1 and self.showAuraCount then
			frameCount:SetText(aura.applications);
			frameCount:Show();
		else
			frameCount:Hide();
		end

		CooldownFrame_Set(frame.Cooldown, aura.expirationTime - aura.duration, aura.duration, aura.duration > 0, true);

		if aura.isHarmful then
			local color;
			if aura.dispelName ~= nil then
				color = DebuffTypeColor[aura.dispelName];
			else
				color = DebuffTypeColor["none"];
			end
			frame.Border:SetVertexColor(color.r, color.g, color.b);
		else
			frame.Stealable:SetShown(not playerIsTarget and aura.isStealable);
		end

		frame:ClearAllPoints();
		frame:Show();
	end

	local maxBuffs = math.min(self.maxBuffs or MAX_TARGET_BUFFS, MAX_TARGET_BUFFS);
	numBuffs = math.min(maxBuffs, self.activeBuffs:Size());

	local maxDebuffs = math.min(self.maxDebuffs or MAX_TARGET_DEBUFFS, MAX_TARGET_DEBUFFS);
	numDebuffs = math.min(maxDebuffs, self.activeDebuffs:Size());

	self.auraRows = 0;
	local mirrorAurasVertically = false;
	if self.buffsOnTop then
		mirrorAurasVertically = true;
	end
	local haveTargetofTarget;
	if self.totFrame ~= nil then
		haveTargetofTarget = self.totFrame:IsShown();
	end
	self.spellbarAnchor = nil;
	local maxRowWidth;
	maxRowWidth = ( haveTargetofTarget and self.TOT_AURA_ROW_WIDTH ) or AURA_ROW_WIDTH;
	TargetFrame_UpdateAuraFrames(self, self.activeBuffs, numBuffs, numDebuffs, UpdateAuraFrame, CfTargetFrame_UpdateBuffAnchor, maxRowWidth, 3, mirrorAurasVertically);
	maxRowWidth = ( haveTargetofTarget and self.auraRows < NUM_TOT_AURA_ROWS and self.TOT_AURA_ROW_WIDTH ) or AURA_ROW_WIDTH;
	TargetFrame_UpdateAuraFrames(self, self.activeDebuffs, numDebuffs, numBuffs, UpdateAuraFrame, CfTargetFrame_UpdateDebuffAnchor, maxRowWidth, 4, mirrorAurasVertically);
	if self.spellbar ~= nil then
		Target_Spellbar_AdjustPosition(self.spellbar);
	end
end

function TargetFrame_ShouldShowDebuffs(unit, caster, nameplateShowAll, casterIsAPlayer)
	if (GetCVarBool("noBuffDebuffFilterOnTarget")) then
		return true;
	end

	if (nameplateShowAll) then
		return true;
	end

	if (caster and (UnitIsUnit("player", caster) or UnitIsOwnerOrControllerOfUnit("player", caster))) then
		return true;
	end

	if (UnitIsUnit("player", unit)) then
		return true;
	end

	local targetIsFriendly = not UnitCanAttack("player", unit);
	local targetIsAPlayer =  UnitIsPlayer(unit);
	local targetIsAPlayerPet = UnitIsOtherPlayersPet(unit);
	if (not targetIsAPlayer and not targetIsAPlayerPet and not targetIsFriendly and casterIsAPlayer) then
        return false;
    end

    return true;
end

function TargetFrame_UpdateAuraFrames(self, auraList, numAuras, numOppositeAuras, setupFunc, anchorFunc, maxRowWidth, offsetX, mirrorAurasVertically)
	local size;
	local offsetY = AURA_OFFSET_Y;
	local rowWidth = 0;
	local i = 0;
	local firstIndexOnRow = 1;
	local firstBuffOnRow;
	local lastBuff;
	auraList:Iterate(function(auraInstanceID, aura)
		i = i + 1;
		if i > numAuras then
			return true;
		end
		local template = aura.isHarmful and "CfTargetDebuffFrameTemplate" or "CfTargetBuffFrameTemplate";
		local pool = self.auraPools:GetPool(template);
		local frame = pool:Acquire();
		setupFunc(frame, aura);

		if ShouldAuraBeLarge(aura.sourceUnit) then
			size = LARGE_AURA_SIZE;
			offsetY = AURA_OFFSET_Y + AURA_OFFSET_Y;
		else
			size = SMALL_AURA_SIZE;
		end

		if i == 1 then
			rowWidth = size;
			self.auraRows = self.auraRows + 1;
			firstBuffOnRow = frame;
		else
			rowWidth = rowWidth + size + offsetX;
		end
		if rowWidth > maxRowWidth then
			anchorFunc(self, frame, i, numOppositeAuras, firstBuffOnRow, firstIndexOnRow, size, offsetX, offsetY, mirrorAurasVertically);
			rowWidth = size;
			self.auraRows = self.auraRows + 1;
			firstIndexOnRow = i;
			firstBuffOnRow = frame;
			offsetY = AURA_OFFSET_Y;
			if ( self.auraRows > NUM_TOT_AURA_ROWS ) then
				maxRowWidth = AURA_ROW_WIDTH;
			end
		else
			anchorFunc(self, frame, i, numOppositeAuras, lastBuff, i - 1, size, offsetX, offsetY, mirrorAurasVertically);
		end
		lastBuff = frame;
		return false;
	end);
end

function CfTargetFrame_UpdateBuffAnchor(self, buff, index, numDebuffs, anchorBuff, anchorIndex, size, offsetX, offsetY, mirrorVertically)
	local point, relativePoint;
	local startY, auraOffsetY;
	if ( mirrorVertically ) then
		point = "BOTTOM";
		relativePoint = "TOP";
		startY = -15;
		if ( self.threatNumericIndicator:IsShown() ) then
			startY = startY + self.threatNumericIndicator:GetHeight();
		end
		offsetY = - offsetY;
		auraOffsetY = -AURA_OFFSET_Y;
	else
		point = "TOP";
		relativePoint="BOTTOM";
		startY = AURA_START_Y;
		auraOffsetY = AURA_OFFSET_Y;
	end

	if ( index == 1 ) then
		if ( UnitIsFriend("player", self.unit) or numDebuffs == 0 ) then
			buff:SetPoint(point.."LEFT", self, relativePoint.."LEFT", AURA_START_X, startY);
		else
			buff:SetPoint(point.."LEFT", self.debuffs, relativePoint.."LEFT", 0, -offsetY);
		end
		self.buffs:SetPoint(point.."LEFT", buff, point.."LEFT", 0, 0);
		self.buffs:SetPoint(relativePoint.."LEFT", buff, relativePoint.."LEFT", 0, -auraOffsetY);
		self.spellbarAnchor = buff;
	elseif ( anchorIndex ~= (index-1) ) then
		buff:SetPoint(point.."LEFT", anchorBuff, relativePoint.."LEFT", 0, -offsetY);
		self.buffs:SetPoint(relativePoint.."LEFT", buff, relativePoint.."LEFT", 0, -auraOffsetY);
		self.spellbarAnchor = buff;
	else
		buff:SetPoint(point.."LEFT", anchorBuff, point.."RIGHT", offsetX, 0);
	end

	buff:SetWidth(size);
	buff:SetHeight(size);
end

function CfTargetFrame_UpdateDebuffAnchor(self, buff, index, numBuffs, anchorBuff, anchorIndex, size, offsetX, offsetY, mirrorVertically)
	local isFriend = UnitIsFriend("player", self.unit);
	local point, relativePoint;
	local startY, auraOffsetY;
	if ( mirrorVertically ) then
		point = "BOTTOM";
		relativePoint = "TOP";
		startY = -15;
		if ( self.threatNumericIndicator:IsShown() ) then
			startY = startY + self.threatNumericIndicator:GetHeight();
		end
		offsetY = - offsetY;
		auraOffsetY = -AURA_OFFSET_Y;
	else
		point = "TOP";
		relativePoint="BOTTOM";
		startY = AURA_START_Y;
		auraOffsetY = AURA_OFFSET_Y;
	end

	if ( index == 1 ) then
		if ( isFriend and numBuffs > 0 ) then
			buff:SetPoint(point.."LEFT", self.buffs, relativePoint.."LEFT", 0, -offsetY);
		else
			buff:SetPoint(point.."LEFT", self, relativePoint.."LEFT", AURA_START_X, startY);
		end
		self.debuffs:SetPoint(point.."LEFT", buff, point.."LEFT", 0, 0);
		self.debuffs:SetPoint(relativePoint.."LEFT", buff, relativePoint.."LEFT", 0, -auraOffsetY);
		if ( ( isFriend ) or ( not isFriend and numBuffs == 0) ) then
			self.spellbarAnchor = buff;
		end
	elseif ( anchorIndex ~= (index-1) ) then
		buff:SetPoint(point.."LEFT", anchorBuff, relativePoint.."LEFT", 0, -offsetY);
		self.debuffs:SetPoint(relativePoint.."LEFT", buff, relativePoint.."LEFT", 0, -auraOffsetY);
		if ( ( isFriend ) or ( not isFriend and numBuffs == 0) ) then
			self.spellbarAnchor = buff;
		end
	else
		buff:SetPoint(point.."LEFT", anchorBuff, point.."RIGHT", offsetX, 0);
	end

	buff:SetWidth(size);
	buff:SetHeight(size);
	local debuffFrame = buff.Border;
	debuffFrame:SetWidth(size+2);
	debuffFrame:SetHeight(size+2);
end

function TargetFrame_HealthUpdate(self, elapsed, unit)
	if ( UnitIsPlayer(unit) ) then
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
			if ( self.portrait ) then
				self.portrait:SetAlpha(alpha);
			end
		end
	end
end

function CfTargetHealthCheck(self)
	if ( UnitIsPlayer(self.unit) ) then
		local unitHPMin, unitHPMax, unitCurrHP;
		local parent = self:GetParent();
		unitHPMin, unitHPMax = self:GetMinMaxValues();
		unitCurrHP = self:GetValue();
		parent.unitHPPercent = unitCurrHP / unitHPMax;
		if ( self.portrait ) then
			if ( UnitIsDead(self.unit) ) then
				parent.portrait:SetVertexColor(0.35, 0.35, 0.35, 1.0);
			elseif ( UnitIsGhost(self.unit) ) then
				parent.portrait:SetVertexColor(0.2, 0.2, 0.75, 1.0);
			elseif ( (parent.unitHPPercent > 0) and (parent.unitHPPercent <= 0.2) ) then
				parent.portrait:SetVertexColor(1.0, 0.0, 0.0);
			else
				parent.portrait:SetVertexColor(1.0, 1.0, 1.0, 1.0);
			end
		end
	end
end

function TargetFrame_UpdateRaidTargetIcon(self)
	local index = GetRaidTargetIndex(self.unit);
	if ( index ) then
		SetRaidTargetIconTexture(self.raidTargetIcon, index);
		self.raidTargetIcon:Show();
	else
		self.raidTargetIcon:Hide();
	end
end

function TargetFrame_CreateTargetofTarget(self, unit)
	local thisName = self:GetName().."ToT";
	local frame = CreateFrame("BUTTON", thisName, self, "CfTargetofTargetFrameTemplate");
	frame:SetFrameLevel(_G[self:GetName().."TextureFrame"]:GetFrameLevel() + 5);
	frame:EnableMouse(false);
	self.totFrame = frame;
	CfUnitFrame_Initialize(frame, unit, _G[thisName.."TextureFrameName"], _G[thisName.."Portrait"],
						 _G[thisName.."HealthBar"], _G[thisName.."TextureFrameHealthBarText"],
						 _G[thisName.."ManaBar"], _G[thisName.."TextureFrameManaBarText"]);
	SetTextStatusBarTextZeroText(frame.healthbar, DEAD);
	frame.deadText = _G[thisName.."TextureFrameDeadText"];
	frame.unconsciousText = _G[thisName.."TextureFrameUnconsciousText"];
end

function TargetofTarget_Update(self, elapsed)
	local show;
	local parent = self:GetParent();
	if (CVarCallbackRegistry:GetCVarValueBool("showTargetOfTarget") and UnitExists(parent.unit) and UnitExists(self.unit)
		and (not UnitIsUnit(CfPlayerFrame.unit, parent.unit)) and (UnitHealth(parent.unit) > 0)) then
		if ( not self:IsShown() ) then
			self:Show();
			if ( parent.spellbar ) then
				parent.haveToT = true;
				Target_Spellbar_AdjustPosition(parent.spellbar);
			end
		end
		CfUnitFrame_Update(self);
		TargetofTarget_CheckDead(self);
		CfTargetofTargetHealthCheck(self);
	else
		if ( self:IsShown() ) then
			self:Hide();
			if ( parent.spellbar ) then
				parent.haveToT = nil;
				Target_Spellbar_AdjustPosition(parent.spellbar);
			end
		end
	end
end

function TargetofTarget_CheckDead(self)
	if ( (UnitHealth(self.unit) <= 0) and UnitIsConnected(self.unit) ) then
		self.background:SetAlpha(0.9);
		if ( UnitIsUnconscious(self.unit) ) then
			self.unconsciousText:Show();
			self.deadText:Hide();
		else
			self.unconsciousText:Hide();
			self.deadText:Show();
		end
	else
		self.background:SetAlpha(1);
		self.deadText:Hide();
		self.unconsciousText:Hide();
	end
end

function CfTargetofTargetHealthCheck(self)
	if ( UnitIsPlayer(self.unit) ) then
		local unitHPMin, unitHPMax, unitCurrHP;
		unitHPMin, unitHPMax = self.healthbar:GetMinMaxValues();
		unitCurrHP = self.healthbar:GetValue();
		self.unitHPPercent = unitCurrHP / unitHPMax;
		if ( UnitIsDead(self.unit) ) then
			self.portrait:SetVertexColor(0.35, 0.35, 0.35, 1.0);
		elseif ( UnitIsGhost(self.unit) ) then
			self.portrait:SetVertexColor(0.2, 0.2, 0.75, 1.0);
		elseif ( (self.unitHPPercent > 0) and (self.unitHPPercent <= 0.2) ) then
			self.portrait:SetVertexColor(1.0, 0.0, 0.0);
		else
			self.portrait:SetVertexColor(1.0, 1.0, 1.0, 1.0);
		end
	end
end

function TargetFrame_CreateSpellbar(self, event)
	local name = self:GetName().."SpellBar";
	local spellbar;
	spellbar = CreateFrame("STATUSBAR", name, self, "CfTargetSpellBarTemplate");
	spellbar:SetFrameLevel(_G[self:GetName().."TextureFrame"]:GetFrameLevel() - 1);
	self.spellbar = spellbar;
	self.auraRows = 0;
	spellbar:RegisterEvent("CVAR_UPDATE");
	spellbar:RegisterEvent("VARIABLES_LOADED");

	CfCastingBarFrame_SetUnit(spellbar, self.unit, false, true);
	if ( event ) then
		spellbar.updateEvent = event;
		spellbar:RegisterEvent(event);
	end

	if ( GetCVar("showTargetCastbar") == "0") then
		spellbar.showCastbar = false;
	end
end

function Target_Spellbar_OnEvent(self, event, ...)
	local arg1 = ...

	if ( (event == "VARIABLES_LOADED") or ((event == "CVAR_UPDATE") and (arg1 == "SHOW_TARGET_CASTBAR")) ) then
		if ( GetCVar("showTargetCastbar") == "0") then
			self.showCastbar = false;
		else
			self.showCastbar = true;
		end

		if ( not self.showCastbar ) then
			self:Hide();
		elseif ( self.casting or self.channeling ) then
			self:Show();
		end
		return;
	elseif ( event == self.updateEvent ) then
		local nameChannel  = UnitChannelInfo(self.unit);
		local nameSpell  = UnitCastingInfo(self.unit);
		if ( nameChannel ) then
			event = "UNIT_SPELLCAST_CHANNEL_START";
			arg1 = self.unit;
		elseif ( nameSpell ) then
			event = "UNIT_SPELLCAST_START";
			arg1 = self.unit;
		else
			self.casting = nil;
			self.channeling = nil;
			self:SetMinMaxValues(0, 0);
			self:SetValue(0);
			self:Hide();
			return;
		end
		Target_Spellbar_AdjustPosition(self);
	end
	CfCastingBarFrame_OnEvent(self, event, arg1, select(2, ...));
end

function Target_Spellbar_AdjustPosition(self)
	local parentFrame = self:GetParent();
	if ( parentFrame.haveToT ) then
		if ( parentFrame.buffsOnTop or parentFrame.auraRows <= 1 ) then
			self:SetPoint("TOPLEFT", parentFrame, "BOTTOMLEFT", 25, -21 );
		else
			self:SetPoint("TOPLEFT", parentFrame.spellbarAnchor, "BOTTOMLEFT", 20, -15);
		end
	elseif ( parentFrame.haveElite ) then
		if ( parentFrame.buffsOnTop or parentFrame.auraRows <= 1 ) then
			self:SetPoint("TOPLEFT", parentFrame, "BOTTOMLEFT", 25, -5 );
		else
			self:SetPoint("TOPLEFT", parentFrame.spellbarAnchor, "BOTTOMLEFT", 20, -15);
		end
	else
		if ( (not parentFrame.buffsOnTop) and parentFrame.auraRows > 0 ) then
			self:SetPoint("TOPLEFT", parentFrame.spellbarAnchor, "BOTTOMLEFT", 20, -15);
		else
			self:SetPoint("TOPLEFT", parentFrame, "BOTTOMLEFT", 25, 7 );
		end
	end
end