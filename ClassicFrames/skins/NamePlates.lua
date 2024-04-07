hooksecurefunc("CompactUnitFrame_UpdateClassificationIndicator", function(frame)
	if (frame.classificationIndicator) then
		local classification = UnitClassification(frame.unit)
		if (classification == "rare") then
			frame.classificationIndicator:SetAtlas("nameplates-icon-elite-silver")
			frame.classificationIndicator:Show()
		end
	end
end)

local function SkinCastbar(self)
	if not self:IsForbidden() then
		if (self.NewBackground == nil) then
			self.NewBackground = self:CreateTexture(nil, "BACKGROUND")
			self.NewBackground:SetColorTexture(0.2, 0.2, 0.2, 0.85)
			self.NewBackground:SetAllPoints()
		end
		self.Background:Hide()
		self.Icon:ClearAllPoints()
		self.Icon:SetPoint("LEFT", -2, -1)

	    hooksecurefunc(self, 'UpdateShownState', function()
	        self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
	        self.Spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
	        self.Spark:SetSize(16, 16)
	        self.Spark:SetBlendMode("ADD")
	        if self.channeling then
	            self.Spark:Hide()
	        end
	    end)

	    hooksecurefunc(self, 'PlayInterruptAnims', function()
	        self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
	        self.Spark:Hide()
	    end)

	    hooksecurefunc(self, 'PlayFinishAnim', function()
			self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
			if (self.NewFlash == nil) then
				self.NewFlash = self.Flash:GetParent():CreateTexture(nil, "OVERLAY")
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
			self.NewFlash:SetVertexColor(self:GetStatusBarColor())
	    end)

	    hooksecurefunc(self, 'GetTypeInfo', function()
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

local ApplyCastbarSkin = CreateFrame("Frame")
ApplyCastbarSkin:RegisterEvent("NAME_PLATE_UNIT_ADDED")
ApplyCastbarSkin:SetScript("OnEvent", function(self, event, plate)
	if event == "NAME_PLATE_UNIT_ADDED" then
		local unitId = plate
		local nameplate = C_NamePlate.GetNamePlateForUnit(unitId)
		local frame = nameplate.UnitFrame
		if not nameplate or frame:IsForbidden() then return end

		if frame.castBar then 
			if not frame.castBar.Hooked then
				frame.castBar:HookScript("OnEvent", SkinCastbar)
			frame.castBar.Hooked = true
			end
			SkinCastbar(frame.castBar)
		end
	end
end)