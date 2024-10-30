function CfUnitFrame_Initialize(self, unit, healthbar, healthtext, manabar, manatext,
	myHealPredictionBar, otherHealPredictionBar, totalAbsorbBar, overAbsorbGlow, overHealAbsorbGlow, healAbsorbBar)
	self.unit = unit;
	self.healthbar = healthbar;
	self.manabar = manabar;
	self.myHealPredictionBar = myHealPredictionBar;
	self.otherHealPredictionBar = otherHealPredictionBar
	self.totalAbsorbBar = totalAbsorbBar;
	self.overAbsorbGlow = overAbsorbGlow;
	self.overHealAbsorbGlow = overHealAbsorbGlow;
	self.healAbsorbBar = healAbsorbBar;

	if (self.overAbsorbGlow) then
		self.overAbsorbGlow:ClearAllPoints()
		self.overAbsorbGlow:SetPoint("TOPLEFT", self.healthbar, "TOPRIGHT", -7, 0)
		self.overAbsorbGlow:SetPoint("BOTTOMLEFT", self.healthbar, "BOTTOMRIGHT", -7, 0)
	end
	if (self.overHealAbsorbGlow) then
		self.overHealAbsorbGlow:ClearAllPoints()
		self.overHealAbsorbGlow:SetPoint("BOTTOMRIGHT", self.healthbar, "BOTTOMLEFT", 7, 0)
		self.overHealAbsorbGlow:SetPoint("TOPRIGHT", self.healthbar, "TOPLEFT", 7, 0)
	end

	if (self.healthbar) then
		self.healthbar.capNumericDisplay = true;
		self.healthbar.unitFrame = self;
	end
	if (self.manabar) then
		self.manabar.capNumericDisplay = true;
		self.manabar.unitFrame = self;
	end

	CfUnitFrameHealthBar_Initialize(unit, healthbar, healthtext, true)
	CfUnitFrameManaBar_Initialize(unit, manabar, manatext, manaBarFrequentUpdates)
	CfUnitFrame_Update(self)

	self:RegisterEvent("UNIT_DISPLAYPOWER")
	if ( self.healAbsorbBar ) then
		self:RegisterUnitEvent("UNIT_HEAL_ABSORB_AMOUNT_CHANGED", unit)
	end
	if ( self.myHealPredictionBar ) then
		self:RegisterUnitEvent("UNIT_MAXHEALTH", unit)
		self:RegisterUnitEvent("UNIT_HEAL_PREDICTION", unit)
	end
	if ( self.totalAbsorbBar ) then
		self:RegisterUnitEvent("UNIT_ABSORB_AMOUNT_CHANGED", unit)
	end
end

function CfUnitFrame_SetUnit(self, unit, healthbar, manabar)
	-- update unit events if unit changes
	if ( self.unit ~= unit ) then
		if ( self.myHealPredictionBar ) then
			self:RegisterUnitEvent("UNIT_MAXHEALTH", unit)
			self:RegisterUnitEvent("UNIT_HEAL_PREDICTION", unit)
		end
		if ( self.totalAbsorbBar ) then
			self:RegisterUnitEvent("UNIT_ABSORB_AMOUNT_CHANGED", unit)
		end
		if ( not healthbar.frequentUpdates ) then
			healthbar:RegisterUnitEvent("UNIT_HEALTH", unit)
		end
		if ( manabar and not manabar.frequentUpdates ) then
			CfUnitFrameManaBar_RegisterDefaultEvents(manabar)
		end
		healthbar:RegisterUnitEvent("UNIT_MAXHEALTH", unit)
		
		if ( self.PlayerFrameHealthBarAnimatedLoss ) then
			self.PlayerFrameHealthBarAnimatedLoss:SetUnitHealthBar(unit, healthbar)
		end
	end

	self.unit = unit;

	CfUnitFrameHealthBar_SetUnit(healthbar, unit)
	if ( manabar ) then	--Party Pet frames don't have a mana bar.
		manabar.unit = unit;
	end
	self:SetAttribute("unit", unit)
	securecall("CfUnitFrame_Update", self)
end

