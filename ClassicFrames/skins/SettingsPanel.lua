if not _G.SettingsPanel then return end

ApplyCloseButton(SettingsPanel.ClosePanelButton)
ApplyTitleBgNoPortrait(SettingsPanel)
ApplyNineSliceNoPortrait(SettingsPanel)
SettingsPanel.NineSlice:SetFrameStrata("HIGH")

SettingsPanel.CloseButton:Hide()

SettingsPanel.Container.SettingsList.ScrollBar.Track.Begin:Hide()
SettingsPanel.Container.SettingsList.ScrollBar.Track.End:Hide()
SettingsPanel.Container.SettingsList.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(SettingsPanel.Container.SettingsList.ScrollBar, true)
ApplyScrollBarThumb(SettingsPanel.Container.SettingsList.ScrollBar.Track.Thumb)

SettingsPanel.CategoryList.ScrollBar.Track.Begin:Hide()
SettingsPanel.CategoryList.ScrollBar.Track.End:Hide()
SettingsPanel.CategoryList.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(SettingsPanel.CategoryList.ScrollBar, true)
ApplyScrollBarThumb(SettingsPanel.CategoryList.ScrollBar.Track.Thumb)