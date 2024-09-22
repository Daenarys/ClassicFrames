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

		WeeklyRewardsFrame.BorderContainer:Hide()

		if not WeeklyRewardsFrame.NineSlice then
			WeeklyRewardsFrame.NineSlice = CreateFrame("Frame", nil, WeeklyRewardsFrame, "NineSlicePanelTemplate")
			NineSliceUtil.ApplyUniqueCornersLayout(WeeklyRewardsFrame.NineSlice, "Oribos")
		end

		WeeklyRewardsFrame.HeaderFrame:SetPoint("TOP", 0, -42)
		WeeklyRewardsFrame.HeaderFrame.HeaderDivider:Hide()
		WeeklyRewardsFrame.HeaderFrame.Text:SetPoint("CENTER")

		if (WeeklyRewardsFrame.HeaderFrame.Left == nil) then
			WeeklyRewardsFrame.HeaderFrame.Left = WeeklyRewardsFrame.HeaderFrame:CreateTexture(nil, "BORDER")
			WeeklyRewardsFrame.HeaderFrame.Left:SetAtlas("UI-Frame-Oribos-TitleLeft", true)
			WeeklyRewardsFrame.HeaderFrame.Left:SetPoint("LEFT")
		end

		if (WeeklyRewardsFrame.HeaderFrame.Right == nil) then
			WeeklyRewardsFrame.HeaderFrame.Right = WeeklyRewardsFrame.HeaderFrame:CreateTexture(nil, "BORDER")
			WeeklyRewardsFrame.HeaderFrame.Right:SetAtlas("UI-Frame-Oribos-TitleRight", true)
			WeeklyRewardsFrame.HeaderFrame.Right:SetPoint("RIGHT")
		end

		if (WeeklyRewardsFrame.HeaderFrame.Middle == nil) then
			WeeklyRewardsFrame.HeaderFrame.Middle = WeeklyRewardsFrame.HeaderFrame:CreateTexture(nil, "BORDER")
			WeeklyRewardsFrame.HeaderFrame.Middle:SetAtlas("_UI-Frame-Oribos-TitleMiddle", true)
			WeeklyRewardsFrame.HeaderFrame.Middle:SetHorizTile(true)
			WeeklyRewardsFrame.HeaderFrame.Middle:SetPoint("LEFT", WeeklyRewardsFrame.HeaderFrame.Left, "RIGHT")
			WeeklyRewardsFrame.HeaderFrame.Middle:SetPoint("RIGHT", WeeklyRewardsFrame.HeaderFrame.Right, "LEFT")
		end

		WeeklyRewardsFrame:HookScript("OnShow", function(self)
			self:ClearAllPoints()
			self:SetPoint("CENTER")
		end)
	end
end)