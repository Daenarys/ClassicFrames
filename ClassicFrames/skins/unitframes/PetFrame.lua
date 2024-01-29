function PetFrame_OnLoad(self)
	self.noTextPrefix = true;

	CfPetFrameHealthBar.LeftText = CfPetFrameHealthBarTextLeft;
	CfPetFrameHealthBar.RightText = CfPetFrameHealthBarTextRight;
	CfPetFrameManaBar.LeftText = CfPetFrameManaBarTextLeft;
	CfPetFrameManaBar.RightText = CfPetFrameManaBarTextRight;

	CfUnitFrame_Initialize(self, "pet", CfPetName, CfPetPortrait,
						 CfPetFrameHealthBar, CfPetFrameHealthBarText, 
						 CfPetFrameManaBar, CfPetFrameManaBarText,
						 CfPetFrameFlash, nil, nil,
						 CfPetFrameMyHealPredictionBar, CfPetFrameOtherHealPredictionBar,
						 CfPetFrameTotalAbsorbBar, CfPetFrameTotalAbsorbBarOverlay, 
						 CfPetFrameOverAbsorbGlow, CfPetFrameOverHealAbsorbGlow, CfPetFrameHealAbsorbBar,
						 CfPetFrameHealAbsorbBarLeftShadow, CfPetFrameHealAbsorbBarRightShadow);
	self.attackModeCounter = 0;
	self.attackModeSign = -1;
	CombatFeedback_Initialize(self, CfPetHitIndicator, 30);
	PetFrame_Update(self);
	self:RegisterUnitEvent("UNIT_PET", "player");
	self:RegisterUnitEvent("UNIT_EXITED_VEHICLE", "player");
	self:RegisterEvent("PET_ATTACK_START");
	self:RegisterEvent("PET_ATTACK_STOP");
	self:RegisterEvent("PET_UI_UPDATE");
	self:RegisterUnitEvent("UNIT_COMBAT", "pet", "player");
end

function PetFrame_Update(self, override)
	if ( (not CfPlayerFrame.animating) or (override) ) then
		if ( UnitIsVisible(self.unit) and PetUsesPetFrame() and not CfPlayerFrame.vehicleHidesPet ) then
			if ( self:IsShown() ) then
				CfUnitFrame_Update(self);
			else
				self:Show();
			end
			if ( UnitPowerMax(self.unit) == 0 ) then
				CfPetFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-SmallTargetingFrame-NoMana");
				CfPetFrameManaBarText:Hide();
			else
				CfPetFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-SmallTargetingFrame");
			end
			CfPetAttackModeTexture:Hide();
		else
			self:Hide();
		end
	end
end

function PetFrame_OnEvent(self, event, ...)
	CfUnitFrame_OnEvent(self, event, ...);
	local arg1, arg2, arg3, arg4, arg5 = ...;
	if ( event == "UNIT_PET" or event == "UNIT_EXITED_VEHICLE" or event == "PET_UI_UPDATE" ) then
		local unit
		if ( UnitInVehicle("player") ) then
			if ( UnitHasVehiclePlayerFrameUI("player") ) then
				unit = "player";
			else
				return;
			end
		else
			unit = "pet";
		end
		CfUnitFrame_SetUnit(self, unit, CfPetFrameHealthBar, CfPetFrameManaBar);
		PetFrame_Update(self);
	elseif ( event == "UNIT_COMBAT" ) then
		if ( arg1 == self.unit ) then
			CombatFeedback_OnCombatEvent(self, arg2, arg3, arg4, arg5);
		end
	elseif ( event == "PET_ATTACK_START" ) then
		CfPetAttackModeTexture:SetVertexColor(1.0, 1.0, 1.0, 1.0);
		CfPetAttackModeTexture:Show();
	elseif ( event == "PET_ATTACK_STOP" ) then
		CfPetAttackModeTexture:Hide();
	end
end

function PetFrame_OnUpdate(self, elapsed)
	if ( CfPetAttackModeTexture:IsShown() ) then
		local alpha = 255;
		local counter = self.attackModeCounter + elapsed;
		local sign    = self.attackModeSign;

		if ( counter > 0.5 ) then
			sign = -sign;
			self.attackModeSign = sign;
		end
		counter = mod(counter, 0.5);
		self.attackModeCounter = counter;

		if ( sign == 1 ) then
			alpha = (55  + (counter * 400)) / 255;
		else
			alpha = (255 - (counter * 400)) / 255;
		end
		CfPetAttackModeTexture:SetVertexColor(1.0, 1.0, 1.0, alpha);
	end
	CombatFeedback_OnUpdate(self, elapsed);
end