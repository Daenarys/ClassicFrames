if not _G.MinimapCluster then return end

local ldbi = LibStub ~= nil and LibStub:GetLibrary("LibDBIcon-1.0")
if (ldbi ~= nil) then
	for _, v in pairs(ldbi:GetButtonList()) do
		ldbi:Refresh(v)
	end
end

MinimapCluster.BorderTop:Hide()
MinimapCluster.DielFrame:Hide()
MinimapCompassTexture:SetAlpha(0)

MinimapCluster:SetSize(192, 192)

MinimapCluster:CreateTexture("MinimapBorderTop", "ARTWORK")
MinimapBorderTop:SetSize(192, 32)
MinimapBorderTop:SetTexture("Interface\\Minimap\\UI-Minimap-Border")
MinimapBorderTop:SetTexCoord(0.25, 1, 0, 0.125)
MinimapBorderTop:ClearAllPoints()
MinimapBorderTop:SetPoint("TOPRIGHT")

Minimap:SetParent(MinimapCluster)
Minimap:SetSize(140, 140)
Minimap:ClearAllPoints()
Minimap:SetPoint("CENTER", MinimapCluster, "TOP", 9, -92)

MinimapBackdrop:SetSize(192, 192)
MinimapBackdrop:ClearAllPoints()
MinimapBackdrop:SetPoint("CENTER", MinimapCluster, "CENTER", 0, -20)

MinimapBackdrop:CreateTexture("MinimapBorder", "ARTWORK")
MinimapBorder:SetTexture("Interface\\Minimap\\UI-Minimap-Border")
MinimapBorder:SetTexCoord(0.25, 1, 0.125, 0.875)
MinimapBorder:ClearAllPoints()
MinimapBorder:SetAllPoints()

Minimap.ZoomIn:SetParent(MinimapBackdrop)
Minimap.ZoomIn:SetSize(32, 32)
Minimap.ZoomIn:SetNormalTexture("Interface\\Minimap\\UI-Minimap-ZoomInButton-Up")
Minimap.ZoomIn:SetPushedTexture("Interface\\Minimap\\UI-Minimap-ZoomInButton-Down")
Minimap.ZoomIn:SetDisabledTexture("Interface\\Minimap\\UI-Minimap-ZoomInButton-Disabled")
Minimap.ZoomIn:GetDisabledTexture():SetDesaturated(false)
Minimap.ZoomIn:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight", "ADD")
Minimap.ZoomIn:SetHitRectInsets(4, 4, 2, 6)
Minimap.ZoomIn:ClearAllPoints()
Minimap.ZoomIn:SetPoint("CENTER", 71, -20)

Minimap.ZoomOut:SetParent(MinimapBackdrop)
Minimap.ZoomOut:SetSize(32, 32)
Minimap.ZoomOut:SetNormalTexture("Interface\\Minimap\\UI-Minimap-ZoomOutButton-Up")
Minimap.ZoomOut:SetPushedTexture("Interface\\Minimap\\UI-Minimap-ZoomOutButton-Down")
Minimap.ZoomOut:SetDisabledTexture("Interface\\Minimap\\UI-Minimap-ZoomOutButton-Disabled")
Minimap.ZoomOut:GetDisabledTexture():SetDesaturated(false)
Minimap.ZoomOut:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight", "ADD")
Minimap.ZoomOut:SetHitRectInsets(4, 4, 2, 6)
Minimap.ZoomOut:ClearAllPoints()
Minimap.ZoomOut:SetPoint("CENTER", 51, -39)

Minimap.ZoomIn:Show()
Minimap.ZoomOut:Show()

Minimap:HookScript("OnLeave", function(self)
	self.ZoomIn:Show()
	self.ZoomOut:Show()
end)

hooksecurefunc(MinimapCluster, "Layout", function(self)
	self:SetSize(192, 192)
end)

hooksecurefunc(MinimapCluster, "SetEditModeScale", function(self, scale)
	self:SetScale(scale)
end)

