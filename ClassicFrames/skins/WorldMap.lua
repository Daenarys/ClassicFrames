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

local Dropdown, Tracking, Pin = unpack(WorldMapFrame.overlayFrames)
ApplyDropDown(Dropdown)
Dropdown:SetWidth(145)
Dropdown:SetPoint("TOPLEFT", WorldMapFrame.ScrollContainer, "TOPLEFT", 3, 1)
Dropdown.Text:SetJustifyH("RIGHT")
Dropdown.Text:SetPoint("TOPLEFT", 9, -7)
Pin:Hide()