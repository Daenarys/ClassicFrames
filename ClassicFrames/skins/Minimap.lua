if not _G.MinimapCluster then return end

local ldbi = LibStub ~= nil and LibStub:GetLibrary("LibDBIcon-1.0")
if (ldbi ~= nil) then
	for _, v in pairs(ldbi:GetButtonList()) do
		ldbi:Refresh(v)
	end
end

MinimapCluster.BorderTop:Hide()
MinimapCluster.DielFrame:Hide()

MinimapCluster:SetSize(192, 192)

MinimapCluster:CreateTexture("MinimapBorderTop", "ARTWORK")
MinimapBorderTop:SetSize(192, 32)
MinimapBorderTop:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-Minimap-Border")
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
MinimapBorder:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-Minimap-Border")
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
Minimap.ZoomIn:SetPoint("CENTER", 77, -13)

Minimap.ZoomOut:SetParent(MinimapBackdrop)
Minimap.ZoomOut:SetSize(32, 32)
Minimap.ZoomOut:SetNormalTexture("Interface\\Minimap\\UI-Minimap-ZoomOutButton-Up")
Minimap.ZoomOut:SetPushedTexture("Interface\\Minimap\\UI-Minimap-ZoomOutButton-Down")
Minimap.ZoomOut:SetDisabledTexture("Interface\\Minimap\\UI-Minimap-ZoomOutButton-Disabled")
Minimap.ZoomOut:GetDisabledTexture():SetDesaturated(false)
Minimap.ZoomOut:SetHighlightTexture("Interface\\Minimap\\UI-Minimap-ZoomButton-Highlight", "ADD")
Minimap.ZoomOut:SetHitRectInsets(4, 4, 2, 6)
Minimap.ZoomOut:ClearAllPoints()
Minimap.ZoomOut:SetPoint("CENTER", 51, -41)

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

hooksecurefunc(MinimapCluster, "SetRotateMinimap", function(self)
	MinimapBackdrop:SetSize(192, 192)
	MinimapCompassTexture:SetAlpha(0)
	MinimapCompassTextureUnderlay:SetAlpha(0)
end)

MinimapCluster.Tracking:SetParent(MinimapBackdrop)
MinimapCluster.Tracking:SetSize(32, 32)
MinimapCluster.Tracking:ClearAllPoints()
MinimapCluster.Tracking:SetPoint("TOPLEFT", 13, -40)
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
MinimapCluster.Tracking.MiniMapTrackingIconOverlay:ClearAllPoints()
MinimapCluster.Tracking.MiniMapTrackingIconOverlay:SetAllPoints(MinimapCluster.Tracking.MiniMapTrackingIcon)
MinimapCluster.Tracking.MiniMapTrackingIconOverlay:SetColorTexture(0, 0, 0, 0.5)
MinimapCluster.Tracking.MiniMapTrackingIconOverlay:Hide()

MinimapCluster.Tracking.Button:SetSize(32, 32)
MinimapCluster.Tracking.Button:ClearAllPoints()
MinimapCluster.Tracking.Button:SetPoint("TOPLEFT")
MinimapCluster.Tracking.Button:GetNormalTexture():SetAlpha(0)
MinimapCluster.Tracking.Button:GetPushedTexture():SetAlpha(0)
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
MinimapCluster.IndicatorFrame.MailFrame:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", 21, -38)

MiniMapMailIcon:SetSize(18, 18)
MiniMapMailIcon:SetTexture("Interface\\Icons\\INV_Letter_15")
MiniMapMailIcon:SetDrawLayer("ARTWORK")
MiniMapMailIcon:ClearAllPoints()
MiniMapMailIcon:SetPoint("TOPLEFT", 7, -6)

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

local MinimapZoneTextButton = CreateFrame("Button", nil, MinimapCluster)
MinimapZoneTextButton:SetSize(128, 12)
MinimapZoneTextButton:SetPoint("CENTER", -3, 83)

MinimapZoneText:SetParent(MinimapZoneTextButton)
MinimapZoneText:SetSize(128, 12)
MinimapZoneText:ClearAllPoints()
MinimapZoneText:SetPoint("TOP")
MinimapZoneText:SetJustifyH("CENTER")

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

MinimapToggleButton = MinimapCluster.ZoneTextButton
MinimapToggleButton:SetSize(32, 32)
MinimapToggleButton:ClearAllPoints()
MinimapToggleButton:SetPoint("CENTER", MinimapCluster, "TOPRIGHT", -15, -13)
MinimapToggleButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
MinimapToggleButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
MinimapToggleButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

MinimapToggleButton:HookScript("OnEnter", GameTooltip_Hide)
MinimapToggleButton:SetScript("OnClick", function(self)
	ToggleMinimap()
end)

GameTimeFrame:SetSize(50, 50)
GameTimeFrame:ClearAllPoints()
GameTimeFrame:SetPoint("TOPRIGHT", 4, -19)

hooksecurefunc("GameTimeFrame_SetDate", function()
	GameTimeFrame:SetNormalTexture("Interface\\Minimap\\UI-TOD-Indicator")
	GameTimeFrame:SetPushedTexture("Interface\\Minimap\\UI-TOD-Indicator")
	GameTimeFrame:GetHighlightTexture():SetAlpha(0)

	if C_DateAndTime.IsDayTime() then
		GameTimeFrame:GetNormalTexture():SetTexCoord(0, 50/128, 0, 50/64)
		GameTimeFrame:GetPushedTexture():SetTexCoord(0, 50/128, 0, 50/64)
	else
		GameTimeFrame:GetNormalTexture():SetTexCoord(0 + 0.5, 50/128 + 0.5, 0, 50/64)
		GameTimeFrame:GetPushedTexture():SetTexCoord(0 + 0.5, 50/128 + 0.5, 0, 50/64)
	end
end)

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

MinimapCluster.InstanceDifficulty:Hide()

--queuestatusbutton
QueueStatusButton:SetParent(MinimapBackdrop)
QueueStatusButton:SetSize(33, 33)
QueueStatusButton:SetFrameLevel(6)

if (QueueStatusButtonBorder == nil) then
	QueueStatusButton:CreateTexture("QueueStatusButtonBorder")
	QueueStatusButtonBorder:SetSize(52, 52)
	QueueStatusButtonBorder:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")
	QueueStatusButtonBorder:ClearAllPoints()
	QueueStatusButtonBorder:SetPoint("TOPLEFT", 1, -1)
end

hooksecurefunc(QueueStatusButton, "UpdateDefaultAnchor", function(self)
	self:ClearAllPoints()
	self:SetPoint("TOPLEFT", 25, -100)
end)

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

--queuestatusframe
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