function CfPlayerFrame_OnLoad(self)
	self:EnableMouse(false)
end

local healthBarContainer = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarsContainer
local healthBar = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarsContainer.HealthBar
local manaBar = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.ManaBarArea.ManaBar

PlayerFrame.PlayerFrameContainer:SetFrameLevel(4)
PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual:SetFrameLevel(5)

PlayerFrame.PlayerFrameContainer.PlayerPortrait:SetSize(64, 64)
PlayerFrame.PlayerFrameContainer.PlayerPortrait:SetPoint("TOPLEFT", 23, -20)
PlayerFrame.PlayerFrameContainer.PlayerPortraitMask:SetSize(64, 64)
PlayerFrame.PlayerFrameContainer.PlayerPortraitMask:SetTexture("Interface\\CharacterFrame\\TempPortraitAlphaMask")
PlayerFrame.PlayerFrameContainer.PlayerPortraitMask:SetPoint("TOPLEFT", 23, -20)

healthBar.OverAbsorbGlow:SetParent(PlayerFrame.PlayerFrameContainer)
healthBar.OverAbsorbGlow:RemoveMaskTexture(healthBarContainer.HealthBarMask)
healthBar.OverAbsorbGlow:ClearAllPoints()
healthBar.OverAbsorbGlow:SetPoint("TOPLEFT", healthBar, "TOPRIGHT", -10, -8)
healthBar.OverAbsorbGlow:SetPoint("BOTTOMLEFT", healthBar, "BOTTOMRIGHT", -10, -1)

healthBar.TextString:SetParent(PlayerFrame.PlayerFrameContainer)
healthBar.LeftText:SetParent(PlayerFrame.PlayerFrameContainer)
healthBar.RightText:SetParent(PlayerFrame.PlayerFrameContainer)

manaBar.FullPowerFrame:SetSize(119, 12)
manaBar.FullPowerFrame:ClearAllPoints()
manaBar.FullPowerFrame:SetPoint("TOPRIGHT", manaBar, "TOPRIGHT", -3, 1)

manaBar.TextString:SetParent(PlayerFrame.PlayerFrameContainer)
manaBar.LeftText:SetParent(PlayerFrame.PlayerFrameContainer)
manaBar.RightText:SetParent(PlayerFrame.PlayerFrameContainer)

PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HitIndicator:SetParent(PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual)
PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HitIndicator.HitText:ClearAllPoints()
PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HitIndicator.HitText:SetPoint("CENTER", PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HitIndicator, "TOPLEFT", 54, -50)

local groupIndicator = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.GroupIndicator
if groupIndicator then
	groupIndicator.GroupIndicatorLeft:SetSize(24, 16)
	groupIndicator.GroupIndicatorLeft:SetTexture("Interface\\CharacterFrame\\UI-CharacterFrame-GroupIndicator")
	groupIndicator.GroupIndicatorLeft:SetTexCoord(0, 0.1875, 0, 1)
	groupIndicator.GroupIndicatorLeft:SetAlpha(0.3)
	groupIndicator.GroupIndicatorRight:SetSize(24, 16)
	groupIndicator.GroupIndicatorRight:SetTexture("Interface\\CharacterFrame\\UI-CharacterFrame-GroupIndicator")
	groupIndicator.GroupIndicatorRight:SetTexCoord(0.53125, 0.71875, 0, 1)
	groupIndicator.GroupIndicatorRight:SetAlpha(0.3)
	if (groupIndicator.GroupIndicatorMiddle == nil) then
		groupIndicator.GroupIndicatorMiddle = groupIndicator:CreateTexture(nil, "BACKGROUND")
		groupIndicator.GroupIndicatorMiddle:SetSize(0, 16)
		groupIndicator.GroupIndicatorMiddle:SetTexture("Interface\\CharacterFrame\\UI-CharacterFrame-GroupIndicator")
		groupIndicator.GroupIndicatorMiddle:SetTexCoord(0.1875, 0.53125, 0, 1)
		groupIndicator.GroupIndicatorMiddle:SetPoint("LEFT", groupIndicator.GroupIndicatorLeft, "RIGHT")
		groupIndicator.GroupIndicatorMiddle:SetPoint("RIGHT", groupIndicator.GroupIndicatorRight, "LEFT")
		groupIndicator.GroupIndicatorMiddle:SetAlpha(0.3)
	end
	select(3, groupIndicator:GetRegions()):SetAlpha(0)
	PlayerFrameGroupIndicatorText:SetPoint("LEFT", 20, -2)