function CfUnitFrame_Update(self, isParty)
	CfUnitFrameHealthBar_Update(self.healthbar, self.unit)
	CfUnitFrameManaBar_Update(self.manabar, self.unit)
	CfUnitFrameHealPredictionBars_UpdateMax(self)
	CfUnitFrameHealPredictionBars_Update(self)
end

function CfUnitFrame_OnEvent(self, event, ...)
	local eventUnit, arg2 = ...

	local unit = self.unit;
	if ( eventUnit == unit ) then
	if ( event == "UNIT_DISPLAYPOWER" ) then
			if ( self.manabar ) then
				CfUnitFrameManaBar_UpdateType(self.manabar)
			end
		elseif ( event == "UNIT_MAXHEALTH" ) then
			CfUnitFrameHealPredictionBars_UpdateMax(self)
		elseif ( event == "UNIT_HEAL_PREDICTION" ) then
			CfUnitFrameHealPredictionBars_Update(self)
		elseif ( event == "UNIT_ABSORB_AMOUNT_CHANGED" ) then
			CfUnitFrameHealPredictionBars_Update(self)
		elseif ( event == "UNIT_HEAL_ABSORB_AMOUNT_CHANGED" ) then
			CfUnitFrameHealPredictionBars_Update(self)
		elseif ( event == "UNIT_MAX_HEALTH_MODIFIERS_CHANGED" ) then
			CfUnitFrameHealthBar_OnUpdate(self.healthbar)
		end
	end
end

function CfUnitFrameHealPredictionBars_UpdateMax(self)
	CfUnitFrameHealPredictionBars_Update(self)
end

function CfUnitFrameHealPredictionBars_UpdateSize(self)
	CfUnitFrameHealPredictionBars_Update(self)
end

local MAX_INCOMING_HEAL_OVERFLOW = 1.0;
function CfUnitFrameHealPredictionBars_Update(frame)
	if ( not frame.myHealPredictionBar and not frame.otherHealPredictionBar and not frame.healAbsorbBar and not frame.totalAbsorbBar ) then
		return;
	end

	local _, maxHealth = frame.healthbar:GetMinMaxValues()
	local health = frame.healthbar:GetValue()
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
			frame.overHealAbsorbGlow:Show()
			myCurrentHealAbsorb = health;
		else
			frame.overHealAbsorbGlow:Hide()
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
			totalAbsorb = max(0,maxHealth - (health - myCurrentHealAbsorb + allIncomingHeal))
		else
			totalAbsorb = max(0,maxHealth - health)
		end
	end

	if ( overAbsorb ) then
		frame.overAbsorbGlow:Show()
	else
		frame.overAbsorbGlow:Hide()
	end

	local healthTexture = frame.healthbar:GetStatusBarTexture()
	local myCurrentHealAbsorbPercent = 0;
	local healAbsorbTexture = nil;

	if ( frame.healAbsorbBar ) then
		myCurrentHealAbsorbPercent = myCurrentHealAbsorb / maxHealth;

		--If allIncomingHeal is greater than myCurrentHealAbsorb, then the current
		--heal absorb will be completely overlayed by the incoming heals so we don't show it.
		if ( myCurrentHealAbsorb > allIncomingHeal ) then
			local shownHealAbsorb = myCurrentHealAbsorb - allIncomingHeal;
			local shownHealAbsorbPercent = shownHealAbsorb / maxHealth;

			healAbsorbTexture = frame.healAbsorbBar:UpdateFillPosition(healthTexture, shownHealAbsorb, -shownHealAbsorbPercent)

			--If there are incoming heals the left shadow would be overlayed by the incoming heals
			--so it isn't shown.
			frame.healAbsorbBar.LeftShadow:SetShown(allIncomingHeal <= 0)

			-- The right shadow is only shown if there are absorbs on the health bar.
			frame.healAbsorbBar.RightShadow:SetShown(totalAbsorb > 0)
		else
			frame.healAbsorbBar:Hide()
		end
	end

	--Show myIncomingHeal on the health bar.
	local incomingHealTexture;
	if ( frame.myHealPredictionBar ) then
		incomingHealTexture = frame.myHealPredictionBar:UpdateFillPosition(healthTexture, myIncomingHeal, -myCurrentHealAbsorbPercent)
	end

	local otherHealLeftTexture = (myIncomingHeal > 0) and incomingHealTexture or healthTexture;
	local xOffset = (myIncomingHeal > 0) and 0 or -myCurrentHealAbsorbPercent;

	--Append otherIncomingHeal on the health bar
	if ( frame.otherHealPredictionBar ) then
		incomingHealTexture = frame.otherHealPredictionBar:UpdateFillPosition(otherHealLeftTexture, otherIncomingHeal, xOffset)
	end

	--Append absorbs to the correct section of the health bar.
	local appendTexture = nil;
	if ( healAbsorbTexture ) then
		--If there is a healAbsorb part shown, append the absorb to the end of that.
		appendTexture = healAbsorbTexture;
	else
		--Otherwise, append the absorb to the end of the the incomingHeals or health part;
		appendTexture = incomingHealTexture or healthTexture;
	end

	if ( frame.totalAbsorbBar ) then
		frame.totalAbsorbBar:UpdateFillPosition(appendTexture, totalAbsorb)
	end
