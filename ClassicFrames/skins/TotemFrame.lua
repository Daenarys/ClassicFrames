if not _G.TotemFrame then return end

hooksecurefunc(TotemFrame, "Update", function(self)
	local _, class = UnitClass("player")
	local hasPet = PetFrame and PetFrame:IsShown()

	self:ClearAllPoints()
	if ( class == "WARLOCK" ) then
		self:SetPoint("TOPLEFT", CfPlayerFrame, "TOPLEFT", 28, -85)
	elseif ( class == "PALADIN" or class == "DEATHKNIGHT"  ) then
		if ( hasPet ) then
			self:SetPoint("TOPLEFT", CfPlayerFrame, "TOPLEFT", 28, -75)
		else
			self:SetPoint("TOPLEFT", CfPlayerFrame, "TOPLEFT", 67, -63)
		end
	elseif ( class == "DRUID" ) then
		local form  = GetShapeshiftFormID()
		if ( form == MOONKIN_FORM or not form ) then
			if ( GetSpecialization() == 1 ) then
				self:SetPoint("TOPLEFT", CfPlayerFrame, "TOPLEFT", 115, -88)
			else
				self:SetPoint("TOPLEFT", CfPlayerFrame, "BOTTOMLEFT", 99, 38)
			end
		elseif ( form == BEAR_FORM or form == CAT_FORM ) then
			self:SetPoint("TOPLEFT", CfPlayerFrame, "TOPLEFT", 99, -78)
		else
			self:SetPoint("TOPLEFT", CfPlayerFrame, "BOTTOMLEFT", 99, 38)
		end
	elseif ( class == "MONK" ) then
		self:SetPoint("TOPLEFT", CfPlayerFrame, "TOPLEFT", 28, -75)
	elseif ( class == "MAGE" ) then
		self:SetPoint("TOPLEFT", CfPlayerFrame, "TOPLEFT", 50, -75)
	elseif ( class == "SHAMAN" ) then
		if ( GetSpecialization() == 3) then
			self:SetPoint("TOPLEFT", CfPlayerFrame, "BOTTOMLEFT", 99, 38)
		else
			self:SetPoint("TOPLEFT", CfPlayerFrame, "TOPLEFT", 99, -78)
		end
	end

	for child in self.totemPool:EnumerateActive() do
		child.Border:SetSize(38, 38)
		child.Border:SetTexture("Interface\\CharacterFrame\\TotemBorder")
		child.Border:ClearAllPoints()
		child.Border:SetPoint("CENTER")
	end
end)