GameTimeFrame:SetParent(Minimap)
GameTimeFrame:SetSize(40, 40)
GameTimeFrame:ClearAllPoints()
GameTimeFrame:SetPoint("TOPRIGHT", 20, -17)
GameTimeFrame:SetFrameStrata("LOW")
GameTimeFrame:SetFrameLevel(5)
GameTimeFrame:SetHitRectInsets(6, 0, 5, 10)
GameTimeFrame:SetNormalFontObject("GameFontBlack")
GameTimeFrame:SetFontString(GameTimeFrame:CreateFontString(nil, "BACKGROUND", "GameFontBlack"))
GameTimeFrame:GetFontString():ClearAllPoints()
GameTimeFrame:GetFontString():SetPoint("CENTER", -1, -1)

hooksecurefunc("GameTimeFrame_SetDate", function()
	GameTimeFrame:SetText(C_DateAndTime.GetCurrentCalendarTime().monthDay)
	GameTimeFrame:SetNormalTexture("Interface\\Calendar\\UI-Calendar-Button")
	GameTimeFrame:GetNormalTexture():SetTexCoord(0, 0.390625, 0, 0.78125)
	GameTimeFrame:SetPushedTexture("Interface\\Calendar\\UI-Calendar-Button")
	GameTimeFrame:GetPushedTexture():SetTexCoord(0.5, 0.890625, 0, 0.78125)
	GameTimeFrame:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight", "ADD")
	GameTimeFrame:GetNormalTexture():SetDrawLayer("BACKGROUND")
	GameTimeFrame:GetPushedTexture():SetDrawLayer("BACKGROUND")
	GameTimeFrame:GetFontString():SetDrawLayer("BACKGROUND")
end)

MinimapCluster.Tracking:SetParent(MinimapBackdrop)
MinimapCluster.Tracking:SetSize(32, 32)
MinimapCluster.Tracking:ClearAllPoints()
MinimapCluster.Tracking:SetPoint("TOPLEFT", 9, -45)
MinimapCluster.Tracking.Background:SetSize(25, 25)
MinimapCluster.Tracking.Background:SetTexture("Interface\\Minimap\\UI-Minimap-Background")
MinimapCluster.Tracking.Background:ClearAllPoints()
MinimapCluster.Tracking.Background:SetPoint("TOPLEFT", 2, -4)
MinimapCluster.Tracking.Background:SetAlpha(0.6)
MinimapCluster.Tracking:CreateTexture("MiniMapTrackingIcon", "ARTWORK")
MinimapCluster.Tracking.MiniMapTrackingIcon = MiniMapTrackingIcon
MinimapCluster.Tracking.MiniMapTrackingIcon:SetSize(20, 20)
MinimapCluster.Tracking.MiniMapTrackingIcon:SetTexture("Interface\\Minimap\\Tracking\\None")
MinimapCluster.Tracking.MiniMapTrackingIcon:ClearAllPoints()
MinimapCluster.Tracking.MiniMapTrackingIcon:SetPoint("TOPLEFT", 6, -6)
MinimapCluster.Tracking.MiniMapTrackingIcon:Show()
MinimapCluster.Tracking:CreateTexture("MiniMapTrackingIconOverlay", "OVERLAY")
MinimapCluster.Tracking.MiniMapTrackingIconOverlay = MiniMapTrackingIconOverlay
MinimapCluster.Tracking.MiniMapTrackingIconOverlay:SetSize(20, 20)
MinimapCluster.Tracking.MiniMapTrackingIconOverlay:ClearAllPoints()
MinimapCluster.Tracking.MiniMapTrackingIconOverlay:SetAllPoints(MinimapCluster.Tracking.MiniMapTrackingIcon)
MinimapCluster.Tracking.MiniMapTrackingIconOverlay:SetColorTexture(0, 0, 0, 0.5)
MinimapCluster.Tracking.MiniMapTrackingIconOverlay:Hide()

