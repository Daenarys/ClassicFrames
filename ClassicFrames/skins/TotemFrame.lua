if not _G.TotemFrame then return end

hooksecurefunc(TotemFrame, "Update", function(self)
	self:ClearAllPoints()
	self:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", -5, -91)

	for child in self.totemPool:EnumerateActive() do
		child.Border:SetSize(38, 38)
		child.Border:SetTexture("Interface\\CharacterFrame\\TotemBorder")
		child.Border:ClearAllPoints()
		child.Border:SetPoint("CENTER")
	end
end)