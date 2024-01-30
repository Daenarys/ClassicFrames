if not _G.BossTargetFrameContainer then return end

local function SetLook(frame)
    frame.Background:SetColorTexture(0, 0, 0, 0.5)
    frame.Border:SetTexture("Interface\\CastingBar\\UI-CastingBar-Border-Small")
    frame.Border:SetWidth(0)
    frame.Border:SetHeight(49)
    frame.Border:ClearAllPoints()
    frame.Border:SetPoint("TOPLEFT", -23, 20)
    frame.Border:SetPoint("TOPRIGHT", 23, 20)
    frame.BorderShield:SetTexture("Interface\\CastingBar\\UI-CastingBar-Small-Shield")
    frame.BorderShield:SetWidth(0)
    frame.BorderShield:SetHeight(49)
    frame.BorderShield:ClearAllPoints()
    frame.BorderShield:SetPoint("TOPLEFT", -28, 20)
    frame.BorderShield:SetPoint("TOPRIGHT", 18, 20)
    frame.Text:SetWidth(0)
    frame.Text:SetHeight(16)
    frame.Text:ClearAllPoints()
    frame.Text:SetPoint("TOPLEFT", 0, 4)
    frame.Text:SetPoint("TOPRIGHT", 0, 4)
    frame.TextBorder:Hide()
    frame.Icon:ClearAllPoints()
    frame.Icon:SetPoint("TOPLEFT", -21, 3)
    frame.Icon:SetSize(16, 16)
end 

local function SkinTargetCastbar(frame)
    SetLook(frame)

    hooksecurefunc(frame.Flash, "SetAtlas", function(frame)
        local Castbar = frame:GetParent()
        local barType = Castbar.barType 

        if (frame.NewFlash == nil) then
            frame.NewFlash = frame:GetParent():CreateTexture(nil, "OVERLAY")
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

        if (barType == "channel") then
            frame.NewFlash:SetVertexColor(0, 1, 0)
        elseif (barType == "uninterruptable") then
            frame.NewFlash:SetVertexColor(0.7, 0.7, 0.7)
        else
            frame.NewFlash:SetVertexColor(1, 0.7, 0)
        end
    end)

    hooksecurefunc(frame, 'UpdateShownState', function(self)
        self:SetFrameStrata("HIGH")
        self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
        self.Spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
        self.Spark:SetSize(32, 32)
        self.Spark:ClearAllPoints()
        self.Spark:SetPoint("CENTER", 0, 0)
        self.Spark:SetBlendMode("ADD")
        if self.channeling then
            self.Spark:Hide()
        end
        local FadeOutAnim = self.FadeOutAnim:CreateAnimation("Alpha") 
        FadeOutAnim:SetDuration(0.2)
        FadeOutAnim:SetFromAlpha(1)
        FadeOutAnim:SetToAlpha(0)
    end)

    hooksecurefunc(frame, 'PlayInterruptAnims', function(self)
        self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
        self.Spark:Hide()
    end)

    hooksecurefunc(frame, 'PlayFinishAnim', function(self)
        self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
    end)

    hooksecurefunc(frame, 'GetTypeInfo', function(self)
        self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
        if ( self.barType == "interrupted") then
            self:SetValue(100)
            self:SetStatusBarColor(1, 0, 0)
        elseif (self.barType == "channel") then
            self:SetStatusBarColor(0, 1, 0)
        elseif (self.barType == "uninterruptable") then
            self:SetStatusBarColor(0.7, 0.7, 0.7)
        else
            self:SetStatusBarColor(1, 0.7, 0)
        end
    end)
end

