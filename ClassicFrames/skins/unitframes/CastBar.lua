local castbarColors = {}
castbarColors.Standard = CreateColor(1, 0.7, 0, 1)
castbarColors.Channel = CreateColor(0, 1, 0, 1)
castbarColors.Uninterruptable = CreateColor(0.7, 0.7, 0.7, 1)
castbarColors.Interrupted = CreateColor(1, 0, 0, 1)

local function SetPlayerLook(self)
	self.playCastFX = nil
	self:SetSize(195, 13)
	self.Background:SetColorTexture(0, 0, 0, 0.5)
	self.Border:SetSize(256, 64)
	self.Border:SetTexture("Interface\\CastingBar\\UI-CastingBar-Border")
	self.Border:ClearAllPoints()
	self.Border:SetPoint("TOP", 0, 28)
	self.BorderShield:SetSize(256, 64)
	self.BorderShield:SetTexture("Interface\\CastingBar\\UI-CastingBar-Small-Shield")
	self.BorderShield:ClearAllPoints()
	self.BorderShield:SetPoint("TOP", 0, 28)
	self.Text:SetSize(185, 16)
	self.Text:ClearAllPoints()
	self.Text:SetPoint("TOP", 0, 5)
	self.Text:SetFontObject("GameFontHighlight")
	self.TextBorder:SetAlpha(0)
	self.Icon:SetAlpha(0)
end

local function SkinPlayerCastbar(frame)
	hooksecurefunc(frame, "GetTypeInfo", function(self)
		SetPlayerLook(self)
	end)

	hooksecurefunc(frame, "UpdateShownState", function(self)
		self.Spark:SetSize(32, 32)
		self.Spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
		self.Spark:SetBlendMode("ADD")
		self.Spark:ClearAllPoints()
		self.Spark:SetPoint("CENTER")
		if self.channeling then
			self.Spark:Hide()
		end
		local FadeOutAnim = self.FadeOutAnim:CreateAnimation("Alpha") 
		FadeOutAnim:SetDuration(0.2)
		FadeOutAnim:SetFromAlpha(1)
		FadeOutAnim:SetToAlpha(0)
	end)

	hooksecurefunc(frame, "PlayInterruptAnims", function(self)
		self:GetStatusBarTexture():SetVertexColor(castbarColors.Interrupted:GetRGBA())
		self:SetValue(self.maxValue)
		self.Spark:Hide()
	end)

	hooksecurefunc(frame, "PlayFinishAnim", function(self)
		if (self.NewFlash == nil) then
			self.NewFlash = self.Flash:GetParent():CreateTexture(nil, "OVERLAY")
			self.NewFlash:SetSize(256, 64)
			self.NewFlash:SetTexture("Interface\\CastingBar\\UI-CastingBar-Flash")
			self.NewFlash:SetBlendMode("ADD")
			self.NewFlash:ClearAllPoints()
			self.NewFlash:SetPoint("TOP", 0, 28)
			self.NewFlash:SetAlpha(0)
			self.NewFlashAnim = self.NewFlash:CreateAnimationGroup()
			self.NewFlashAnim:SetToFinalAlpha(true)
			local anim = self.NewFlashAnim:CreateAnimation("Alpha") 
			anim:SetDuration(0.2)
			anim:SetFromAlpha(1)
			anim:SetToAlpha(0)
		end
		self.NewFlashAnim:Play()
		self.NewFlash:SetVertexColor(self:GetStatusBarColor())
	end)

	hooksecurefunc(frame, "UpdateBarFillTexture", function(self, isFull)
		self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
		if UnitCastingInfo(self.unit) then
			local _, _, _, _, _, _, _, notInterruptible = UnitCastingInfo(self.unit)
			self:GetStatusBarTexture():SetVertexColorFromBoolean(notInterruptible, castbarColors.Uninterruptable, castbarColors.Standard)
		elseif UnitChannelInfo(self.unit) then
			local _, _, _, _, _, _, notInterruptible = UnitChannelInfo(self.unit)
			self:GetStatusBarTexture():SetVertexColorFromBoolean(notInterruptible, castbarColors.Uninterruptable, castbarColors.Channel)
		end
		if isFull then
			self:GetStatusBarTexture():SetVertexColor(castbarColors.Channel:GetRGBA())
		end
	end)
end

SkinPlayerCastbar(PlayerCastingBarFrame)

local function AdjustPosition(self)
	local parentFrame = self:GetParent()
	local point, relativeTo, relativePoint, offsetX, offsetY = self:GetPoint()

	if relativeTo == parentFrame then
		if parentFrame.haveToT then
			self:AdjustPointsOffset(2, 22)
		elseif parentFrame.haveElite then
			self:AdjustPointsOffset(2, -14)
		else
			self:AdjustPointsOffset(2, -2)
		end
	else
		self:AdjustPointsOffset(2, -5)
	end
