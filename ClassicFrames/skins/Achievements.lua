local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AchievementUI" then
		AchievementFrameCloseButton:SetSize(32, 32)
		AchievementFrameCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		AchievementFrameCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		AchievementFrameCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		AchievementFrameCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		AchievementFrameCloseButton:ClearAllPoints()
		AchievementFrameCloseButton:SetPoint("TOPRIGHT", 3, 4)

		AchievementFrameCategories.ScrollBar:SetSize(25, 560)
		AchievementFrameCategories.ScrollBar:ClearAllPoints()
		AchievementFrameCategories.ScrollBar:SetPoint("TOPLEFT", AchievementFrameCategories.ScrollBox, "TOPRIGHT", -1, 3)
		AchievementFrameCategories.ScrollBar:SetPoint("BOTTOMLEFT", AchievementFrameCategories.ScrollBox, "BOTTOMRIGHT", 1, -5)

		if (AchievementFrameCategories.ScrollBar.BG == nil) then
			AchievementFrameCategories.ScrollBar.BG = AchievementFrameCategories.ScrollBar:CreateTexture(nil, "BACKGROUND")
			AchievementFrameCategories.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			AchievementFrameCategories.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(AchievementFrameCategories.ScrollBar)
		ApplyScrollBarTrack(AchievementFrameCategories.ScrollBar.Track)
		ApplyScrollBarThumb(AchievementFrameCategories.ScrollBar.Track.Thumb)

		AchievementFrameAchievements.ScrollBar:SetSize(25, 560)
		AchievementFrameAchievements.ScrollBar:ClearAllPoints()
		AchievementFrameAchievements.ScrollBar:SetPoint("TOPLEFT", AchievementFrameAchievements.ScrollBox, "TOPRIGHT", -1, 3)
		AchievementFrameAchievements.ScrollBar:SetPoint("BOTTOMLEFT", AchievementFrameAchievements.ScrollBox, "BOTTOMRIGHT", 1, -5)

		if (AchievementFrameAchievements.ScrollBar.BG == nil) then
			AchievementFrameAchievements.ScrollBar.BG = AchievementFrameAchievements.ScrollBar:CreateTexture(nil, "BACKGROUND")
			AchievementFrameAchievements.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			AchievementFrameAchievements.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(AchievementFrameAchievements.ScrollBar)
		ApplyScrollBarTrack(AchievementFrameAchievements.ScrollBar.Track)
		ApplyScrollBarThumb(AchievementFrameAchievements.ScrollBar.Track.Thumb)

		AchievementFrameStats.ScrollBar:SetSize(25, 560)
		AchievementFrameStats.ScrollBar:ClearAllPoints()
		AchievementFrameStats.ScrollBar:SetPoint("TOPLEFT", AchievementFrameStats.ScrollBox, "TOPRIGHT", -1, 3)
		AchievementFrameStats.ScrollBar:SetPoint("BOTTOMLEFT", AchievementFrameStats.ScrollBox, "BOTTOMRIGHT", 1, -5)

		if (AchievementFrameStats.ScrollBar.BG == nil) then
			AchievementFrameStats.ScrollBar.BG = AchievementFrameStats.ScrollBar:CreateTexture(nil, "BACKGROUND")
			AchievementFrameStats.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			AchievementFrameStats.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(AchievementFrameStats.ScrollBar)
		ApplyScrollBarTrack(AchievementFrameStats.ScrollBar.Track)
		ApplyScrollBarThumb(AchievementFrameStats.ScrollBar.Track.Thumb)

		AchievementFrameComparison.AchievementContainer.ScrollBar:SetSize(25, 560)
		AchievementFrameComparison.AchievementContainer.ScrollBar:ClearAllPoints()
		AchievementFrameComparison.AchievementContainer.ScrollBar:SetPoint("TOPLEFT", AchievementFrameComparison.Summary, "TOPRIGHT", 0, -4)
		AchievementFrameComparison.AchievementContainer.ScrollBar:SetPoint("BOTTOMLEFT", AchievementFrameComparison.AchievementContainer, "BOTTOMRIGHT", 0, 4)

		if (AchievementFrameComparison.AchievementContainer.ScrollBar.BG == nil) then
			AchievementFrameComparison.AchievementContainer.ScrollBar.BG = AchievementFrameComparison.AchievementContainer.ScrollBar:CreateTexture(nil, "BACKGROUND")
			AchievementFrameComparison.AchievementContainer.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			AchievementFrameComparison.AchievementContainer.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(AchievementFrameComparison.AchievementContainer.ScrollBar)
		ApplyScrollBarTrack(AchievementFrameComparison.AchievementContainer.ScrollBar.Track)
		ApplyScrollBarThumb(AchievementFrameComparison.AchievementContainer.ScrollBar.Track.Thumb)

		AchievementFrameComparison.StatContainer.ScrollBar:SetSize(25, 560)
		AchievementFrameComparison.StatContainer.ScrollBar:ClearAllPoints()
		AchievementFrameComparison.StatContainer.ScrollBar:SetPoint("TOPLEFT", AchievementFrameComparison.Summary, "TOPRIGHT", 2, -4)
		AchievementFrameComparison.StatContainer.ScrollBar:SetPoint("BOTTOMLEFT", AchievementFrameComparison.StatContainer, "BOTTOMRIGHT", -2, 4)

		if (AchievementFrameComparison.StatContainer.ScrollBar.BG == nil) then
			AchievementFrameComparison.StatContainer.ScrollBar.BG = AchievementFrameComparison.StatContainer.ScrollBar:CreateTexture(nil, "BACKGROUND")
			AchievementFrameComparison.StatContainer.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			AchievementFrameComparison.StatContainer.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(AchievementFrameComparison.StatContainer.ScrollBar)
		ApplyScrollBarTrack(AchievementFrameComparison.StatContainer.ScrollBar.Track)
		ApplyScrollBarThumb(AchievementFrameComparison.StatContainer.ScrollBar.Track.Thumb)

		AchievementFrame.SearchResults.CloseButton:SetSize(32, 32)
		AchievementFrame.SearchResults.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		AchievementFrame.SearchResults.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		AchievementFrame.SearchResults.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		AchievementFrame.SearchResults.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		AchievementFrame.SearchResults.CloseButton:ClearAllPoints()
		AchievementFrame.SearchResults.CloseButton:SetPoint("TOPRIGHT", 4, 2)

		AchievementFrame.SearchResults.ScrollBar:SetSize(25, 560)
		AchievementFrame.SearchResults.ScrollBar:ClearAllPoints()
		AchievementFrame.SearchResults.ScrollBar:SetPoint("TOPLEFT", AchievementFrame.SearchResults.ScrollBox, "TOPRIGHT", -5, 2)
		AchievementFrame.SearchResults.ScrollBar:SetPoint("BOTTOMLEFT", AchievementFrame.SearchResults.ScrollBox, "BOTTOMRIGHT", 5, -1)

		if (AchievementFrame.SearchResults.ScrollBar.BG == nil) then
			AchievementFrame.SearchResults.ScrollBar.BG = AchievementFrame.SearchResults.ScrollBar:CreateTexture(nil, "BACKGROUND")
			AchievementFrame.SearchResults.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			AchievementFrame.SearchResults.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(AchievementFrame.SearchResults.ScrollBar)
		ApplyScrollBarTrack(AchievementFrame.SearchResults.ScrollBar.Track)
		ApplyScrollBarThumb(AchievementFrame.SearchResults.ScrollBar.Track.Thumb)

		ApplySearchBox(AchievementFrame.SearchBox)

		hooksecurefunc('AchievementFrameSummary_Refresh', function()
			for i = 1, ACHIEVEMENTUI_MAX_SUMMARY_ACHIEVEMENTS do
				local button = _G["AchievementFrameSummaryAchievement"..i];
				if ( button ) then
					if ( button.accountWide ) then
						button.TitleBar:SetAlpha(1)
					else
						button.TitleBar:SetAlpha(0.5)
					end
				end
			end
		end)
	end
