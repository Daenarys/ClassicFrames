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

hooksecurefunc(POIButtonMixin, "UpdateButtonStyle", function(poiButton)
	local style = poiButton:GetStyle()
	local questID = poiButton:GetQuestID()

	if poiButton.TimeLowFrame then
		poiButton.TimeLowFrame:SetSize(18, 18)
		poiButton.TimeLowFrame:SetPoint("CENTER", -8, -7)
	end

	if poiButton.Glow then
		poiButton.Glow:SetSize(45, 45)
		poiButton.Glow:SetTexture("Interface\\WorldMap\\UI-QuestPoi-IconGlow")
	end

	if style == POIButtonUtil.Style.BonusObjective then
		poiButton.Display:SetAlpha(0)
		poiButton.NormalTexture:SetSize(24, 24)
		poiButton.NormalTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
		poiButton.NormalTexture:SetTexCoord(0.807617, 0.838867, 0.331055, 0.362305)
		poiButton.PushedTexture:SetSize(24, 24)
		poiButton.PushedTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
		poiButton.PushedTexture:SetTexCoord(0.807617, 0.838867, 0.331055, 0.362305)
		poiButton.HighlightTexture:SetAlpha(0)
	elseif style == POIButtonUtil.Style.QuestThreat then
		if poiButton:IsSelected() then
			poiButton.NormalTexture:SetAtlas("UI-QuestPoi-QuestNumber-SuperTracked")
			poiButton.PushedTexture:SetAtlas("UI-QuestPoi-QuestNumber-Pressed-SuperTracked")
		else
			poiButton.NormalTexture:SetAtlas("UI-QuestPoi-QuestNumber")
			poiButton.PushedTexture:SetAtlas("UI-QuestPoi-QuestNumber-Pressed")
		end
		poiButton.HighlightTexture:SetAtlas("UI-QuestPoi-InnerGlow")
	elseif style == POIButtonUtil.Style.WorldQuest then
		local info = C_QuestLog.GetQuestTagInfo(questID)
		if info then
			if (poiButton.Display.Icon:GetAtlas() == "Worldquest-icon" or poiButton.Display.Icon:GetAtlas() == "worldquest-icon-boss") then
				poiButton.Display.Icon:SetSize(6, 15)
				poiButton.Display.Icon:SetAtlas("worldquest-questmarker-questbang")
			elseif (poiButton.Display.Icon:GetAtlas() == "worldquest-icon-petbattle") then
				poiButton.Display.Icon:SetSize(11, 9)
			elseif (poiButton.Display.Icon:GetAtlas() == "worldquest-icon-race") then
				poiButton.Display.Icon:SetSize(17, 14)
			end
		end
	elseif style == POIButtonUtil.Style.AreaPOI then
		poiButton.Display:SetAlpha(0)
		poiButton.NormalTexture:SetSize(25, 24)
		poiButton.NormalTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
		poiButton.NormalTexture:SetTexCoord(0.0654297, 0.12793, 0.643555, 0.706055)
		poiButton.PushedTexture:SetSize(25, 24)
		poiButton.PushedTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
		poiButton.PushedTexture:SetTexCoord(0.0654297, 0.12793, 0.643555, 0.706055)
	end
end)