end

if (_G.AlternatePowerBar) then
	AlternatePowerBar:SetSize(104, 12)
	AlternatePowerBar:ClearAllPoints()
	AlternatePowerBar:SetPoint("BOTTOMLEFT", 95, 15)

	AlternatePowerBarText:SetPoint("CENTER", 0, -1)
	AlternatePowerBar.LeftText:SetPoint("LEFT", 0, -1)
	AlternatePowerBar.RightText:SetPoint("RIGHT", 0, -1)

	if (AlternatePowerBar.Background == nil) then
		AlternatePowerBar.Background = AlternatePowerBar:CreateTexture(nil, "BACKGROUND")
		AlternatePowerBar.Background:SetAllPoints()
		AlternatePowerBar.Background:SetColorTexture(0, 0, 0, 0.5)
	end

	if (AlternatePowerBar.Border == nil) then
		AlternatePowerBar.Border = AlternatePowerBar:CreateTexture(nil, "OVERLAY")
		AlternatePowerBar.Border:SetSize(0, 16)
		AlternatePowerBar.Border:SetTexture("Interface\\CharacterFrame\\UI-CharacterFrame-GroupIndicator")
		AlternatePowerBar.Border:SetTexCoord(0.125, 0.250, 1, 0)
		AlternatePowerBar.Border:SetPoint("TOPLEFT", 4, 0)
		AlternatePowerBar.Border:SetPoint("TOPRIGHT", -4, 0)
	end

	if (AlternatePowerBar.LeftBorder == nil) then
		AlternatePowerBar.LeftBorder = AlternatePowerBar:CreateTexture(nil, "OVERLAY")
		AlternatePowerBar.LeftBorder:SetSize(16, 16)
		AlternatePowerBar.LeftBorder:SetTexture("Interface\\CharacterFrame\\UI-CharacterFrame-GroupIndicator")
		AlternatePowerBar.LeftBorder:SetTexCoord(0, 0.125, 1, 0)
		AlternatePowerBar.LeftBorder:SetPoint("RIGHT", AlternatePowerBar.Border, "LEFT")
	end

	if (AlternatePowerBar.RightBorder == nil) then
		AlternatePowerBar.RightBorder = AlternatePowerBar:CreateTexture(nil, "OVERLAY")
		AlternatePowerBar.RightBorder:SetSize(16, 16)
		AlternatePowerBar.RightBorder:SetTexture("Interface\\CharacterFrame\\UI-CharacterFrame-GroupIndicator")
		AlternatePowerBar.RightBorder:SetTexCoord(0.125, 0, 1, 0)
		AlternatePowerBar.RightBorder:SetPoint("LEFT", AlternatePowerBar.Border, "RIGHT")
	end

	hooksecurefunc(AlternatePowerBar, "EvaluateUnit", function(self)
		self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
		self:SetStatusBarColor(0, 0, 1)

		if self.PowerBarMask then
			self.PowerBarMask:Hide()
		end
	end)
end

if (_G.MonkStaggerBar) then
	MonkStaggerBar:SetSize(94, 12)
	MonkStaggerBar:ClearAllPoints()
	MonkStaggerBar:SetPoint("TOPLEFT", PlayerFrameAlternatePowerBarArea, "TOPLEFT", 98, -70)

	MonkStaggerBar.PowerBarMask:Hide()

	MonkStaggerBarText:SetPoint("CENTER", 0, -1)
	MonkStaggerBar.LeftText:SetPoint("LEFT", 0, -1)
	MonkStaggerBar.RightText:SetPoint("RIGHT", 0, -1)

	if (MonkStaggerBar.Background == nil) then
		MonkStaggerBar.Background = MonkStaggerBar:CreateTexture(nil, "BACKGROUND")
		MonkStaggerBar.Background:SetSize(128, 16)
		MonkStaggerBar.Background:SetTexture("Interface\\PlayerFrame\\MonkManaBar")
		MonkStaggerBar.Background:SetTexCoord(0, 1, 0.5, 1)
		MonkStaggerBar.Background:SetPoint("TOPLEFT", -17, 0)
	end

	if (MonkStaggerBar.Border == nil) then
		MonkStaggerBar.Border = MonkStaggerBar:CreateTexture(nil, "OVERLAY")
		MonkStaggerBar.Border:SetSize(128, 16)
		MonkStaggerBar.Border:SetTexture("Interface\\PlayerFrame\\MonkManaBar")
		MonkStaggerBar.Border:SetTexCoord(0, 1, 0, 0.5)
		MonkStaggerBar.Border:SetPoint("TOPLEFT", -17, 0)
	end

	hooksecurefunc(MonkStaggerBar, "EvaluateUnit", function(self)
		self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
		self:SetStatusBarColor(0, 0, 1)
	end)
