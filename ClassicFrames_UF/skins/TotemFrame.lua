if not _G.TotemFrame then return end

hooksecurefunc(TotemFrame, "Update", function(self)
	for child in self.totemPool:EnumerateActive() do
		child.Border:SetSize(38, 38)
		child.Border:SetTexture("Interface\\CharacterFrame\\TotemBorder")
		child.Border:ClearAllPoints()
		child.Border:SetPoint("CENTER")
	end
end)

hooksecurefunc(TotemFrame, "SetPoint", function(self)
	if self.changing then return end
	self.changing = true
	self:ClearAllPoints()
	self:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", -5, -95)
	self.changing = false
end)