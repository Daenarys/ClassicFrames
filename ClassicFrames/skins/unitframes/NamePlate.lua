hooksecurefunc("CompactUnitFrame_UpdateClassificationIndicator", function(frame)
	if (frame.classificationIndicator) then
		local classification = UnitClassification(frame.unit)
		if (classification == "rare") then
			frame.classificationIndicator:SetAtlas("nameplates-icon-elite-silver")
		end
	end
end)

local function SkinCastbar(self)
	if self:IsForbidden() then return end

	hooksecurefunc(self, 'UpdateShownState', function()
		self.Background:SetColorTexture(0.2, 0.2, 0.2, 0.85)
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
		self.Flash:SetVertexColor(self:GetStatusBarColor())
		self.Flash:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
	end)

	hooksecurefunc(self, 'GetTypeInfo', function(barType)
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

local ApplyCastbarSkin = CreateFrame("Frame")
ApplyCastbarSkin:RegisterEvent("NAME_PLATE_UNIT_ADDED")
ApplyCastbarSkin:SetScript("OnEvent", function(self, event, plate)
	if event == "NAME_PLATE_UNIT_ADDED" then
		local unitId = plate
		local nameplate = C_NamePlate.GetNamePlateForUnit(unitId)
		local frame = nameplate.UnitFrame
		if not nameplate or frame:IsForbidden() then return end
		if frame.castBar then
			if not frame.castBar.skinned then
				SkinCastbar(frame.castBar)
				frame.castBar.skinned = true
			end
		end
	end
end)