if not _G.GossipFrame then return end

ApplyCloseButton(GossipFrameCloseButton)

GossipFramePortrait:SetSize(61, 61)
GossipFramePortrait:ClearAllPoints()
GossipFramePortrait:SetPoint("TOPLEFT", -6, 8)

GossipFrame.TitleContainer:ClearAllPoints()
GossipFrame.TitleContainer:SetPoint("TOPLEFT", GossipFrame, "TOPLEFT", 66, -1)
GossipFrame.TitleContainer:SetPoint("TOPRIGHT", GossipFrame, "TOPRIGHT", -60, 1)

GossipFrameTitleText:SetTextColor(255, 255, 255, 1)

ApplyTitleBg(GossipFrame)
ApplyNineSlicePortrait(GossipFrame)

ApplyScrollBarArrow(GossipFrame.GreetingPanel.ScrollBar)
ApplyScrollBarTrack(GossipFrame.GreetingPanel.ScrollBar.Track)
ApplyScrollBarThumb(GossipFrame.GreetingPanel.ScrollBar.Track.Thumb)