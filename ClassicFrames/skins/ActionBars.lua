if not _G.MainMenuBar then return end

hooksecurefunc(MainMenuBar, "UpdateEndCaps", function(self)
	self.EndCaps.LeftEndCap:SetAtlas("hud-MainMenuBar-gryphon", true)
	self.EndCaps.LeftEndCap:ClearAllPoints()
	self.EndCaps.LeftEndCap:SetPoint("BOTTOMRIGHT", self.EndCaps, "BOTTOMLEFT", 27, -10)

	self.EndCaps.RightEndCap:SetAtlas("hud-MainMenuBar-gryphon", true)
	self.EndCaps.RightEndCap:SetTexCoord(1, 0, 0, 1)
	self.EndCaps.RightEndCap:ClearAllPoints()
	self.EndCaps.RightEndCap:SetPoint("BOTTOMLEFT", self.EndCaps, "BOTTOMRIGHT", -27, -10)
end)