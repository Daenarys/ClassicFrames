if not _G.WorldMapFrame then return end

hooksecurefunc(WorldMapFrame, "Minimize", function(self)
	ApplyCloseButton(WorldMapFrameCloseButton)

	self.BorderFrame.MaximizeMinimizeFrame:SetSize(32, 32)
	self.BorderFrame.MaximizeMinimizeFrame:ClearAllPoints()
	self.BorderFrame.MaximizeMinimizeFrame:SetPoint("RIGHT", WorldMapFrameCloseButton, "LEFT", 8.5, 0)

	ApplyMaxMinButton(self.BorderFrame.MaximizeMinimizeFrame)

	if (self.BorderFrame.ButtonFrameEdge == nil) then
		self.BorderFrame.ButtonFrameEdge = self.BorderFrame.MaximizeMinimizeFrame:CreateTexture(nil, "OVERLAY")
		self.BorderFrame.ButtonFrameEdge:SetAtlas("UI-OuterBorderButtonPatch", true)
		self.BorderFrame.ButtonFrameEdge:ClearAllPoints()
		self.BorderFrame.ButtonFrameEdge:SetPoint("CENTER", self.BorderFrame.MaximizeMinimizeFrame, "LEFT", 6, 0)
	end

	WorldMapFramePortrait:SetSize(61, 61)
	WorldMapFramePortrait:ClearAllPoints()
	WorldMapFramePortrait:SetPoint("TOPLEFT", -6, 8)

	self.BorderFrame.TitleContainer:ClearAllPoints()
	self.BorderFrame.TitleContainer:SetPoint("TOPLEFT", self, "TOPLEFT", 58, 0)
	self.BorderFrame.TitleContainer:SetPoint("TOPRIGHT", self, "TOPRIGHT", -58, 0)

	ApplyTitleBg(self)
	ApplyNineSlicePortrait(self.BorderFrame)

	self.BorderFrame.Tutorial.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")
end)

hooksecurefunc(WorldMapFrame, "Maximize", function(self)
	ApplyCloseButton(WorldMapFrameCloseButton)

	self.BorderFrame.MaximizeMinimizeFrame:SetSize(32, 32)
	self.BorderFrame.MaximizeMinimizeFrame:ClearAllPoints()
	self.BorderFrame.MaximizeMinimizeFrame:SetPoint("RIGHT", WorldMapFrameCloseButton, "LEFT", 8.5, 0)

	ApplyMaxMinButton(self.BorderFrame.MaximizeMinimizeFrame)

	if (self.BorderFrame.ButtonFrameEdge == nil) then
		self.BorderFrame.ButtonFrameEdge = self.BorderFrame.MaximizeMinimizeFrame:CreateTexture(nil, "OVERLAY")
		self.BorderFrame.ButtonFrameEdge:SetAtlas("UI-OuterBorderButtonPatch", true)
		self.BorderFrame.ButtonFrameEdge:ClearAllPoints()
		self.BorderFrame.ButtonFrameEdge:SetPoint("CENTER", self.BorderFrame.MaximizeMinimizeFrame, "LEFT", 6, 0)
	end
	
	ApplyTitleBg(self, true)
	ApplyNineSliceNoPortrait(self.BorderFrame)
end)

WorldMapFrame.NavBar:SetPoint("TOPLEFT", WorldMapFrame.TitleCanvasSpacerFrame, "TOPLEFT", 64, -25)
WorldMapFrame.NavBar:SetPoint("BOTTOMRIGHT", WorldMapFrame.TitleCanvasSpacerFrame, "BOTTOMRIGHT", -4, 9)

