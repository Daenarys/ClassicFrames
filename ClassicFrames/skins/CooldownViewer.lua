if not _G.CooldownViewerSettings then return end

ApplyCloseButton(CooldownViewerSettingsCloseButton)

CooldownViewerSettingsPortrait:SetSize(61, 61)
CooldownViewerSettingsPortrait:ClearAllPoints()
CooldownViewerSettingsPortrait:SetPoint("TOPLEFT", -6, 8)

CooldownViewerSettings.TitleContainer:ClearAllPoints()
CooldownViewerSettings.TitleContainer:SetPoint("TOPLEFT", CooldownViewerSettings, "TOPLEFT", 66, -1)
CooldownViewerSettings.TitleContainer:SetPoint("TOPRIGHT", CooldownViewerSettings, "TOPRIGHT", -60, 1)

ApplyTitleBg(CooldownViewerSettings)
ApplyNineSlicePortrait(CooldownViewerSettings)

ApplyScrollBarArrow(CooldownViewerSettings.CooldownScroll.ScrollBar)
ApplyScrollBarTrack(CooldownViewerSettings.CooldownScroll.ScrollBar.Track)
ApplyScrollBarThumb(CooldownViewerSettings.CooldownScroll.ScrollBar.Track.Thumb)