end)

hooksecurefunc(AchievementAlertSystem, "setUpFunction", function(frame, achievementID, alreadyEarned)
	local _, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch, wasEarnedByMe, earnedBy = GetAchievementInfo(achievementID)

	if not frame.OldAchievement then
		frame.OldAchievement = frame:CreateTexture(nil)
		frame.OldAchievement:SetSize(193, 19)
		frame.OldAchievement:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Borders")
		frame.OldAchievement:SetTexCoord(0.185546875, 0.623046875, 0.65625, 0.734375)
		frame.OldAchievement:SetPoint("TOPLEFT", 93, -34)
		frame.OldAchievement:SetDrawLayer("BACKGROUND", 1)
		frame.OldAchievement:Hide()
	end

	local displayName = frame.Name;
	local shieldPoints = frame.Shield.Points;
	local shieldIcon = frame.Shield.Icon;
	local unlocked = frame.Unlocked;
	local oldCheevo = frame.OldAchievement;

	displayName:SetSize(240, 16)
	displayName:SetMaxLines(1)

	if ( isGuildAch ) then
		local guildName = frame.GuildName;
		local guildBorder = frame.GuildBorder;
		local guildBanner = frame.GuildBanner;
		frame.Shield:Show()
		shieldPoints:Show()
		shieldIcon:Show()
		if oldCheevo then
			oldCheevo:Hide()
		end
		frame:SetHeight(104)
		local iconBorder = frame.Icon.Overlay;
		iconBorder:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Guild")
		iconBorder:SetTexCoord(0.25976563,0.40820313,0.50000000,0.64453125)
		iconBorder:ClearAllPoints()
		iconBorder:SetPoint("CENTER", 0, 1)
		frame.Icon:ClearAllPoints()
		frame.Icon:SetPoint("TOPLEFT", -26, 2)
		frame.Icon.Texture:SetSize(50, 50)
		frame.Icon.Texture:ClearAllPoints()
		frame.Icon.Texture:SetPoint("CENTER", 0, 3)
		displayName:ClearAllPoints()
		displayName:SetPoint("BOTTOMLEFT", 79, 37)
		displayName:SetPoint("BOTTOMRIGHT", -79, 37)
		frame.Shield:ClearAllPoints()
		frame.Shield:SetPoint("TOPRIGHT", -15, -28)
		shieldPoints:ClearAllPoints()
		shieldPoints:SetPoint("TOP", -1, -36)
		shieldPoints:SetPoint("CENTER", 6, 5)
		shieldPoints:SetVertexColor(1, .82, 0)
		shieldIcon:SetSize(52, 48)
		shieldIcon:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Shields")
		shieldIcon:SetTexCoord(0, 0.5, 0, 0.45)
		unlocked:ClearAllPoints()
		unlocked:SetPoint("TOP", -1, -36)
		frame.glow:SetSize(400, 171)
		frame.glow:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Guild")
		frame.glow:SetTexCoord(0.00195313, 0.74804688, 0.19531250, 0.49609375)
		frame.shine:SetSize(67, 72)
		frame.shine:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Guild")
		frame.shine:SetTexCoord(0.75195313, 0.91601563, 0.19531250, 0.35937500)
		frame.shine:ClearAllPoints()
		frame.shine:SetPoint("BOTTOMLEFT", 0, 16)
	else
		frame.Shield:Show()
		shieldPoints:Show()
		shieldIcon:Show()
		if oldCheevo then
			oldCheevo:Hide()
		end
		frame:SetHeight(88)
		local background = frame.Background;
		background:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Alert-Background")
		background:SetTexCoord(0, 0.605, 0, 0.703)
		background:ClearAllPoints()
		background:SetPoint("TOPLEFT", 0, 0)
		background:SetPoint("BOTTOMRIGHT", 0, 0)
		local iconBorder = frame.Icon.Overlay;
		iconBorder:SetSize(72, 72)
		iconBorder:SetTexture("Interface\\AchievementFrame\\UI-Achievement-IconFrame")
		iconBorder:SetTexCoord(0, 0.5625, 0, 0.5625)
		iconBorder:ClearAllPoints()
		iconBorder:SetPoint("CENTER", -1, 2)
		frame.Icon:SetSize(124, 124)
		frame.Icon:ClearAllPoints()
		frame.Icon:SetPoint("TOPLEFT", -26, 16)
		frame.Icon.Texture:SetSize(50, 50)
		frame.Icon.Texture:ClearAllPoints()
		frame.Icon.Texture:SetPoint("CENTER", 0, 3)
		displayName:ClearAllPoints()
		displayName:SetPoint("BOTTOMLEFT", 72, 36)
		displayName:SetPoint("BOTTOMRIGHT", -60, 36)
		frame.Shield:ClearAllPoints()
		frame.Shield:SetPoint("TOPRIGHT", -10, -13)
		shieldPoints:SetSize(64, 64)
		shieldPoints:ClearAllPoints()
		shieldPoints:SetPoint("CENTER", 6, 2)
		shieldPoints:SetVertexColor(1, .82, 0)
		shieldIcon:SetSize(52, 48)
		shieldIcon:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Shields")
		shieldIcon:SetTexCoord(0, 0.5, 0, 0.45)
		unlocked:ClearAllPoints()
		unlocked:SetPoint("TOP", 7, -23)
		frame.glow:SetSize(400, 171)
		frame.glow:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Alert-Glow")
		frame.glow:SetTexCoord(0, 0.78125, 0, 0.66796875)
		frame.shine:SetSize(67, 72)
		frame.shine:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Alert-Glow")
		frame.shine:SetTexCoord(0.78125, 0.912109375, 0, 0.28125)
		frame.shine:ClearAllPoints()
		frame.shine:SetPoint("BOTTOMLEFT", 0, 8)
	end

	if (alreadyEarned) then
		shieldPoints:Hide()
		shieldIcon:Hide()
		oldCheevo:Show()
		displayName:ClearAllPoints()
		displayName:SetPoint("BOTTOMLEFT", 72, 37)
		displayName:SetPoint("BOTTOMRIGHT", -25, 37)
		unlocked:ClearAllPoints()
		unlocked:SetPoint("TOP", 21, -23)
	end

	if ( points == 0 ) then
		shieldIcon:SetTexture([[Interface\AchievementFrame\UI-Achievement-Shields-NoPoints]])
	else
		shieldIcon:SetTexture([[Interface\AchievementFrame\UI-Achievement-Shields]])
	end
end)