end

if (_G.EvokerEbonMightBar) then
	EvokerEbonMightBar:SetSize(104, 12)
	EvokerEbonMightBar:ClearAllPoints()
	EvokerEbonMightBar:SetPoint("BOTTOMLEFT", 95, 15)

	EvokerEbonMightBarText:SetPoint("CENTER", 0, -1)
	EvokerEbonMightBar.LeftText:SetPoint("LEFT", 0, -1)
	EvokerEbonMightBar.RightText:SetPoint("RIGHT", 0, -1)

	if (EvokerEbonMightBar.Background == nil) then
		EvokerEbonMightBar.Background = EvokerEbonMightBar:CreateTexture(nil, "BACKGROUND")
		EvokerEbonMightBar.Background:SetAllPoints()
		EvokerEbonMightBar.Background:SetColorTexture(0, 0, 0, 0.5)
	end

	if (EvokerEbonMightBar.Border == nil) then
		EvokerEbonMightBar.Border = EvokerEbonMightBar:CreateTexture(nil, "OVERLAY")
		EvokerEbonMightBar.Border:SetSize(0, 16)
		EvokerEbonMightBar.Border:SetTexture("Interface\\CharacterFrame\\UI-CharacterFrame-GroupIndicator")
		EvokerEbonMightBar.Border:SetTexCoord(0.125, 0.250, 1, 0)
		EvokerEbonMightBar.Border:SetPoint("TOPLEFT", 4, 0)
		EvokerEbonMightBar.Border:SetPoint("TOPRIGHT", -4, 0)
	end

	if (EvokerEbonMightBar.LeftBorder == nil) then
		EvokerEbonMightBar.LeftBorder = EvokerEbonMightBar:CreateTexture(nil, "OVERLAY")
		EvokerEbonMightBar.LeftBorder:SetSize(16, 16)
		EvokerEbonMightBar.LeftBorder:SetTexture("Interface\\CharacterFrame\\UI-CharacterFrame-GroupIndicator")
		EvokerEbonMightBar.LeftBorder:SetTexCoord(0, 0.125, 1, 0)
		EvokerEbonMightBar.LeftBorder:SetPoint("RIGHT", EvokerEbonMightBar.Border, "LEFT")
	end

	if (EvokerEbonMightBar.RightBorder == nil) then
		EvokerEbonMightBar.RightBorder = EvokerEbonMightBar:CreateTexture(nil, "OVERLAY")
		EvokerEbonMightBar.RightBorder:SetSize(16, 16)
		EvokerEbonMightBar.RightBorder:SetTexture("Interface\\CharacterFrame\\UI-CharacterFrame-GroupIndicator")
		EvokerEbonMightBar.RightBorder:SetTexCoord(0.125, 0, 1, 0)
		EvokerEbonMightBar.RightBorder:SetPoint("LEFT", EvokerEbonMightBar.Border, "RIGHT")
	end

	hooksecurefunc(EvokerEbonMightBar, "EvaluateUnit", function(self)
		self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
		self:SetStatusBarColor(1, 0.5, 0.25)

		if self.PowerBarMask then
			self.PowerBarMask:Hide()
		end
	end)
end

