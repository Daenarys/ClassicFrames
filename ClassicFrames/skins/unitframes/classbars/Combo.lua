ComboPointPowerBar = {}

function ComboPointPowerBar:OnLoad()
	if (GetCVar("comboPointLocation") ~= "2") then
		self:Hide()
		return
	end

	self.class = "ROGUE"
	self:SetPowerTokens("COMBO_POINTS")
	self:SetTooltip(COMBO_POINTS_POWER, COMBO_POINTS_ROGUE_TOOLTIP)

	for i = 1, #self.ComboPoints do
		self.ComboPoints[i].on = false
	end
	self.maxUsablePoints = 5

	CfClassPowerBar.OnLoad(self)
end

function ComboPointPowerBar:OnEvent(event, arg1, arg2)
	if (event == "UNIT_DISPLAYPOWER" or event == "PLAYER_ENTERING_WORLD" ) then
		self:Setup()
	elseif (event == "UNIT_MAXPOWER") then
		self:UpdateMaxPower()
	elseif (event == "UNIT_POWER_POINT_CHARGE") then
		self:UpdateChargedPowerPoints()
	else
		CfClassPowerBar.OnEvent(self, event, arg1, arg2)
	end
end

function ComboPointPowerBar:Setup()
	local showBar = false
	local frameLevel = 0
	local xOffset = 43
	if UnitInVehicle("player") then
		showBar = PlayerVehicleHasComboPoints()
	else
		showBar = CfClassPowerBar.Setup(self) or self:SetupDruid()
		if showBar then
			frameLevel = self:GetParent():GetFrameLevel() + 3
			xOffset = 50
		end
	end

	if showBar then
		local unit = self:GetParent().unit
		self:RegisterUnitEvent("UNIT_POWER_FREQUENT", unit)
		self:RegisterUnitEvent("UNIT_MAXPOWER", unit)
		self:RegisterUnitEvent("UNIT_POWER_POINT_CHARGE", unit)
		self:SetPoint("TOP", self:GetParent(), "BOTTOM", xOffset, 38)
		self:SetFrameLevel(frameLevel)
		self:Show()
		self:UpdateMaxPower()
		self:UpdatePower()
	else
		self:Hide()
		self:UnregisterEvent("UNIT_POWER_FREQUENT")
		self:UnregisterEvent("UNIT_MAXPOWER")
		self:UnregisterEvent("UNIT_POWER_POINT_CHARGE")
	end
end

function ComboPointPowerBar:SetupDruid()
	local showBar = false
	local _, myclass = UnitClass("player")
	if myclass == "DRUID" then
		local powerType, powerToken = UnitPowerType("player")
		showBar = (powerType == Enum.PowerType.Energy)
		self:RegisterUnitEvent("UNIT_DISPLAYPOWER", "player")
		self:RegisterEvent("PLAYER_ENTERING_WORLD")
		self:SetTooltip(COMBO_POINTS_POWER, COMBO_POINTS_DRUID_TOOLTIP)
	end
	return showBar
end

local comboPointMaxToLayout = {
	[5] = {
		["width"] = 20,
		["height"] = 21,
		["xOffs"] = 1,
	},
	[6] = {
		["width"] = 18,
		["height"] = 19,
		["xOffs"] = -1,
	},
	[7] = {
		["width"] = 16,
		["height"] = 17,
		["xOffs"] = -1,
	},
}

local function UpdateComboPointLayout(maxUsablePoints, comboPoint, previousComboPoint)
	local layout = comboPointMaxToLayout[maxUsablePoints]

	comboPoint:SetSize(layout.width, layout.height)
	comboPoint.PointOff:SetSize(layout.width, layout.height)
	comboPoint.Point:SetSize(layout.width, layout.height)

	if (previousComboPoint) then
		comboPoint:SetPoint("LEFT", previousComboPoint, "RIGHT", layout.xOffs, 0)
	end
end

local function DetermineComboBonusVisibility(comboBonusIndex, max)
	if (max < 8) then
		return false
	end

	if (comboBonusIndex <= 3) then
		return true
	end

	if (comboBonusIndex == 4 and max >= 9) then
		return true
	end

	if (comboBonusIndex == 5 and max >= 10) then
		return true
	end

	return false
