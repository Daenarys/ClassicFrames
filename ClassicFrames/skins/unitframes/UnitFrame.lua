CfPowerBarColor = {};
CfPowerBarColor["MANA"] = { r = 0.00, g = 0.00, b = 1.00 };
CfPowerBarColor["RAGE"] = { r = 1.00, g = 0.00, b = 0.00, fullPowerAnim=true };
CfPowerBarColor["FOCUS"] = { r = 1.00, g = 0.50, b = 0.25, fullPowerAnim=true };
CfPowerBarColor["ENERGY"] = { r = 1.00, g = 1.00, b = 0.00, fullPowerAnim=true };
CfPowerBarColor["HAPPINESS"] = { r = 1.00, g = 0.41, b = 0.96 };
CfPowerBarColor["RUNIC_POWER"] = { r = 0.00, g = 0.82, b = 1.00 };
CfPowerBarColor["SOUL_SHARDS"] = { r = 0.50, g = 0.32, b = 0.55 };
CfPowerBarColor["LUNAR_POWER"] = { r = 0.30, g = 0.52, b = 0.90, atlas="_Druid-LunarBar" };
CfPowerBarColor["HOLY_POWER"] = { r = 0.95, g = 0.90, b = 0.60 };
CfPowerBarColor["MAELSTROM"] = { r = 0.00, g = 0.50, b = 1.00, atlas = "_Shaman-MaelstromBar", fullPowerAnim=true };
CfPowerBarColor["INSANITY"] = { r = 0.40, g = 0, b = 0.80, atlas = "_Priest-InsanityBar"};
CfPowerBarColor["COMBO_POINTS"] = { r = 1.00, g = 0.96, b = 0.41 };
CfPowerBarColor["CHI"] = { r = 0.71, g = 1.0, b = 0.92 };
CfPowerBarColor["ARCANE_CHARGES"] = { r = 0.1, g = 0.1, b = 0.98 };
CfPowerBarColor["FURY"] = { r = 0.788, g = 0.259, b = 0.992, atlas = "_DemonHunter-DemonicFuryBar", fullPowerAnim=true };
CfPowerBarColor["PAIN"] = { r = 255/255, g = 156/255, b = 0, atlas = "_DemonHunter-DemonicPainBar", fullPowerAnim=true };
-- vehicle colors
CfPowerBarColor["AMMOSLOT"] = { r = 0.80, g = 0.60, b = 0.00 };
CfPowerBarColor["FUEL"] = { r = 0.0, g = 0.55, b = 0.5 };
CfPowerBarColor["STAGGER"] = { {r = 0.52, g = 1.0, b = 0.52}, {r = 1.0, g = 0.98, b = 0.72}, {r = 1.0, g = 0.42, b = 0.42},};

-- these are mostly needed for a fallback case
CfPowerBarColor[0] = CfPowerBarColor["MANA"];
CfPowerBarColor[1] = CfPowerBarColor["RAGE"];
CfPowerBarColor[2] = CfPowerBarColor["FOCUS"];
CfPowerBarColor[3] = CfPowerBarColor["ENERGY"];
CfPowerBarColor[4] = CfPowerBarColor["CHI"];
CfPowerBarColor[6] = CfPowerBarColor["RUNIC_POWER"];
CfPowerBarColor[7] = CfPowerBarColor["SOUL_SHARDS"];
CfPowerBarColor[8] = CfPowerBarColor["LUNAR_POWER"];
CfPowerBarColor[9] = CfPowerBarColor["HOLY_POWER"];
CfPowerBarColor[11] = CfPowerBarColor["MAELSTROM"];
CfPowerBarColor[13] = CfPowerBarColor["INSANITY"];
CfPowerBarColor[17] = CfPowerBarColor["FURY"];
CfPowerBarColor[18] = CfPowerBarColor["PAIN"];

