if (IsAddOnLoaded("SexyMap")) then return end

-- minimap
MinimapZoomIn:ClearAllPoints()
MinimapZoomIn:SetPoint("CENTER", 72, -25)
MinimapZoomOut:ClearAllPoints()
MinimapZoomOut:SetPoint("CENTER", 50, -43)

MiniMapTracking:ClearAllPoints()
MiniMapTracking:SetPoint("TOPLEFT", 9, -45)

GameTimeFrame:ClearAllPoints()
GameTimeFrame:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", 20, -2)
GameTimeFrame:GetFontString():ClearAllPoints()
GameTimeFrame:GetFontString():SetPoint("CENTER", -2, -1)

MiniMapWorldBorder:Hide()

MiniMapWorldMapButton:SetSize(32, 32)
MiniMapWorldMapButton:ClearAllPoints()
MiniMapWorldMapButton:SetPoint("TOPRIGHT", MinimapBackdrop, "TOPRIGHT", 0, 21)
MiniMapWorldMapButton:SetNormalTexture("Interface\\Minimap\\UI-Minimap-WorldMapSquare")
MiniMapWorldMapButton:GetNormalTexture():SetSize(32, 32)
MiniMapWorldMapButton:GetNormalTexture():SetTexCoord(0.0, 1, 0, 0.5)
MiniMapWorldMapButton:SetPushedTexture("Interface\\Minimap\\UI-Minimap-WorldMapSquare")
MiniMapWorldMapButton:GetPushedTexture():SetSize(32, 32)
MiniMapWorldMapButton:GetPushedTexture():SetTexCoord(0.0, 1, 0.5, 1)
MiniMapWorldMapButton:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")
MiniMapWorldMapButton:GetHighlightTexture():SetSize(28, 28)
MiniMapWorldMapButton:GetHighlightTexture():ClearAllPoints()
MiniMapWorldMapButton:GetHighlightTexture():SetPoint("TOPRIGHT", MiniMapWorldMapButton, "TOPRIGHT")

Minimap:HookScript("OnEvent", function(self, event, ...)
	TimeManagerClockTicker:ClearAllPoints()
	TimeManagerClockTicker:SetPoint("CENTER", TimeManagerClockButton, "CENTER", 2, 1)
end)

-- queuestatusframe
QueueStatusFrame:ClearAllPoints();
QueueStatusFrame:SetPoint("TOPRIGHT", MiniMapLFGFrame, "TOPLEFT", -1, 1);

hooksecurefunc(QueueStatusFrame, "UpdatePosition", function(self)
	self:ClearAllPoints();
	self:SetPoint("TOPRIGHT", MiniMapLFGFrame, "TOPLEFT", -1, 1);
end)

hooksecurefunc("QueueStatusDropDown_Show", function()
	DropDownList1:ClearAllPoints()
	DropDownList1:SetPoint("BOTTOMLEFT", MiniMapLFGFrame, "BOTTOMLEFT", 0, -61)
end)