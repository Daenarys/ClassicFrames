if not _G.CatalogShopFrame then return end

ApplyCloseButton(CatalogShopFrameCloseButton)

CatalogShopFrame.PortraitContainer.CircleMask:Hide()

CatalogShopFramePortrait:SetSize(61, 61)
CatalogShopFramePortrait:ClearAllPoints()
CatalogShopFramePortrait:SetPoint("TOPLEFT", -6, 8)

CatalogShopFrame.TitleContainer:ClearAllPoints()
CatalogShopFrame.TitleContainer:SetPoint("TOPLEFT", CatalogShopFrame, "TOPLEFT", 58, 0)
CatalogShopFrame.TitleContainer:SetPoint("TOPRIGHT", CatalogShopFrame, "TOPRIGHT", -58, 0)

ApplyTitleBg(CatalogShopFrame)
ApplyNineSlicePortrait(CatalogShopFrame)