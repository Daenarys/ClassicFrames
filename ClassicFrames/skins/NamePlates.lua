hooksecurefunc("CompactUnitFrame_UpdateClassificationIndicator", function(frame)
	if (frame.classificationIndicator) then
		local classification = UnitClassification(frame.unit)
		if (classification == "rare") then
			frame.classificationIndicator:SetAtlas("nameplates-icon-elite-silver")
			frame.classificationIndicator:Show()
		end
	end
end)

hooksecurefunc("CooldownFrame_Set", function(self)
	if not self:IsForbidden() then
		self:SetEdgeTexture("Interface\\Cooldown\\edge");
	end
end)