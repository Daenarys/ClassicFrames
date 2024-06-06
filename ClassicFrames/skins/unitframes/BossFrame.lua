if not _G.BossTargetFrameContainer then return end

for _, frame in _G.pairs(_G.BossTargetFrameContainer.BossTargetFrames) do
	local FrameHealthBar = frame.TargetFrameContent.TargetFrameContentMain.HealthBarsContainer.HealthBar;
	local FrameHealthBarContainer = frame.TargetFrameContent.TargetFrameContentMain.HealthBarsContainer;
	local FrameManaBar = frame.TargetFrameContent.TargetFrameContentMain.ManaBar;
	local nameText = frame.TargetFrameContent.TargetFrameContentMain.Name;

	frame:SetScale(0.75)

	FrameHealthBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
	FrameHealthBar:SetStatusBarColor(0, 1, 0)
	FrameHealthBar:SetSize(119, 12)
	FrameHealthBarContainer:SetParent(frame)
	FrameHealthBarContainer:ClearAllPoints()
	FrameHealthBarContainer:SetPoint("TOPLEFT", 26, -48)
	FrameHealthBarContainer.HealthBarMask:Hide()
	FrameHealthBar.TextString:SetPoint("CENTER", FrameHealthBar, "CENTER", 1, 0)
	FrameHealthBarContainer.RightText:SetPoint("RIGHT", FrameHealthBar, "RIGHT", -3, 0)
	FrameHealthBarContainer.LeftText:SetPoint("LEFT", FrameHealthBar, "LEFT", 2, 0)
	FrameHealthBarContainer.DeadText:SetPoint("CENTER", FrameHealthBar, "CENTER", 1, 0)

	FrameManaBar:SetSize(119, 12)
	FrameManaBar:ClearAllPoints()
	FrameManaBar:SetPoint("TOPLEFT", 26, -58)
	FrameManaBar:SetFrameLevel(500)
	FrameManaBar.ManaBarMask:Hide()
	FrameManaBar.TextString:SetPoint("CENTER", FrameManaBar, "CENTER", 1, -1)
	FrameManaBar.RightText:SetPoint("RIGHT", FrameManaBar, "RIGHT", -3, -1)
	FrameManaBar.LeftText:SetPoint("LEFT", FrameManaBar, "LEFT", 1, -1)
	
	FrameHealthBar.TextString:SetParent(frame.TargetFrameContainer)
	FrameHealthBarContainer.RightText:SetParent(frame.TargetFrameContainer)
	FrameHealthBarContainer.LeftText:SetParent(frame.TargetFrameContainer)
	FrameHealthBarContainer.DeadText:SetParent(frame.TargetFrameContainer)

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
		frame.Background = frame:CreateTexture(nil, "BACKGROUND")
		frame.Background:SetSize(119, 41)
		frame.Background:SetPoint("TOPLEFT", frame, "TOPLEFT", 26, -29)
		frame.Background:SetColorTexture(0, 0, 0, 0.5)
	end

	frame.TargetFrameContainer.FrameTexture:SetSize(232, 100)
	frame.TargetFrameContainer.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-UnitFrame-Boss")
	frame.TargetFrameContainer.FrameTexture:ClearAllPoints()
	frame.TargetFrameContainer.FrameTexture:SetPoint("TOPLEFT", frame.TargetFrameContainer, "TOPLEFT", 20, -7)
	frame.TargetFrameContainer.FrameTexture:SetTexCoord(0.09375, 1, 0, 0.78125)

	frame.TargetFrameContent.TargetFrameContentContextual.HighLevelTexture:SetParent(frame.TargetFrameContainer)
	frame.TargetFrameContent.TargetFrameContentContextual.HighLevelTexture:SetSize(16, 16)
	frame.TargetFrameContent.TargetFrameContentContextual.HighLevelTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Skull")
	frame.TargetFrameContent.TargetFrameContentContextual.HighLevelTexture:ClearAllPoints()
	frame.TargetFrameContent.TargetFrameContentContextual.HighLevelTexture:SetPoint("CENTER", 31, -24)

	frame.TargetFrameContent.TargetFrameContentMain.LevelText:SetParent(frame.TargetFrameContainer)
	frame.TargetFrameContent.TargetFrameContentMain.LevelText:ClearAllPoints()
	frame.TargetFrameContent.TargetFrameContentMain.LevelText:SetPoint("CENTER", 31, -24)

	frame.TargetFrameContent.TargetFrameContentMain.ReputationColor:SetParent(frame.TargetFrameContainer)
	frame.TargetFrameContent.TargetFrameContentMain.ReputationColor:SetSize(119, 19)
	frame.TargetFrameContent.TargetFrameContentMain.ReputationColor:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-LevelBackground")
	frame.TargetFrameContent.TargetFrameContentMain.ReputationColor:ClearAllPoints()
	frame.TargetFrameContent.TargetFrameContentMain.ReputationColor:SetPoint("TOPRIGHT", frame.TargetFrameContent.TargetFrameContentMain, "TOPRIGHT", -88, -29)

	hooksecurefunc(frame.spellbar, "AdjustPosition", function(self)
		self:ClearAllPoints()
		self:SetPoint("TOPLEFT", frame, "BOTTOMLEFT", 44, 4)
	end)
end