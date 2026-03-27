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

CooldownViewerSettings.CooldownScroll.ScrollBar:SetWidth(25)
CooldownViewerSettings.CooldownScroll.ScrollBar:SetPoint("TOPLEFT", CooldownViewerSettings.CooldownScroll, "TOPRIGHT", 0, 2)
CooldownViewerSettings.CooldownScroll.ScrollBar:SetPoint("BOTTOMLEFT", CooldownViewerSettings.CooldownScroll, "BOTTOMRIGHT", 0, -2)

ApplyScrollBarArrow(CooldownViewerSettings.CooldownScroll.ScrollBar)
ApplyScrollBarTrack(CooldownViewerSettings.CooldownScroll.ScrollBar.Track)
ApplyScrollBarThumb(CooldownViewerSettings.CooldownScroll.ScrollBar.Track.Thumb)

ApplyDropDown(CooldownViewerSettings.LayoutDropdown)