MinimapCluster.Tracking.Button:SetSize(32, 32)
MinimapCluster.Tracking.Button:ClearAllPoints()
MinimapCluster.Tracking.Button:SetPoint("TOPLEFT")
MinimapCluster.Tracking.Button:GetNormalTexture():SetTexture(nil)
MinimapCluster.Tracking.Button:GetNormalTexture():SetAlpha(0)
MinimapCluster.Tracking.Button:GetNormalTexture():Hide()
MinimapCluster.Tracking.Button:GetPushedTexture():SetTexture(nil)
MinimapCluster.Tracking.Button:GetPushedTexture():SetAlpha(0)
MinimapCluster.Tracking.Button:GetPushedTexture():Hide()
MinimapCluster.Tracking.Button:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight", "ADD")
MinimapCluster.Tracking.Button:CreateTexture("MiniMapTrackingButtonBorder", "BORDER")
MinimapCluster.Tracking.ButtonBorder = MiniMapTrackingButtonBorder
MinimapCluster.Tracking.ButtonBorder:SetSize(54, 54)
MinimapCluster.Tracking.ButtonBorder:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")
MinimapCluster.Tracking.ButtonBorder:ClearAllPoints()
MinimapCluster.Tracking.ButtonBorder:SetPoint("TOPLEFT")

MinimapCluster.Tracking.Button:HookScript("OnMouseDown", function()
	MinimapCluster.Tracking.MiniMapTrackingIcon:SetPoint("TOPLEFT", MinimapCluster.Tracking, "TOPLEFT", 8, -8)
	MinimapCluster.Tracking.MiniMapTrackingIconOverlay:Show()
	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
end)

MinimapCluster.Tracking.Button:HookScript("OnMouseUp", function()
	MinimapCluster.Tracking.MiniMapTrackingIcon:SetPoint("TOPLEFT", MinimapCluster.Tracking, "TOPLEFT", 6, -6)
	MinimapCluster.Tracking.MiniMapTrackingIconOverlay:Hide()
end)

MinimapCluster.IndicatorFrame:SetParent(MinimapCluster)
MinimapCluster.IndicatorFrame:SetSize(33, 33)
MinimapCluster.IndicatorFrame:SetFrameStrata("LOW")
MinimapCluster.IndicatorFrame:SetFrameLevel(4)

MinimapCluster.IndicatorFrame.MailFrame:SetSize(33, 33)
MinimapCluster.IndicatorFrame.MailFrame:ClearAllPoints()
MinimapCluster.IndicatorFrame.MailFrame:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", 21, -53)
MinimapCluster.IndicatorFrame.MailFrame:SetFrameStrata("LOW")
MinimapCluster.IndicatorFrame.MailFrame:SetFrameLevel(6)

MiniMapMailIcon:SetSize(18, 18)
MiniMapMailIcon:SetTexture("Interface\\Icons\\INV_Letter_15")
MiniMapMailIcon:SetDrawLayer("ARTWORK", 0)
MiniMapMailIcon:ClearAllPoints()
MiniMapMailIcon:SetPoint("TOPLEFT", MinimapCluster.IndicatorFrame.MailFrame, "TOPLEFT", 7, -6)

MinimapCluster.IndicatorFrame.MailFrame:CreateTexture("MiniMapMailBorder", "OVERLAY")
MiniMapMailBorder:SetSize(52, 52)
MiniMapMailBorder:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")
MiniMapMailBorder:ClearAllPoints()
MiniMapMailBorder:SetPoint("TOPLEFT")

hooksecurefunc(MinimapCluster.IndicatorFrame.MailFrame, "ResetMailIcon", function(self)
	self.MailIcon:SetShown(true)
end)

hooksecurefunc(MinimapCluster.IndicatorFrame.MailFrame, "TryPlayMailNotification", function(self)
	self.NewMailAnim:SetPlaying(false)
	self.MailReminderAnim:SetPlaying(false)
	self.MailIcon:SetShown(true)
end)

