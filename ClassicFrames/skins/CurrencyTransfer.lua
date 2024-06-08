if _G.CurrencyTransferLog then
	ApplyCloseButton(CurrencyTransferLogCloseButton)

	CurrencyTransferLog.TitleContainer:ClearAllPoints()
	CurrencyTransferLog.TitleContainer:SetPoint("TOPLEFT", CurrencyTransferLog, "TOPLEFT", 58, 0)
	CurrencyTransferLog.TitleContainer:SetPoint("TOPRIGHT", CurrencyTransferLog, "TOPRIGHT", -58, 0)

	ApplyTitleBgNoPortrait(CurrencyTransferLog)
	ApplyNineSliceNoPortrait(CurrencyTransferLog)

	CurrencyTransferLog.ScrollBar:SetSize(25, 560)
	CurrencyTransferLog.ScrollBar:ClearAllPoints()
	CurrencyTransferLog.ScrollBar:SetPoint("TOPLEFT", CurrencyTransferLog.ScrollBox, "TOPRIGHT", -2, 2)
	CurrencyTransferLog.ScrollBar:SetPoint("BOTTOMLEFT", CurrencyTransferLog.ScrollBox, "BOTTOMRIGHT", -2, 0)

	if (CurrencyTransferLog.ScrollBar.BG == nil) then
		CurrencyTransferLog.ScrollBar.BG = CurrencyTransferLog.ScrollBar:CreateTexture(nil, "BACKGROUND")
		CurrencyTransferLog.ScrollBar.BG:SetColorTexture(0, 0, 0, 1)
		CurrencyTransferLog.ScrollBar.BG:SetAllPoints()
	end

	ApplyScrollBarArrow(CurrencyTransferLog.ScrollBar)
	ApplyScrollBarTrack(CurrencyTransferLog.ScrollBar.Track)
	ApplyScrollBarThumb(CurrencyTransferLog.ScrollBar.Track.Thumb)
end

if _G.CurrencyTransferMenu then
	ApplyCloseButton(CurrencyTransferMenuCloseButton)

	CurrencyTransferMenu.TitleContainer:ClearAllPoints()
	CurrencyTransferMenu.TitleContainer:SetPoint("TOPLEFT", CurrencyTransferMenu, "TOPLEFT", 58, 0)
	CurrencyTransferMenu.TitleContainer:SetPoint("TOPRIGHT", CurrencyTransferMenu, "TOPRIGHT", -58, 0)

	ApplyTitleBgNoPortrait(CurrencyTransferMenu)
	ApplyNineSliceNoPortrait(CurrencyTransferMenu)

	ApplyDropDown(CurrencyTransferMenu.SourceSelector.Dropdown)
end