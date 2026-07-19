if not _G.AlertFrame then return end

hooksecurefunc(AchievementAlertSystem, "setUpFunction", function(frame, achievementID)
	local _, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuildAch, wasEarnedByMe, earnedBy = GetAchievementInfo(achievementID)

	local displayName = frame.Name
	local shieldPoints = frame.Shield.Points
	local shieldIcon = frame.Shield.Icon
	local unlocked = frame.Unlocked

	if not isGuildAch then
		frame:SetHeight(88)
		local background = frame.Background
		background:SetTexture("Interface\\AchievementFrame\\UI-Achievement-Alert-Background")
		background:SetTexCoord(0, 0.605, 0, 0.703)
		background:ClearAllPoints()
		background:SetPoint("TOPLEFT")
		background:SetPoint("BOTTOMRIGHT")
		local iconBorder = frame.Icon.Overlay
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
		displayName:SetSize(240, 16)
		displayName:SetMaxLines(1)
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
end)

hooksecurefunc(CriteriaAlertSystem, "setUpFunction", function(frame)
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