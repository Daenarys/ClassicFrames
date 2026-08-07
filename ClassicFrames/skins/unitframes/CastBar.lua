local function SetLook(self)
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

local castbarColors = {}
castbarColors.Standard = CreateColor(1, 0.7, 0, 1)
castbarColors.Channel = CreateColor(0, 1, 0, 1)
castbarColors.Uninterruptable = CreateColor(0.7, 0.7, 0.7, 1)
castbarColors.Interrupted = CreateColor(1, 0, 0, 1)

local function SkinTargetCastbar(frame)
	SetLook(frame)

	hooksecurefunc(frame, "HandleInterruptOrSpellFailed", function(_, event)
		if ( frame.Text ) then
			if ( event == "UNIT_SPELLCAST_FAILED" ) then
				frame.Text:SetText(FAILED)
			else
				frame.Text:SetText(INTERRUPTED)
			end
		end
	end)

	hooksecurefunc(frame, "UpdateShownState", function()
		frame:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
		frame.Spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
		frame.Spark:SetSize(32, 32)
		frame.Spark:ClearAllPoints()
		frame.Spark:SetPoint("CENTER", 0, 0)
		frame.Spark:SetBlendMode("ADD")
		if frame.channeling then
			frame.Spark:Hide()
		end
		local FadeOutAnim = frame.FadeOutAnim:CreateAnimation("Alpha") 
		FadeOutAnim:SetDuration(0.2)
		FadeOutAnim:SetFromAlpha(1)
		FadeOutAnim:SetToAlpha(0)
	end)

	hooksecurefunc(frame, "PlayInterruptAnims", function()
		frame:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
		frame:GetStatusBarTexture():SetVertexColor(castbarColors.Interrupted:GetRGBA())
		frame:SetValue(frame.maxValue)
		frame.Spark:Hide()
	end)

	hooksecurefunc(frame, "PlayFinishAnim", function()
		frame:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
		if (frame.NewFlash == nil) then
			frame.NewFlash = frame.Flash:GetParent():CreateTexture(nil, "OVERLAY")
			frame.NewFlash:SetSize(0, 49)
			frame.NewFlash:SetTexture("Interface\\CastingBar\\UI-CastingBar-Flash-Small")
			frame.NewFlash:ClearAllPoints()
			frame.NewFlash:SetPoint("TOPLEFT", -23, 20)
			frame.NewFlash:SetPoint("TOPRIGHT", 23, 20)
			frame.NewFlash:SetBlendMode("ADD")
			frame.NewFlash:SetAlpha(0)
			frame.NewFlashAnim = frame.NewFlash:CreateAnimationGroup()
			frame.NewFlashAnim:SetToFinalAlpha(true)
			local anim = frame.NewFlashAnim:CreateAnimation("Alpha") 
			anim:SetDuration(0.2)
			anim:SetFromAlpha(1)
			anim:SetToAlpha(0)
		end
		frame.NewFlashAnim:Play()
		frame.NewFlash:SetVertexColor(frame:GetStatusBarColor())
	end)

	hooksecurefunc(frame, "UpdateBarFillTexture", function(_, isFull)
		if UnitCastingInfo(frame.unit) then
			local _, _, _, _, _, _, _, notInterruptible = UnitCastingInfo(frame.unit)
			frame:GetStatusBarTexture():SetVertexColorFromBoolean(notInterruptible, castbarColors.Uninterruptable, castbarColors.Standard)
		elseif UnitChannelInfo(frame.unit) then
			local _, _, _, _, _, _, notInterruptible = UnitChannelInfo(frame.unit)
			frame:GetStatusBarTexture():SetVertexColorFromBoolean(notInterruptible, castbarColors.Uninterruptable, castbarColors.Channel)
		end
		if isFull then
			frame:GetStatusBarTexture():SetVertexColor(0, 1, 0)
		end
	end)
end

SkinTargetCastbar(TargetFrame.spellbar)
SkinTargetCastbar(FocusFrame.spellbar)

for _, frame in _G.pairs(_G.BossTargetFrameContainer.BossTargetFrames) do
	SkinTargetCastbar(frame.spellbar)
end