function CfUnitFrame_Initialize(self, unit, name, portrait, healthbar, healthtext, manabar, manatext, threatIndicator, threatFeedbackUnit, threatNumericIndicator,
		myHealPredictionBar, otherHealPredictionBar, totalAbsorbBar, totalAbsorbBarOverlay, overAbsorbGlow, overHealAbsorbGlow, healAbsorbBar, healAbsorbBarLeftShadow,
		healAbsorbBarRightShadow, myManaCostPredictionBar)
	self.unit = unit;
	self.name = name;
	self.portrait = portrait;
	self.healthbar = healthbar;
	self.manabar = manabar;
	self.threatIndicator = threatIndicator;
	self.threatNumericIndicator = threatNumericIndicator;
	self.myHealPredictionBar = myHealPredictionBar;
	self.otherHealPredictionBar = otherHealPredictionBar
	self.totalAbsorbBar = totalAbsorbBar;
	self.totalAbsorbBarOverlay = totalAbsorbBarOverlay;
	self.overAbsorbGlow = overAbsorbGlow;
	self.overHealAbsorbGlow = overHealAbsorbGlow;
	self.healAbsorbBar = healAbsorbBar;
	self.healAbsorbBarLeftShadow = healAbsorbBarLeftShadow;
	self.healAbsorbBarRightShadow = healAbsorbBarRightShadow;
	self.myManaCostPredictionBar = myManaCostPredictionBar;
	if ( self.myHealPredictionBar ) then
		self.myHealPredictionBar:ClearAllPoints();
	end
	if ( self.otherHealPredictionBar ) then
		self.otherHealPredictionBar:ClearAllPoints();
	end
	if ( self.totalAbsorbBar ) then
		self.totalAbsorbBar:ClearAllPoints();
	end
	if ( self.myManaCostPredictionBar ) then
		self.myManaCostPredictionBar:ClearAllPoints();
	end

	if ( self.totalAbsorbBarOverlay ) then
		self.totalAbsorbBar.overlay = self.totalAbsorbBarOverlay;
		self.totalAbsorbBarOverlay:SetAllPoints(self.totalAbsorbBar);
		self.totalAbsorbBarOverlay.tileSize = 32;
	end
	if ( self.overAbsorbGlow ) then
		self.overAbsorbGlow:ClearAllPoints();
		self.overAbsorbGlow:SetPoint("TOPLEFT", self.healthbar, "TOPRIGHT", -7, 0);
		self.overAbsorbGlow:SetPoint("BOTTOMLEFT", self.healthbar, "BOTTOMRIGHT", -7, 0);
	end
	if ( self.healAbsorbBar ) then
		self.healAbsorbBar:ClearAllPoints();
		self.healAbsorbBar:SetTexture("Interface\\RaidFrame\\Absorb-Fill", true, true);
	end
	if ( self.overHealAbsorbGlow ) then
		self.overHealAbsorbGlow:ClearAllPoints();
		self.overHealAbsorbGlow:SetPoint("BOTTOMRIGHT", self.healthbar, "BOTTOMLEFT", 7, 0);
		self.overHealAbsorbGlow:SetPoint("TOPRIGHT", self.healthbar, "TOPLEFT", 7, 0);
	end
	if ( healAbsorbBarLeftShadow ) then
		self.healAbsorbBarLeftShadow:ClearAllPoints();
	end
	if ( healAbsorbBarRightShadow ) then
		self.healAbsorbBarRightShadow:ClearAllPoints();
	end
	if (self.healthbar) then
		self.healthbar.capNumericDisplay = true;
	end
	if (self.manabar) then
		self.manabar.capNumericDisplay = true;
	end
	CfUnitFrameHealthBar_Initialize(unit, healthbar, healthtext, true);
	CfUnitFrameManaBar_Initialize(unit, manabar, manatext, (unit == "player" or unit == "pet" or unit == "vehicle" or unit == "target" or unit == "focus"));
	CfUnitFrameThreatIndicator_Initialize(unit, self, threatFeedbackUnit);
	CfUnitFrame_Update(self);
	self:RegisterForClicks("LeftButtonUp", "RightButtonUp");
	self:RegisterEvent("UNIT_NAME_UPDATE");
	self:RegisterEvent("UNIT_DISPLAYPOWER");
	self:RegisterEvent("UNIT_PORTRAIT_UPDATE")
	self:RegisterEvent("PORTRAITS_UPDATED");
	if ( self.healAbsorbBar ) then
		self:RegisterUnitEvent("UNIT_HEAL_ABSORB_AMOUNT_CHANGED", unit);
	end
	if ( self.myHealPredictionBar ) then
		self:RegisterUnitEvent("UNIT_MAXHEALTH", unit);
		self:RegisterUnitEvent("UNIT_HEAL_PREDICTION", unit);
	end
	if ( self.totalAbsorbBar ) then
		self:RegisterUnitEvent("UNIT_ABSORB_AMOUNT_CHANGED", unit);
	end
	if ( self.myManaCostPredictionBar ) then
		self:RegisterUnitEvent("UNIT_SPELLCAST_START", unit);
		self:RegisterUnitEvent("UNIT_SPELLCAST_STOP", unit);
		self:RegisterUnitEvent("UNIT_SPELLCAST_FAILED", unit);
		self:RegisterUnitEvent("UNIT_SPELLCAST_SUCCEEDED", unit);
	end
end

function CfUnitFrame_SetUnit(self, unit, healthbar, manabar)
	-- update unit events if unit changes
	if ( self.unit ~= unit ) then
		if ( self.myHealPredictionBar ) then
			self:RegisterUnitEvent("UNIT_MAXHEALTH", unit);
			self:RegisterUnitEvent("UNIT_HEAL_PREDICTION", unit);
		end
		if ( self.totalAbsorbBar ) then
			self:RegisterUnitEvent("UNIT_ABSORB_AMOUNT_CHANGED", unit);
		end
		if ( not healthbar.frequentUpdates ) then
			healthbar:RegisterUnitEvent("UNIT_HEALTH", unit);
		end
		if ( manabar and not manabar.frequentUpdates ) then
			CfUnitFrameManaBar_RegisterDefaultEvents(manabar);
		end
		healthbar:RegisterUnitEvent("UNIT_MAXHEALTH", unit);
		
		if ( self.CfPlayerFrameHealthBarAnimatedLoss ) then
			self.CfPlayerFrameHealthBarAnimatedLoss:SetUnitHealthBar(unit, healthbar);
		end
	end

	self.unit = unit;
	CfUnitFrameHealthBar_SetUnit(healthbar, unit)
	if ( manabar ) then	--Party Pet frames don't have a mana bar.
		manabar.unit = unit;
	end
	self:SetAttribute("unit", unit);
	securecall("CfUnitFrame_Update", self);
end

