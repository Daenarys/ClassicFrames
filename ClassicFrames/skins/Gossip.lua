if not _G.GossipFrame then return end

GossipFrame:SetHeight(496)

 _G.select(18, _G.GossipFrame:GetRegions()):SetSize(510, 620)
 _G.select(18, _G.GossipFrame:GetRegions()):SetPoint("TOPLEFT", 7, -62)

GossipFrame.GreetingPanel.ScrollBar:SetPoint("TOPLEFT", GossipFrame.GreetingPanel.ScrollBox, "TOPRIGHT", 0, 5)
GossipFrame.GreetingPanel.ScrollBar:SetPoint("BOTTOMLEFT", GossipFrame.GreetingPanel.ScrollBox, "BOTTOMRIGHT", 0, -71)