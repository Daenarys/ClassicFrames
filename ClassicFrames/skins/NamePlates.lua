hooksecurefunc("CompactUnitFrame_UpdateClassificationIndicator", function(frame)
	if (frame.classificationIndicator) then
		local classification = UnitClassification(frame.unit)
		if (classification == "rare") then
			frame.classificationIndicator:SetAtlas("nameplates-icon-elite-silver")
			frame.classificationIndicator:Show()
		end
	end
end)

local NameplateFix = CreateFrame("Frame")
NameplateFix:RegisterEvent("PLAYER_LOGIN")
NameplateFix:SetScript("OnEvent", function(self, event)
	local Plater = IsAddOnLoaded("Plater")
	local NeatPlates = IsAddOnLoaded("NeatPlates")
	local Kui = IsAddOnLoaded("Kui_Nameplates")
	local ThreatPlates = IsAddOnLoaded("TidyPlates_ThreatPlates")
	local TidyPlates = IsAddOnLoaded("TidyPlates")

	if Plater or NeatPlates or Kui or ThreatPlates or TidyPlates then return end

	local function SkinNameplateCastbar(self)
		if not self:IsForbidden() then 
			self.Background:SetColorTexture(0.2, 0.2, 0.2, 0.85)
			self.Icon:ClearAllPoints()
			self.Icon:SetPoint("LEFT", -2, -1)

		    hooksecurefunc(self.Flash, "SetAtlas", function(self)
		        if (self.NewFlash == nil) then
		            self.NewFlash = self:GetParent():CreateTexture(nil, "OVERLAY")
		            self.NewFlash:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-BarFill")
		            self.NewFlash:ClearAllPoints()
		            self.NewFlash:SetAllPoints()
		            self.NewFlash:SetBlendMode("ADD")
		            self.NewFlash:SetAlpha(0)
		            self.NewFlashAnim = self.NewFlash:CreateAnimationGroup()
		            self.NewFlashAnim:SetToFinalAlpha(true)
		            local anim = self.NewFlashAnim:CreateAnimation("Alpha") 
		            anim:SetDuration(0.2)
		            anim:SetFromAlpha(1)
		            anim:SetToAlpha(0)
		        end
		        self.NewFlashAnim:Play()
		    end)

		    hooksecurefunc(self, 'UpdateShownState', function(self)
		        self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
		        self.Spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
		        self.Spark:SetSize(16, 16)
		        self.Spark:SetBlendMode("ADD")
		        if self.channeling then
		            self.Spark:Hide()
		        end
		    end)

		    hooksecurefunc(self, 'PlayInterruptAnims', function(self)
		        self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
		        self.Spark:Hide()
		    end)

		    hooksecurefunc(self, 'PlayFinishAnim', function(self)
		        self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
		    end)

		    hooksecurefunc(self, 'GetTypeInfo', function(self)
		        self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
		        if ( self.barType == "interrupted") then
		            self:SetValue(100)
		            self:SetStatusBarColor(1, 0, 0)
		        elseif (self.barType == "channel") then
		            self:SetStatusBarColor(0, 1, 0)
		        elseif (self.barType == "uninterruptable") then
		            self:SetStatusBarColor(0.7, 0.7, 0.7)
		        else
		            self:SetStatusBarColor(1, 0.7, 0)
		        end
		    end)
		end
	end

	local NameplateAddedFrame = CreateFrame("Frame")
	NameplateAddedFrame:RegisterEvent("NAME_PLATE_UNIT_ADDED")
	NameplateAddedFrame:SetScript("OnEvent", function(self, event, plate)
		if event == "NAME_PLATE_UNIT_ADDED" then
			local unitId = plate
			local nameplate = C_NamePlate.GetNamePlateForUnit(unitId, false)
			local frame = nameplate.UnitFrame
			if not nameplate or frame:IsForbidden() then return end

			if frame.castBar then 
				if not frame.castBar.OldCastbars_Hooked then
					frame.castBar:HookScript("OnEvent", SkinNameplateCastbar)
				frame.castBar.OldCastbars_Hooked = true
				end
				SkinNameplateCastbar(frame.castBar)
			end
		end
	end)
end)