hooksecurefunc("PlayerFrame_ToPlayerArt", function(self)
	self.PlayerFrameContainer.FrameTexture:SetSize(232, 100)
	self.PlayerFrameContainer.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame")
	self.PlayerFrameContainer.FrameTexture:SetTexCoord(1, 0.09375, 0, 0.78125)
	self.PlayerFrameContainer.FrameTexture:ClearAllPoints()
	self.PlayerFrameContainer.FrameTexture:SetPoint("TOPLEFT", -19, -8)
	self.PlayerFrameContainer.FrameTexture:SetDrawLayer("BORDER")

	self.PlayerFrameContainer.AlternatePowerFrameTexture:SetSize(232, 100)
	self.PlayerFrameContainer.AlternatePowerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame")
	self.PlayerFrameContainer.AlternatePowerFrameTexture:SetTexCoord(1, 0.09375, 0, 0.78125)
	self.PlayerFrameContainer.AlternatePowerFrameTexture:ClearAllPoints()
	self.PlayerFrameContainer.AlternatePowerFrameTexture:SetPoint("TOPLEFT", -19, -8)

	local FrameFlash = self.PlayerFrameContainer.FrameFlash
	FrameFlash:SetParent(self)
	FrameFlash:SetSize(242, 93)
	FrameFlash:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash")
	FrameFlash:SetTexCoord(0.9453125, 0, 0, 0.181640625)
	FrameFlash:ClearAllPoints()
	FrameFlash:SetPoint("TOPLEFT", -6, -8)
	FrameFlash:SetDrawLayer("BACKGROUND")

	local StatusTexture = self.PlayerFrameContent.PlayerFrameContentMain.StatusTexture
	StatusTexture:SetParent(self.PlayerFrameContent.PlayerFrameContentContextual)
	StatusTexture:SetSize(190, 66)
	StatusTexture:SetTexture("Interface\\CharacterFrame\\UI-Player-Status")
	StatusTexture:SetTexCoord(0, 0.74609375, 0, 0.53125)
	StatusTexture:ClearAllPoints()
	StatusTexture:SetPoint("TOPLEFT", 16, -16)
	StatusTexture:SetBlendMode("ADD")

	healthBar:SetStatusBarTexture("Interface\\AddOns\\ClassicFrames\\icons\\ui-statusbar")
	healthBar:SetStatusBarColor(0, 1, 0)
	healthBarContainer.HealthBarMask:ClearAllPoints()
	healthBarContainer.HealthBarMask:SetPoint("TOPLEFT", healthBar, "TOPLEFT", 0, -4)
	healthBarContainer.HealthBarMask:SetPoint("BOTTOMRIGHT", healthBar, "BOTTOMRIGHT", -1, -4)

	healthBar.TextString:SetPoint("CENTER", healthBar, "CENTER", 0, -4)
	healthBar.LeftText:SetPoint("LEFT", healthBar, "LEFT", 6, -4)
	healthBar.RightText:SetPoint("RIGHT", healthBar, "RIGHT", -4, -4)

	manaBar.ManaBarMask:ClearAllPoints()
	manaBar.ManaBarMask:SetPoint("TOPLEFT", manaBar, "TOPLEFT", 0, 3)
	manaBar.ManaBarMask:SetPoint("BOTTOMRIGHT", manaBar, "BOTTOMRIGHT", -1, -3)

	manaBar.TextString:SetPoint("CENTER", manaBar, "CENTER", 0, -1)
	manaBar.LeftText:SetPoint("LEFT", manaBar, "LEFT", 6, -1)
	manaBar.RightText:SetPoint("RIGHT", manaBar, "RIGHT", -4, -1)

	self.PlayerFrameContent.PlayerFrameContentContextual.GroupIndicator:ClearAllPoints()
	self.PlayerFrameContent.PlayerFrameContentContextual.GroupIndicator:SetPoint("BOTTOMLEFT", CfPlayerFrame, "TOPLEFT", 97, -24)
	self.PlayerFrameContent.PlayerFrameContentContextual.RoleIcon:SetPoint("TOPLEFT", 76, -23)

	CfPlayerFrameBackground:SetSize(119, 41)
	PlayerLevelText:Show()

	local _, class = UnitClass("player")
	if ( CfPlayerFrame.CfClassPowerBar ) then
		CfPlayerFrame.CfClassPowerBar:Setup()
	elseif ( class == "DEATHKNIGHT" ) then
		CfRuneFrame:Show()
	end

	ComboPointPlayerFrame:Setup()
end)