end

function CfUnitFrameManaBar_UpdateType(manaBar)
	if ( not manaBar ) then
		return;
	end

	local powerType, powerToken, altR, altG, altB = UnitPowerType(manaBar.unit)
	local prefix = _G[powerToken];
	local info = PowerBarColor[powerToken];

	manaBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")

	if ( info ) then
		if ( not manaBar.lockColor ) then
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

			if ( manaBar.FeedbackFrame ) then
				manaBar.FeedbackFrame:Initialize(info, manaBar.unit, powerType)
			end

			if ( manaBar.FullPowerFrame ) then
				manaBar.FullPowerFrame:Initialize(info.fullPowerAnim)
			end
		end
	else
		if ( not altR ) then
			-- couldn't find a power token entry...default to indexing by power type or just mana if we don't have that either
			info = PowerBarColor[powerType] or PowerBarColor["MANA"];
		else
			if ( not manaBar.lockColor ) then
				manaBar:SetStatusBarColor(altR, altG, altB)
			end
		end
	end

	if ( manaBar.powerType ~= powerType ) then
		manaBar.powerType = powerType;
		manaBar.powerToken = powerToken;
		if ( manaBar.FullPowerFrame ) then
			manaBar.FullPowerFrame:RemoveAnims()
		end
		if manaBar.FeedbackFrame then
			manaBar.FeedbackFrame:StopFeedbackAnim()
		end
		manaBar.currValue = UnitPower("player", powerType)
		manaBar.unitFrame.predictedPowerCost = 0;
	end

	-- Update the manabar text
	manaBar:UpdateTextString()
end

function CfUnitFrameHealthBar_Initialize(unit, statusbar, statustext, frequentUpdates)
	if ( not statusbar ) then
		return;
	end

	statusbar.unit = unit;
	statusbar:SetBarText(statustext)

	statusbar.frequentUpdates = frequentUpdates;
	if ( frequentUpdates ) then
		statusbar:RegisterEvent("VARIABLES_LOADED")
	end

	CfUnitFrameHealthBar_RefreshUpdateEvent(statusbar)

	statusbar:RegisterUnitEvent("UNIT_MAXHEALTH", unit)
	statusbar:SetScript("OnEvent", CfUnitFrameHealthBar_OnEvent)
end

function CfUnitFrameHealthBar_RefreshUpdateEvent(self)
	if ( GetCVarBool("predictedHealth") and self.frequentUpdates ) then
		self:SetScript("OnUpdate", CfUnitFrameHealthBar_OnUpdate)
		self:UnregisterEvent("UNIT_HEALTH")
	else
		self:SetScript("OnUpdate", nil)
		self:RegisterUnitEvent("UNIT_HEALTH", self.unit)
	end
end

function CfUnitFrameHealthBar_SetUnit(self, unit)
	self.unit = unit;
	CfUnitFrameHealthBar_RefreshUpdateEvent(self)
end

