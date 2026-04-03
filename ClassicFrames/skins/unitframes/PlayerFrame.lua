local function UpdateHealth(frame)
	if not frame or not frame.unit or not frame.HealthBar then return end
	local unit = frame.unit

	-- Don't update if unit doesn't exist
	if not UnitExists(unit) then return end

	-- Get health values directly - StatusBar can handle secret values
	-- The key is to NOT do any comparisons or arithmetic on these values
	local hp = UnitHealth(unit)
	local maxHP = UnitHealthMax(unit)

	-- Pass directly to StatusBar - it handles secret values gracefully
	frame.HealthBar:SetMinMaxValues(0, maxHP or 1)
	frame.HealthBar:SetValue(hp or 0)
end

local function UpdatePower(frame)
	if not frame or not frame.unit or not frame.ManaBar then return end
	local unit = frame.unit

	-- Don't update if unit doesn't exist
	if not UnitExists(unit) then return end

	-- Get power values directly - StatusBar can handle secret values
	local p = UnitPower(unit)
	local pMax = UnitPowerMax(unit)

	-- Pass directly to StatusBar - it handles secret values gracefully
	frame.ManaBar:SetMinMaxValues(0, pMax or 1)
	frame.ManaBar:SetValue(p or 0)

	-- Set power color
	local powerType, powerToken, altR, altG, altB = UnitPowerType(unit)
	local info = CfPowerBarColor[powerToken]

	frame.ManaBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")

	if info then
		local playerDeadOrGhost = (unit == "player" and (UnitIsDead("player") or UnitIsGhost("player")))
		if info.atlas then
			frame.ManaBar:SetStatusBarTexture(info.atlas)
			frame.ManaBar:SetStatusBarColor(1, 1, 1)
			frame.ManaBar:GetStatusBarTexture():SetDesaturated(playerDeadOrGhost)
			frame.ManaBar:GetStatusBarTexture():SetAlpha(playerDeadOrGhost and 0.5 or 1)
		else
			if ( playerDeadOrGhost ) then
				frame.ManaBar:SetStatusBarColor(0.6, 0.6, 0.6, 0.5)
			else
				frame.ManaBar:SetStatusBarColor(info.r, info.g, info.b, 1)
			end
		end
	else
		if not altR then
			info = CfPowerBarColor[powerType] or CfPowerBarColor["MANA"]
		else
			frame.ManaBar:SetStatusBarColor(altR, altG, altB)
		end
	end

	if frame.ManaBar.powerType ~= powerType then
		frame.ManaBar.powerType = powerType
		frame.ManaBar.powerToken = powerToken
	end
end

local function UpdateFrame(frame)
	if not frame then return end

	UpdateHealth(frame)
	UpdatePower(frame)
end

function CfPlayerFrame_OnLoad(self)
	self.unit = "player"

	-- Event handling
	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("UNIT_HEALTH")
	self:RegisterEvent("UNIT_MAXHEALTH")
	self:RegisterEvent("UNIT_DISPLAYPOWER")
	self:RegisterEvent("UNIT_POWER_UPDATE")
	self:RegisterEvent("UNIT_POWER_FREQUENT")
	self:RegisterEvent("UNIT_MAXPOWER")
	self:RegisterEvent("PLAYER_DEAD")
	self:RegisterEvent("PLAYER_ALIVE")
	self:RegisterEvent("PLAYER_UNGHOST")

	self:SetScript("OnEvent", function(self, event, arg1)
		if event == "PLAYER_ENTERING_WORLD" then
			UpdateFrame(self)
		elseif event == "UNIT_HEALTH" or event == "UNIT_MAXHEALTH" then
			UpdateHealth(self)
		elseif event == "UNIT_DISPLAYPOWER" or event == "UNIT_POWER_UPDATE" or event == "UNIT_POWER_FREQUENT" or event == "UNIT_MAXPOWER" then
			UpdatePower(self)
		elseif event == "PLAYER_ALIVE" or event == "PLAYER_DEAD" or event == "PLAYER_UNGHOST" then
			UpdatePower(self)
		end
	end)

	-- Initial update (player frame is always shown, others use state driver)
	if UnitExists(self.unit) then
		UpdateFrame(self)
	end

	self:EnableMouse(false)
end

local healthBarContainer = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarsContainer
local healthBar = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HealthBarsContainer.HealthBar
local manaBarContainer = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.ManaBarArea
local manaBar = PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.ManaBarArea.ManaBar

PlayerFrame.PlayerFrameContainer:SetFrameLevel(4)
PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual:SetFrameLevel(5)

PlayerFrame.PlayerFrameContainer.PlayerPortrait:SetSize(64, 64)
PlayerFrame.PlayerFrameContainer.PlayerPortrait:SetPoint("TOPLEFT", 23, -16)
PlayerFrame.PlayerFrameContainer.PlayerPortraitMask:SetSize(64, 64)
PlayerFrame.PlayerFrameContainer.PlayerPortraitMask:SetTexture("Interface\\CharacterFrame\\TempPortraitAlphaMask")
PlayerFrame.PlayerFrameContainer.PlayerPortraitMask:SetPoint("TOPLEFT", 23, -16)