if WorldMapFrame.WorldMapTrackingOptionsButton then
	WorldMapFrame.WorldMapTrackingOptionsButton:ClearAllPoints()
	WorldMapFrame.WorldMapTrackingOptionsButton:SetPoint("TOPRIGHT", WorldMapFrame.ScrollContainer, "TOPRIGHT", -4, -2)
	WorldMapFrame.WorldMapTrackingOptionsButton:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight", "ADD")
	WorldMapFrame.WorldMapTrackingOptionsButton:GetHighlightTexture():SetAllPoints()
	WorldMapFrame.WorldMapTrackingOptionsButton:GetHighlightTexture():SetAlpha(1)

	if (WorldMapFrame.WorldMapTrackingOptionsButton.Shadow == nil) then
		WorldMapFrame.WorldMapTrackingOptionsButton.Shadow = WorldMapFrame.WorldMapTrackingOptionsButton:CreateTexture(nil, "BACKGROUND", nil, -1)
		WorldMapFrame.WorldMapTrackingOptionsButton.Shadow:SetAtlas("MapCornerShadow-Right", true)
		WorldMapFrame.WorldMapTrackingOptionsButton.Shadow:SetTexCoord(0, 1, 1, 0)
		WorldMapFrame.WorldMapTrackingOptionsButton.Shadow:SetPoint("TOPRIGHT", 4, 1)
	end

	if (WorldMapFrame.WorldMapTrackingOptionsButton.Background == nil) then
		WorldMapFrame.WorldMapTrackingOptionsButton.Background = WorldMapFrame.WorldMapTrackingOptionsButton:CreateTexture(nil, "BACKGROUND")
		WorldMapFrame.WorldMapTrackingOptionsButton.Background:SetSize(25, 25)
		WorldMapFrame.WorldMapTrackingOptionsButton.Background:SetTexture("Interface\\Minimap\\UI-Minimap-Background")
		WorldMapFrame.WorldMapTrackingOptionsButton.Background:SetPoint("TOPLEFT", 2, -4)
	end

	if (WorldMapFrame.WorldMapTrackingOptionsButton.Border == nil) then
		WorldMapFrame.WorldMapTrackingOptionsButton.Border = WorldMapFrame.WorldMapTrackingOptionsButton:CreateTexture(nil, "OVERLAY", nil, 1)
		WorldMapFrame.WorldMapTrackingOptionsButton.Border:SetSize(54, 54)
		WorldMapFrame.WorldMapTrackingOptionsButton.Border:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")
		WorldMapFrame.WorldMapTrackingOptionsButton.Border:SetPoint("TOPLEFT")
	end

	WorldMapFrame.WorldMapTrackingOptionsButton.Icon:SetSize(20, 20)
	WorldMapFrame.WorldMapTrackingOptionsButton.Icon:SetTexture("Interface\\Minimap\\Tracking\\None")
	WorldMapFrame.WorldMapTrackingOptionsButton.Icon:SetPoint("TOPLEFT", 6, -6)

	if (WorldMapFrame.WorldMapTrackingOptionsButton.IconOverlay == nil) then
		WorldMapFrame.WorldMapTrackingOptionsButton.IconOverlay = WorldMapFrame.WorldMapTrackingOptionsButton:CreateTexture(nil, "OVERLAY")
		WorldMapFrame.WorldMapTrackingOptionsButton.IconOverlay:SetPoint("TOPLEFT", WorldMapFrame.WorldMapTrackingOptionsButton.Icon)
		WorldMapFrame.WorldMapTrackingOptionsButton.IconOverlay:SetPoint("BOTTOMRIGHT", WorldMapFrame.WorldMapTrackingOptionsButton.Icon)
		WorldMapFrame.WorldMapTrackingOptionsButton.IconOverlay:SetColorTexture(0, 0, 0, 0.5)
		WorldMapFrame.WorldMapTrackingOptionsButton.IconOverlay:Hide()
	end

	WorldMapFrame.WorldMapTrackingOptionsButton:HookScript("OnMouseDown", function(self)
		self.Icon:SetTexture("Interface\\Minimap\\Tracking\\None")
		self.Icon:SetPoint("TOPLEFT", 8, -8)
		self.IconOverlay:Show()
	end)

	WorldMapFrame.WorldMapTrackingOptionsButton:HookScript("OnMouseUp", function(self)
		self.Icon:SetTexture("Interface\\Minimap\\Tracking\\None")
		self.Icon:SetPoint("TOPLEFT", 6, -6)
		self.IconOverlay:Hide()
	end)
end

if WorldMapFrame.WorldMapTrackingPinButton then
	WorldMapFrame.WorldMapTrackingPinButton:ClearAllPoints()
	WorldMapFrame.WorldMapTrackingPinButton:SetPoint("TOPRIGHT", WorldMapFrame.ScrollContainer, "TOPRIGHT", -36, -2)

	WorldMapFrame.WorldMapTrackingPinButton.Border:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")
	WorldMapFrame.WorldMapTrackingPinButton.Icon:SetPoint("TOPLEFT", 6, -6)

	WorldMapFrame.WorldMapTrackingPinButton:HookScript("OnMouseDown", function(self)
		self.Icon:SetPoint("TOPLEFT", 8, -8)
	end)

	WorldMapFrame.WorldMapTrackingPinButton:HookScript("OnMouseUp", function(self)
		self.Icon:SetPoint("TOPLEFT", 6, -6)
	end)
end