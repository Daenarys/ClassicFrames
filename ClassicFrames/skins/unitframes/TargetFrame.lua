function CfTargetFrame_OnLoad(self)
	self:EnableMouse(false)
end

local function SkinFrame(frame)
	local contextual = frame.TargetFrameContent.TargetFrameContentContextual;
	local contentMain = frame.TargetFrameContent.TargetFrameContentMain;
	local FrameHealthBarContainer = contentMain.HealthBarsContainer
	local FrameHealthBar = contentMain.HealthBarsContainer.HealthBar
	local FrameManaBar = contentMain.ManaBar;

	contextual:SetFrameStrata("MEDIUM")
	frame.TargetFrameContainer:SetFrameStrata("MEDIUM")

	frame.TargetFrameContainer.Flash:SetParent(frame)

	frame.TargetFrameContainer.Portrait:SetSize(64, 64)
	frame.TargetFrameContainer.Portrait:ClearAllPoints()
	frame.TargetFrameContainer.Portrait:SetPoint("TOPRIGHT", -22, -16)

	contextual.NumericalThreat:SetParent(frame)
	contextual.NumericalThreat:ClearAllPoints()
	contextual.NumericalThreat:SetPoint("BOTTOM", frame, "TOP", -30, -26)

	contextual.RaidTargetIcon:ClearAllPoints()
	contextual.RaidTargetIcon:SetPoint("CENTER", frame.TargetFrameContainer.Portrait, "TOP", 2, -2)

	contentMain.Name:SetParent(contextual)
	contentMain.Name:SetWidth(100)
	contentMain.Name:ClearAllPoints()
	contentMain.Name:SetPoint("TOPLEFT", 36, -30)
	contentMain.Name:SetJustifyH("CENTER")

	contentMain.ReputationColor:SetSize(119, 19)
	contentMain.ReputationColor:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-LevelBackground")
	contentMain.ReputationColor:ClearAllPoints()
	contentMain.ReputationColor:SetPoint("TOPRIGHT", -86, -26)

	local leaderIcon = contextual.LeaderIcon;
	leaderIcon:SetSize(16, 16)
	leaderIcon:SetTexture("Interface\\GroupFrame\\UI-Group-LeaderIcon")
	leaderIcon:ClearAllPoints()
	leaderIcon:SetPoint("TOPRIGHT", -24, -14)

	local guideIcon = contextual.GuideIcon;
	guideIcon:SetSize(19, 19)
	guideIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-PORTRAITROLES")
	guideIcon:SetTexCoord(0, 0.296875, 0.015625, 0.3125)
	guideIcon:ClearAllPoints()
	guideIcon:SetPoint("TOPRIGHT", -20, -14)

	local questIcon = contextual.QuestIcon;
	questIcon:SetSize(32, 32)
	questIcon:SetTexture("Interface\\TargetingFrame\\PortraitQuestBadge")
	questIcon:ClearAllPoints()
	questIcon:SetPoint("TOP", 32, -16)

	if ComboFrame then
		ComboFrame:ClearAllPoints()
		ComboFrame:SetPoint("TOPRIGHT", TargetFrame, "TOPRIGHT", -24, -13)
	end

	hooksecurefunc(frame, "CheckBattlePet", function(self)
		local petBattle = contextual.PetBattleIcon;

		petBattle:ClearAllPoints()
		petBattle:SetPoint("CENTER", self.TargetFrameContainer.FrameTexture, "RIGHT", -44, 10)
	end)

	hooksecurefunc(frame, "CheckClassification", function(self)
		local classification = UnitClassification(self.unit)

		contentMain.ReputationColor:Show()
		contextual.BossIcon:Hide()
		self.TargetFrameContainer.BossPortraitFrameTexture:Hide()

		CfTargetFrameBackground:SetSize(119, 25)
		CfTargetFrameBackground:SetPoint("BOTTOMLEFT", 7, 35)

		CfFocusFrameBackground:SetSize(119, 25)
		CfFocusFrameBackground:SetPoint("BOTTOMLEFT", 7, 35)

		FrameHealthBarContainer.HealthBarMask:ClearAllPoints()
		FrameHealthBarContainer.HealthBarMask:SetPoint("TOPLEFT", FrameHealthBar, "TOPLEFT", 1, 0)
		FrameHealthBarContainer.HealthBarMask:SetPoint("BOTTOMRIGHT", FrameHealthBar, "BOTTOMRIGHT", -1, -1)

		FrameHealthBar.TextString:SetPoint("CENTER", FrameHealthBar, "CENTER")
		FrameHealthBarContainer.LeftText:SetPoint("LEFT", FrameHealthBar, "LEFT", 5, 0)
		FrameHealthBarContainer.RightText:SetPoint("RIGHT", FrameHealthBar, "RIGHT", -7, 0)

		FrameHealthBar.TextString:SetParent(frame.TargetFrameContainer)
		FrameHealthBarContainer.RightText:SetParent(frame.TargetFrameContainer)
		FrameHealthBarContainer.LeftText:SetParent(frame.TargetFrameContainer)
		FrameHealthBarContainer.DeadText:SetParent(frame.TargetFrameContainer)

		FrameManaBar.ManaBarMask:Hide()

		FrameManaBar.TextString:SetPoint("CENTER", FrameManaBar, "CENTER", -4, 3)
		FrameManaBar.LeftText:SetPoint("LEFT", FrameManaBar, "LEFT", 5, 3)
		FrameManaBar.RightText:SetPoint("RIGHT", FrameManaBar, "RIGHT", -15, 3)

		FrameManaBar.TextString:SetParent(frame.TargetFrameContainer)
		FrameManaBar.RightText:SetParent(frame.TargetFrameContainer)
		FrameManaBar.LeftText:SetParent(frame.TargetFrameContainer)

		self.haveElite = nil;

		if ( classification == "rareelite" ) then
			self.TargetFrameContainer.FrameTexture:SetSize(232, 100)
			self.TargetFrameContainer.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare-Elite")
			self.TargetFrameContainer.FrameTexture:SetTexCoord(0.09375, 1, 0, 0.78125)
			self.TargetFrameContainer.FrameTexture:ClearAllPoints()
			self.TargetFrameContainer.FrameTexture:SetPoint("TOPLEFT", 20, -4)
			self.TargetFrameContainer.Flash:SetSize(242, 112)
			self.TargetFrameContainer.Flash:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash")
			self.TargetFrameContainer.Flash:SetTexCoord(0, 0.9453125, 0.181640625, 0.400390625)
			self.TargetFrameContainer.Flash:ClearAllPoints()
			self.TargetFrameContainer.Flash:SetPoint("TOPLEFT", -2, 5)
			self.haveElite = true;
		elseif ( classification == "worldboss" or classification == "elite" ) then
			self.TargetFrameContainer.FrameTexture:SetSize(232, 100)
			self.TargetFrameContainer.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite")
			self.TargetFrameContainer.FrameTexture:SetTexCoord(0.09375, 1, 0, 0.78125)
			self.TargetFrameContainer.FrameTexture:ClearAllPoints()
			self.TargetFrameContainer.FrameTexture:SetPoint("TOPLEFT", 20, -4)
			self.TargetFrameContainer.Flash:SetSize(242, 112)
			self.TargetFrameContainer.Flash:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash")
			self.TargetFrameContainer.Flash:SetTexCoord(0, 0.9453125, 0.181640625, 0.400390625)
			self.TargetFrameContainer.Flash:ClearAllPoints()
			self.TargetFrameContainer.Flash:SetPoint("TOPLEFT", -2, 5)
			self.haveElite = true;
		elseif ( classification == "rare" ) then
			self.TargetFrameContainer.FrameTexture:SetSize(232, 100)
			self.TargetFrameContainer.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare")
			self.TargetFrameContainer.FrameTexture:SetTexCoord(0.09375, 1, 0, 0.78125)
			self.TargetFrameContainer.FrameTexture:ClearAllPoints()
			self.TargetFrameContainer.FrameTexture:SetPoint("TOPLEFT", 20, -4)
			self.TargetFrameContainer.Flash:SetSize(242, 93)
			self.TargetFrameContainer.Flash:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash")
			self.TargetFrameContainer.Flash:SetTexCoord(0, 0.9453125, 0, 0.181640625)
			self.TargetFrameContainer.Flash:ClearAllPoints()
			self.TargetFrameContainer.Flash:SetPoint("TOPLEFT", -4, -4)
			self.haveElite = true;
		elseif ( classification == "minus" ) then
			CfTargetFrameBackground:SetSize(119, 12)
			CfTargetFrameBackground:SetPoint("BOTTOMLEFT", 7, 47)
			CfFocusFrameBackground:SetSize(119, 12)
			CfFocusFrameBackground:SetPoint("BOTTOMLEFT", 7, 47)
			self.TargetFrameContainer.FrameTexture:SetSize(232, 100)
			self.TargetFrameContainer.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Minus")
			self.TargetFrameContainer.FrameTexture:SetTexCoord(0.09375, 1, 0, 0.78125)
			self.TargetFrameContainer.FrameTexture:ClearAllPoints()
			self.TargetFrameContainer.FrameTexture:SetPoint("TOPLEFT", 20, -4)
			self.TargetFrameContainer.Flash:SetSize(256, 128)
			self.TargetFrameContainer.Flash:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Minus-Flash")
			self.TargetFrameContainer.Flash:SetTexCoord(0, 1, 0, 1)
			self.TargetFrameContainer.Flash:ClearAllPoints()
			self.TargetFrameContainer.Flash:SetPoint("TOPLEFT", -4, -4)
			contentMain.ReputationColor:Hide()
		else
			self.TargetFrameContainer.FrameTexture:SetSize(232, 100)
			self.TargetFrameContainer.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame")
			self.TargetFrameContainer.FrameTexture:SetTexCoord(0.09375, 1, 0, 0.78125)
			self.TargetFrameContainer.FrameTexture:ClearAllPoints()
			self.TargetFrameContainer.FrameTexture:SetPoint("TOPLEFT", 20, -4)
			self.TargetFrameContainer.Flash:SetSize(242, 93)
			self.TargetFrameContainer.Flash:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Flash")
			self.TargetFrameContainer.Flash:SetTexCoord(0, 0.9453125, 0, 0.181640625)
			self.TargetFrameContainer.Flash:ClearAllPoints()
			self.TargetFrameContainer.Flash:SetPoint("TOPLEFT", -4, -4)
		end
	end)

	hooksecurefunc(frame, "CheckFaction", function(self)
		if (self.showPVP) then
			local factionGroup = UnitFactionGroup(self.unit)
			if (factionGroup == "Alliance") then
				contextual.PvpIcon:ClearAllPoints()
				contextual.PvpIcon:SetPoint("TOPRIGHT", -4, -24)
			elseif (factionGroup == "Horde") then
				contextual.PvpIcon:ClearAllPoints()
				contextual.PvpIcon:SetPoint("TOPRIGHT", 3, -22)
			end
			contextual.PrestigePortrait:ClearAllPoints()
			contextual.PrestigePortrait:SetPoint("TOPRIGHT", 5, -17)
		end
	end)

	hooksecurefunc(frame, "CheckLevel", function(self)
		local levelText = self.TargetFrameContent.TargetFrameContentMain.LevelText;
		local highLevelTexture = contextual.HighLevelTexture;

		levelText:SetParent(contextual)
		levelText:ClearAllPoints()
		levelText:SetPoint("CENTER", 82, -21)

		highLevelTexture:SetSize(16, 16)
		highLevelTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Skull")
		highLevelTexture:ClearAllPoints()
		highLevelTexture:SetPoint("CENTER", 81, -21)
	end)

	if (frame.totFrame) then
		local function fixDebuffs()
			local frameName = frame.totFrame:GetName()
			local suffix = "Debuff";
			local frameNameWithSuffix = frameName..suffix;
			for i= 1, 4 do
				local debuffName = frameNameWithSuffix..i;
				_G[debuffName]:ClearAllPoints()
				if (i == 1) then
					_G[debuffName]:SetPoint("TOPLEFT", frame.totFrame, "TOPRIGHT", -23, -8)
				elseif (i==2) then
					_G[debuffName]:SetPoint("TOPLEFT", frame.totFrame, "TOPRIGHT", -10, -8)
				elseif (i==3) then
					_G[debuffName]:SetPoint("TOPLEFT", frame.totFrame, "TOPRIGHT", -23, -21)
				elseif (i==4) then
					_G[debuffName]:SetPoint("TOPLEFT", frame.totFrame, "TOPRIGHT", -10, -21)
				end
			end
		end

		frame.totFrame:SetFrameStrata("HIGH")
		if frame == TargetFrame then
			frame.totFrame:SetPoint("TOPRIGHT", frame, "BOTTOMRIGHT", 12, 31)
		end

		if (frame.totFrame.Background == nil) then
			frame.totFrame.Background = frame.totFrame.HealthBar:CreateTexture(nil, "BACKGROUND")
			frame.totFrame.Background:SetSize(46, 15)
			frame.totFrame.Background:SetColorTexture(0, 0, 0, 0.5)
			frame.totFrame.Background:ClearAllPoints()
			frame.totFrame.Background:SetPoint("BOTTOMLEFT", frame.totFrame, "BOTTOMLEFT", 45, 20)
		end
		
		frame.totFrame.FrameTexture:SetSize(93, 45)
		frame.totFrame.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetofTargetFrame")
		frame.totFrame.FrameTexture:SetTexCoord(0.015625, 0.7265625, 0, 0.703125)
		frame.totFrame.FrameTexture:ClearAllPoints()
		frame.totFrame.FrameTexture:SetPoint("TOPLEFT", 0, 0)

		frame.totFrame.Portrait:SetSize(35, 35)

		frame.totFrame.Name:SetWidth(100)
		frame.totFrame.Name:ClearAllPoints()
		frame.totFrame.Name:SetPoint("BOTTOMLEFT", 42, 7)
		
		frame.totFrame.HealthBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
		frame.totFrame.HealthBar:SetStatusBarColor(0, 1, 0)
		frame.totFrame.HealthBar:SetSize(46, 7)
		frame.totFrame.HealthBar:ClearAllPoints()
		frame.totFrame.HealthBar:SetPoint("TOPRIGHT", -29, -15)
		frame.totFrame.HealthBar:SetFrameLevel(1)

		frame.totFrame.HealthBar.DeadText:SetParent(frame.totFrame)
		frame.totFrame.HealthBar.DeadText:ClearAllPoints()
		frame.totFrame.HealthBar.DeadText:SetPoint("LEFT", 48, 3)

		frame.totFrame.HealthBar.UnconsciousText:SetParent(frame.totFrame)
		frame.totFrame.HealthBar.UnconsciousText:ClearAllPoints()
		frame.totFrame.HealthBar.UnconsciousText:SetPoint("LEFT", 48, 3)
		
		frame.totFrame.ManaBar:SetSize(46, 7)
		frame.totFrame.ManaBar:ClearAllPoints()
		frame.totFrame.ManaBar:SetPoint("TOPRIGHT", -29, -23)
		frame.totFrame.ManaBar:SetFrameLevel(1)

		fixDebuffs()
	end