healthBarContainer:SetAlpha(0)
healthBar.TextString:SetParent(PlayerFrame.PlayerFrameContainer)
healthBar.LeftText:SetParent(PlayerFrame.PlayerFrameContainer)
healthBar.RightText:SetParent(PlayerFrame.PlayerFrameContainer)

manaBarContainer:SetAlpha(0)
manaBar.TextString:SetParent(PlayerFrame.PlayerFrameContainer)
manaBar.LeftText:SetParent(PlayerFrame.PlayerFrameContainer)
manaBar.RightText:SetParent(PlayerFrame.PlayerFrameContainer)

PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HitIndicator:SetParent(PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual)
PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HitIndicator.HitText:ClearAllPoints()
PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HitIndicator.HitText:SetPoint("CENTER", PlayerFrame.PlayerFrameContent.PlayerFrameContentMain.HitIndicator, "TOPLEFT", 54, -46)

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
	AlternatePowerBar:SetPoint("BOTTOMLEFT", 95, 19)

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

hooksecurefunc("PlayerFrame_ToPlayerArt", function(self)
	self.PlayerFrameContainer.FrameTexture:SetSize(232, 100)
	self.PlayerFrameContainer.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame")
	self.PlayerFrameContainer.FrameTexture:SetTexCoord(1, 0.09375, 0, 0.78125)
	self.PlayerFrameContainer.FrameTexture:ClearAllPoints()
	self.PlayerFrameContainer.FrameTexture:SetPoint("TOPLEFT", -19, -4)
	self.PlayerFrameContainer.FrameTexture:SetDrawLayer("BORDER")

	self.PlayerFrameContainer.AlternatePowerFrameTexture:SetSize(232, 100)
	self.PlayerFrameContainer.AlternatePowerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame")
	self.PlayerFrameContainer.AlternatePowerFrameTexture:SetTexCoord(1, 0.09375, 0, 0.78125)
	self.PlayerFrameContainer.AlternatePowerFrameTexture:ClearAllPoints()
	self.PlayerFrameContainer.AlternatePowerFrameTexture:SetPoint("TOPLEFT", -19, -4)

	local FrameFlash = self.PlayerFrameContainer.FrameFlash
	FrameFlash:SetParent(self)
	FrameFlash:SetSize(242, 93)
	FrameFlash:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash")
	FrameFlash:SetTexCoord(0.9453125, 0, 0, 0.181640625)
	FrameFlash:ClearAllPoints()
	FrameFlash:SetPoint("TOPLEFT", -6, -4)
	FrameFlash:SetDrawLayer("BACKGROUND")

	local StatusTexture = self.PlayerFrameContent.PlayerFrameContentMain.StatusTexture
	StatusTexture:SetParent(self.PlayerFrameContent.PlayerFrameContentContextual)
	StatusTexture:SetSize(190, 66)
	StatusTexture:SetTexture("Interface\\CharacterFrame\\UI-Player-Status")
	StatusTexture:SetTexCoord(0, 0.74609375, 0, 0.53125)
	StatusTexture:ClearAllPoints()
	StatusTexture:SetPoint("TOPLEFT", 16, -12)
	StatusTexture:SetBlendMode("ADD")

	CfPlayerFrame.HealthBar:SetWidth(119)
	CfPlayerFrame.HealthBar:SetPoint("TOPLEFT",106,-41)
	CfPlayerFrame.ManaBar:SetWidth(119)
	CfPlayerFrame.ManaBar:SetPoint("TOPLEFT",106,-52)

	healthBar.TextString:SetPoint("CENTER", healthBarContainer, "CENTER")
	healthBar.LeftText:SetPoint("LEFT", healthBarContainer, "LEFT", 6, 0)
	healthBar.RightText:SetPoint("RIGHT", healthBarContainer, "RIGHT", -4, 0)

	manaBar.TextString:SetPoint("CENTER", manaBar, "CENTER", 0, 3)
	manaBar.LeftText:SetPoint("LEFT", manaBar, "LEFT", 6, 3)
	manaBar.RightText:SetPoint("RIGHT", manaBar, "RIGHT", -4, 3)

	self.PlayerFrameContent.PlayerFrameContentContextual.GroupIndicator:ClearAllPoints()
	self.PlayerFrameContent.PlayerFrameContentContextual.GroupIndicator:SetPoint("BOTTOMLEFT", CfPlayerFrame, "TOPLEFT", 97, -20)
	self.PlayerFrameContent.PlayerFrameContentContextual.RoleIcon:SetPoint("TOPLEFT", 76, -19)

	CfPlayerFrameBackground:SetSize(119, 41)
	PlayerLevelText:Show()

	CfPlayerFrame.unit = "player"
	UpdateFrame(CfPlayerFrame)

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
	self.PlayerFrameContainer.VehicleFrameTexture:SetPoint("TOPLEFT", -3, 6)
	self.PlayerFrameContainer.VehicleFrameTexture:SetDrawLayer("BORDER")

	local FrameFlash = self.PlayerFrameContainer.FrameFlash
	FrameFlash:SetParent(self)
	FrameFlash:SetSize(242, 93)
	FrameFlash:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame-Flash")
	FrameFlash:SetTexCoord(-0.02, 1, 0.07, 0.86)
	FrameFlash:ClearAllPoints()
	FrameFlash:SetPoint("TOPLEFT", -6, -4)
	FrameFlash:SetDrawLayer("BACKGROUND")

	local StatusTexture = self.PlayerFrameContent.PlayerFrameContentMain.StatusTexture
	StatusTexture:SetParent(self)
	StatusTexture:SetSize(242, 93)
	StatusTexture:SetTexture("Interface\\Vehicles\\UI-Vehicle-Frame-Flash")
	StatusTexture:SetTexCoord(-0.02, 1, 0.07, 0.86)
	StatusTexture:ClearAllPoints()
	StatusTexture:SetPoint("TOPLEFT", -6, -4)
	StatusTexture:SetDrawLayer("BACKGROUND")

	CfPlayerFrame.HealthBar:SetWidth(100)
	CfPlayerFrame.HealthBar:SetPoint("TOPLEFT",119,-41)
	CfPlayerFrame.ManaBar:SetWidth(100)
	CfPlayerFrame.ManaBar:SetPoint("TOPLEFT",119,-52)

	healthBar.TextString:SetPoint("CENTER", healthBarContainer, "CENTER", -2, -1)
	healthBar.LeftText:SetPoint("LEFT", healthBarContainer, "LEFT", 0, -2)
	healthBar.RightText:SetPoint("RIGHT", healthBarContainer, "RIGHT", -9, -2)

	manaBar.TextString:SetPoint("CENTER", manaBar, "CENTER", -2, 3)
	manaBar.LeftText:SetPoint("LEFT", manaBar, "LEFT", 0, 3)
	manaBar.RightText:SetPoint("RIGHT", manaBar, "RIGHT", -4, 3)

	self.PlayerFrameContent.PlayerFrameContentContextual.GroupIndicator:ClearAllPoints()
	self.PlayerFrameContent.PlayerFrameContentContextual.GroupIndicator:SetPoint("BOTTOMLEFT", CfPlayerFrame, "TOPLEFT", 97, -13)
	self.PlayerFrameContent.PlayerFrameContentContextual.RoleIcon:SetPoint("TOPLEFT", 76, -19)

	PlayerName:SetParent(self.PlayerFrameContainer)
	PlayerName:ClearAllPoints()
	PlayerName:SetPoint("TOPLEFT", self.PlayerFrameContainer, "TOPLEFT", 97, -26)

	CfPlayerFrameBackground:SetSize(114, 41)
	PlayerLevelText:Hide()

	CfPlayerFrame.unit = "vehicle"
	UpdateFrame(CfPlayerFrame)

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
	PlayerLevelText:SetPoint("CENTER", -80, -21)
end)

