hooksecurefunc(HelpTip, "Show", function(self)
	for frame in self.framePool:EnumerateActive() do
		frame.CloseButton:SetSize(32, 32)
		frame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		frame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		frame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		frame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		frame.CloseButton:ClearAllPoints()
		frame.CloseButton:SetPoint("TOPRIGHT", 5, 5)

		frame.CloseButton.Texture:Hide()
	end
end)