function CfUnitFrame_Update(self, isParty)
	if (self.name) then
		local name;
		if ( self.overrideName ) then
			name = self.overrideName;
		else
			name = self.unit;
		end
		if (isParty) then
			self.name:SetText(CfGetUnitName(name, true));
		else
			self.name:SetText(CfGetUnitName(name));
		end
	end

	CfUnitFramePortrait_Update(self);
	CfUnitFrameHealthBar_Update(self.healthbar, self.unit);
	CfUnitFrameManaBar_Update(self.manabar, self.unit);
	CfUnitFrame_UpdateThreatIndicator(self.threatIndicator, self.threatNumericIndicator);
	CfUnitFrameHealPredictionBars_UpdateMax(self);
	CfUnitFrameHealPredictionBars_Update(self);
	CfUnitFrameManaCostPredictionBars_Update(self);
end

function CfUnitFramePortrait_Update(self)
	if ( self.portrait ) then
		SetPortraitTexture(self.portrait, self.unit);
	end
end

function CfUnitFrame_OnEvent(self, event, ...)
	local eventUnit = ...

	local unit = self.unit;
	if ( eventUnit == unit ) then
		if ( event == "UNIT_NAME_UPDATE" ) then
			self.name:SetText(CfGetUnitName(unit));
		elseif ( event == "UNIT_PORTRAIT_UPDATE" ) then
			CfUnitFramePortrait_Update(self);
		elseif ( event == "UNIT_DISPLAYPOWER" ) then
			if ( self.manabar ) then
				CfUnitFrameManaBar_UpdateType(self.manabar);
			end
		elseif ( event == "UNIT_MAXHEALTH" ) then
			CfUnitFrameHealPredictionBars_UpdateMax(self);
			CfUnitFrameHealPredictionBars_Update(self);
		elseif ( event == "UNIT_HEAL_PREDICTION" ) then
			CfUnitFrameHealPredictionBars_Update(self);
		elseif ( event == "UNIT_ABSORB_AMOUNT_CHANGED" ) then
			CfUnitFrameHealPredictionBars_Update(self);
		elseif ( event == "UNIT_HEAL_ABSORB_AMOUNT_CHANGED" ) then
			CfUnitFrameHealPredictionBars_Update(self);
		elseif ( event == "UNIT_SPELLCAST_START" or event == "UNIT_SPELLCAST_STOP" or event == "UNIT_SPELLCAST_FAILED" or event == "UNIT_SPELLCAST_SUCCEEDED" ) then
			local name, text, texture, startTime, endTime, isTradeSkill, castID, notInterruptible, spellID = UnitCastingInfo(unit);
			CfUnitFrameManaCostPredictionBars_Update(self, event == "UNIT_SPELLCAST_START", startTime, endTime, spellID);
		end
	elseif ( event == "PORTRAITS_UPDATED" ) then
		CfUnitFramePortrait_Update(self);
	end
end

function CfUnitFrameHealPredictionBars_UpdateMax(self)
	if ( not self.myHealPredictionBar ) then
		return;
	end

	CfUnitFrameHealPredictionBars_Update(self);
end

function CfUnitFrameHealPredictionBars_UpdateSize(self)
	if ( not self.myHealPredictionBar or not self.otherHealPredictionBar ) then
		return;
	end

	CfUnitFrameHealPredictionBars_Update(self);
end

