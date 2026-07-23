if RPETurnStrafeStyleMixin then
	hooksecurefunc(RPETurnStrafeStyleMixin, "OnLoad", function(self)
		self.BG:SetAlpha(0)

		local backdrop = CreateFrame("Frame", nil, self, "BackdropTemplate")
		backdrop:SetBackdrop(BACKDROP_DIALOG_32_32)
		backdrop:SetAllPoints()
		backdrop:SetFrameLevel(self:GetFrameLevel())

		ApplyCloseButton(self.CloseButton, true)
		self.CloseButton:ClearAllPoints()
		self.CloseButton:SetPoint("TOPRIGHT", -4, -4)
	end)
end