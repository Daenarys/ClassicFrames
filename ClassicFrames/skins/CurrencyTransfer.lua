if not _G.CurrencyTransferMenu then return end

ApplyCloseButton(CurrencyTransferMenuCloseButton)

CurrencyTransferMenu.TitleContainer:ClearAllPoints()
CurrencyTransferMenu.TitleContainer:SetPoint("TOPLEFT", CurrencyTransferMenu, "TOPLEFT", 58, 0)
CurrencyTransferMenu.TitleContainer:SetPoint("TOPRIGHT", CurrencyTransferMenu, "TOPRIGHT", -58, 0)

ApplyTitleBgNoPortrait(CurrencyTransferMenu)
ApplyNineSliceNoPortrait(CurrencyTransferMenu)

CurrencyTransferMenu.Background:Hide()
CurrencyTransferMenu.Bg:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-Background-Rock", true, true)

ApplyDropDown(CurrencyTransferMenu.Content.SourceSelector.Dropdown)