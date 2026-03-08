if RPETurnStrafeStyleMixin then
	hooksecurefunc(RPETurnStrafeStyleMixin, "OnLoad", function(self)
		self.BG:SetAlpha(0)

		local border = CreateFrame("Frame", nil, self, "DialogBorderDarkTemplate")
		ApplyDialogBorder(border)
		self.Border = border

		self.CloseButton:SetSize(32, 32)
		self.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		self.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		self.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		self.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		self.CloseButton:ClearAllPoints()
		self.CloseButton:SetPoint("TOPRIGHT", -4, -4)
	end)
end