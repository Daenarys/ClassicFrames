if _G.QuestFrame then
	ApplyCloseButton(QuestFrameCloseButton)

	QuestFramePortrait:SetSize(61, 61)
	QuestFramePortrait:ClearAllPoints()
	QuestFramePortrait:SetPoint("TOPLEFT", -6, 8)

	QuestFrame.TitleContainer:ClearAllPoints()
	QuestFrame.TitleContainer:SetPoint("TOPLEFT", QuestFrame, "TOPLEFT", 60, -1)
	QuestFrame.TitleContainer:SetPoint("TOPRIGHT", QuestFrame, "TOPRIGHT", -60, 1)

	QuestFrameTitleText:SetTextColor(255, 255, 255, 1)

	ApplyTitleBg(QuestFrame)
	ApplyNineSlicePortrait(QuestFrame)
end

if _G.QuestLogPopupDetailFrame then
	ApplyCloseButton(QuestLogPopupDetailFrameCloseButton)

	QuestLogPopupDetailFramePortrait:SetSize(61, 61)
	QuestLogPopupDetailFramePortrait:ClearAllPoints()
	QuestLogPopupDetailFramePortrait:SetPoint("TOPLEFT", -6, 8)

	QuestLogPopupDetailFrame.TitleContainer:ClearAllPoints()
	QuestLogPopupDetailFrame.TitleContainer:SetPoint("TOPLEFT", QuestLogPopupDetailFrame, "TOPLEFT", 58, 0)
	QuestLogPopupDetailFrame.TitleContainer:SetPoint("TOPRIGHT", QuestLogPopupDetailFrame, "TOPRIGHT", -58, 0)

	ApplyTitleBg(QuestLogPopupDetailFrame)
	ApplyNineSlicePortrait(QuestLogPopupDetailFrame)
end

QuestScrollFrame.ScrollBar:SetSize(25, 560)
QuestScrollFrame.ScrollBar:ClearAllPoints()
QuestScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestScrollFrame, "TOPRIGHT", -2, 3)
QuestScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestScrollFrame, "BOTTOMRIGHT", -2, -3)

if (QuestScrollFrame.ScrollBar.BG == nil) then
	QuestScrollFrame.ScrollBar.BG = QuestScrollFrame.ScrollBar:CreateTexture(nil, "BACKGROUND")
	QuestScrollFrame.ScrollBar.BG:SetColorTexture(0, 0, 0, 0.75)
	QuestScrollFrame.ScrollBar.BG:SetAllPoints()
end

ApplyScrollBarArrow(QuestScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestScrollFrame.ScrollBar.Track.Thumb)

QuestMapDetailsScrollFrame.ScrollBar:SetSize(25, 560)
QuestMapDetailsScrollFrame.ScrollBar:ClearAllPoints()
QuestMapDetailsScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestMapDetailsScrollFrame, "TOPRIGHT", 3, 47)
QuestMapDetailsScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestMapDetailsScrollFrame, "BOTTOMRIGHT", 3, -34)

if (QuestMapDetailsScrollFrame.ScrollBar.BG == nil) then
	QuestMapDetailsScrollFrame.ScrollBar.BG = QuestMapDetailsScrollFrame.ScrollBar:CreateTexture(nil, "BACKGROUND")
	QuestMapDetailsScrollFrame.ScrollBar.BG:SetColorTexture(0, 0, 0, 0.75)
	QuestMapDetailsScrollFrame.ScrollBar.BG:SetAllPoints()
end

ApplyScrollBarArrow(QuestMapDetailsScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestMapDetailsScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestMapDetailsScrollFrame.ScrollBar.Track.Thumb)

QuestMapFrame.QuestsFrame.CampaignOverview.ScrollFrame.ScrollBar:SetSize(25, 560)
QuestMapFrame.QuestsFrame.CampaignOverview.ScrollFrame.ScrollBar:ClearAllPoints()
QuestMapFrame.QuestsFrame.CampaignOverview.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestScrollFrame, "TOPRIGHT", -2, 3)
QuestMapFrame.QuestsFrame.CampaignOverview.ScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestScrollFrame, "BOTTOMRIGHT", -2, -3)

if (QuestMapFrame.QuestsFrame.CampaignOverview.ScrollFrame.ScrollBar.BG == nil) then
	QuestMapFrame.QuestsFrame.CampaignOverview.ScrollFrame.ScrollBar.BG = QuestMapFrame.QuestsFrame.CampaignOverview.ScrollFrame.ScrollBar:CreateTexture(nil, "BACKGROUND")
	QuestMapFrame.QuestsFrame.CampaignOverview.ScrollFrame.ScrollBar.BG:SetColorTexture(0, 0, 0, 0.75)
	QuestMapFrame.QuestsFrame.CampaignOverview.ScrollFrame.ScrollBar.BG:SetAllPoints()
