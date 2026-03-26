if not _G.SettingsPanel then return end

ApplyCloseButton(SettingsPanel.ClosePanelButton)
ApplyTitleBgNoPortrait(SettingsPanel)
ApplyNineSliceNoPortrait(SettingsPanel)

SettingsPanel.CloseButton:Hide()

SettingsPanel.Container.SettingsList.ScrollBar.Track.Begin:Hide()
SettingsPanel.Container.SettingsList.ScrollBar.Track.End:Hide()
SettingsPanel.Container.SettingsList.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(SettingsPanel.Container.SettingsList.ScrollBar)
ApplyScrollBarThumb(SettingsPanel.Container.SettingsList.ScrollBar.Track.Thumb)

SettingsPanel.CategoryList.ScrollBar.Track.Begin:Hide()
SettingsPanel.CategoryList.ScrollBar.Track.End:Hide()
SettingsPanel.CategoryList.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(SettingsPanel.CategoryList.ScrollBar)
ApplyScrollBarThumb(SettingsPanel.CategoryList.ScrollBar.Track.Thumb)