end

SkinFrame(TargetFrame)
SkinFrame(FocusFrame)

hooksecurefunc(FocusFrame, "SetSmallSize", function(self, smallSize)
	self.smallSize = smallSize
	if (self.smallSize) then
		self.totFrame:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", 29, 25)
	else
		self.totFrame:SetPoint("TOPRIGHT", self, "BOTTOMRIGHT", 12, 31)
	end
end)

hooksecurefunc('TargetFrame_UpdateBuffAnchor', function(self, buff, index, numDebuffs, anchorBuff, anchorIndex, size, offsetX, offsetY, mirrorVertically)
	--For mirroring vertically
	local point, relativePoint;
	local startY, auraOffsetY;
	if ( mirrorVertically ) then
		point = "BOTTOM";
		relativePoint = "TOP";
		startY = -15;
		if ( self.threatNumericIndicator:IsShown() ) then
			startY = startY + self.threatNumericIndicator:GetHeight()
		end
		offsetY = - offsetY;
		auraOffsetY = -3;
	else
		point = "TOP";
		relativePoint="BOTTOM";
		startY = 32;
		auraOffsetY = 3;
	end
	buff:ClearAllPoints()
	local targetFrameContentContextual = self.TargetFrameContent.TargetFrameContentContextual
	if (index == 1) then
		if (UnitIsFriend("player", self.unit) or numDebuffs == 0) then
			buff:SetPoint(point.."LEFT", self.TargetFrameContainer.FrameTexture, relativePoint.."LEFT", 5, startY)
		else
			buff:SetPoint(point.."LEFT", targetFrameContentContextual.debuffs, relativePoint.."LEFT", 0, -offsetY)
		end
		targetFrameContentContextual.buffs:SetPoint(point.."LEFT", buff, point.."LEFT", 0, 0)
		targetFrameContentContextual.buffs:SetPoint(relativePoint.."LEFT", buff, relativePoint.."LEFT", 0, -auraOffsetY)
	elseif (anchorIndex ~= (index-1)) then
		buff:SetPoint(point.."LEFT", anchorBuff, relativePoint.."LEFT", 0, -offsetY)
		targetFrameContentContextual.buffs:SetPoint(relativePoint.."LEFT", buff, relativePoint.."LEFT", 0, -auraOffsetY)
	else
		buff:SetPoint(point.."LEFT", anchorBuff, point.."RIGHT", offsetX, 0)
	end
end)