MinimapCluster.InstanceDifficulty:Hide()

local MinimapZoneTextButton = CreateFrame("Button", nil, MinimapCluster)
MinimapZoneTextButton:SetSize(150, 12)
MinimapZoneTextButton:SetPoint("CENTER", 7, 83)

MinimapZoneTextButton:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	local pvpType, isSubZonePvP, factionName = C_PvP.GetZonePVPInfo()
	local zoneName = GetZoneText()
	local subzoneName = GetSubZoneText()
	if ( subzoneName == zoneName ) then
		subzoneName = ""
	end
	GameTooltip:AddLine( zoneName, 1.0, 1.0, 1.0 )
	if ( pvpType == "sanctuary" ) then
		GameTooltip:AddLine( subzoneName, 0.41, 0.8, 0.94 )
		GameTooltip:AddLine(SANCTUARY_TERRITORY, 0.41, 0.8, 0.94)
	elseif ( pvpType == "arena" ) then
		GameTooltip:AddLine( subzoneName, 1.0, 0.1, 0.1 )
		GameTooltip:AddLine(FREE_FOR_ALL_TERRITORY, 1.0, 0.1, 0.1)
	elseif ( pvpType == "friendly" ) then
		if (factionName and factionName ~= "") then
			GameTooltip:AddLine( subzoneName, 0.1, 1.0, 0.1 )
			GameTooltip:AddLine(format(FACTION_CONTROLLED_TERRITORY, factionName), 0.1, 1.0, 0.1)
		end
	elseif ( pvpType == "hostile" ) then
		if (factionName and factionName ~= "") then
			GameTooltip:AddLine( subzoneName, 1.0, 0.1, 0.1 )
			GameTooltip:AddLine(format(FACTION_CONTROLLED_TERRITORY, factionName), 1.0, 0.1, 0.1)
		end
	elseif ( pvpType == "contested" ) then
		GameTooltip:AddLine( subzoneName, 1.0, 0.7, 0.0 )
		GameTooltip:AddLine(CONTESTED_TERRITORY, 1.0, 0.7, 0.0)
	elseif ( pvpType == "combat" ) then
		GameTooltip:AddLine( subzoneName, 1.0, 0.1, 0.1 )
		GameTooltip:AddLine(COMBAT_ZONE, 1.0, 0.1, 0.1)
	else
		GameTooltip:AddLine( subzoneName, NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b )
	end
	GameTooltip:Show()
end)

MinimapZoneTextButton:SetScript("OnLeave", GameTooltip_Hide)

MinimapZoneText:SetParent(MinimapZoneTextButton)
MinimapZoneText:SetSize(150, 12)
MinimapZoneText:ClearAllPoints()
MinimapZoneText:SetPoint("CENTER", MinimapZoneTextButton, "TOP", 0, -5)
MinimapZoneText:SetJustifyH("CENTER")

MiniMapWorldMapButton = MinimapCluster.ZoneTextButton
MiniMapWorldMapButton:SetParent(MinimapBackdrop)
MiniMapWorldMapButton:SetSize(33, 33)
MiniMapWorldMapButton:ClearAllPoints()
MiniMapWorldMapButton:SetPoint("TOPRIGHT", -21, -1)

if (MiniMapWorldMapButtonIcon == nil) then
	MiniMapWorldMapButton:CreateTexture("MiniMapWorldMapButtonIcon", "BORDER")
	MiniMapWorldMapButtonIcon:SetSize(20, 20)
	MiniMapWorldMapButtonIcon:SetTexture("Interface\\WorldMap\\UI-World-Icon")
	MiniMapWorldMapButtonIcon:ClearAllPoints()
	MiniMapWorldMapButtonIcon:SetPoint("CENTER", -2, 2)
end

if (MiniMapWorldMapButtonBorder == nil) then
	MiniMapWorldMapButton:CreateTexture("MiniMapWorldMapButtonBorder", "OVERLAY")
	MiniMapWorldMapButtonBorder:SetSize(52, 52)
	MiniMapWorldMapButtonBorder:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")
	MiniMapWorldMapButtonBorder:ClearAllPoints()
	MiniMapWorldMapButtonBorder:SetPoint("TOPLEFT")