hooksecurefunc("PlayerFrame_UpdatePartyLeader", function()
	local leaderIcon = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.LeaderIcon
	leaderIcon:SetSize(16, 16)
	leaderIcon:SetTexture("Interface\\GroupFrame\\UI-Group-LeaderIcon")
	leaderIcon:ClearAllPoints()
	leaderIcon:SetPoint("TOPLEFT", 21, -16)

	local guideIcon = PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.GuideIcon
	guideIcon:SetSize(19, 19)
	guideIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES")
	guideIcon:SetTexCoord(0, 0.296875, 0.015625, 0.3125)
	guideIcon:ClearAllPoints()
	guideIcon:SetPoint("TOPLEFT", 21, -16)
end)

hooksecurefunc("PlayerFrame_UpdatePlayerNameTextAnchor", function()
	PlayerName:SetWidth(100)
	PlayerName:ClearAllPoints()
	PlayerName:SetPoint("TOPLEFT", 97, -30)
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
		PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PVPIcon:SetPoint("TOPLEFT", 8, -24)
	elseif (factionGroup == "Horde") then
		PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PVPIcon:ClearAllPoints()
		PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PVPIcon:SetPoint("TOPLEFT", -1, -22)
	end

	PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PrestigePortrait:ClearAllPoints()
	PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PrestigePortrait:SetPoint("TOPLEFT", -4, -17)
	
	PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PvpTimerText:ClearAllPoints()
	PlayerFrame.PlayerFrameContent.PlayerFrameContentContextual.PvpTimerText:SetPoint("TOPLEFT", 9, -7)
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
PlayerRestIcon:SetPoint("TOPLEFT", 20, -54)

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