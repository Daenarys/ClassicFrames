local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AuctionHouseUI" then
		AuctionHouseFrameBuyTab:SetPoint("BOTTOMLEFT", 20, -31)

		ApplyDropDown(AuctionHouseFrame.CommoditiesSellFrame.Duration.Dropdown)
		ApplyDropDown(AuctionHouseFrame.ItemSellFrame.Duration.Dropdown)
		ApplyFilterDropDown(AuctionHouseFrame.SearchBar.FilterButton)
	end
end)