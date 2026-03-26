if not _G.CatalogShopFrame then return end

ApplyCloseButton(CatalogShopFrameCloseButton)

CatalogShopFramePortrait:SetSize(61, 61)
CatalogShopFramePortrait:ClearAllPoints()
CatalogShopFramePortrait:SetPoint("TOPLEFT", -6, 8)

CatalogShopFrame.TitleContainer:ClearAllPoints()
CatalogShopFrame.TitleContainer:SetPoint("TOPLEFT", CatalogShopFrame, "TOPLEFT", 58, 0)
CatalogShopFrame.TitleContainer:SetPoint("TOPRIGHT", CatalogShopFrame, "TOPRIGHT", -58, 0)

if (CatalogShopFrame.NineSlice.TitleBg == nil) then
	CatalogShopFrame.NineSlice.TitleBg = CatalogShopFrame.NineSlice:CreateTexture(nil, "BACKGROUND")
	CatalogShopFrame.NineSlice.TitleBg:SetAtlas("_UI-Frame-TitleTileBg", false)
	CatalogShopFrame.NineSlice.TitleBg:SetSize(256, 17)
	CatalogShopFrame.NineSlice.TitleBg:SetHorizTile(true)
	CatalogShopFrame.NineSlice.TitleBg:SetPoint("TOPLEFT", 54, -3)
	CatalogShopFrame.NineSlice.TitleBg:SetPoint("TOPRIGHT", -25, -3)
end

ApplyNineSlicePortrait(CatalogShopFrame)

CatalogShopFrame.ProductContainerFrame.ProductsScrollBoxContainer.ScrollBar:SetSize(25, 560)
CatalogShopFrame.ProductContainerFrame.ProductsScrollBoxContainer.ScrollBar:ClearAllPoints()
CatalogShopFrame.ProductContainerFrame.ProductsScrollBoxContainer.ScrollBar:SetPoint("TOPLEFT", CatalogShopFrame.ProductContainerFrame.ProductsScrollBoxContainer.ScrollBox, "TOPRIGHT", -6, -2)
CatalogShopFrame.ProductContainerFrame.ProductsScrollBoxContainer.ScrollBar:SetPoint("BOTTOMLEFT", CatalogShopFrame.ProductContainerFrame.ProductsScrollBoxContainer.ScrollBox, "BOTTOMRIGHT", -3, 0)

CatalogShopFrame.ProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track:ClearAllPoints()
CatalogShopFrame.ProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track:SetPoint("TOPLEFT", 4, -22)
CatalogShopFrame.ProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track:SetPoint("BOTTOMRIGHT", -4, 22)

CatalogShopFrame.ProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track.Begin:Hide()
CatalogShopFrame.ProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track.End:Hide()
CatalogShopFrame.ProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(CatalogShopFrame.ProductContainerFrame.ProductsScrollBoxContainer.ScrollBar)
ApplyScrollBarThumb(CatalogShopFrame.ProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track.Thumb)

CatalogShopFrame.ProductDetailsContainerFrame.DetailsProductContainerFrame.ProductsScrollBoxContainer.ScrollBar:SetSize(25, 560)
CatalogShopFrame.ProductDetailsContainerFrame.DetailsProductContainerFrame.ProductsScrollBoxContainer.ScrollBar:ClearAllPoints()
CatalogShopFrame.ProductDetailsContainerFrame.DetailsProductContainerFrame.ProductsScrollBoxContainer.ScrollBar:SetPoint("TOPLEFT", CatalogShopFrame.ProductDetailsContainerFrame.DetailsProductContainerFrame.ProductsScrollBoxContainer.ScrollBox, "TOPRIGHT", -6, -2)
CatalogShopFrame.ProductDetailsContainerFrame.DetailsProductContainerFrame.ProductsScrollBoxContainer.ScrollBar:SetPoint("BOTTOMLEFT", CatalogShopFrame.ProductDetailsContainerFrame.DetailsProductContainerFrame.ProductsScrollBoxContainer.ScrollBox, "BOTTOMRIGHT", -3, 0)

CatalogShopFrame.ProductDetailsContainerFrame.DetailsProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track:ClearAllPoints()
CatalogShopFrame.ProductDetailsContainerFrame.DetailsProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track:SetPoint("TOPLEFT", 4, -22)
CatalogShopFrame.ProductDetailsContainerFrame.DetailsProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track:SetPoint("BOTTOMRIGHT", -4, 22)

CatalogShopFrame.ProductDetailsContainerFrame.DetailsProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track.Begin:Hide()
CatalogShopFrame.ProductDetailsContainerFrame.DetailsProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track.End:Hide()
CatalogShopFrame.ProductDetailsContainerFrame.DetailsProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(CatalogShopFrame.ProductDetailsContainerFrame.DetailsProductContainerFrame.ProductsScrollBoxContainer.ScrollBar)
ApplyScrollBarThumb(CatalogShopFrame.ProductDetailsContainerFrame.DetailsProductContainerFrame.ProductsScrollBoxContainer.ScrollBar.Track.Thumb)