end

MiniMapWorldMapButton:SetScript("OnEnter", function(self)
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	GameTooltip:SetText(self.tooltipText, 1, 1, 1)
end)

MiniMapWorldMapButton:SetScript("OnLeave", GameTooltip_Hide)

Minimap:HookScript("OnEvent", function(self, event, ...)
	if event == "PLAYER_ENTERING_WORLD" then
		TimeManagerClockButton:SetParent(self)
		TimeManagerClockButton:SetSize(60, 28)
		TimeManagerClockButton:ClearAllPoints()
		TimeManagerClockButton:SetPoint("CENTER", 0, -68)
		TimeManagerClockButton:SetFrameStrata("LOW")
		TimeManagerClockButton:SetFrameLevel(5)

		if (TimeManagerClockButtonBackground == nil) then
			TimeManagerClockButtonBackground = TimeManagerClockButton:CreateTexture("TimeManagerClockButtonBackground", "BORDER")
			TimeManagerClockButtonBackground:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\ClockBackground")
			TimeManagerClockButtonBackground:SetTexCoord(0.015625, 0.8125, 0.015625, 0.390625)
			TimeManagerClockButtonBackground:ClearAllPoints()
			TimeManagerClockButtonBackground:SetAllPoints()
		end

		TimeManagerClockTicker:ClearAllPoints()
		TimeManagerClockTicker:SetPoint("CENTER", 1, -1)
	end
end)

--queuestatusbutton
local function MinimapButton_OnMouseDown(self, button)
	if ( self.isDown ) then
		return
	end
	local button = _G[self:GetName().."Icon"]
	local point, relativeTo, relativePoint, offsetX, offsetY = button:GetPoint()
	button:SetPoint(point, relativeTo, relativePoint, offsetX+1, offsetY-1)
	self.isDown = 1
end

local function MinimapButton_OnMouseUp(self)
	if ( not self.isDown ) then
		return
	end
	local button = _G[self:GetName().."Icon"]
	local point, relativeTo, relativePoint, offsetX, offsetY = button:GetPoint()
	button:SetPoint(point, relativeTo, relativePoint, offsetX-1, offsetY+1)
	self.isDown = nil
end

hooksecurefunc(QueueStatusButton, "UpdateDefaultAnchor", function(self)
	self:SetParent(MinimapBackdrop)
	self:SetScale(1)
	self:SetSize(33, 33)
	self:ClearAllPoints()
	self:SetPoint("TOPLEFT", 22, -100)
	self:SetFrameLevel(6)
end)

if (QueueStatusButtonBorder == nil) then
	QueueStatusButton:CreateTexture("QueueStatusButtonBorder")
	QueueStatusButtonBorder:SetSize(52, 52)
	QueueStatusButtonBorder:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")
	QueueStatusButtonBorder:ClearAllPoints()
	QueueStatusButtonBorder:SetPoint("TOPLEFT", 1, -1)
end

local LFG_EYE_TEXTURES = { }
LFG_EYE_TEXTURES["default"] = { file = "Interface\\LFGFrame\\LFG-Eye", width = 512, height = 256, frames = 29, iconSize = 64, delay = 0.1 }
LFG_EYE_TEXTURES["raid"] = { file = "Interface\\LFGFrame\\LFR-Anim", width = 256, height = 256, frames = 16, iconSize = 64, delay = 0.05 }
LFG_EYE_TEXTURES["unknown"] = { file = "Interface\\LFGFrame\\WaitAnim", width = 128, height = 128, frames = 4, iconSize = 64, delay = 0.25 }

local function EyeTemplate_OnUpdate(self, elapsed)
	local textureInfo = LFG_EYE_TEXTURES[self.queueType or "default"]
	TextureUtil.AnimateTexCoords(self.texture, textureInfo.width, textureInfo.height, textureInfo.iconSize, textureInfo.iconSize, textureInfo.frames, elapsed, textureInfo.delay)