hooksecurefunc(BaseMapPoiPinMixin, "OnAcquired", function(self)
	if self.Texture then
		-- caves
		if (self.Texture:GetAtlas() == "CaveUnderground-Down") then
			self.Texture:SetSize(25, 25)
			self.Texture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.000976562, 0.0634766, 0.12793, 0.19043)
			self.HighlightTexture:SetSize(25, 25)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.000976562, 0.0634766, 0.12793, 0.19043)
		elseif (self.Texture:GetAtlas() == "CaveUnderground-Up") then
			self.Texture:SetSize(25, 25)
			self.Texture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.000976562, 0.0634766, 0.192383, 0.254883)
			self.HighlightTexture:SetSize(25, 25)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.000976562, 0.0634766, 0.192383, 0.254883)
		-- dungeons & raids
		elseif (self.Texture:GetAtlas() == "Dungeon") then
			self.Texture:SetSize(22, 22)
			self.Texture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.508789, 0.530273, 0.104492, 0.125977)
			self.HighlightTexture:SetSize(22, 22)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.508789, 0.530273, 0.104492, 0.125977)
		elseif (self.Texture:GetAtlas() == "Raid") then
			self.Texture:SetSize(22, 22)
			self.Texture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.532227, 0.553711, 0.104492, 0.125977)
			self.HighlightTexture:SetSize(22, 22)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.532227, 0.553711, 0.104492, 0.125977)
		-- vignettes
		elseif (self.Texture:GetAtlas() == "VignetteEvent") then
			self.Texture:SetSize(32, 32)
			self.Texture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.608398, 0.639648, 0.397461, 0.428711)
			self.HighlightTexture:SetSize(32, 32)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.608398, 0.639648, 0.397461, 0.428711)
		elseif (self.Texture:GetAtlas() == "VignetteEventElite") then
			self.Texture:SetSize(32, 32)
			self.Texture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.641602, 0.672852, 0.397461, 0.428711)
			self.HighlightTexture:SetSize(32, 32)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.641602, 0.672852, 0.397461, 0.428711)
		elseif (self.Texture:GetAtlas() == "VignetteKill") then
			self.Texture:SetSize(32, 32)
			self.Texture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.674805, 0.706055, 0.397461, 0.428711)
			self.HighlightTexture:SetSize(32, 32)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.674805, 0.706055, 0.397461, 0.428711)
		elseif (self.Texture:GetAtlas() == "VignetteKillElite") then
			self.Texture:SetSize(32, 32)
			self.Texture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.258789, 0.321289, 0.12793, 0.19043)
			self.HighlightTexture:SetSize(32, 32)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.258789, 0.321289, 0.12793, 0.19043)
		elseif (self.Texture:GetAtlas() == "vignettekillboss") then
			self.Texture:SetAtlas("legioninvasion-map-icon-portal", true)
			self.HighlightTexture:SetAtlas("legioninvasion-map-icon-portal", true)
		end
	end
end)

hooksecurefunc(VignettePinMixin, "OnAcquired", function(self)
	if self.Texture then
		if (self.Texture:GetAtlas() == "VignetteEvent") then
			self.Texture:SetSize(32, 32)
			self.Texture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.608398, 0.639648, 0.397461, 0.428711)
			self.HighlightTexture:SetSize(32, 32)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.608398, 0.639648, 0.397461, 0.428711)
		elseif (self.Texture:GetAtlas() == "VignetteEventElite") then
			self.Texture:SetSize(32, 32)
			self.Texture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.641602, 0.672852, 0.397461, 0.428711)
			self.HighlightTexture:SetSize(32, 32)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.641602, 0.672852, 0.397461, 0.428711)
		elseif (self.Texture:GetAtlas() == "VignetteKill") then
			self.Texture:SetSize(32, 32)
			self.Texture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.674805, 0.706055, 0.397461, 0.428711)
			self.HighlightTexture:SetSize(32, 32)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.674805, 0.706055, 0.397461, 0.428711)
		elseif (self.Texture:GetAtlas() == "VignetteKillElite") then
			self.Texture:SetSize(32, 32)
			self.Texture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.Texture:SetTexCoord(0.258789, 0.321289, 0.12793, 0.19043)
			self.HighlightTexture:SetSize(32, 32)
			self.HighlightTexture:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ObjectIconsAtlas")
			self.HighlightTexture:SetTexCoord(0.258789, 0.321289, 0.12793, 0.19043)
		elseif (self.Texture:GetAtlas() == "vignettekillboss") then
			self.Texture:SetAtlas("legioninvasion-map-icon-portal", true)
			self.HighlightTexture:SetAtlas("legioninvasion-map-icon-portal", true)
		end
	end
end)