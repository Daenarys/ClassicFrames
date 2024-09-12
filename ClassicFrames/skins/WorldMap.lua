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
Tracking.Icon:SetPoint("TOPLEFT", 6, -6)
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
Pin.Icon:SetPoint("TOPLEFT", 6, -6)
Pin:HookScript("OnMouseDown", function(self)
	self.Icon:SetPoint("TOPLEFT", 8, -8)
end)
Pin:HookScript("OnMouseUp", function(self)
	self.Icon:SetPoint("TOPLEFT", 6, -6)
end)
MapLegend:Hide()

hooksecurefunc(BaseMapPoiPinMixin, "OnAcquired", function(self)
	if self.Texture then
		-- dungeons & raids
		if (self.Texture:GetAtlas() == "Dungeon") then
			self.Texture:SetSize(22, 22)
			self.Texture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.912109, 0.955078, 0.0449219, 0.0664062)
			self.HighlightTexture:SetSize(22, 22)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.912109, 0.955078, 0.0449219, 0.0664062)
		elseif (self.Texture:GetAtlas() == "Raid") then
			self.Texture:SetSize(22, 22)
			self.Texture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.689453, 0.732422, 0.166016, 0.1875)
			self.HighlightTexture:SetSize(22, 22)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.689453, 0.732422, 0.166016, 0.1875)
		-- taxis
		elseif (self.Texture:GetAtlas() == "TaxiNode_Alliance") then
			self.Texture:SetSize(18, 18)
			self.Texture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.958984, 0.994141, 0.0449219, 0.0625)
			self.HighlightTexture:SetSize(18, 18)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.958984, 0.994141, 0.0449219, 0.0625)
		elseif (self.Texture:GetAtlas() == "TaxiNode_Horde") then
			self.Texture:SetSize(18, 18)
			self.Texture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.474609, 0.509766, 0.177734, 0.195312)
			self.HighlightTexture:SetSize(18, 18)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.474609, 0.509766, 0.177734, 0.195312)
		elseif (self.Texture:GetAtlas() == "TaxiNode_Neutral") then
			self.Texture:SetSize(18, 18)
			self.Texture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.513672, 0.548828, 0.177734, 0.195312)
			self.HighlightTexture:SetSize(18, 18)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.513672, 0.548828, 0.177734, 0.195312)
		elseif (self.Texture:GetAtlas() == "TaxiNode_Undiscovered") then
			self.Texture:SetSize(18, 18)
			self.HighlightTexture:SetSize(18, 18)
		elseif (self.Texture:GetAtlas() == "TaxiNode_Continent_Alliance") then
			self.Texture:SetSize(27, 27)
			self.Texture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.00195312, 0.0546875, 0.608398, 0.634766)
			self.HighlightTexture:SetSize(27, 27)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.00195312, 0.0546875, 0.608398, 0.634766)
		elseif (self.Texture:GetAtlas() == "TaxiNode_Continent_Horde") then
			self.Texture:SetSize(27, 27)
			self.Texture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.00195312, 0.0546875, 0.636719, 0.663086)
			self.HighlightTexture:SetSize(27, 27)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.00195312, 0.0546875, 0.636719, 0.663086)
		elseif (self.Texture:GetAtlas() == "TaxiNode_Continent_Neutral") then
			self.Texture:SetSize(27, 27)
			self.Texture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.00195312, 0.0546875, 0.665039, 0.691406)
			self.HighlightTexture:SetSize(27, 27)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.00195312, 0.0546875, 0.665039, 0.691406)
		end
	end
end)

hooksecurefunc(POIButtonMixin, "UpdateButtonStyle", function(poiButton)
	local style = poiButton:GetStyle()
	local questID = poiButton:GetQuestID()

	if style == POIButtonUtil.Style.BonusObjective then
		poiButton.Display:Hide()
		poiButton:SetNormalTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
		poiButton:GetNormalTexture():SetTexCoord(0.859375, 0.921875, 0.635742, 0.666992)
		poiButton:GetNormalTexture():SetSize(25, 25)
		poiButton:SetPushedTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
		poiButton:GetPushedTexture():SetTexCoord(0.859375, 0.921875, 0.635742, 0.666992)
		poiButton:GetPushedTexture():SetSize(25, 25)
		poiButton.HighlightTexture:SetAlpha(0)
	elseif style == POIButtonUtil.Style.WorldQuest then
		local info = C_QuestLog.GetQuestTagInfo(questID)
		if info then
			poiButton.Display.Icon:SetSize(6, 15)
			poiButton.Display.Icon:SetAtlas("worldquest-questmarker-questbang")
			if info.quality == Enum.WorldQuestQuality.Rare then
				poiButton:SetNormalTexture("Interface\\AddOns\\ClassicFrames\\icons\\WorldQuest")
				poiButton:GetNormalTexture():SetTexCoord(0.955078, 0.994141, 0.134766, 0.173828)
				poiButton:GetNormalTexture():SetSize(18, 18)
				poiButton:SetPushedTexture("Interface\\AddOns\\ClassicFrames\\icons\\WorldQuest")
				poiButton:GetPushedTexture():SetTexCoord(0.955078, 0.994141, 0.177734, 0.216797)
				poiButton:GetPushedTexture():SetSize(18, 18)
			elseif info.quality == Enum.WorldQuestQuality.Epic then
				poiButton:SetNormalTexture("Interface\\AddOns\\ClassicFrames\\icons\\WorldQuest")
				poiButton:GetNormalTexture():SetTexCoord(0.955078, 0.994141, 0.0488281, 0.0878906)
				poiButton:GetNormalTexture():SetSize(18, 18)
				poiButton:SetPushedTexture("Interface\\AddOns\\ClassicFrames\\icons\\WorldQuest")
				poiButton:GetPushedTexture():SetTexCoord(0.955078, 0.994141, 0.0917969, 0.130859)
				poiButton:GetPushedTexture():SetSize(18, 18)
			else
				poiButton:SetNormalTexture("Interface/WorldMap/UI-QuestPoi-NumberIcons")
				poiButton:GetNormalTexture():SetTexCoord(0.875, 1, 0.375, 0.5)
				poiButton:SetPushedTexture("Interface/WorldMap/UI-QuestPoi-NumberIcons")
				poiButton:GetPushedTexture():SetTexCoord(0.750, 0.875, 0.375, 0.5)
			end
			if info.isElite then
				poiButton.Glow:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\WorldQuest")
				poiButton.Glow:SetTexCoord(0.548828, 0.644531, 0.435547, 0.529297)
				poiButton.UnderlayAtlas:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\WorldQuest")
				poiButton.UnderlayAtlas:SetTexCoord(0.0839844, 0.150391, 0.75, 0.816406)
			end
		end
	end
end)