end

local function EyeTemplate_StartAnimating(eye)
	eye:SetScript("OnUpdate", EyeTemplate_OnUpdate)
end

local function EyeTemplate_StopAnimating(eye)
	eye:SetScript("OnUpdate", nil)
	if ( eye.texture.frame ) then
		eye.texture.frame = 1 --To start the animation over.
	end
	local textureInfo = LFG_EYE_TEXTURES[eye.queueType or "default"]
	eye.texture:SetTexCoord(0, textureInfo.iconSize / textureInfo.width, 0, textureInfo.iconSize / textureInfo.height)
end

local function QueueStatusButton_OnUpdate(self)
	if ( self:IsShown() ) then
		self.Eye.texture:Show()
	else
		self.Eye.texture:Hide()
	end

	self.Eye.texture:SetTexture("Interface\\LFGFrame\\LFG-Eye")
	self.Eye.texture:ClearAllPoints()
	self.Eye.texture:SetAllPoints()

	self.Highlight:SetAtlas("groupfinder-eye-highlight", true)

	self:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight", "ADD")

	self.Eye.EyeInitial:Hide()
	self.Eye.EyeSearchingLoop:Hide()
	self.Eye.EyeMouseOver:Hide()
	self.Eye.EyeFoundInitial:Hide()
	self.Eye.EyeFoundLoop:Hide()
	self.Eye.GlowBackLoop:Hide()
	self.Eye.EyePokeInitial:Hide()
	self.Eye.EyePokeLoop:Hide()
	self.Eye.EyePokeEnd:Hide()
end

QueueStatusButton:HookScript("OnUpdate", QueueStatusButton_OnUpdate)
QueueStatusButton:HookScript("OnHide", function(self)
	if (self.isDown) then
		MinimapButton_OnMouseUp(self)
	end
end)
QueueStatusButton:HookScript("OnMouseDown", MinimapButton_OnMouseDown)
QueueStatusButton:HookScript("OnMouseUp", MinimapButton_OnMouseUp)

--queuestatusframe
hooksecurefunc(QueueStatusFrame, "Update", function(self)
	local animateEye

	--Try each LFG type
	for i=1, NUM_LE_LFG_CATEGORYS do
		local mode, submode = GetLFGMode(i)
		if ( mode and submode ~= "noteleport" ) then
			if ( mode == "queued" ) then
				animateEye = true
			end
		end
	end

	--Try LFGList entries
	local isActive = C_LFGList.HasActiveEntryInfo()
	if ( isActive ) then
		animateEye = true
	end

	--Try LFGList applications
	local apps = C_LFGList.GetApplications()
	for i=1, #apps do
		local _, appStatus = C_LFGList.GetApplicationInfo(apps[i])
		if ( appStatus == "applied" or appStatus == "invited" ) then
			if ( appStatus == "applied" ) then
				animateEye = true
			end
		end
	end

	--Try all PvP queues
	for i=1, GetMaxBattlefieldID() do
		local status, mapName, teamSize, registeredMatch, suspend = GetBattlefieldStatus(i)
		if ( status and status ~= "none" ) then
			if ( status == "queued" and not suspend ) then
				animateEye = true
			end
		end
	end

	--Try all World PvP queues
	for i=1, MAX_WORLD_PVP_QUEUES do
		local status, mapName, queueID = GetWorldPVPQueueStatus(i)
		if ( status and status ~= "none" ) then
			if ( status == "queued" ) then
				animateEye = true
			end
		end
	end

	if ( animateEye ) then
		EyeTemplate_StartAnimating(QueueStatusButton.Eye)
	else
		EyeTemplate_StopAnimating(QueueStatusButton.Eye)
	end
end)

hooksecurefunc(AddonCompartmentFrame, "UpdateDisplay", function(self)
	self:SetShown(false)
end)