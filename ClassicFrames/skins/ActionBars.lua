if not _G.MainActionBar then return end

MainActionBar.EndCaps.LeftEndCap.Texture:SetAtlas("hud-MainMenuBar-gryphon")
MainActionBar.EndCaps.RightEndCap.Texture:SetAtlas("hud-MainMenuBar-gryphon")
MainActionBar.EndCaps.RightEndCap.Texture:SetTexCoord(1, 0, 0, 1)

hooksecurefunc(MainActionBar, "UpdateEndCaps", function(self)
	self.EndCaps.LeftEndCap.Texture:SetAtlas("hud-MainMenuBar-gryphon")
	self.EndCaps.RightEndCap.Texture:SetAtlas("hud-MainMenuBar-gryphon")
	self.EndCaps.RightEndCap.Texture:SetTexCoord(1, 0, 0, 1)
end)