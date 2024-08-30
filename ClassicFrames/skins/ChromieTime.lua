local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ChromieTimeUI" then
		ChromieTimeFrame.CloseButton:SetSize(32, 32)
		ChromieTimeFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		ChromieTimeFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		ChromieTimeFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		ChromieTimeFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		ChromieTimeFrame.CloseButton:ClearAllPoints()
		ChromieTimeFrame.CloseButton:SetPoint("TOPRIGHT", 3, 2)

		ChromieTimeFrame:HookScript("OnShow", function(self)
			self:ClearAllPoints()
			self:SetPoint("CENTER")
		end)
	end
end)