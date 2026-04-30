if RPETurnStrafeStyleMixin then
	hooksecurefunc(RPETurnStrafeStyleMixin, "OnLoad", function(self)
		self.BG:SetAlpha(0)

		self.Border = CreateFrame("Frame", nil, self, "DialogBorderDarkTemplate")
		ApplyDialogBorder(self.Border)

		ApplyCloseButton(self.CloseButton, true)
		self.CloseButton:ClearAllPoints()
		self.CloseButton:SetPoint("TOPRIGHT", -4, -4)
	end)
end