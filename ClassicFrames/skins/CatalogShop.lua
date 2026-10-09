if not _G.CatalogShopFrame then return end

ApplyCloseButton(CatalogShopFrameCloseButton)

CatalogShopFramePortrait:SetSize(61, 61)
CatalogShopFramePortrait:ClearAllPoints()
CatalogShopFramePortrait:SetPoint("TOPLEFT", -6, 8)

CatalogShopFrame.TitleContainer:ClearAllPoints()
CatalogShopFrame.TitleContainer:SetPoint("TOPLEFT", CatalogShopFrame, "TOPLEFT", 58, 0)
CatalogShopFrame.TitleContainer:SetPoint("TOPRIGHT", CatalogShopFrame, "TOPRIGHT", -58, 0)

if (CatalogShopFrame.NineSlice.TitleBg == nil) then
	CatalogShopFrame.NineSlice.TitleBg = CatalogShopFrame.NineSlice:CreateTexture(nil, "BACKGROUND", "_UI-Frame-TitleTileBg")
	CatalogShopFrame.NineSlice.TitleBg:ClearAllPoints()
	CatalogShopFrame.NineSlice.TitleBg:SetPoint("TOPLEFT", 54, -3)
	CatalogShopFrame.NineSlice.TitleBg:SetPoint("TOPRIGHT", -25, -3)
end

ApplyNineSlicePortrait(CatalogShopFrame)

CatalogShopFrame.ProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track.Begin:Hide()
CatalogShopFrame.ProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track.End:Hide()
CatalogShopFrame.ProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(CatalogShopFrame.ProductContainerFrame.ProductsScrollBoxContainer.ScrollBar, true)
ApplyScrollBarThumb(CatalogShopFrame.ProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track.Thumb)

CatalogShopFrame.ProductDetailsContainerFrame.DetailsProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track.Begin:Hide()
CatalogShopFrame.ProductDetailsContainerFrame.DetailsProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track.End:Hide()
CatalogShopFrame.ProductDetailsContainerFrame.DetailsProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(CatalogShopFrame.ProductDetailsContainerFrame.DetailsProductContainerFrame.ProductsScrollBoxContainer.ScrollBar, true)
ApplyScrollBarThumb(CatalogShopFrame.ProductDetailsContainerFrame.DetailsProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track.Thumb)