if not _G.SettingsPanel then return end

SettingsPanel.CloseButton:Hide()

SettingsPanel.NineSlice.RightEdge:ClearAllPoints()
SettingsPanel.NineSlice.RightEdge:SetPoint("TOPRIGHT", SettingsPanel.NineSlice.TopRightCorner, "BOTTOMRIGHT", 1, 0)
SettingsPanel.NineSlice.RightEdge:SetPoint("BOTTOMRIGHT", SettingsPanel.NineSlice.BottomRightCorner, "TOPRIGHT")

SettingsPanel.Container.SettingsList.ScrollBar:SetSize(25, 560)
SettingsPanel.Container.SettingsList.ScrollBar:ClearAllPoints()
SettingsPanel.Container.SettingsList.ScrollBar:SetPoint("TOPLEFT", SettingsPanel.Container.SettingsList.ScrollBox, "TOPRIGHT", -4, 2)
SettingsPanel.Container.SettingsList.ScrollBar:SetPoint("BOTTOMLEFT", SettingsPanel.Container.SettingsList.ScrollBox, "BOTTOMRIGHT", -1, 0)

if (SettingsPanel.Container.SettingsList.ScrollBar.BG == nil) then
	SettingsPanel.Container.SettingsList.ScrollBar.BG = SettingsPanel.Container.SettingsList.ScrollBar:CreateTexture(nil, "BACKGROUND");
	SettingsPanel.Container.SettingsList.ScrollBar.BG:SetColorTexture(0, 0, 0, 0.10)
	SettingsPanel.Container.SettingsList.ScrollBar.BG:SetAllPoints()
end

SettingsPanel.Container.SettingsList.ScrollBar.Track:SetWidth(18)
SettingsPanel.Container.SettingsList.ScrollBar.Track:ClearAllPoints()
SettingsPanel.Container.SettingsList.ScrollBar.Track:SetPoint("TOPLEFT", 4, -22)
SettingsPanel.Container.SettingsList.ScrollBar.Track:SetPoint("BOTTOMRIGHT", -4, 22)

SettingsPanel.Container.SettingsList.ScrollBar.Track.Begin:Hide()
SettingsPanel.Container.SettingsList.ScrollBar.Track.End:Hide()
SettingsPanel.Container.SettingsList.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(SettingsPanel.Container.SettingsList.ScrollBar)
ApplyScrollBarThumb(SettingsPanel.Container.SettingsList.ScrollBar.Track.Thumb)

_G.SettingsPanel:HookScript("OnShow", function(self)
	self:ClearAllPoints()
	self:SetPoint("CENTER", 0, 5)
end)