hooksecurefunc("PlayerFrame_ToVehicleArt", function(self)
	self.PlayerFrameContainer.VehicleFrameTexture:SetSize(240, 120)
	self.PlayerFrameContainer.VehicleFrameTexture:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame")
	self.PlayerFrameContainer.VehicleFrameTexture:ClearAllPoints()
	self.PlayerFrameContainer.VehicleFrameTexture:SetPoint("TOPLEFT", -3, 2)
	self.PlayerFrameContainer.VehicleFrameTexture:SetDrawLayer("BORDER")

	local FrameFlash = self.PlayerFrameContainer.FrameFlash
	FrameFlash:SetParent(self)
	FrameFlash:SetSize(242, 93)
	FrameFlash:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame-Flash")
	FrameFlash:SetTexCoord(-0.02, 1, 0.07, 0.86)
	FrameFlash:ClearAllPoints()
	FrameFlash:SetPoint("TOPLEFT", -6, -8)
	FrameFlash:SetDrawLayer("BACKGROUND")

	local StatusTexture = self.PlayerFrameContent.PlayerFrameContentMain.StatusTexture
	StatusTexture:SetParent(self)
	StatusTexture:SetSize(242, 93)
	StatusTexture:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame-Flash")
	StatusTexture:SetTexCoord(-0.02, 1, 0.07, 0.86)
	StatusTexture:ClearAllPoints()
	StatusTexture:SetPoint("TOPLEFT", -6, -8)
	StatusTexture:SetDrawLayer("BACKGROUND")

	healthBar:SetStatusBarTexture("Interface\\AddOns\\ClassicFrames\\icons\\ui-statusbar")
	healthBar:SetStatusBarColor(0, 1, 0)
	healthBarContainer.HealthBarMask:ClearAllPoints()
	healthBarContainer.HealthBarMask:SetPoint("TOPLEFT", healthBar, "TOPLEFT", 7, -5)
	healthBarContainer.HealthBarMask:SetPoint("BOTTOMRIGHT", healthBar, "BOTTOMRIGHT", -10, -3)

	healthBar.TextString:SetPoint("CENTER", healthBar, "CENTER", -2, -5)
	healthBar.LeftText:SetPoint("LEFT", healthBar, "LEFT", 0, -6)
	healthBar.RightText:SetPoint("RIGHT", healthBar, "RIGHT", -9, -6)

	manaBar.ManaBarMask:ClearAllPoints()
	manaBar.ManaBarMask:SetPoint("TOPLEFT", manaBar, "TOPLEFT", 7, 3)
	manaBar.ManaBarMask:SetPoint("BOTTOMRIGHT", manaBar, "BOTTOMRIGHT", -7, -3)

	manaBar.TextString:SetPoint("CENTER", manaBar, "CENTER", -2, -1)
	manaBar.LeftText:SetPoint("LEFT", manaBar, "LEFT", 0, -1)
	manaBar.RightText:SetPoint("RIGHT", manaBar, "RIGHT", -4, -1)

	self.PlayerFrameContent.PlayerFrameContentContextual.GroupIndicator:ClearAllPoints()
	self.PlayerFrameContent.PlayerFrameContentContextual.GroupIndicator:SetPoint("BOTTOMLEFT", CfPlayerFrame, "TOPLEFT", 97, -17)
	self.PlayerFrameContent.PlayerFrameContentContextual.RoleIcon:SetPoint("TOPLEFT", 76, -23)

	PlayerName:SetParent(self.PlayerFrameContainer)
	PlayerName:ClearAllPoints()
	PlayerName:SetPoint("TOPLEFT", self.PlayerFrameContainer, "TOPLEFT", 97, -30)

	CfPlayerFrameBackground:SetSize(114, 41)
	PlayerLevelText:Hide()

	local _, class = UnitClass("player")
	if ( CfPlayerFrame.CfClassPowerBar ) then
		CfPlayerFrame.CfClassPowerBar:Hide()
	elseif ( class == "DEATHKNIGHT" ) then
		CfRuneFrame:Hide()
	end

	ComboPointPlayerFrame:Setup()
end)

hooksecurefunc("PlayerFrame_UpdateLevel", function()
	PlayerLevelText:SetParent(PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual)
	PlayerLevelText:SetDrawLayer("ARTWORK")
	PlayerLevelText:ClearAllPoints()
	PlayerLevelText:SetPoint("CENTER", -80, -25)
end)

hooksecurefunc("PlayerFrame_UpdatePartyLeader", function()
	local leaderIcon = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.LeaderIcon
	leaderIcon:SetSize(16, 16)
	leaderIcon:SetTexture("Interface\\GroupFrame\\UI-Group-LeaderIcon")
	leaderIcon:ClearAllPoints()
	leaderIcon:SetPoint("TOPLEFT", 21, -20)

	local guideIcon = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.GuideIcon
	guideIcon:SetSize(19, 19)
	guideIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES")
	guideIcon:SetTexCoord(0, 0.296875, 0.015625, 0.3125)
	guideIcon:ClearAllPoints()
	guideIcon:SetPoint("TOPLEFT", 21, -20)
end)

