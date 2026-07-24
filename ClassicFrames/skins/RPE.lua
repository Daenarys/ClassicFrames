if RPETurnStrafeStyleMixin then
	hooksecurefunc(RPETurnStrafeStyleMixin, "OnLoad", function(self)
		self.BG.Top:SetAtlas("UI-DiamondDialogBox-ClassicBorder")

		ApplyCloseButton(self.CloseButton, true)
		self.CloseButton:ClearAllPoints()
		self.CloseButton:SetPoint("TOPRIGHT", -4, -4)
	end)
end