hooksecurefunc(CriteriaAlertSystem, 'setUpFunction', function(frame)
	frame:SetHeight(52)

	frame.Background:SetSize(256, 64)
	frame.Background:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Alert-Background-Mini")
	frame.Background:ClearAllPoints()
	frame.Background:SetPoint("LEFT", 23, 0)

	frame.Unlocked:SetSize(200, 0)
	frame.Unlocked:ClearAllPoints()
	frame.Unlocked:SetPoint("TOP", 23, -14)

	frame.Name:SetSize(200, 16)
	frame.Name:ClearAllPoints()
	frame.Name:SetPoint("TOP", 23, -28)
	frame.Name:SetMaxLines(1)

	frame.glow:SetSize(257, 52)
	frame.glow:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Alert-Glow")
	frame.glow:SetTexCoord(0, 0.78125, 0, 0.66796875)
	frame.glow:ClearAllPoints()
	frame.glow:SetPoint("CENTER", 23, 0)

	frame.shine:SetSize(67, 52)
	frame.shine:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Alert-Glow")
	frame.shine:SetTexCoord(0.78125, 0.912109375, 0, 0.28125)
	frame.shine:ClearAllPoints()
	frame.shine:SetPoint("TOPLEFT", 23, 0)

	frame.Icon:ClearAllPoints()
	frame.Icon:SetPoint("LEFT", -44, 0)
end)