hooksecurefunc("PlayerFrame_UpdatePlayerNameTextAnchor", function()
	PlayerName:SetWidth(100)
	PlayerName:ClearAllPoints()
	PlayerName:SetPoint("TOPLEFT", 97, -34)
	PlayerName:SetJustifyH("CENTER")
end)

hooksecurefunc("PlayerFrame_UpdatePlayerRestLoop", function()
	local playerRestLoop = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerRestLoop

	playerRestLoop:Hide()
	playerRestLoop.PlayerRestLoopAnim:Stop()
end)

hooksecurefunc("PlayerFrame_UpdatePvPStatus", function()
	local factionGroup = UnitFactionGroup("player")

	if (factionGroup == "Alliance") then
		PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PVPIcon:ClearAllPoints()
		PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PVPIcon:SetPoint("TOPLEFT", 8, -28)
	elseif (factionGroup == "Horde") then
		PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PVPIcon:ClearAllPoints()
		PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PVPIcon:SetPoint("TOPLEFT", -1, -26)
	end

	PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PrestigePortrait:ClearAllPoints()
	PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PrestigePortrait:SetPoint("TOPLEFT", -4, -21)
	
	PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PvpTimerText:ClearAllPoints()
	PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PvpTimerText:SetPoint("TOPLEFT", 9, -11)
end)

hooksecurefunc("PlayerFrame_UpdateRolesAssigned", function()
	local roleIcon = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.RoleIcon
	local role = UnitGroupRolesAssignedEnum("player")

	roleIcon:SetSize(19, 19)
	roleIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES")
	
	if (role == Enum.LFGRole.Tank) then
		roleIcon:SetTexCoord(0, 19/64, 22/64, 41/64)
		roleIcon:Show()
	elseif (role == Enum.LFGRole.Healer) then
		roleIcon:SetTexCoord(20/64, 39/64, 1/64, 20/64)
		roleIcon:Show()
	elseif (role == Enum.LFGRole.Damage) then
		roleIcon:SetTexCoord(20/64, 39/64, 22/64, 41/64)
		roleIcon:Show()
	else
		roleIcon:Hide()
	end

	if (UnitHasVehiclePlayerFrameUI("player")) then
		PlayerLevelText:Hide()
	else
		PlayerLevelText:Show()
	end
end)

local PlayerRestIcon = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual:CreateTexture(nil, "OVERLAY")
PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerRestIcon = PlayerRestIcon
PlayerRestIcon:SetSize(31, 31)
PlayerRestIcon:SetTexture("Interface\\CharacterFrame\\UI-StateIcon")
PlayerRestIcon:SetTexCoord(0, 0.5, 0, 0.421875)
PlayerRestIcon:SetPoint("TOPLEFT", 20, -58)

local PlayerRestGlow = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual:CreateTexture(nil, "OVERLAY")
PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerRestGlow = PlayerRestGlow
PlayerRestGlow:SetSize(32, 32)
PlayerRestGlow:SetTexture("Interface\\CharacterFrame\\UI-StateIcon")
PlayerRestGlow:SetTexCoord(0, 0.5, 0.5, 1)
PlayerRestGlow:SetBlendMode("ADD")
PlayerRestGlow:SetPoint("TOPLEFT", PlayerRestIcon, "TOPLEFT")

local PlayerAttackIcon = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual:CreateTexture(nil, "OVERLAY")
PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerAttackIcon = PlayerAttackIcon
PlayerAttackIcon:SetSize(32, 31)
PlayerAttackIcon:SetTexture("Interface\\CharacterFrame\\UI-StateIcon")
PlayerAttackIcon:SetTexCoord(0.5, 1.0, 0, 0.484375)
PlayerAttackIcon:SetPoint("TOPLEFT", PlayerRestIcon, "TOPLEFT", 1, 1)

local PlayerAttackGlow = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual:CreateTexture(nil, "OVERLAY")
PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerAttackGlow = PlayerAttackGlow
PlayerAttackGlow:SetSize(32, 32)
PlayerAttackGlow:SetTexture("Interface\\CharacterFrame\\UI-StateIcon")
PlayerAttackGlow:SetTexCoord(0.5, 1, 0.5, 1)
PlayerAttackGlow:SetVertexColor(1, 0, 0)
PlayerAttackGlow:SetBlendMode("ADD")
PlayerAttackGlow:SetPoint("TOPLEFT", PlayerAttackIcon, "TOPLEFT")

