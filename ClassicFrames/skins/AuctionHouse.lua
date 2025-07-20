local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AuctionHouseUI" then
		AuctionHouseFrame.PortraitContainer.CircleMask:Hide()

		AuctionHouseFramePortrait:SetSize(61, 61)
		AuctionHouseFramePortrait:ClearAllPoints()
		AuctionHouseFramePortrait:SetPoint("TOPLEFT", -6, 8)

		AuctionHouseFramePortraitFrame:SetParent(AuctionHouseFrame.PortraitContainer)
		AuctionHouseFramePortraitFrame:SetDrawLayer("OVERLAY", 1)

		AuctionHouseFrameBuyTab:SetPoint("BOTTOMLEFT", 20, -31)

		ApplyDialogBorder(AuctionHouseFrame.BuyDialog.Border)
		ApplyDropDown(AuctionHouseFrame.CommoditiesSellFrame.Duration.Dropdown)
		ApplyDropDown(AuctionHouseFrame.ItemSellFrame.Duration.Dropdown)
		ApplyFilterDropDown(AuctionHouseFrame.SearchBar.FilterButton)
	end
end)