--WARNING: This function is very similar to the function CompactCfUnitFrame_UpdateHealPrediction in CompactCfUnitFrame.lua.
--If you are making changes here, it is possible you may want to make changes there as well.
local MAX_INCOMING_HEAL_OVERFLOW = 1.0;
function CfUnitFrameHealPredictionBars_Update(frame)
	if ( not frame.myHealPredictionBar ) then
		return;
	end

	local _, maxHealth = frame.healthbar:GetMinMaxValues();
	local health = frame.healthbar:GetValue();
	if ( maxHealth <= 0 ) then
		return;
	end

	local myIncomingHeal = UnitGetIncomingHeals(frame.unit, "player") or 0;
	local allIncomingHeal = UnitGetIncomingHeals(frame.unit) or 0;
	local totalAbsorb = UnitGetTotalAbsorbs(frame.unit) or 0;

	local myCurrentHealAbsorb = 0;
	if ( frame.healAbsorbBar ) then
		myCurrentHealAbsorb = UnitGetTotalHealAbsorbs(frame.unit) or 0;

		--We don't fill outside the health bar with healAbsorbs.  Instead, an overHealAbsorbGlow is shown.
		if ( health < myCurrentHealAbsorb ) then
			frame.overHealAbsorbGlow:Show();
			myCurrentHealAbsorb = health;
		else
			frame.overHealAbsorbGlow:Hide();
		end
	end

	--See how far we're going over the health bar and make sure we don't go too far out of the frame.
	if ( health - myCurrentHealAbsorb + allIncomingHeal > maxHealth * MAX_INCOMING_HEAL_OVERFLOW ) then
		allIncomingHeal = maxHealth * MAX_INCOMING_HEAL_OVERFLOW - health + myCurrentHealAbsorb;
	end

	local otherIncomingHeal = 0;

	--Split up incoming heals.
	if ( allIncomingHeal >= myIncomingHeal ) then
		otherIncomingHeal = allIncomingHeal - myIncomingHeal;
	else
		myIncomingHeal = allIncomingHeal;
	end

	--We don't fill outside the the health bar with absorbs.  Instead, an overAbsorbGlow is shown.
	local overAbsorb = false;
	if ( health - myCurrentHealAbsorb + allIncomingHeal + totalAbsorb >= maxHealth or health + totalAbsorb >= maxHealth ) then
		if ( totalAbsorb > 0 ) then
			overAbsorb = true;
		end

		if ( allIncomingHeal > myCurrentHealAbsorb ) then
			totalAbsorb = max(0,maxHealth - (health - myCurrentHealAbsorb + allIncomingHeal));
		else
			totalAbsorb = max(0,maxHealth - health);
		end
	end

	if ( overAbsorb ) then
		frame.overAbsorbGlow:Show();
	else
		frame.overAbsorbGlow:Hide();
	end

	local healthTexture = frame.healthbar:GetStatusBarTexture();
	local myCurrentHealAbsorbPercent = 0;
	local healAbsorbTexture = nil;

	if ( frame.healAbsorbBar ) then
		myCurrentHealAbsorbPercent = myCurrentHealAbsorb / maxHealth;

		--If allIncomingHeal is greater than myCurrentHealAbsorb, then the current
		--heal absorb will be completely overlayed by the incoming heals so we don't show it.
		if ( myCurrentHealAbsorb > allIncomingHeal ) then
			local shownHealAbsorb = myCurrentHealAbsorb - allIncomingHeal;
			local shownHealAbsorbPercent = shownHealAbsorb / maxHealth;

			healAbsorbTexture = CfUnitFrameUtil_UpdateFillBar(frame, healthTexture, frame.healAbsorbBar, shownHealAbsorb, -shownHealAbsorbPercent);

			--If there are incoming heals the left shadow would be overlayed by the incoming heals
			--so it isn't shown.
			if ( allIncomingHeal > 0 ) then
				frame.healAbsorbBarLeftShadow:Hide();
			else
				frame.healAbsorbBarLeftShadow:SetPoint("TOPLEFT", healAbsorbTexture, "TOPLEFT", 0, 0);
				frame.healAbsorbBarLeftShadow:SetPoint("BOTTOMLEFT", healAbsorbTexture, "BOTTOMLEFT", 0, 0);
				frame.healAbsorbBarLeftShadow:Show();
			end

			-- The right shadow is only shown if there are absorbs on the health bar.
			if ( totalAbsorb > 0 ) then
				frame.healAbsorbBarRightShadow:SetPoint("TOPLEFT", healAbsorbTexture, "TOPRIGHT", -8, 0);
				frame.healAbsorbBarRightShadow:SetPoint("BOTTOMLEFT", healAbsorbTexture, "BOTTOMRIGHT", -8, 0);
				frame.healAbsorbBarRightShadow:Show();
			else
				frame.healAbsorbBarRightShadow:Hide();
			end
		else
			frame.healAbsorbBar:Hide();
			frame.healAbsorbBarLeftShadow:Hide();
			frame.healAbsorbBarRightShadow:Hide();
		end
	end

	--Show myIncomingHeal on the health bar.
	local incomingHealTexture = CfUnitFrameUtil_UpdateFillBar(frame, healthTexture, frame.myHealPredictionBar, myIncomingHeal, -myCurrentHealAbsorbPercent);

	--Append otherIncomingHeal on the health bar
	if (myIncomingHeal > 0) then
		incomingHealTexture = CfUnitFrameUtil_UpdateFillBar(frame, incomingHealTexture, frame.otherHealPredictionBar, otherIncomingHeal);
	else
		incomingHealTexture = CfUnitFrameUtil_UpdateFillBar(frame, healthTexture, frame.otherHealPredictionBar, otherIncomingHeal, -myCurrentHealAbsorbPercent);
	end

	--Append absorbs to the correct section of the health bar.
	local appendTexture = nil;
	if ( healAbsorbTexture ) then
		--If there is a healAbsorb part shown, append the absorb to the end of that.
		appendTexture = healAbsorbTexture;
	else
		--Otherwise, append the absorb to the end of the the incomingHeals part;
		appendTexture = incomingHealTexture;
	end
	CfUnitFrameUtil_UpdateFillBar(frame, appendTexture, frame.totalAbsorbBar, totalAbsorb)
end

function CfUnitFrameManaCostPredictionBars_Update(frame, isStarting, startTime, endTime, spellID)
	if (not frame.manabar or not frame.myManaCostPredictionBar) then
		return;
	end

	local cost = 0;
	if (not isStarting or startTime == endTime) then
        local currentSpellID = select(9, UnitCastingInfo(frame.unit));
        if(currentSpellID and frame.predictedPowerCost) then --if we're currently casting something with a power cost, then whatever cast
		    cost = frame.predictedPowerCost;                 --just finished was allowed while casting, don't reset the original cast
        else
            frame.predictedPowerCost = nil;
        end
	else
		local costTable = GetSpellPowerCost(spellID);
		for _, costInfo in pairs(costTable) do
			if (costInfo.type == frame.manabar.powerType) then
				cost = costInfo.cost;
				break;
			end
		end
		frame.predictedPowerCost = cost;
	end
	local manaBarTexture = frame.manabar:GetStatusBarTexture();
	CfUnitFrameManaBar_Update(frame.manabar, frame.unit);
	CfUnitFrameUtil_UpdateManaFillBar(frame, manaBarTexture, frame.myManaCostPredictionBar, cost);
end

