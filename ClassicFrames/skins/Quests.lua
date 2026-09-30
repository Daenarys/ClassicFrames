if _G.QuestFrame then
	ApplyCloseButton(QuestFrameCloseButton)

	QuestFramePortrait:SetSize(61, 61)
	QuestFramePortrait:ClearAllPoints()
	QuestFramePortrait:SetPoint("TOPLEFT", -6, 8)

	QuestFrame.TitleContainer:ClearAllPoints()
	QuestFrame.TitleContainer:SetPoint("TOPLEFT", QuestFrame, "TOPLEFT", 60, -1)
	QuestFrame.TitleContainer:SetPoint("TOPRIGHT", QuestFrame, "TOPRIGHT", -58, 1)

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

QuestScrollFrame.ScrollBar:ClearAllPoints()
QuestScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestScrollFrame, "TOPRIGHT", 7, -2)
QuestScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestScrollFrame, "BOTTOMRIGHT", 7, -3)

ApplyScrollBarHybrid(QuestScrollFrame.ScrollBar, true)
ApplyScrollBarThumb(QuestScrollFrame.ScrollBar.Track.Thumb)

QuestMapDetailsScrollFrame.ScrollBar:ClearAllPoints()
QuestMapDetailsScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestMapDetailsScrollFrame, "TOPRIGHT", 12, 42)
QuestMapDetailsScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestMapDetailsScrollFrame, "BOTTOMRIGHT", 12, -31)

ApplyScrollBarHybrid(QuestMapDetailsScrollFrame.ScrollBar, true)
ApplyScrollBarThumb(QuestMapDetailsScrollFrame.ScrollBar.Track.Thumb)

QuestMapFrame.QuestsFrame.CampaignOverview.ScrollFrame.ScrollBar:ClearAllPoints()
QuestMapFrame.QuestsFrame.CampaignOverview.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestScrollFrame, "TOPRIGHT", 7, -2)
QuestMapFrame.QuestsFrame.CampaignOverview.ScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestScrollFrame, "BOTTOMRIGHT", 7, -3)

ApplyScrollBarHybrid(QuestMapFrame.QuestsFrame.CampaignOverview.ScrollFrame.ScrollBar, true)
ApplyScrollBarThumb(QuestMapFrame.QuestsFrame.CampaignOverview.ScrollFrame.ScrollBar.Track.Thumb)

QuestDetailScrollFrame.ScrollBar:SetSize(25, 560)
QuestDetailScrollFrame.ScrollBar:ClearAllPoints()
QuestDetailScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestDetailScrollFrame, "TOPRIGHT", 1, 4)
QuestDetailScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestDetailScrollFrame, "BOTTOMRIGHT", -1, -3)

ApplyScrollBarArrow(QuestDetailScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestDetailScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestDetailScrollFrame.ScrollBar.Track.Thumb)

QuestGreetingScrollFrame.ScrollBar:SetSize(25, 560)
QuestGreetingScrollFrame.ScrollBar:ClearAllPoints()
QuestGreetingScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestGreetingScrollFrame, "TOPRIGHT", 1, 4)
QuestGreetingScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestGreetingScrollFrame, "BOTTOMRIGHT", -1, -3)

ApplyScrollBarArrow(QuestGreetingScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestGreetingScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestGreetingScrollFrame.ScrollBar.Track.Thumb)

QuestProgressScrollFrame.ScrollBar:SetSize(25, 560)
QuestProgressScrollFrame.ScrollBar:ClearAllPoints()
QuestProgressScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestProgressScrollFrame, "TOPRIGHT", 1, 4)
QuestProgressScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestProgressScrollFrame, "BOTTOMRIGHT", -1, -3)

ApplyScrollBarArrow(QuestProgressScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestProgressScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestProgressScrollFrame.ScrollBar.Track.Thumb)

QuestRewardScrollFrame.ScrollBar:SetSize(25, 560)
QuestRewardScrollFrame.ScrollBar:ClearAllPoints()
QuestRewardScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestRewardScrollFrame, "TOPRIGHT", 1, 4)
QuestRewardScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestRewardScrollFrame, "BOTTOMRIGHT", -1, -3)

ApplyScrollBarArrow(QuestRewardScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestRewardScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestRewardScrollFrame.ScrollBar.Track.Thumb)

QuestLogPopupDetailFrameScrollFrame.ScrollBar:SetSize(25, 560)
QuestLogPopupDetailFrameScrollFrame.ScrollBar:ClearAllPoints()
QuestLogPopupDetailFrameScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestLogPopupDetailFrameScrollFrame, "TOPRIGHT", 0, 4)
QuestLogPopupDetailFrameScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestLogPopupDetailFrameScrollFrame, "BOTTOMRIGHT", -1, -3)

ApplyScrollBarArrow(QuestLogPopupDetailFrameScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestLogPopupDetailFrameScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestLogPopupDetailFrameScrollFrame.ScrollBar.Track.Thumb)

hooksecurefunc(QuestLogPopupDetailFrame, "ShowQuest", function(self)
	self.Bg:SetSize(510, 620)
	self.Bg:SetTexture("Interface\\QuestFrame\\QuestBG")
end)

hooksecurefunc("QuestFrame_SetMaterial", function(frame)
	frame.Bg:SetSize(510, 620)
	frame.Bg:SetTexture("Interface\\QuestFrame\\QuestBG")
end)

QuestFrameProgressPanel:HookScript("OnShow", function(self)
	self.Bg:SetSize(510, 620)
	self.Bg:SetTexture("Interface\\QuestFrame\\QuestBG")
end)