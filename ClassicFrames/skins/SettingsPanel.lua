if not _G.SettingsPanel then return end

ApplyCloseButton(SettingsPanel.ClosePanelButton)
ApplyTitleBgNoPortrait(SettingsPanel)
ApplyNineSliceNoPortrait(SettingsPanel)

SettingsPanel.CloseButton:Hide()

SettingsPanel.NineSlice:SetFrameStrata("HIGH")

SettingsPanel.Container.SettingsList.ScrollBar:SetSize(25, 560)
SettingsPanel.Container.SettingsList.ScrollBar:ClearAllPoints()
SettingsPanel.Container.SettingsList.ScrollBar:SetPoint("TOPLEFT", SettingsPanel.Container.SettingsList.ScrollBox, "TOPRIGHT", -4, 0)
SettingsPanel.Container.SettingsList.ScrollBar:SetPoint("BOTTOMLEFT", SettingsPanel.Container.SettingsList.ScrollBox, "BOTTOMRIGHT", -1, 0)

if (SettingsPanel.Container.SettingsList.ScrollBar.BG == nil) then
	SettingsPanel.Container.SettingsList.ScrollBar.BG = SettingsPanel.Container.SettingsList.ScrollBar:CreateTexture(nil, "BACKGROUND")
	SettingsPanel.Container.SettingsList.ScrollBar.BG:SetColorTexture(0, 0, 0, .1)
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

SettingsPanel.CategoryList.ScrollBar:SetSize(25, 560)
SettingsPanel.CategoryList.ScrollBar:ClearAllPoints()
SettingsPanel.CategoryList.ScrollBar:SetPoint("TOPLEFT", SettingsPanel.CategoryList.ScrollBox, "TOPRIGHT", -9, 7)
SettingsPanel.CategoryList.ScrollBar:SetPoint("BOTTOMLEFT", SettingsPanel.CategoryList.ScrollBox, "BOTTOMRIGHT", -9, 0)

if (SettingsPanel.CategoryList.ScrollBar.BG == nil) then
	SettingsPanel.CategoryList.ScrollBar.BG = SettingsPanel.CategoryList.ScrollBar:CreateTexture(nil, "BACKGROUND")
	SettingsPanel.CategoryList.ScrollBar.BG:SetColorTexture(0, 0, 0, .1)
	SettingsPanel.CategoryList.ScrollBar.BG:SetAllPoints()
end

SettingsPanel.CategoryList.ScrollBar.Track:SetWidth(18)
SettingsPanel.CategoryList.ScrollBar.Track:ClearAllPoints()
SettingsPanel.CategoryList.ScrollBar.Track:SetPoint("TOPLEFT", 4, -22)
SettingsPanel.CategoryList.ScrollBar.Track:SetPoint("BOTTOMRIGHT", -4, 22)

SettingsPanel.CategoryList.ScrollBar.Track.Begin:Hide()
SettingsPanel.CategoryList.ScrollBar.Track.End:Hide()
SettingsPanel.CategoryList.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(SettingsPanel.CategoryList.ScrollBar)
ApplyScrollBarThumb(SettingsPanel.CategoryList.ScrollBar.Track.Thumb)

ApplySearchBox(SettingsPanel.SearchBox)

SettingsPanel:HookScript("OnShow", function(self)
	self:ClearAllPoints()
	self:SetPoint("CENTER", 0, 5)
end)