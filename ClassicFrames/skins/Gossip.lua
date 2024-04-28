if not _G.GossipFrame then return end

GossipFramePortrait:SetParent(GossipFrame)

GossipFrame.TitleContainer:SetSize(0, 14)
GossipFrame.TitleContainer:ClearAllPoints()
GossipFrame.TitleContainer:SetPoint("TOP", 0, -23)
GossipFrame.TitleContainer:SetPoint("LEFT", GossipFramePortrait, "RIGHT", 10, 0)
GossipFrame.TitleContainer:SetPoint("RIGHT", -58, 0)

GossipFrame.GreetingPanel.ScrollBox:ClearAllPoints()
GossipFrame.GreetingPanel.ScrollBox:SetPoint("TOPLEFT", 23, -81)

GossipFrame.GreetingPanel.ScrollBar:ClearAllPoints()
GossipFrame.GreetingPanel.ScrollBar:SetPoint("TOPLEFT", GossipFrame.GreetingPanel.ScrollBox, "TOPRIGHT", 1, 3)
GossipFrame.GreetingPanel.ScrollBar:SetPoint("BOTTOMLEFT", GossipFrame.GreetingPanel.ScrollBox, "BOTTOMRIGHT", -1, -2)