end

ApplyScrollBarArrow(QuestMapFrame.QuestsFrame.CampaignOverview.ScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestMapFrame.QuestsFrame.CampaignOverview.ScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestMapFrame.QuestsFrame.CampaignOverview.ScrollFrame.ScrollBar.Track.Thumb)

QuestDetailScrollFrame.ScrollBar:SetSize(25, 560)
QuestDetailScrollFrame.ScrollBar:ClearAllPoints()
QuestDetailScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestDetailScrollFrame, "TOPRIGHT", 2, 3)
QuestDetailScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestDetailScrollFrame, "BOTTOMRIGHT", 2, -2)

ApplyScrollBarArrow(QuestDetailScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestDetailScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestDetailScrollFrame.ScrollBar.Track.Thumb)

QuestGreetingScrollFrame.ScrollBar:SetSize(25, 560)
QuestGreetingScrollFrame.ScrollBar:ClearAllPoints()
QuestGreetingScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestGreetingScrollFrame, "TOPRIGHT", 2, 3)
QuestGreetingScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestGreetingScrollFrame, "BOTTOMRIGHT", 2, -2)

ApplyScrollBarArrow(QuestGreetingScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestGreetingScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestGreetingScrollFrame.ScrollBar.Track.Thumb)

QuestProgressScrollFrame.ScrollBar:SetSize(25, 560)
QuestProgressScrollFrame.ScrollBar:ClearAllPoints()
QuestProgressScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestProgressScrollFrame, "TOPRIGHT", 2, 3)
QuestProgressScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestProgressScrollFrame, "BOTTOMRIGHT", 2, -2)

ApplyScrollBarArrow(QuestProgressScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestProgressScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestProgressScrollFrame.ScrollBar.Track.Thumb)

QuestRewardScrollFrame.ScrollBar:SetSize(25, 560)
QuestRewardScrollFrame.ScrollBar:ClearAllPoints()
QuestRewardScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestRewardScrollFrame, "TOPRIGHT", 2, 3)
QuestRewardScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestRewardScrollFrame, "BOTTOMRIGHT", 2, -2)

ApplyScrollBarArrow(QuestRewardScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestRewardScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestRewardScrollFrame.ScrollBar.Track.Thumb)

QuestLogPopupDetailFrameScrollFrame.ScrollBar:SetSize(25, 560)
QuestLogPopupDetailFrameScrollFrame.ScrollBar:ClearAllPoints()
QuestLogPopupDetailFrameScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestLogPopupDetailFrameScrollFrame, "TOPRIGHT", 1, 3)
QuestLogPopupDetailFrameScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestLogPopupDetailFrameScrollFrame, "BOTTOMRIGHT", 4, -1)

ApplyScrollBarArrow(QuestLogPopupDetailFrameScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestLogPopupDetailFrameScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestLogPopupDetailFrameScrollFrame.ScrollBar.Track.Thumb)