--WARNING: This function is very similar to the function CompactCfUnitFrameUtil_UpdateFillBar in CompactCfUnitFrame.lua.
--If you are making changes here, it is possible you may want to make changes there as well.
function CfUnitFrameUtil_UpdateFillBarBase(frame, realbar, previousTexture, bar, amount, barOffsetXPercent)
	if ( amount == 0 ) then
		bar:Hide();
		if ( bar.overlay ) then
			bar.overlay:Hide();
		end
		return previousTexture;
	end

	local barOffsetX = 0;
	if ( barOffsetXPercent ) then
		local realbarSizeX = realbar:GetWidth();
		barOffsetX = realbarSizeX * barOffsetXPercent;
	end

	bar:SetPoint("TOPLEFT", previousTexture, "TOPRIGHT", barOffsetX, 0);
	bar:SetPoint("BOTTOMLEFT", previousTexture, "BOTTOMRIGHT", barOffsetX, 0);

	local totalWidth, totalHeight = realbar:GetSize();
	local _, totalMax = realbar:GetMinMaxValues();

	local barSize = (amount / totalMax) * totalWidth;
	bar:SetWidth(barSize);
	bar:Show();
	if ( bar.overlay ) then
		bar.overlay:SetTexCoord(0, barSize / bar.overlay.tileSize, 0, totalHeight / bar.overlay.tileSize);
		bar.overlay:Show();
	end
	return bar;
end

function CfUnitFrameUtil_UpdateFillBar(frame, previousTexture, bar, amount, barOffsetXPercent)
	return CfUnitFrameUtil_UpdateFillBarBase(frame, frame.healthbar, previousTexture, bar, amount, barOffsetXPercent);
end

function CfUnitFrameUtil_UpdateManaFillBar(frame, previousTexture, bar, amount, barOffsetXPercent)
	return CfUnitFrameUtil_UpdateFillBarBase(frame, frame.manabar, previousTexture, bar, amount, barOffsetXPercent);
end

function CfUnitFrameManaBar_UpdateType(manaBar)
	if ( not manaBar ) then
		return;
	end
	local unitFrame = manaBar:GetParent();
	local powerType, powerToken, altR, altG, altB = UnitPowerType(manaBar.unit);
	if powerType == nil then
		powerType = 0
	end
	local prefix = _G[powerToken];
	local info = CfPowerBarColor[powerToken];
	if ( info ) then
		if ( not manaBar.lockColor ) then
			local playerDeadOrGhost = manaBar.unit == "player" and (UnitIsDead("player") or UnitIsGhost("player")) and not UnitIsFeignDeath("player");
			if ( info.atlas ) then
				manaBar:SetStatusBarTexture(info.atlas);
				manaBar:SetStatusBarColor(1, 1, 1);
				manaBar:GetStatusBarTexture():SetDesaturated(playerDeadOrGhost);
				manaBar:GetStatusBarTexture():SetAlpha(playerDeadOrGhost and 0.5 or 1);
			else
				manaBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar");
				if ( playerDeadOrGhost ) then
					manaBar:SetStatusBarColor(0.6, 0.6, 0.6, 0.5);
				else
					manaBar:SetStatusBarColor(info.r, info.g, info.b, 1);
				end
			end

			if ( manaBar.FeedbackFrame ) then
				manaBar.FeedbackFrame:Initialize(info, manaBar.unit, powerType);
			end

			if ( manaBar.FullPowerFrame ) then
				manaBar.FullPowerFrame:Initialize(info.fullPowerAnim);
			end
		end
	else
		if ( not altR) then
			-- couldn't find a power token entry...default to indexing by power type or just mana if we don't have that either
			info = CfPowerBarColor[powerType] or CfPowerBarColor["MANA"];
		else
			if ( not manaBar.lockColor ) then
				manaBar:SetStatusBarColor(altR, altG, altB);
			end
		end
	end
	if ( manaBar.powerType ~= powerType or manaBar.powerType ~= powerType ) then
		manaBar.powerType = powerType;
		manaBar.powerToken = powerToken;
		if ( manaBar.FullPowerFrame ) then
			manaBar.FullPowerFrame:RemoveAnims();
		end
		manaBar.currValue = UnitPower("player", powerType);
	end

	-- Update the manabar text
	if ( not unitFrame.noTextPrefix ) then
		SetTextStatusBarTextPrefix(manaBar, prefix);
	end
	TextStatusBar_UpdateTextString(manaBar);
end

function CfUnitFrameHealthBar_Initialize(unit, statusbar, statustext, frequentUpdates)
	if ( not statusbar ) then
		return;
	end

	statusbar.unit = unit;
	SetTextStatusBarText(statusbar, statustext);

	statusbar.frequentUpdates = frequentUpdates;
	if ( frequentUpdates ) then
		statusbar:RegisterEvent("VARIABLES_LOADED");
	end
	
	CfUnitFrameHealthBar_RefreshUpdateEvent(statusbar);

	statusbar:RegisterUnitEvent("UNIT_MAXHEALTH", unit);
	statusbar:SetScript("OnEvent", CfUnitFrameHealthBar_OnEvent);
end

function CfUnitFrameHealthBar_RefreshUpdateEvent(self)
	if ( GetCVarBool("predictedHealth") and self.frequentUpdates ) then
		self:SetScript("OnUpdate", CfUnitFrameHealthBar_OnUpdate);
		self:UnregisterEvent("UNIT_HEALTH");
	else
		self:SetScript("OnUpdate", nil);
		self:RegisterUnitEvent("UNIT_HEALTH", self.unit);
	end
end

function CfUnitFrameHealthBar_SetUnit(self, unit)
	self.unit = unit;
	CfUnitFrameHealthBar_RefreshUpdateEvent(self);
end

function CfUnitFrameHealthBar_OnEvent(self, event, ...)
	if ( event == "CVAR_UPDATE" ) then
		TextStatusBar_OnEvent(self, event, ...);
	elseif ( event == "VARIABLES_LOADED" ) then
		self:UnregisterEvent("VARIABLES_LOADED");
		CfUnitFrameHealthBar_RefreshUpdateEvent(self);
	elseif self:IsShown() then
		if ( not self.ignoreNoUnit or UnitGUID(self.unit) ) then
			CfUnitFrameHealthBar_Update(self, ...);
		end
	end
