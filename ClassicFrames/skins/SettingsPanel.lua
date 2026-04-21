if not _G.SettingsPanel then return end

ApplyCloseButton(SettingsPanel.ClosePanelButton)
ApplyTitleBg(SettingsPanel, true)
ApplyNineSliceNoPortrait(SettingsPanel)
SettingsPanel.NineSlice:SetFrameStrata("HIGH")