end

function ComboPointPowerBar:UpdateMaxPower()
	local unit = self:GetParent().unit
	local maxComboPoints = UnitPowerMax(unit, Enum.PowerType.ComboPoints)

	self.ComboPoints[6]:SetShown(maxComboPoints == 6 or maxComboPoints == 7)
	self.ComboPoints[7]:SetShown(maxComboPoints == 7)
	for i = 1, #self.ComboBonus do
		self.ComboBonus[i]:SetShown(DetermineComboBonusVisibility(i, maxComboPoints))
	end

	if (maxComboPoints == 5 or maxComboPoints == 8 or maxComboPoints == 10) then
		self.maxUsablePoints = 5
	elseif (maxComboPoints == 6) then
		self.maxUsablePoints = 6
	elseif (maxComboPoints == 7) then
		self.maxUsablePoints = 7
	end

	for i = 1, self.maxUsablePoints do
		UpdateComboPointLayout(self.maxUsablePoints, self.ComboPoints[i], self.ComboPoints[i - 1])
	end
end

function ComboPointPowerBar:AnimIn(frame)
	if (not frame.on) then
		frame.on = true
		frame.AnimIn:Play()

		if (frame.PointAnim) then
			frame.PointAnim:Play()
		end
	end
end

function ComboPointPowerBar:AnimOut(frame)
	if (frame.on) then
		frame.on = false

		if (frame.PointAnim) then
			frame.PointAnim:Play(true)
		end

		frame.AnimIn:Stop()
		frame.AnimOut:Play()
	end
end


function ComboPointPowerBar:UpdatePower()
	if ( self.delayedUpdate ) then
		return
	end

	local unit = self:GetParent().unit
	local comboPoints = UnitPower(unit, Enum.PowerType.ComboPoints)
	local maxComboPoints = UnitPowerMax(unit, Enum.PowerType.ComboPoints)

	if ( self.lastPower and self.lastPower > self.maxUsablePoints and comboPoints == self.lastPower - self.maxUsablePoints ) then
		for i = 1, self.maxUsablePoints do
			self:AnimOut(self.ComboPoints[i])
		end
		self.delayedUpdate = true
		self.lastPower = nil
		C_Timer.After(0.45, function()
			self.delayedUpdate = false
			self:UpdatePower()
		end)
	else
		for i = 1, min(comboPoints, self.maxUsablePoints) do
			if (not self.ComboPoints[i].on) then
				self:AnimIn(self.ComboPoints[i])
			end
		end
		for i = comboPoints + 1, self.maxUsablePoints do
			if (self.ComboPoints[i].on) then
			self:AnimOut(self.ComboPoints[i])
		end
		end

		if (maxComboPoints >= 8) then
			for i = 6, comboPoints do
				self:AnimIn(self.ComboBonus[i-5])
			end
			for i = max(comboPoints + 1, 6), maxComboPoints do
				self:AnimOut(self.ComboBonus[i-5])
			end
		end

		self.lastPower = comboPoints
	end

	self:UpdateChargedPowerPoints()
end

function ComboPointPowerBar:UpdateChargedPowerPoints()
	local chargedPowerPoints = GetUnitChargedPowerPoints(self:GetParent().unit)
	for i = 1, self.maxUsablePoints do
		local comboPointFrame = self.ComboPoints[i]
		local isCharged = chargedPowerPoints and tContains(chargedPowerPoints, i)
		if comboPointFrame.isCharged ~= isCharged then
			comboPointFrame.isCharged = isCharged
			if isCharged then
				comboPointFrame.Point:SetAtlas("ComboPoints-ComboPoint-Kyrian")
				comboPointFrame.PointOff:SetAtlas("ComboPoints-PointBg-Kyrian")
				if comboPointFrame.on then
					comboPointFrame.on = false
					comboPointFrame.AnimIn:Stop()
				end
				self:AnimIn(comboPointFrame)
			else
				comboPointFrame.Point:SetAtlas("ComboPoints-ComboPoint")
				comboPointFrame.PointOff:SetAtlas("ComboPoints-PointBg")
			end
		end
	end
end