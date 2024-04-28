if not _G.GossipFrame then return end

GossipFramePortrait:SetParent(GossipFrame)

GossipFrame.TitleContainer:SetSize(0, 14)
GossipFrame.TitleContainer:ClearAllPoints()
GossipFrame.TitleContainer:SetPoint("TOP", 0, -23)
GossipFrame.TitleContainer:SetPoint("LEFT", GossipFramePortrait, "RIGHT", 10, 0)
GossipFrame.TitleContainer:SetPoint("RIGHT", -58, 0)