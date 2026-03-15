if not _G.WorldMapFrame then return end

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
Tracking.Icon:SetTexture("Interface\\Minimap\\Tracking\\None")
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
	self.Icon:SetPoint("TOPLEFT", 7, -6)
	self.IconOverlay:Hide()
end)
Pin:SetPoint("TOPRIGHT", WorldMapFrame.ScrollContainer, "TOPRIGHT", -36, -2)