end

CfAnimatedHealthLossMixin = {};

function CfAnimatedHealthLossMixin:OnLoad()
	self:SetStatusBarColor(1, 0, 0, 1);
	self:SetDuration(.25);
	self:SetStartDelay(.1);
	self:SetPauseDelay(.05);
	self:SetPostponeDelay(.05);
end

function CfAnimatedHealthLossMixin:SetDuration(duration)
	self.animationDuration = duration or 0;
end

function CfAnimatedHealthLossMixin:SetStartDelay(delay)
	self.animationStartDelay = delay or 0;
end

function CfAnimatedHealthLossMixin:SetPauseDelay(delay)
	self.animationPauseDelay = delay or 0;
end

function CfAnimatedHealthLossMixin:SetPostponeDelay(delay)
	self.animationPostponeDelay = delay or 0;
end

function CfAnimatedHealthLossMixin:SetUnitHealthBar(unit, healthBar)
	if self.unit ~= unit then
		healthBar.AnimatedLossBar = self;

		self.unit = unit;
		self:SetAllPoints(healthBar);
		self:UpdateHealthMinMax();
	end
end

function CfAnimatedHealthLossMixin:UpdateHealthMinMax()
	local maxValue = UnitHealthMax(self.unit);
	self:SetMinMaxValues(0, maxValue);
end

function CfAnimatedHealthLossMixin:GetHealthLossAnimationData(currentHealth, previousHealth)
	if self.animationStartTime then
		local totalElapsedTime = GetTime() - self.animationStartTime;
		if totalElapsedTime > 0 then
			local animCompletePercent = totalElapsedTime / self.animationDuration;
			if animCompletePercent < 1 and previousHealth > currentHealth then
				local healthDelta = previousHealth - currentHealth;
				local animatedLossAmount = previousHealth - (animCompletePercent * healthDelta);
				return animatedLossAmount, animCompletePercent;
			end
		else
			return previousHealth, 0;
		end
	end
	return 0, 1; -- Animated loss amount is 0, and the animation is fully complete.
end

function CfAnimatedHealthLossMixin:CancelAnimation()
	self:Hide();
	self.animationStartTime = nil;
	self.animationCompletePercent = nil;
end

function CfAnimatedHealthLossMixin:BeginAnimation(value)
	self.animationStartValue = value;
	self.animationStartTime = GetTime() + self.animationStartDelay;
	self.animationCompletePercent = 0;
	self:Show();
	self:SetValue(self.animationStartValue);
end

function CfAnimatedHealthLossMixin:PostponeStartTime()
	self.animationStartTime = self.animationStartTime + self.animationPostponeDelay;
end

function CfAnimatedHealthLossMixin:UpdateHealth(currentHealth, previousHealth)
	local delta = currentHealth - previousHealth;
	local hasLoss = delta < 0;
	local hasBegun = self.animationStartTime ~= nil;
	local isAnimating = hasBegun and self.animationCompletePercent > 0;

	if hasLoss and not hasBegun then
		self:BeginAnimation(previousHealth);
	elseif hasLoss and hasBegun and not isAnimating then
		self:PostponeStartTime();
	elseif hasLoss and isAnimating then
		-- Reset the starting value of the health to what the animated loss bar was when the new incoming damage happened
		-- and pause briefly when new damage occurs.
		self.animationStartValue = self:GetHealthLossAnimationData(previousHealth, self.animationStartValue);
		self.animationStartTime = GetTime() + self.animationPauseDelay;
	elseif not hasLoss and hasBegun and currentHealth >= self.animationStartValue then
		self:CancelAnimation();
	end
end

function CfAnimatedHealthLossMixin:UpdateLossAnimation(currentHealth)
	local totalAbsorb = UnitGetTotalAbsorbs(self.unit) or 0;
	if totalAbsorb > 0 then
		self:CancelAnimation();
	end

	if self.animationStartTime then
		local animationValue, animationCompletePercent = self:GetHealthLossAnimationData(currentHealth, self.animationStartValue);
		self.animationCompletePercent = animationCompletePercent;
		if animationCompletePercent >= 1 then
			self:CancelAnimation();
		else
			self:SetValue(animationValue);
		end
	end
end

function CfUnitFrameHealthBar_OnUpdate(self)
	if ( not self.disconnected and not self.lockValues) then
		local currValue = UnitHealth(self.unit);
		local animatedLossBar = self.AnimatedLossBar;

		if ( currValue ~= self.currValue ) then
			if ( not self.ignoreNoUnit or UnitGUID(self.unit) ) then

				if animatedLossBar then
					animatedLossBar:UpdateHealth(currValue, self.currValue);
				end

				self:SetValue(currValue);
				self.currValue = currValue;
				TextStatusBar_UpdateTextString(self);
				CfUnitFrameHealPredictionBars_Update(self:GetParent());
			end
		end

		if animatedLossBar then
			animatedLossBar:UpdateLossAnimation(currValue);
		end
	end
end

