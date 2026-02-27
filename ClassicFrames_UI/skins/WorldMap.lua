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

	if (self.BorderFrame.ButtonFrameEdge == nil) then
		self.BorderFrame.ButtonFrameEdge = self.BorderFrame.MaximizeMinimizeFrame:CreateTexture(nil, "OVERLAY")
		self.BorderFrame.ButtonFrameEdge:SetAtlas("UI-OuterBorderButtonPatch", true)
		self.BorderFrame.ButtonFrameEdge:ClearAllPoints()
		self.BorderFrame.ButtonFrameEdge:SetPoint("CENTER", self.BorderFrame.MaximizeMinimizeFrame, "LEFT", 6, 0)
	end

	self.BorderFrame.Tutorial.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

	WorldMapFramePortrait:SetSize(61, 61)
	WorldMapFramePortrait:ClearAllPoints()
	WorldMapFramePortrait:SetPoint("TOPLEFT", -6, 8)

	self.BorderFrame.TitleContainer:ClearAllPoints()
	self.BorderFrame.TitleContainer:SetPoint("TOPLEFT", self, "TOPLEFT", 58, 0)
	self.BorderFrame.TitleContainer:SetPoint("TOPRIGHT", self, "TOPRIGHT", -58, 0)

	ApplyTitleBg(self)
	ApplyNineSlicePortrait(self.BorderFrame)
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

	if (self.BorderFrame.ButtonFrameEdge == nil) then
		self.BorderFrame.ButtonFrameEdge = self.BorderFrame.MaximizeMinimizeFrame:CreateTexture(nil, "OVERLAY")
		self.BorderFrame.ButtonFrameEdge:SetAtlas("UI-OuterBorderButtonPatch", true)
		self.BorderFrame.ButtonFrameEdge:ClearAllPoints()
		self.BorderFrame.ButtonFrameEdge:SetPoint("CENTER", self.BorderFrame.MaximizeMinimizeFrame, "LEFT", 6, 0)
	end

	ApplyTitleBgNoPortrait(self)
	ApplyNineSliceNoPortrait(self.BorderFrame)
end)

for _, f in next, WorldMapFrame.overlayFrames do
	if WorldMapActivityTrackerMixin and f.OnLoad == WorldMapActivityTrackerMixin.OnLoad then
		hooksecurefunc(f, "Show", function()
			f:Hide()
		end)
	end
end

local Dropdown, Tracking, Pin = unpack(WorldMapFrame.overlayFrames)
ApplyDropDown(Dropdown)
Dropdown:SetWidth(145)
Dropdown:SetPoint("TOPLEFT", WorldMapFrame.ScrollContainer, "TOPLEFT", 3, 1)
Dropdown.Text:SetJustifyH("RIGHT")
Dropdown.Text:SetPoint("TOPLEFT", 9, -7)
Tracking.Border:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")
Tracking.Icon:SetTexture("Interface\\Minimap\\Tracking\\None")
Tracking.Icon:SetPoint("TOPLEFT", 6, -6)
if (Tracking.IconOverlay == nil) then
	Tracking.IconOverlay = Tracking:CreateTexture(nil, "OVERLAY")
	Tracking.IconOverlay:SetPoint("TOPLEFT", Tracking.Icon)
	Tracking.IconOverlay:SetPoint("BOTTOMRIGHT", Tracking.Icon)
	Tracking.IconOverlay:SetColorTexture(0, 0, 0, 0.5)
	Tracking.IconOverlay:Hide()
end
hooksecurefunc(Tracking, "RefreshFilterCounter", function(self)
	self.FilterCounter:Hide()
	self.FilterCounterBanner:Hide()
end)
Tracking:HookScript("OnMouseDown", function(self)
	self.Icon:SetTexture("Interface\\Minimap\\Tracking\\None")
	self.Icon:SetPoint("TOPLEFT", 8, -8)
	self.IconOverlay:Show()
end)
Tracking:HookScript("OnMouseUp", function(self)
	self.Icon:SetTexture("Interface\\Minimap\\Tracking\\None")
	self.Icon:SetPoint("TOPLEFT", 6, -6)
	self.IconOverlay:Hide()
end)
Pin:SetPoint("TOPRIGHT", WorldMapFrame.ScrollContainer, "TOPRIGHT", -36, -2)
Pin.Border:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")
Pin.Icon:SetPoint("TOPLEFT", 6, -6)
Pin:HookScript("OnMouseDown", function(self)
	self.Icon:SetPoint("TOPLEFT", 8, -8)
end)
Pin:HookScript("OnMouseUp", function(self)
	self.Icon:SetPoint("TOPLEFT", 6, -6)
end)