local PlayerAttackBackground = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual:CreateTexture(nil, "ARTWORK")
PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerAttackBackground = PlayerAttackBackground
PlayerAttackBackground:SetSize(32, 32)
PlayerAttackBackground:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-AttackBackground")
PlayerAttackBackground:SetVertexColor(0.8, 0.1, 0.1)
PlayerAttackBackground:SetAlpha(0.4)
PlayerAttackBackground:SetPoint("TOPLEFT", PlayerAttackIcon, "TOPLEFT", -3, -1)

hooksecurefunc("PlayerFrame_UpdateStatus", function()
	PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.AttackIcon:Hide()
	PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PlayerPortraitCornerIcon:Hide()
	
	if ( UnitHasVehiclePlayerFrameUI("player") ) then
		PlayerAttackIcon:Hide()
		PlayerAttackGlow:Hide()
		PlayerRestIcon:Hide()
		PlayerRestGlow:Hide()
		PlayerAttackBackground:Hide()
	elseif ( IsResting() ) then
		PlayerAttackIcon:Hide()
		PlayerAttackGlow:Hide()
		PlayerRestIcon:Show()
		PlayerRestGlow:Show()
		PlayerAttackBackground:Hide()
	elseif ( PlayerFrame.inCombat ) then
		PlayerAttackIcon:Show()
		PlayerAttackGlow:Show()
		PlayerRestIcon:Hide()
		PlayerRestGlow:Hide()
		PlayerAttackBackground:Show()
	elseif ( PlayerFrame.onHateList ) then
		PlayerAttackIcon:Show()
		PlayerAttackGlow:Hide()
		PlayerRestIcon:Hide()
		PlayerRestGlow:Hide()
		PlayerAttackBackground:Hide()
	else
		PlayerAttackIcon:Hide()
		PlayerAttackGlow:Hide()
		PlayerRestIcon:Hide()
		PlayerRestGlow:Hide()
		PlayerAttackBackground:Hide()
	end
end)

hooksecurefunc(PlayerFrameBottomManagedFramesContainer, "Layout", function()
	if (DruidComboPointBarFrame) then
		DruidComboPointBarFrame:UnregisterAllEvents()
		DruidComboPointBarFrame:Hide()
	end
	if (MageArcaneChargesFrame) then
		MageArcaneChargesFrame:UnregisterAllEvents()
		MageArcaneChargesFrame:Hide()
	end
	if (MonkHarmonyBarFrame) then
		MonkHarmonyBarFrame:UnregisterAllEvents()
		MonkHarmonyBarFrame:Hide()
	end
	if (PaladinPowerBarFrame) then
		PaladinPowerBarFrame:UnregisterAllEvents()
		PaladinPowerBarFrame:Hide()
	end
	if (RogueComboPointBarFrame) then
		RogueComboPointBarFrame:UnregisterAllEvents()
		RogueComboPointBarFrame:Hide()
	end
	if (RuneFrame) then
		RuneFrame:UnregisterAllEvents()
		RuneFrame:Hide()
	end
	if (WarlockPowerFrame) then
		WarlockPowerFrame:UnregisterAllEvents()
		WarlockPowerFrame:Hide()
	end
end)

PlayerFrame:HookScript("OnUpdate", function(self)
	if (self.PlayerFrameContent.PlayerFrameContentMain.StatusTexture:IsShown()) then
		local alpha = 255
		local counter = self.statusCounter
		local sign = self.statusSign

		if (counter > 0.5) then
			sign = -sign
			self.statusSign = sign
		end
		counter = mod(counter, 0.5)
		self.statusCounter = counter

		if (sign == 1) then
			alpha = (55 + (counter * 400)) / 255
		else
			alpha = (255 - (counter * 400)) / 255
		end
		if (self.PlayerFrameContent.PlayerFrameContentContextual.PlayerAttackGlow:IsShown()) then
			self.PlayerFrameContent.PlayerFrameContentContextual.PlayerAttackGlow:SetAlpha(alpha)
		end
		if (self.PlayerFrameContent.PlayerFrameContentContextual.PlayerRestGlow:IsShown()) then
			self.PlayerFrameContent.PlayerFrameContentContextual.PlayerRestGlow:SetAlpha(alpha)
		end
	end
end)