if _G.QuestModelScene then
	QuestModelScene.Border:SetAlpha(0)
	QuestModelScene.TopBarBg:SetAlpha(0)
	QuestModelScene.ModelNameBackground:SetAlpha(0)
	QuestModelScene.ModelNameDivider:SetAlpha(0)

	hooksecurefunc("QuestFrame_ShowQuestPortrait", function(parentFrame)
		QuestModelScene:SetSize(198, 230)
		QuestModelScene:ClearAllPoints()
		QuestModelScene:SetPoint("TOPLEFT", parentFrame, "TOPRIGHT", -3, -42)
		QuestModelScene.ModelTextFrame:SetHeight(64)
	end)

	QuestModelScene.ModelBackground:SetSize(197, 230)
	QuestModelScene.ModelBackground:SetTexture("Interface\\QuestFrame\\QuestPortrait")
	QuestModelScene.ModelBackground:SetTexCoord(0.00390625, 0.77343750, 0.00195313, 0.45117188)
	QuestModelScene.ModelBackground:ClearAllPoints()
	QuestModelScene.ModelBackground:SetPoint("TOPLEFT", QuestModelScene, "TOPLEFT")

	QuestModelScene.ModelNameDivider:ClearAllPoints()
	QuestModelScene.ModelNameDivider:SetPoint("CENTER", QuestModelScene.ModelBackground, "BOTTOM", 0, -9)

	if (QuestModelScene.QuestNPCModelTopBg == nil) then
		QuestModelScene.QuestNPCModelTopBg = QuestModelScene:CreateTexture(nil, "OVERLAY", nil, -1)
		QuestModelScene.QuestNPCModelTopBg:SetSize(195, 18)
		QuestModelScene.QuestNPCModelTopBg:SetTexture("Interface\\QuestFrame\\QuestPortrait")
		QuestModelScene.QuestNPCModelTopBg:SetTexCoord(0.00390625, 0.76562500, 0.63476563, 0.66992188)
		QuestModelScene.QuestNPCModelTopBg:SetPoint("TOPLEFT", 0, 16)
	end

	if (QuestModelScene.QuestNPCCornerTopLeft == nil) then
		QuestModelScene.QuestNPCCornerTopLeft = QuestModelScene:CreateTexture(nil, "OVERLAY", nil, 2)
		QuestModelScene.QuestNPCCornerTopLeft:SetSize(37, 37)
		QuestModelScene.QuestNPCCornerTopLeft:SetTexture("Interface\\QuestFrame\\QuestPortrait")
		QuestModelScene.QuestNPCCornerTopLeft:SetTexCoord(0.78125000, 0.92578125, 0.00195313, 0.07421875)
		QuestModelScene.QuestNPCCornerTopLeft:SetPoint("TOPLEFT", -6, 24)
	end

	if (QuestModelScene.QuestNPCCornerTopRight == nil) then
		QuestModelScene.QuestNPCCornerTopRight = QuestModelScene:CreateTexture(nil, "OVERLAY", nil, 2)
		QuestModelScene.QuestNPCCornerTopRight:SetSize(37, 37)
		QuestModelScene.QuestNPCCornerTopRight:SetTexture("Interface\\QuestFrame\\QuestPortrait")
		QuestModelScene.QuestNPCCornerTopRight:SetTexCoord(0.78125000, 0.92578125, 0.07812500, 0.15039063)
		QuestModelScene.QuestNPCCornerTopRight:SetPoint("TOPRIGHT", 7, 24)
	end

	if (QuestModelScene.QuestNPCCornerBottomLeft == nil) then
		QuestModelScene.QuestNPCCornerBottomLeft = QuestModelScene:CreateTexture(nil, "OVERLAY", nil, 2)
		QuestModelScene.QuestNPCCornerBottomLeft:SetSize(37, 37)
		QuestModelScene.QuestNPCCornerBottomLeft:SetTexture("Interface\\QuestFrame\\QuestPortrait")
		QuestModelScene.QuestNPCCornerBottomLeft:SetTexCoord(0.78125000, 0.92578125, 0.15429688, 0.22656250)
		QuestModelScene.QuestNPCCornerBottomLeft:SetPoint("BOTTOMLEFT", QuestModelScene.ModelTextFrame.TextBackground, "BOTTOMLEFT", -6, -6)
	end

	if (QuestModelScene.QuestNPCCornerBottomRight == nil) then
		QuestModelScene.QuestNPCCornerBottomRight = QuestModelScene:CreateTexture(nil, "OVERLAY", nil, 2)
		QuestModelScene.QuestNPCCornerBottomRight:SetSize(37, 37)
		QuestModelScene.QuestNPCCornerBottomRight:SetTexture("Interface\\QuestFrame\\QuestPortrait")
		QuestModelScene.QuestNPCCornerBottomRight:SetTexCoord(0.78125000, 0.92578125, 0.23046875, 0.30273438)
		QuestModelScene.QuestNPCCornerBottomRight:SetPoint("BOTTOMRIGHT", QuestModelScene.ModelTextFrame.TextBackground, "BOTTOMRIGHT", 7, -6)
	end

	if (QuestModelScene.QuestNPCModelTopBorder == nil) then
		QuestModelScene.QuestNPCModelTopBorder = QuestModelScene:CreateTexture(nil, "OVERLAY")
		QuestModelScene.QuestNPCModelTopBorder:SetSize(200, 28)
		QuestModelScene.QuestNPCModelTopBorder:SetAtlas("_UI-Frame-TitleTile")
		QuestModelScene.QuestNPCModelTopBorder:SetHorizTile(true)
		QuestModelScene.QuestNPCModelTopBorder:SetPoint("TOPLEFT", -1, 20)
		QuestModelScene.QuestNPCModelTopBorder:SetPoint("TOPRIGHT", 1, 20)
	end

	if (QuestModelScene.QuestNPCModelBottomBorder == nil) then
		QuestModelScene.QuestNPCModelBottomBorder = QuestModelScene:CreateTexture(nil, "OVERLAY")
		QuestModelScene.QuestNPCModelBottomBorder:SetSize(180, 9)
		QuestModelScene.QuestNPCModelBottomBorder:SetAtlas("_UI-Frame-Bot")
		QuestModelScene.QuestNPCModelBottomBorder:SetHorizTile(true)
		QuestModelScene.QuestNPCModelBottomBorder:SetPoint("BOTTOMLEFT", QuestModelScene.ModelTextFrame.TextBackground, "BOTTOMLEFT", 0, -5)
		QuestModelScene.QuestNPCModelBottomBorder:SetPoint("BOTTOMRIGHT", QuestModelScene.ModelTextFrame.TextBackground, "BOTTOMRIGHT", 0, -5)
	end

	if (QuestModelScene.QuestNPCModelLeftBorder == nil) then
		QuestModelScene.QuestNPCModelLeftBorder = QuestModelScene:CreateTexture(nil, "OVERLAY")
		QuestModelScene.QuestNPCModelLeftBorder:SetSize(16, 221)
		QuestModelScene.QuestNPCModelLeftBorder:SetAtlas("!UI-Frame-LeftTile")
		QuestModelScene.QuestNPCModelLeftBorder:SetVertTile(true)
		QuestModelScene.QuestNPCModelLeftBorder:SetPoint("TOPLEFT", -5, 0)
		QuestModelScene.QuestNPCModelLeftBorder:SetPoint("BOTTOMLEFT", QuestModelScene.ModelTextFrame.TextBackground, "BOTTOMLEFT")
	end

	if (QuestModelScene.QuestNPCModelRightBorder == nil) then
		QuestModelScene.QuestNPCModelRightBorder = QuestModelScene:CreateTexture(nil, "OVERLAY")
		QuestModelScene.QuestNPCModelRightBorder:SetSize(10, 224)
		QuestModelScene.QuestNPCModelRightBorder:SetAtlas("!UI-Frame-RightTile")
		QuestModelScene.QuestNPCModelRightBorder:SetVertTile(true)
		QuestModelScene.QuestNPCModelRightBorder:SetPoint("TOPRIGHT", 3, 0)
		QuestModelScene.QuestNPCModelRightBorder:SetPoint("BOTTOMRIGHT", QuestModelScene.ModelTextFrame.TextBackground, "BOTTOMRIGHT")
	end

	if (QuestModelScene.QuestNPCModelNameplate == nil) then
		QuestModelScene.QuestNPCModelNameplate = QuestModelScene:CreateTexture(nil, "OVERLAY", nil, 1)
		QuestModelScene.QuestNPCModelNameplate:SetSize(199, 44)
		QuestModelScene.QuestNPCModelNameplate:SetTexture("Interface\\QuestFrame\\QuestPortrait")
		QuestModelScene.QuestNPCModelNameplate:SetTexCoord(0.00390625, 0.78125000, 0.45507813, 0.54101563)
		QuestModelScene.QuestNPCModelNameplate:SetPoint("TOPLEFT", QuestModelScene, "BOTTOMLEFT", 0, 12)
	end

	QuestModelScene.ModelTextFrame:ClearAllPoints()
	QuestModelScene.ModelTextFrame:SetPoint("TOPLEFT", QuestModelScene.QuestNPCModelNameplate, "BOTTOMLEFT", 0, 12)

	QuestModelScene.ModelTextFrame.TextBackground:SetSize(197, 64)
	QuestModelScene.ModelTextFrame.TextBackground:SetTexture("Interface\\QuestFrame\\QuestPortrait")
	QuestModelScene.ModelTextFrame.TextBackground:SetTexCoord(0.00390625, 0.77343750, 0.00195313, 0.126953125)

	QuestNPCModelNameText:ClearAllPoints()
	QuestNPCModelNameText:SetPoint("TOPLEFT", QuestModelScene.QuestNPCModelNameplate, "TOPLEFT", 22, -12)
	QuestNPCModelNameText:SetPoint("BOTTOMRIGHT", QuestModelScene.QuestNPCModelNameplate, "BOTTOMRIGHT", -22, 12)

	QuestNPCModelTextScrollFrame:ClearAllPoints()
	QuestNPCModelTextScrollFrame:SetPoint("TOPLEFT", QuestModelScene.ModelTextFrame, "TOPLEFT", 10, -6)
	QuestNPCModelTextScrollFrame:SetPoint("BOTTOMRIGHT", QuestModelScene.ModelTextFrame, "BOTTOMRIGHT", -10, 10)

	QuestNPCModelTextScrollFrame.ScrollBar:SetAlpha(0)
end