function CfUnitFrameHealthBar_Update(statusbar, unit)
	if ( not statusbar or statusbar.lockValues ) then
		return;
	end

	if ( unit == statusbar.unit ) then
		local maxValue = UnitHealthMax(unit);

		-- Safety check to make sure we never get an empty bar.
		statusbar.forceHideText = false;
		if ( maxValue == 0 ) then
			maxValue = 1;
			statusbar.forceHideText = true;
		end

		statusbar:SetMinMaxValues(0, maxValue);

		if statusbar.AnimatedLossBar then
			statusbar.AnimatedLossBar:UpdateHealthMinMax();
		end

		statusbar.disconnected = not UnitIsConnected(unit);
		if ( statusbar.disconnected ) then
			if ( not statusbar.lockColor ) then
				statusbar:SetStatusBarColor(0.5, 0.5, 0.5);
			end
			statusbar:SetValue(maxValue);
			statusbar.currValue = maxValue;
		else
			local currValue = UnitHealth(unit);
			if ( not statusbar.lockColor ) then
				statusbar:SetStatusBarColor(0.0, 1.0, 0.0);
			end
			statusbar:SetValue(currValue);
			statusbar.currValue = currValue;
		end
	end
	TextStatusBar_UpdateTextString(statusbar);
	CfUnitFrameHealPredictionBars_Update(statusbar:GetParent());
end

function CfUnitFrameHealthBar_OnValueChanged(self, value)
	TextStatusBar_OnValueChanged(self, value);
	HealthBar_OnValueChanged(self, value);
end

function CfUnitFrameManaBar_UnregisterDefaultEvents(self)
	self:UnregisterEvent("UNIT_POWER_UPDATE");
end

function CfUnitFrameManaBar_RegisterDefaultEvents(self)
	self:RegisterUnitEvent("UNIT_POWER_UPDATE", self.unit);
end

function CfUnitFrameManaBar_Initialize(unit, statusbar, statustext, frequentUpdates)
	if ( not statusbar ) then
		return;
	end
	statusbar.unit = unit;
	statusbar.texture = statusbar:GetStatusBarTexture();
	SetTextStatusBarText(statusbar, statustext);

	statusbar.frequentUpdates = frequentUpdates;
	if ( frequentUpdates ) then
		statusbar:RegisterEvent("VARIABLES_LOADED");
	end
	if ( frequentUpdates ) then
		statusbar:SetScript("OnUpdate", CfUnitFrameManaBar_OnUpdate);
	else
		CfUnitFrameManaBar_RegisterDefaultEvents(statusbar);
	end
	statusbar:RegisterEvent("UNIT_DISPLAYPOWER");
	statusbar:RegisterUnitEvent("UNIT_MAXPOWER", unit);
	if ( statusbar.unit == "player" ) then
		statusbar:RegisterEvent("PLAYER_DEAD");
		statusbar:RegisterEvent("PLAYER_ALIVE");
		statusbar:RegisterEvent("PLAYER_UNGHOST");
	end
	statusbar:SetScript("OnEvent", CfUnitFrameManaBar_OnEvent);
end

function CfUnitFrameManaBar_OnEvent(self, event, ...)
	if ( event == "CVAR_UPDATE" ) then
		TextStatusBar_OnEvent(self, event, ...);
	elseif ( event == "VARIABLES_LOADED" ) then
		self:UnregisterEvent("VARIABLES_LOADED");
		if ( self.frequentUpdates ) then
			self:SetScript("OnUpdate", CfUnitFrameManaBar_OnUpdate);
			CfUnitFrameManaBar_UnregisterDefaultEvents(self);
		else
			CfUnitFrameManaBar_RegisterDefaultEvents(self);
			self:SetScript("OnUpdate", nil);
		end
	elseif ( event == "PLAYER_ALIVE"  or event == "PLAYER_DEAD" or event == "PLAYER_UNGHOST" ) then
		CfUnitFrameManaBar_UpdateType(self);
	else
		if ( not self.ignoreNoUnit or UnitGUID(self.unit) ) then
			CfUnitFrameManaBar_Update(self, ...);
		end
	end
end

function CfUnitFrameManaBar_OnUpdate(self)
	if ( not self.disconnected and not self.lockValues ) then
		local predictedCost = self:GetParent().predictedPowerCost;
		local currValue = UnitPower(self.unit, self.powerType);
		if (predictedCost) then
			currValue = currValue - predictedCost;
		end
		if ( currValue ~= self.currValue or self.forceUpdate ) then
			self.forceUpdate = nil;
			if ( not self.ignoreNoUnit or UnitGUID(self.unit) ) then
				if ( self.FeedbackFrame and self.FeedbackFrame.maxValue ) then
					-- Only show anim if change is more than 10%
					local oldValue = self.currValue or 0;
					if ( self.FeedbackFrame.maxValue ~= 0 and math.abs(currValue - oldValue) / self.FeedbackFrame.maxValue > 0.1 ) then
						self.FeedbackFrame:StartFeedbackAnim(oldValue, currValue);
					end
				end
				if ( self.FullPowerFrame and self.FullPowerFrame.active ) then
					self.FullPowerFrame:StartAnimIfFull(self.currValue or 0, currValue);
				end
				self:SetValue(currValue);
				self.currValue = currValue;
				TextStatusBar_UpdateTextString(self);
			end
		end
	end
end