end

hooksecurefunc(TargetFrame.spellbar, "AdjustPosition", AdjustPosition)
TargetFrame.spellbar:HookScript("OnShow", AdjustPosition)

local function SetTargetLook(self)
	self.Background:SetColorTexture(0, 0, 0, 0.5)
	self.Border:SetTexture("Interface\\CastingBar\\UI-CastingBar-Border-Small")
	self.Border:SetWidth(0)
	self.Border:SetHeight(49)
	self.Border:ClearAllPoints()
	self.Border:SetPoint("TOPLEFT", -23, 20)
	self.Border:SetPoint("TOPRIGHT", 23, 20)
	self.BorderShield:SetTexture("Interface\\CastingBar\\UI-CastingBar-Small-Shield")
	self.BorderShield:SetWidth(0)
	self.BorderShield:SetHeight(49)
	self.BorderShield:ClearAllPoints()
	self.BorderShield:SetPoint("TOPLEFT", -28, 20)
	self.BorderShield:SetPoint("TOPRIGHT", 18, 20)
	self.Text:SetWidth(0)
	self.Text:SetHeight(16)
	self.Text:ClearAllPoints()
	self.Text:SetPoint("TOPLEFT", 0, 4)
	self.Text:SetPoint("TOPRIGHT", 0, 4)
	self.TextBorder:Hide()
	self.Icon:ClearAllPoints()
	self.Icon:SetPoint("RIGHT", self, "LEFT", -5, 0)
	self.Icon:SetSize(16, 16)
end

local function SkinTargetCastbar(frame)
	SetTargetLook(frame)

	hooksecurefunc(frame, "UpdateShownState", function(self)
		self.Spark:SetSize(32, 32)
		self.Spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
		self.Spark:SetBlendMode("ADD")
		self.Spark:ClearAllPoints()
		self.Spark:SetPoint("CENTER")
		if self.channeling then
			self.Spark:Hide()
		end
		local FadeOutAnim = self.FadeOutAnim:CreateAnimation("Alpha") 
		FadeOutAnim:SetDuration(0.2)
		FadeOutAnim:SetFromAlpha(1)
		FadeOutAnim:SetToAlpha(0)
	end)

	hooksecurefunc(frame, "PlayInterruptAnims", function(self)
		self:GetStatusBarTexture():SetVertexColor(castbarColors.Interrupted:GetRGBA())
		self:SetValue(self.maxValue)
		self.Spark:Hide()
	end)

	hooksecurefunc(frame, "PlayFinishAnim", function(self)
		if (self.NewFlash == nil) then
			self.NewFlash = self.Flash:GetParent():CreateTexture(nil, "OVERLAY")
			self.NewFlash:SetSize(0, 49)
			self.NewFlash:SetTexture("Interface\\CastingBar\\UI-CastingBar-Flash-Small")
			self.NewFlash:SetBlendMode("ADD")
			self.NewFlash:ClearAllPoints()
			self.NewFlash:SetPoint("TOPLEFT", -23, 20)
			self.NewFlash:SetPoint("TOPRIGHT", 23, 20)
			self.NewFlash:SetAlpha(0)
			self.NewFlashAnim = self.NewFlash:CreateAnimationGroup()
			self.NewFlashAnim:SetToFinalAlpha(true)
			local anim = self.NewFlashAnim:CreateAnimation("Alpha") 
			anim:SetDuration(0.2)
			anim:SetFromAlpha(1)
			anim:SetToAlpha(0)
		end
		self.NewFlashAnim:Play()
		self.NewFlash:SetVertexColor(self:GetStatusBarColor())
	end)

	hooksecurefunc(frame, "UpdateBarFillTexture", function(self, isFull)
		self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
		if UnitCastingInfo(self.unit) then
			local _, _, _, _, _, _, _, notInterruptible = UnitCastingInfo(self.unit)
			self:GetStatusBarTexture():SetVertexColorFromBoolean(notInterruptible, castbarColors.Uninterruptable, castbarColors.Standard)
		elseif UnitChannelInfo(self.unit) then
			local _, _, _, _, _, _, notInterruptible = UnitChannelInfo(self.unit)
			self:GetStatusBarTexture():SetVertexColorFromBoolean(notInterruptible, castbarColors.Uninterruptable, castbarColors.Channel)
		end
		if isFull then
			self:GetStatusBarTexture():SetVertexColor(castbarColors.Channel:GetRGBA())
		end
	end)
end

SkinTargetCastbar(TargetFrame.spellbar)
SkinTargetCastbar(FocusFrame.spellbar)

for _, frame in _G.pairs(_G.BossTargetFrameContainer.BossTargetFrames) do
	SkinTargetCastbar(frame.spellbar)
end