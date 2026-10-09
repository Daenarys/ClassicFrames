if not _G.HelpTip then return end

hooksecurefunc(HelpTip, "Show", function(self)
	for frame in self.framePool:EnumerateActive() do
		ApplyCloseButton(frame.CloseButton, true)
		frame.CloseButton:ClearAllPoints()
		frame.CloseButton:SetPoint("TOPRIGHT", 5, 5)
		frame.CloseButton.Texture:Hide()
	end
end)