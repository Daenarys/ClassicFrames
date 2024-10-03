if _G.QuestFrame then
	ApplyCloseButton(QuestFrameCloseButton)

	QuestFrame.PortraitContainer.CircleMask:Hide()

	QuestFramePortrait:SetSize(61, 61)
	QuestFramePortrait:ClearAllPoints()
	QuestFramePortrait:SetPoint("TOPLEFT", -6, 8)

	QuestFrame.TitleContainer:ClearAllPoints()
	QuestFrame.TitleContainer:SetPoint("TOPLEFT", QuestFrame, "TOPLEFT", 73, -1)
	QuestFrame.TitleContainer:SetPoint("TOPRIGHT", QuestFrame, "TOPRIGHT", -47, 1)

	QuestFrameTitleText:SetTextColor(255, 255, 255, 1)

	ApplyTitleBg(QuestFrame)
	ApplyNineSlicePortrait(QuestFrame)
end

if _G.QuestLogPopupDetailFrame then
	ApplyCloseButton(QuestLogPopupDetailFrameCloseButton)

	QuestLogPopupDetailFrame.PortraitContainer.CircleMask:Hide()

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

QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar:SetSize(25, 560)
QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar:ClearAllPoints()
QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestScrollFrame, "TOPRIGHT", -2, 3)
QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestScrollFrame, "BOTTOMRIGHT", -2, -11)

if (QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar.BG == nil) then
	QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar.BG = QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar:CreateTexture(nil, "BACKGROUND")
	QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar.BG:SetColorTexture(0, 0, 0, 0.75)
	QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar.BG:SetAllPoints()
end

ApplyScrollBarArrow(QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar.Track.Thumb)

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

QuestNPCModelTextScrollFrame.ScrollBar.Track.Begin:Hide()
QuestNPCModelTextScrollFrame.ScrollBar.Track.End:Hide()
QuestNPCModelTextScrollFrame.ScrollBar.Track.Middle:Hide()

ApplyScrollBarThumb(QuestNPCModelTextScrollFrame.ScrollBar.Track.Thumb)

QuestNPCModelTextScrollFrame.ScrollBar.Back:SetSize(18, 16)
QuestNPCModelTextScrollFrame.ScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
QuestNPCModelTextScrollFrame.ScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
QuestNPCModelTextScrollFrame.ScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
QuestNPCModelTextScrollFrame.ScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

QuestNPCModelTextScrollFrame.ScrollBar.Forward:SetSize(18, 16)
QuestNPCModelTextScrollFrame.ScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
QuestNPCModelTextScrollFrame.ScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
QuestNPCModelTextScrollFrame.ScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
QuestNPCModelTextScrollFrame.ScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")

QuestLogPopupDetailFrameScrollFrame.ScrollBar:SetSize(25, 560)
QuestLogPopupDetailFrameScrollFrame.ScrollBar:ClearAllPoints()
QuestLogPopupDetailFrameScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestLogPopupDetailFrameScrollFrame, "TOPRIGHT", 1, 3)
QuestLogPopupDetailFrameScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestLogPopupDetailFrameScrollFrame, "BOTTOMRIGHT", 4, -1)

ApplyScrollBarArrow(QuestLogPopupDetailFrameScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestLogPopupDetailFrameScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestLogPopupDetailFrameScrollFrame.ScrollBar.Track.Thumb)