for _, frame in _G.pairs(_G.BossTargetFrameContainer.BossTargetFrames) do
	local FrameHealthBar = frame.TargetFrameContent.TargetFrameContentMain.HealthBar;
	local FrameManaBar = frame.TargetFrameContent.TargetFrameContentMain.ManaBar;
	local nameText = frame.TargetFrameContent.TargetFrameContentMain.Name;

	frame:SetScale(0.75);

	FrameHealthBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
	FrameHealthBar:SetStatusBarColor(0, 1, 0)
	FrameHealthBar:SetSize(119, 12)
	FrameHealthBar:ClearAllPoints()
	FrameHealthBar:SetPoint("TOPLEFT", 26, -48)
	FrameHealthBar:SetFrameLevel(500)
	FrameHealthBar.HealthBarMask:Hide()
	FrameHealthBar.TextString:SetPoint("CENTER", FrameHealthBar, "CENTER", 1, 0)
	FrameHealthBar.RightText:SetPoint("RIGHT", FrameHealthBar, "RIGHT", -3, 0)
	FrameHealthBar.LeftText:SetPoint("LEFT", FrameHealthBar, "LEFT", 2, 0)
	FrameHealthBar.DeadText:SetPoint("CENTER", FrameHealthBar, "CENTER", 1, 0)

	FrameManaBar:SetSize(119, 12)
	FrameManaBar:ClearAllPoints()
	FrameManaBar:SetPoint("TOPLEFT", 26, -58)
	FrameManaBar:SetFrameLevel(500)
	FrameManaBar.ManaBarMask:Hide()
	FrameManaBar.TextString:SetPoint("CENTER", FrameManaBar, "CENTER", 1, -1)
	FrameManaBar.RightText:SetPoint("RIGHT", FrameManaBar, "RIGHT", -3, -1)
	FrameManaBar.LeftText:SetPoint("LEFT", FrameManaBar, "LEFT", 1, -1)
	
	FrameHealthBar.TextString:SetParent(frame.TargetFrameContainer)
	FrameHealthBar.RightText:SetParent(frame.TargetFrameContainer)
	FrameHealthBar.LeftText:SetParent(frame.TargetFrameContainer)
	FrameHealthBar.DeadText:SetParent(frame.TargetFrameContainer)

	FrameManaBar.TextString:SetParent(frame.TargetFrameContainer)
	FrameManaBar.RightText:SetParent(frame.TargetFrameContainer)
	FrameManaBar.LeftText:SetParent(frame.TargetFrameContainer)
	
	nameText:SetWidth(100)
	nameText:ClearAllPoints()
	nameText:SetPoint("TOPLEFT", frame.TargetFrameContainer, "TOPLEFT", 36, -33)
	nameText:SetJustifyH("CENTER")
	nameText:SetParent(frame.TargetFrameContainer)
	
	frame.threatIndicator:SetParent(frame)
	frame.threatIndicator:SetTexture("Interface\\TargetingFrame\\UI-UnitFrame-Boss-Flash")
	frame.threatIndicator:SetTexCoord(0.0, 0.945, 0.0, 0.73125)
	frame.threatIndicator:SetSize(242, 93)
	frame.threatIndicator:ClearAllPoints()
	frame.threatIndicator:SetPoint("CENTER", 1, -3)

	if (frame.threatNumericIndicator) then
		frame.threatNumericIndicator:ClearAllPoints()
		frame.threatNumericIndicator:SetPoint("BOTTOM", frame, "TOP", -65, -28)
	end

	if (frame.powerBarAlt) then
		frame.powerBarAlt:ClearAllPoints()
		frame.powerBarAlt:SetPoint("RIGHT", frame, "LEFT", 20, -2)
	end

	if (frame.Background == nil) then
		frame.Background = frame:CreateTexture(nil, "BACKGROUND");
		frame.Background:SetSize(119, 41)
		frame.Background:SetPoint("TOPLEFT", frame, "TOPLEFT", 26, -29);
		frame.Background:SetColorTexture(0, 0, 0, 0.5)
	end

	frame.TargetFrameContainer.FrameTexture:SetSize(232, 100)
	frame.TargetFrameContainer.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-UnitFrame-Boss");
	frame.TargetFrameContainer.FrameTexture:ClearAllPoints()
	frame.TargetFrameContainer.FrameTexture:SetPoint("TOPLEFT", frame.TargetFrameContainer, "TOPLEFT", 20, -7)
	frame.TargetFrameContainer.FrameTexture:SetTexCoord(0.09375, 1, 0, 0.78125)

	frame.TargetFrameContent.TargetFrameContentContextual.HighLevelTexture:SetParent(frame.TargetFrameContainer)
	frame.TargetFrameContent.TargetFrameContentContextual.HighLevelTexture:SetSize(16, 16)
	frame.TargetFrameContent.TargetFrameContentContextual.HighLevelTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Skull")
	frame.TargetFrameContent.TargetFrameContentContextual.HighLevelTexture:ClearAllPoints();
	frame.TargetFrameContent.TargetFrameContentContextual.HighLevelTexture:SetPoint("CENTER", 31, -24)

	frame.TargetFrameContent.TargetFrameContentMain.LevelText:SetParent(frame.TargetFrameContainer)
	frame.TargetFrameContent.TargetFrameContentMain.LevelText:ClearAllPoints();
	frame.TargetFrameContent.TargetFrameContentMain.LevelText:SetPoint("CENTER", 31, -24)

	frame.TargetFrameContent.TargetFrameContentMain.ReputationColor:SetParent(frame.TargetFrameContainer)
	frame.TargetFrameContent.TargetFrameContentMain.ReputationColor:SetSize(119, 19)
	frame.TargetFrameContent.TargetFrameContentMain.ReputationColor:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-LevelBackground")
	frame.TargetFrameContent.TargetFrameContentMain.ReputationColor:ClearAllPoints()
	frame.TargetFrameContent.TargetFrameContentMain.ReputationColor:SetPoint("TOPRIGHT", frame.TargetFrameContent.TargetFrameContentMain, "TOPRIGHT", -88, -29)

	SkinTargetCastbar(frame.spellbar)
	
	hooksecurefunc(frame.spellbar, "AdjustPosition", function(self)
		self:ClearAllPoints()
		self:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", 44, 4)
	end)
end