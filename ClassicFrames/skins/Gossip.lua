if not _G.GossipFrame then return end

ApplyCloseButton(GossipFrameCloseButton)

GossipFrame.PortraitContainer.CircleMask:Hide()

GossipFramePortrait:SetSize(61, 61)
GossipFramePortrait:ClearAllPoints()
GossipFramePortrait:SetPoint("TOPLEFT", -6, 8)

GossipFrame.TitleContainer:ClearAllPoints()
GossipFrame.TitleContainer:SetPoint("TOPLEFT", GossipFrame, "TOPLEFT", 66, -1)
GossipFrame.TitleContainer:SetPoint("TOPRIGHT", GossipFrame, "TOPRIGHT", -60, 1)

ApplyTitleBg(GossipFrame)
ApplyNineSlicePortrait(GossipFrame)

GossipFrame.GreetingPanel.ScrollBox:ClearAllPoints()
GossipFrame.GreetingPanel.ScrollBox:SetPoint("TOPLEFT", 5, -65)

GossipFrame.GreetingPanel.ScrollBar:SetSize(25, 560)
GossipFrame.GreetingPanel.ScrollBar:ClearAllPoints()
GossipFrame.GreetingPanel.ScrollBar:SetPoint("TOPLEFT", GossipFrame.GreetingPanel.ScrollBox, "TOPRIGHT", 2, 3)
GossipFrame.GreetingPanel.ScrollBar:SetPoint("BOTTOMLEFT", GossipFrame.GreetingPanel.ScrollBox, "BOTTOMRIGHT", 2, -2)

ApplyScrollBarArrow(GossipFrame.GreetingPanel.ScrollBar)
ApplyScrollBarTrack(GossipFrame.GreetingPanel.ScrollBar.Track)
ApplyScrollBarThumb(GossipFrame.GreetingPanel.ScrollBar.Track.Thumb)