function CfUnitFrameHealthBar_OnEvent(self, event, ...)
	if ( event == "CVAR_UPDATE" ) then
		self:TextStatusBarOnEvent(event, ...)
	elseif ( event == "VARIABLES_LOADED" ) then
		self:UnregisterEvent("VARIABLES_LOADED")
		CfUnitFrameHealthBar_RefreshUpdateEvent(self)
	elseif self:IsShown() then
		if ( not self.ignoreNoUnit or UnitGUID(self.unit) ) then
			CfUnitFrameHealthBar_Update(self, ...)
		end
	end
end

function CfUnitFrameHealthBar_OnUpdate(self)
	if ( not self.disconnected and not self.lockValues) then
		local currValue = UnitHealth(self.unit)
		local animatedLossBar = self.AnimatedLossBar;

		if ( currValue ~= self.currValue ) then
			if ( not self.ignoreNoUnit or UnitGUID(self.unit) ) then

				if animatedLossBar then
					animatedLossBar:UpdateHealth(currValue, self.currValue)
				end

				self:SetValue(currValue)
				self.currValue = currValue;
				self:UpdateTextString()
				CfUnitFrameHealPredictionBars_Update(self.unitFrame)
			end
		end

		if animatedLossBar then
			animatedLossBar:UpdateLossAnimation(currValue)
		end
	end
end

function CfUnitFrameHealthBar_Update(statusbar, unit)
	if ( not statusbar or statusbar.lockValues ) then
		return;
	end

	if ( unit == statusbar.unit ) then
		local maxValue = UnitHealthMax(unit)

		-- Safety check to make sure we never get an empty bar.
		statusbar.forceHideText = false;
		if ( maxValue == 0 ) then
			maxValue = 1;
			statusbar.forceHideText = true;
		end

		statusbar:SetMinMaxValues(0, maxValue)

		if statusbar.AnimatedLossBar then
			statusbar.AnimatedLossBar:UpdateHealthMinMax()
		end

		statusbar.disconnected = not UnitIsConnected(unit)
		if ( statusbar.disconnected ) then
			if ( not statusbar.lockColor ) then
				statusbar:SetStatusBarColor(0.5, 0.5, 0.5)
			end
			statusbar:SetValue(maxValue)
			statusbar.currValue = maxValue;
		else
			local currValue = UnitHealth(unit)
			if ( not statusbar.lockColor ) then
				statusbar:SetStatusBarColor(0.0, 1.0, 0.0)
			end
			statusbar:SetValue(currValue)
			statusbar.currValue = currValue;
		end
	end
	statusbar:UpdateTextString()
	CfUnitFrameHealPredictionBars_Update(statusbar.unitFrame)
end

function CfUnitFrameHealthBar_OnValueChanged(self, value)
	self:OnStatusBarValueChanged(value)
	HealthBar_OnValueChanged(self, value)
end

function CfUnitFrameManaBar_UnregisterDefaultEvents(self)
	self:UnregisterEvent("UNIT_POWER_UPDATE")
end

function CfUnitFrameManaBar_RegisterDefaultEvents(self)
	self:RegisterUnitEvent("UNIT_POWER_UPDATE", self.unit)
end

function CfUnitFrameManaBar_Initialize(unit, statusbar, statustext, frequentUpdates)
	if ( not statusbar ) then
		return;
	end
	statusbar.unit = unit;
	statusbar.texture = statusbar:GetStatusBarTexture()
	statusbar:SetBarText(statustext)

	statusbar.frequentUpdates = frequentUpdates;
	if ( frequentUpdates ) then
		statusbar:RegisterEvent("VARIABLES_LOADED")
	end
	if ( frequentUpdates ) then
		statusbar:SetScript("OnUpdate", CfUnitFrameManaBar_OnUpdate)
	else
		CfUnitFrameManaBar_RegisterDefaultEvents(statusbar)
	end
	statusbar:RegisterEvent("UNIT_DISPLAYPOWER")
	statusbar:RegisterUnitEvent("UNIT_MAXPOWER", unit)
	statusbar:RegisterUnitEvent("PLAYER_GAINS_VEHICLE_DATA", unit)
	statusbar:RegisterUnitEvent("PLAYER_LOSES_VEHICLE_DATA", unit)
	if ( statusbar.unit == "player" ) then
		statusbar:RegisterEvent("PLAYER_DEAD")
		statusbar:RegisterEvent("PLAYER_ALIVE")
		statusbar:RegisterEvent("PLAYER_UNGHOST")
	end
	statusbar:SetScript("OnEvent", CfUnitFrameManaBar_OnEvent)
