if not _G.ChannelFrame then return end

ApplyCloseButton(ChannelFrameCloseButton)

ChannelFramePortrait:SetSize(61, 61)
ChannelFramePortrait:ClearAllPoints()
ChannelFramePortrait:SetPoint("TOPLEFT", -6, 8)

ChannelFrame.TitleContainer:ClearAllPoints()
ChannelFrame.TitleContainer:SetPoint("TOPLEFT", ChannelFrame, "TOPLEFT", 60, 0)
ChannelFrame.TitleContainer:SetPoint("TOPRIGHT", ChannelFrame, "TOPRIGHT", -60, 0)

ApplyTitleBg(ChannelFrame)
ApplyNineSlicePortrait(ChannelFrame)

ChannelFrame.ChannelRoster.ScrollBar:SetSize(25, 560)
ChannelFrame.ChannelRoster.ScrollBar:ClearAllPoints()
ChannelFrame.ChannelRoster.ScrollBar:SetPoint("TOPLEFT", ChannelFrame.ChannelRoster.ScrollBox, "TOPRIGHT", 1, 3)
ChannelFrame.ChannelRoster.ScrollBar:SetPoint("BOTTOMLEFT", ChannelFrame.ChannelRoster.ScrollBox, "BOTTOMRIGHT", 1, -5)

ApplyScrollBarArrow(ChannelFrame.ChannelRoster.ScrollBar)
ApplyScrollBarTrack(ChannelFrame.ChannelRoster.ScrollBar.Track)
ApplyScrollBarThumb(ChannelFrame.ChannelRoster.ScrollBar.Track.Thumb)

CreateChannelPopup.CloseButton:Hide()

ApplyDialogBorder(CreateChannelPopup.BG)
ApplyDialogHeader(CreateChannelPopup.Header)