hooksecurefunc('TargetFrame_UpdateDebuffAnchor', function(self, buff, index, numBuffs, anchorBuff, anchorIndex, size, offsetX, offsetY, mirrorVertically)
	--For mirroring vertically
	local point, relativePoint;
	local startY, auraOffsetY;
	if ( mirrorVertically ) then
		point = "BOTTOM";
		relativePoint = "TOP";
		startY = -15;
		if ( self.threatNumericIndicator:IsShown() ) then
			startY = startY + self.threatNumericIndicator:GetHeight()
		end
		offsetY = - offsetY;
		auraOffsetY = -3;
	else
		point = "TOP";
		relativePoint="BOTTOM";
		startY = 32;
		auraOffsetY = 3;
	end
	buff:ClearAllPoints()
	local targetFrameContentContextual = self.TargetFrameContent.TargetFrameContentContextual
	if (index == 1) then
		if (UnitIsFriend("player", self.unit) and numBuffs > 0) then
			buff:SetPoint(point.."LEFT", targetFrameContentContextual.buffs, relativePoint.."LEFT", 0, -offsetY)
		else
			buff:SetPoint(point.."LEFT", self.TargetFrameContainer.FrameTexture, relativePoint.."LEFT", 5, startY)
		end
		targetFrameContentContextual.debuffs:SetPoint(point.."LEFT", buff, point.."LEFT", 0, 0)
		targetFrameContentContextual.debuffs:SetPoint(relativePoint.."LEFT", buff, relativePoint.."LEFT", 0, -auraOffsetY)
	elseif (anchorIndex ~= (index-1)) then
		buff:SetPoint(point.."LEFT", anchorBuff, relativePoint.."LEFT", 0, -offsetY)
		targetFrameContentContextual.debuffs:SetPoint(relativePoint.."LEFT", buff, relativePoint.."LEFT", 0, -auraOffsetY)
	else
		buff:SetPoint(point.."LEFT", anchorBuff, point.."RIGHT", offsetX, 0)
	end
end)