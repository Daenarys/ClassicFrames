if not _G.QuestLogPopupDetailFrame then return end

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

QuestLogPopupDetailFrameScrollFrame.ScrollBar:SetSize(25, 560)
QuestLogPopupDetailFrameScrollFrame.ScrollBar:ClearAllPoints()
QuestLogPopupDetailFrameScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestLogPopupDetailFrameScrollFrame, "TOPRIGHT", 1, 3)
QuestLogPopupDetailFrameScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestLogPopupDetailFrameScrollFrame, "BOTTOMRIGHT", 4, -1)

ApplyScrollBarArrow(QuestLogPopupDetailFrameScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestLogPopupDetailFrameScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestLogPopupDetailFrameScrollFrame.ScrollBar.Track.Thumb)