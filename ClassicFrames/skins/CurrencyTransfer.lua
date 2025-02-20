if _G.CurrencyTransferMenu then
	ApplyCloseButton(CurrencyTransferMenuCloseButton)

	CurrencyTransferMenu.TitleContainer:ClearAllPoints()
	CurrencyTransferMenu.TitleContainer:SetPoint("TOPLEFT", CurrencyTransferMenu, "TOPLEFT", 58, 0)
	CurrencyTransferMenu.TitleContainer:SetPoint("TOPRIGHT", CurrencyTransferMenu, "TOPRIGHT", -58, 0)

	ApplyTitleBgNoPortrait(CurrencyTransferMenu)
	ApplyNineSliceNoPortrait(CurrencyTransferMenu)

	ApplyDropDown(CurrencyTransferMenu.SourceSelector.Dropdown)
end