function CfUnitFrameManaBar_Update(statusbar, unit)
	if ( not statusbar or statusbar.lockValues ) then
		return;
	end

	if ( unit == statusbar.unit ) then
		-- be sure to update the power type before grabbing the max power!
		CfUnitFrameManaBar_UpdateType(statusbar);

		local maxValue = UnitPowerMax(unit, statusbar.powerType);

		statusbar:SetMinMaxValues(0, maxValue);

		statusbar.disconnected = not UnitIsConnected(unit);
		if ( statusbar.disconnected ) then
			statusbar:SetValue(maxValue);
			statusbar.currValue = maxValue;
			if ( not statusbar.lockColor ) then
				statusbar:SetStatusBarColor(0.5, 0.5, 0.5);
			end
		else
			local predictedCost = statusbar:GetParent().predictedPowerCost;
			local currValue = UnitPower(unit, statusbar.powerType);
			if (predictedCost) then
				currValue = currValue - predictedCost;
			end
			if ( statusbar.FullPowerFrame ) then
				statusbar.FullPowerFrame:SetMaxValue(maxValue);
			end

			statusbar:SetValue(currValue);
			statusbar.forceUpdate = true;
		end
	end
	TextStatusBar_UpdateTextString(statusbar);
end

function CfUnitFrameThreatIndicator_Initialize(unit, unitFrame, feedbackUnit)
	local indicator = unitFrame.threatIndicator;
	if ( not indicator ) then
		return;
	end

	indicator.unit = unit;
	indicator.feedbackUnit = feedbackUnit or unit;

	unitFrame:RegisterEvent("UNIT_THREAT_SITUATION_UPDATE");
	if ( unitFrame.OnEvent == nil ) then
		unitFrame.OnEvent = unitFrame:GetScript("OnEvent") or false;
	end
	unitFrame:SetScript("OnEvent", CfUnitFrameThreatIndicator_OnEvent);
end

function CfUnitFrameThreatIndicator_OnEvent(self, event, ...)
	if ( self.OnEvent ) then
		self.OnEvent(self, event, ...);
	end
	if ( event == "UNIT_THREAT_SITUATION_UPDATE" ) then
		CfUnitFrame_UpdateThreatIndicator(self.threatIndicator, self.threatNumericIndicator,...);
	end
end

function CfUnitFrame_UpdateThreatIndicator(indicator, numericIndicator, unit)
	if ( not indicator ) then
		return;
	end

	if ( not unit or unit == indicator.feedbackUnit ) then
		local status;
		if ( indicator.feedbackUnit ~= indicator.unit ) then
			status = UnitThreatSituation(indicator.feedbackUnit, indicator.unit);
		else
			status = UnitThreatSituation(indicator.feedbackUnit);
		end

		if ( IsThreatWarningEnabled() ) then
			if (status and status > 0) then
				indicator:SetVertexColor(GetThreatStatusColor(status));
				indicator:Show();
			else
				indicator:Hide();
			end

			if ( numericIndicator ) then
				if ( CfShowNumericThreat() and not (UnitClassification(indicator.unit) == "minus") ) then
					local isTanking, status, percentage, rawPercentage = UnitDetailedThreatSituation(indicator.feedbackUnit, indicator.unit);
					local display = rawPercentage;
					if ( isTanking ) then
						display = UnitThreatPercentageOfLead(indicator.feedbackUnit, indicator.unit);
					end
					if ( display and display ~= 0 ) then
						numericIndicator.text:SetText(format("%1.0f", display).."%");
						numericIndicator.bg:SetVertexColor(GetThreatStatusColor(status));
						numericIndicator:Show();
					else
						numericIndicator:Hide();
					end
				else
					numericIndicator:Hide();
				end
			end
		else
			indicator:Hide();
			if ( numericIndicator ) then
				numericIndicator:Hide();
			end
		end
	end
end

function CfGetUnitName(unit, showServerName)
	local name, server = UnitName(unit);
	local relationship = UnitRealmRelationship(unit);
	if ( server and server ~= "" ) then
		if ( showServerName ) then
			return name.."-"..server;
		else
			if (relationship == LE_REALM_RELATION_VIRTUAL) then
				return name;
			else
				return name..FOREIGN_SERVER_LABEL;
			end
		end
	else
		return name;
	end
end

function CfShowNumericThreat()
	if ( GetCVar("threatShowNumeric") == "1" ) then
		return true;
	else
		return false;
	end
end

hooksecurefunc("UnitFrameManaBar_UpdateType", function(manaBar)
	if ( not manaBar ) then
		return
	end

	local powerType, powerToken, altR, altG, altB = UnitPowerType(manaBar.unit)
	local info = CfPowerBarColor[powerToken]

	manaBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")

	if ( info ) then
		local playerDeadOrGhost = (manaBar.unit == "player" and (UnitIsDead("player") or UnitIsGhost("player")))
		if ( info.atlas ) then
			manaBar:SetStatusBarTexture(info.atlas)
			manaBar:SetStatusBarColor(1, 1, 1)
			manaBar:GetStatusBarTexture():SetDesaturated(playerDeadOrGhost)
			manaBar:GetStatusBarTexture():SetAlpha(playerDeadOrGhost and 0.5 or 1)
		else
			if ( playerDeadOrGhost ) then
				manaBar:SetStatusBarColor(0.6, 0.6, 0.6, 0.5)
			else
				manaBar:SetStatusBarColor(info.r, info.g, info.b)
			end
		end
		if (manaBar.FeedbackFrame) then
			if (info.atlas) then
				manaBar.FeedbackFrame.BarTexture:SetAtlas(info.atlas, false)
			else
				manaBar.FeedbackFrame.BarTexture:SetVertexColor(info.r, info.g, info.b)
			end
		end
		if (manaBar.Spark) then
			manaBar.Spark:SetAlpha(0)
		end
	else
		if ( not altR ) then
			info = CfPowerBarColor[powerType] or CfPowerBarColor["MANA"]
		else
			manaBar:SetStatusBarColor(altR, altG, altB)
		end
	end
end)