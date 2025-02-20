local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_WeeklyRewards" then
		WeeklyRewardsFrame.CloseButton:SetSize(32, 32)
		WeeklyRewardsFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		WeeklyRewardsFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		WeeklyRewardsFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		WeeklyRewardsFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		WeeklyRewardsFrame.CloseButton:ClearAllPoints()
		WeeklyRewardsFrame.CloseButton:SetPoint("TOPRIGHT", -5, -2)
		UIPanelCloseButton_SetBorderAtlas(WeeklyRewardsFrame.CloseButton, "UI-Frame-Oribos-ExitButtonBorder", -1, 1)

		WeeklyRewardsFrame:HookScript("OnShow", function(self)
			self:ClearAllPoints()
			self:SetPoint("CENTER", 0, 39)
		end)
	end
end)