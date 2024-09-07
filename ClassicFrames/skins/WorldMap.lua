if not _G.WorldMapFrame then return end

hooksecurefunc(WorldMapFrame, "Minimize", function(self)
	ApplyCloseButton(WorldMapFrameCloseButton)

	self.BorderFrame.MaximizeMinimizeFrame:SetSize(32, 32)
	self.BorderFrame.MaximizeMinimizeFrame:ClearAllPoints()
	self.BorderFrame.MaximizeMinimizeFrame:SetPoint("RIGHT", WorldMapFrameCloseButton, "LEFT", 8.5, 0)
	self.BorderFrame.MaximizeMinimizeFrame:SetFrameLevel(2)

	self.BorderFrame.MaximizeMinimizeFrame.MaximizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Up")
	self.BorderFrame.MaximizeMinimizeFrame.MaximizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Down")
	self.BorderFrame.MaximizeMinimizeFrame.MaximizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Disabled")
	self.BorderFrame.MaximizeMinimizeFrame.MaximizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

	self.BorderFrame.MaximizeMinimizeFrame.MinimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Up")
	self.BorderFrame.MaximizeMinimizeFrame.MinimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Down")
	self.BorderFrame.MaximizeMinimizeFrame.MinimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
	self.BorderFrame.MaximizeMinimizeFrame.MinimizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Disabled")

	self.BorderFrame.Tutorial.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

	self.BorderFrame.PortraitContainer.CircleMask:Hide()

	WorldMapFramePortrait:SetSize(61, 61)
	WorldMapFramePortrait:ClearAllPoints()
	WorldMapFramePortrait:SetPoint("TOPLEFT", -6, 8)

	self.BorderFrame.TitleContainer:ClearAllPoints()
	self.BorderFrame.TitleContainer:SetPoint("TOPLEFT", self, "TOPLEFT", 58, 0)
	self.BorderFrame.TitleContainer:SetPoint("TOPRIGHT", self, "TOPRIGHT", -58, 0)

	ApplyTitleBg(self)
	ApplyNineSlicePortraitMinimizable(self.BorderFrame)
end)

hooksecurefunc(WorldMapFrame, "Maximize", function(self)
	ApplyCloseButton(WorldMapFrameCloseButton)

	self.BorderFrame.MaximizeMinimizeFrame:SetSize(32, 32)
	self.BorderFrame.MaximizeMinimizeFrame:ClearAllPoints()
	self.BorderFrame.MaximizeMinimizeFrame:SetPoint("RIGHT", WorldMapFrameCloseButton, "LEFT", 8.5, 0)
	self.BorderFrame.MaximizeMinimizeFrame:SetFrameLevel(2)

	self.BorderFrame.MaximizeMinimizeFrame.MaximizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Up")
	self.BorderFrame.MaximizeMinimizeFrame.MaximizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Down")
	self.BorderFrame.MaximizeMinimizeFrame.MaximizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Disabled")
	self.BorderFrame.MaximizeMinimizeFrame.MaximizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

	self.BorderFrame.MaximizeMinimizeFrame.MinimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Up")
	self.BorderFrame.MaximizeMinimizeFrame.MinimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Down")
	self.BorderFrame.MaximizeMinimizeFrame.MinimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
	self.BorderFrame.MaximizeMinimizeFrame.MinimizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Disabled")

	ApplyTitleBg(self)
	ApplyNineSliceNoPortraitMinimizable(self.BorderFrame)
end)

for _, f in next, WorldMapFrame.overlayFrames do
	if WorldMapActivityTrackerMixin and f.OnLoad == WorldMapActivityTrackerMixin.OnLoad then
		hooksecurefunc(f, "Show", function()
			f:Hide()
		end)
	end
end

local Dropdown, Tracking, Pin, MapLegend = unpack(WorldMapFrame.overlayFrames)
ApplyDropDown(Dropdown)

Tracking.Border:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")
Tracking.Icon:SetTexture("Interface\\Minimap\\Tracking\\None")
if (Tracking.IconOverlay == nil) then
	Tracking.IconOverlay = Tracking:CreateTexture(nil, "OVERLAY")
	Tracking.IconOverlay:SetPoint("TOPLEFT", Tracking.Icon)
	Tracking.IconOverlay:SetPoint("BOTTOMRIGHT", Tracking.Icon)
	Tracking.IconOverlay:SetColorTexture(0, 0, 0, 0.5)
	Tracking.IconOverlay:Hide()
end
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

Pin.Border:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

MapLegend:Hide()

hooksecurefunc(POIButtonMixin, "UpdateButtonStyle", function(poiButton)
	local style = poiButton:GetStyle()
	local questID = poiButton:GetQuestID()

	if style == POIButtonUtil.Style.WorldQuest then
		local info = C_QuestLog.GetQuestTagInfo(questID)
		if info then
			poiButton:SetSize(20, 20)
			poiButton.Display.Icon:SetSize(6, 15)
			poiButton.Display.Icon:SetAtlas("worldquest-questmarker-questbang")
			if info.isElite then
				poiButton:SetNormalAtlas("worldquest-questmarker-rare")
				poiButton:GetNormalTexture():SetSize(18, 18)
				poiButton:SetPushedAtlas("worldquest-questmarker-rare-down")
				poiButton:GetPushedTexture():SetSize(18, 18)
			else
				poiButton:SetNormalTexture("Interface/WorldMap/UI-QuestPoi-NumberIcons")
				poiButton:GetNormalTexture():SetTexCoord(0.875, 1, 0.375, 0.5)
				poiButton:SetPushedTexture("Interface/WorldMap/UI-QuestPoi-NumberIcons")
				poiButton:GetPushedTexture():SetTexCoord(0.750, 0.875, 0.375, 0.5)
			end
		end
	end
end)