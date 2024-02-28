if not _G.WorldMapFrame then return end

hooksecurefunc(WorldMapFrame, "Minimize", function(self)
	ApplyCloseButton(WorldMapFrameCloseButton)

	self.BorderFrame.MaximizeMinimizeFrame:SetSize(32, 32)
	self.BorderFrame.MaximizeMinimizeFrame:ClearAllPoints()
	self.BorderFrame.MaximizeMinimizeFrame:SetPoint("RIGHT", WorldMapFrameCloseButton, "LEFT", 10, 0)

	self.BorderFrame.MaximizeMinimizeFrame.MaximizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Up")
	self.BorderFrame.MaximizeMinimizeFrame.MaximizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Down")
	self.BorderFrame.MaximizeMinimizeFrame.MaximizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Disabled")
	self.BorderFrame.MaximizeMinimizeFrame.MaximizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

	self.BorderFrame.MaximizeMinimizeFrame.MinimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Up")
	self.BorderFrame.MaximizeMinimizeFrame.MinimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Down")
	self.BorderFrame.MaximizeMinimizeFrame.MinimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
	self.BorderFrame.MaximizeMinimizeFrame.MinimizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Disabled")

	if not self.BorderFrame.ButtonFrameEdge then
		self.BorderFrame.ButtonFrameEdge = self.BorderFrame.MaximizeMinimizeFrame:CreateTexture(nil, "OVERLAY")
		self.BorderFrame.ButtonFrameEdge:SetAtlas("UI-OuterBorderButtonPatch", true)
		self.BorderFrame.ButtonFrameEdge:ClearAllPoints()
		self.BorderFrame.ButtonFrameEdge:SetPoint("CENTER", self.BorderFrame.MaximizeMinimizeFrame, "LEFT", 6, 0)
	end

	self.BorderFrame.Tutorial.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

	self.BorderFrame.PortraitContainer.CircleMask:Hide()

	WorldMapFramePortrait:SetSize(61, 61)
	WorldMapFramePortrait:ClearAllPoints()
	WorldMapFramePortrait:SetPoint("TOPLEFT", -6, 8)

	self.BorderFrame.TitleContainer:ClearAllPoints()
	self.BorderFrame.TitleContainer:SetPoint("TOPLEFT", self, "TOPLEFT", 58, 0)
	self.BorderFrame.TitleContainer:SetPoint("TOPRIGHT", self, "TOPRIGHT", -58, 0)

	ApplyTitleBg(self)
	ApplyNineSlicePortrait(self.BorderFrame)
	WorldMapFrameBg:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-Background-Rock", true, true)
end)

hooksecurefunc(WorldMapFrame, "Maximize", function(self)
	ApplyCloseButton(WorldMapFrameCloseButton)

	self.BorderFrame.MaximizeMinimizeFrame:SetSize(32, 32)
	self.BorderFrame.MaximizeMinimizeFrame:ClearAllPoints()
	self.BorderFrame.MaximizeMinimizeFrame:SetPoint("RIGHT", WorldMapFrameCloseButton, "LEFT", 10, 0)

	self.BorderFrame.MaximizeMinimizeFrame.MaximizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Up")
	self.BorderFrame.MaximizeMinimizeFrame.MaximizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Down")
	self.BorderFrame.MaximizeMinimizeFrame.MaximizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Disabled")
	self.BorderFrame.MaximizeMinimizeFrame.MaximizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

	self.BorderFrame.MaximizeMinimizeFrame.MinimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Up")
	self.BorderFrame.MaximizeMinimizeFrame.MinimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Down")
	self.BorderFrame.MaximizeMinimizeFrame.MinimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
	self.BorderFrame.MaximizeMinimizeFrame.MinimizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Disabled")

	if not self.BorderFrame.ButtonFrameEdge then
		self.BorderFrame.ButtonFrameEdge = self.BorderFrame.MaximizeMinimizeFrame:CreateTexture(nil, "OVERLAY")
		self.BorderFrame.ButtonFrameEdge:SetAtlas("UI-OuterBorderButtonPatch", true)
		self.BorderFrame.ButtonFrameEdge:ClearAllPoints()
		self.BorderFrame.ButtonFrameEdge:SetPoint("CENTER", self.BorderFrame.MaximizeMinimizeFrame, "LEFT", 6, 0)
	end

	ApplyTitleBg(self)
	ApplyNineSliceNoPortrait(self.BorderFrame)
	WorldMapFrameBg:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-Background-Rock", true, true)
end)

for _, f in next, WorldMapFrame.overlayFrames do
    if WorldMapTrackingOptionsButtonMixin and f.OnLoad == WorldMapTrackingOptionsButtonMixin.OnLoad then
    	f.Border:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")
 	end
    if WorldMapTrackingPinButtonMixin and f.OnLoad == WorldMapTrackingPinButtonMixin.OnLoad then
    	f.Border:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")
    end
    if WorldMapActivityTrackerMixin and f.OnLoad == WorldMapActivityTrackerMixin.OnLoad then
    	hooksecurefunc(f, "Show", function()
			f:Hide()
		end)
    end
end