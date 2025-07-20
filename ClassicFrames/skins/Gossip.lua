if not _G.GossipFrame then return end

GossipFrame:SetHeight(496)

GossipFrame.PortraitContainer.CircleMask:Hide()

GossipFramePortrait:SetSize(61, 61)
GossipFramePortrait:ClearAllPoints()
GossipFramePortrait:SetPoint("TOPLEFT", -6, 8)

GossipFramePortraitFrame:SetParent(GossipFrame.PortraitContainer)
GossipFramePortraitFrame:SetDrawLayer("OVERLAY", 1)

GossipFrame.TitleText:ClearAllPoints()
GossipFrame.TitleText:SetPoint("TOPLEFT", GossipFrame, "TOPLEFT", 65, -6)
GossipFrame.TitleText:SetPoint("TOPRIGHT", GossipFrame, "TOPRIGHT", -60, 6)

GossipFrame.TitleText:SetTextColor(255, 255, 255, 1)

 _G.select(17, _G.GossipFrame:GetRegions()):SetSize(510, 620)
 _G.select(17, _G.GossipFrame:GetRegions()):SetPoint("TOPLEFT", 7, -62)

GossipFrame.GreetingPanel.ScrollBox:SetPoint("TOPLEFT", GossipFrame, "TOPLEFT", 5, -65)
GossipFrame.GreetingPanel.ScrollBar:SetPoint("TOPLEFT", GossipFrame.GreetingPanel.ScrollBox, "TOPRIGHT", 2, 5)
GossipFrame.GreetingPanel.ScrollBar:SetPoint("BOTTOMLEFT", GossipFrame.GreetingPanel.ScrollBox, "BOTTOMRIGHT", 2, -71)