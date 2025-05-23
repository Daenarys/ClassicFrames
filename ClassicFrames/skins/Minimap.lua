if (C_AddOns.IsAddOnLoaded("SexyMap")) then return end

-- minimap
MinimapZoomIn:ClearAllPoints()
MinimapZoomIn:SetPoint("CENTER", 72, -25)
MinimapZoomOut:ClearAllPoints()
MinimapZoomOut:SetPoint("CENTER", 50, -43)

MiniMapTracking:ClearAllPoints()
MiniMapTracking:SetPoint("TOPLEFT", 9, -45)
MiniMapTrackingIcon:SetTexture("Interface\\Minimap\\Tracking\\None")

MiniMapTrackingButton:SetScript("OnMouseDown", function()
	MiniMapTrackingIcon:SetPoint("TOPLEFT", MiniMapTracking, "TOPLEFT", 8, -8)
	MiniMapTrackingIconOverlay:Show()
end)
MiniMapTrackingButton:SetScript("OnMouseUp", function()
	MiniMapTrackingIcon:SetPoint("TOPLEFT", MiniMapTracking, "TOPLEFT", 6, -6)
	MiniMapTrackingIconOverlay:Hide()
end)

MiniMapMailFrame:ClearAllPoints()
MiniMapMailFrame:SetPoint("TOPRIGHT", 24, -37)

GameTimeFrame:ClearAllPoints()
GameTimeFrame:SetPoint("TOPRIGHT", Minimap, "TOPRIGHT", 20, -2)
GameTimeFrame:GetFontString():ClearAllPoints()
GameTimeFrame:GetFontString():SetPoint("CENTER", -1, -1)

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
	TimeManagerClockTicker:SetPoint("CENTER", TimeManagerClockButton, "CENTER", 3, 1)
end)

--lfg eye
MiniMapLFGFrame:ClearAllPoints()
MiniMapLFGFrame:SetPoint("TOPLEFT", 22, -100)

MiniMapLFGFrameBorder:SetParent(MiniMapLFGFrame.eye)

QueueStatusFrame:HookScript("OnShow", function(self)
	self:ClearAllPoints()
	self:SetPoint("TOPRIGHT", MiniMapLFGFrame, "TOPLEFT")
end)

hooksecurefunc(QueueStatusFrame, "Update", function(self)
	local animateEye;

	--Try each LFG type
	for i=1, NUM_LE_LFG_CATEGORYS do
		local mode, submode = GetLFGMode(i)
		if ( mode and submode ~= "noteleport" ) then
			if ( mode == "queued" ) then
				animateEye = true;
			end
		end
	end

	--Try LFGList entries
	local isActive = C_LFGList.HasActiveEntryInfo()
	if ( isActive ) then
		animateEye = true;
	end

	--Try LFGList applications
	local apps = C_LFGList.GetApplications()
	for i=1, #apps do
		local _, appStatus = C_LFGList.GetApplicationInfo(apps[i])
		if ( appStatus == "applied" or appStatus == "invited" ) then
			if ( appStatus == "applied" ) then
				animateEye = true;
			end
		end
	end

	--Try all PvP queues
	for i=1, GetMaxBattlefieldID() do
		local status, mapName, teamSize, registeredMatch, suspend = GetBattlefieldStatus(i)
		if ( status and status ~= "none" ) then
			if ( status == "queued" and not suspend ) then
				animateEye = true;
			end
		end
	end

	if ( animateEye ) then
		EyeTemplate_StartAnimating(MiniMapLFGFrame.eye)
	else
		EyeTemplate_StopAnimating(MiniMapLFGFrame.eye)
	end
end)