end

function CfUnitFrameManaBar_OnEvent(self, event, ...)
	if ( event == "CVAR_UPDATE" ) then
		self:TextStatusBarOnEvent(event, ...)
	elseif ( event == "VARIABLES_LOADED" ) then
		self:UnregisterEvent("VARIABLES_LOADED")
		if ( self.frequentUpdates ) then
			self:SetScript("OnUpdate", CfUnitFrameManaBar_OnUpdate)
			CfUnitFrameManaBar_UnregisterDefaultEvents(self)
		else
			CfUnitFrameManaBar_RegisterDefaultEvents(self)
			self:SetScript("OnUpdate", nil)
		end
	elseif ( event == "PLAYER_ALIVE"  or event == "PLAYER_DEAD" or event == "PLAYER_UNGHOST" ) then
		CfUnitFrameManaBar_UpdateType(self)
	elseif ( event == "PLAYER_GAINS_VEHICLE_DATA"  or event == "PLAYER_LOSES_VEHICLE_DATA" ) then
		CfUnitFrameManaBar_UpdateType(self)
	else
		if ( not self.ignoreNoUnit or UnitGUID(self.unit) ) then
			CfUnitFrameManaBar_Update(self, ...)
		end
	end
end

function CfUnitFrameManaBar_OnUpdate(self)
	if ( not self.disconnected and not self.lockValues ) then
		local predictedCost = self.unitFrame.predictedPowerCost;
		local currValue = UnitPower(self.unit, self.powerType)
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
						self.FeedbackFrame:StartFeedbackAnim(oldValue, currValue)
					end
				end
				if ( self.FullPowerFrame and self.FullPowerFrame.active ) then
					self.FullPowerFrame:StartAnimIfFull(currValue)
				end
				self:SetValue(currValue)
				self.currValue = currValue;
				self:UpdateTextString()
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
		CfUnitFrameManaBar_UpdateType(statusbar)

		local maxValue = UnitPowerMax(unit, statusbar.powerType)

		statusbar:SetMinMaxValues(0, maxValue)

		statusbar.disconnected = not UnitIsConnected(unit)
		if ( statusbar.disconnected ) then
			statusbar:SetValue(maxValue)
			statusbar.currValue = maxValue;
			if ( not statusbar.lockColor ) then
				statusbar:SetStatusBarColor(0.5, 0.5, 0.5)
			end
		else
			local predictedCost = statusbar.unitFrame.predictedPowerCost;
			local currValue = UnitPower(unit, statusbar.powerType)
			if (predictedCost) then
				currValue = currValue - predictedCost;
			end
			if ( statusbar.FullPowerFrame ) then
				statusbar.FullPowerFrame:SetMaxValue(maxValue)
			end

			statusbar:SetValue(currValue)
			statusbar.forceUpdate = true;
		end
	end
	statusbar:UpdateTextString()
end

hooksecurefunc("UnitFrameManaBar_UpdateType", function(manaBar)
	if ( not manaBar ) then
		return
	end

	local powerType, powerToken, altR, altG, altB = UnitPowerType(manaBar.unit)
	local info = PowerBarColor[powerToken]

	manaBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")

	if ( info ) then
		if ( info.atlas ) then
			manaBar:SetStatusBarTexture(info.atlas)
			manaBar:SetStatusBarColor(1, 1, 1)
		else
			manaBar:SetStatusBarColor(info.r, info.g, info.b)
		end
		if ( manaBar.Spark ) then
			manaBar.Spark:SetAlpha(0)
		end
	else
		if ( not altR ) then
			info = PowerBarColor[powerType] or PowerBarColor["MANA"]
		else
			manaBar:SetStatusBarColor(altR, altG, altB)
		end
	end
end)