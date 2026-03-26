local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AuctionHouseUI" then
		ApplyCloseButton(AuctionHouseFrameCloseButton)

		AuctionHouseFramePortrait:SetSize(61, 61)
		AuctionHouseFramePortrait:ClearAllPoints()
		AuctionHouseFramePortrait:SetPoint("TOPLEFT", -6, 8)

		AuctionHouseFrame.TitleContainer:ClearAllPoints()
		AuctionHouseFrame.TitleContainer:SetPoint("TOPLEFT", AuctionHouseFrame, "TOPLEFT", 58, 0)
		AuctionHouseFrame.TitleContainer:SetPoint("TOPRIGHT", AuctionHouseFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(AuctionHouseFrame)
		ApplyNineSlicePortrait(AuctionHouseFrame)

		AuctionHouseFrameSellTab:ClearAllPoints()
		AuctionHouseFrameSellTab:SetPoint("LEFT", AuctionHouseFrameBuyTab, "RIGHT", -15, 0)
		AuctionHouseFrameAuctionsTab:ClearAllPoints()
		AuctionHouseFrameAuctionsTab:SetPoint("LEFT", AuctionHouseFrameSellTab, "RIGHT", -15, 0)

		ApplyBottomTab(AuctionHouseFrameBuyTab)
		ApplyBottomTab(AuctionHouseFrameSellTab)
		ApplyBottomTab(AuctionHouseFrameAuctionsTab)

		AuctionHouseFrame:HookScript("OnShow", function()
			AuctionHouseFrameBuyTab:SetWidth(89 + AuctionHouseFrameBuyTab:GetFontString():GetStringWidth())
			AuctionHouseFrameSellTab:SetWidth(90 + AuctionHouseFrameSellTab:GetFontString():GetStringWidth())
			AuctionHouseFrameAuctionsTab:SetWidth(63 + AuctionHouseFrameAuctionsTab:GetFontString():GetStringWidth())
		end)

		ApplyTopTab(AuctionHouseFrameAuctionsFrameAuctionsTab)
		ApplyTopTab(AuctionHouseFrameAuctionsFrameBidsTab)

		AuctionHouseFrameAuctionsFrameAuctionsTab:HookScript("OnShow", function(self)
			self:SetWidth(55 + self:GetFontString():GetStringWidth())
		end)

		AuctionHouseFrameAuctionsFrameBidsTab:HookScript("OnShow", function(self)
			self:SetWidth(78 + self:GetFontString():GetStringWidth())
		end)

		ApplyScrollBarArrow(AuctionHouseFrame.CategoriesList.ScrollBar)
		ApplyScrollBarTrack(AuctionHouseFrame.CategoriesList.ScrollBar.Track)
		ApplyScrollBarThumb(AuctionHouseFrame.CategoriesList.ScrollBar.Track.Thumb)

		ApplyScrollBarArrow(AuctionHouseFrame.BrowseResultsFrame.ItemList.ScrollBar)
		ApplyScrollBarTrack(AuctionHouseFrame.BrowseResultsFrame.ItemList.ScrollBar.Track)
		ApplyScrollBarThumb(AuctionHouseFrame.BrowseResultsFrame.ItemList.ScrollBar.Track.Thumb)

		ApplyScrollBarArrow(AuctionHouseFrame.CommoditiesBuyFrame.ItemList.ScrollBar)
		ApplyScrollBarTrack(AuctionHouseFrame.CommoditiesBuyFrame.ItemList.ScrollBar.Track)
		ApplyScrollBarThumb(AuctionHouseFrame.CommoditiesBuyFrame.ItemList.ScrollBar.Track.Thumb)

		ApplyScrollBarArrow(AuctionHouseFrame.ItemBuyFrame.ItemList.ScrollBar)
		ApplyScrollBarTrack(AuctionHouseFrame.ItemBuyFrame.ItemList.ScrollBar.Track)
		ApplyScrollBarThumb(AuctionHouseFrame.ItemBuyFrame.ItemList.ScrollBar.Track.Thumb)

		ApplyScrollBarArrow(AuctionHouseFrame.CommoditiesSellList.ScrollBar)
		ApplyScrollBarTrack(AuctionHouseFrame.CommoditiesSellList.ScrollBar.Track)
		ApplyScrollBarThumb(AuctionHouseFrame.CommoditiesSellList.ScrollBar.Track.Thumb)

		ApplyScrollBarArrow(AuctionHouseFrame.ItemSellList.ScrollBar)
		ApplyScrollBarTrack(AuctionHouseFrame.ItemSellList.ScrollBar.Track)
		ApplyScrollBarThumb(AuctionHouseFrame.ItemSellList.ScrollBar.Track.Thumb)

		ApplyDialogBorder(AuctionHouseFrame.BuyDialog.Border)

		ApplyScrollBarArrow(AuctionHouseFrameAuctionsFrame.SummaryList.ScrollBar)
		ApplyScrollBarTrack(AuctionHouseFrameAuctionsFrame.SummaryList.ScrollBar.Track)
		ApplyScrollBarThumb(AuctionHouseFrameAuctionsFrame.SummaryList.ScrollBar.Track.Thumb)

		ApplyScrollBarArrow(AuctionHouseFrameAuctionsFrame.AllAuctionsList.ScrollBar)
		ApplyScrollBarTrack(AuctionHouseFrameAuctionsFrame.AllAuctionsList.ScrollBar.Track)
		ApplyScrollBarThumb(AuctionHouseFrameAuctionsFrame.AllAuctionsList.ScrollBar.Track.Thumb)
		
		ApplyScrollBarArrow(AuctionHouseFrameAuctionsFrame.BidsList.ScrollBar)
		ApplyScrollBarTrack(AuctionHouseFrameAuctionsFrame.BidsList.ScrollBar.Track)
		ApplyScrollBarThumb(AuctionHouseFrameAuctionsFrame.BidsList.ScrollBar.Track.Thumb)

		ApplyCloseButton(AuctionHouseFrame.WoWTokenResults.GameTimeTutorial.CloseButton)
		ApplyTitleBgNoPortrait(AuctionHouseFrame.WoWTokenResults.GameTimeTutorial)
		ApplyNineSliceNoPortrait(AuctionHouseFrame.WoWTokenResults.GameTimeTutorial)
		
		ApplyScrollBarArrow(AuctionHouseFrame.WoWTokenResults.DummyScrollBar)
		ApplyScrollBarTrack(AuctionHouseFrame.WoWTokenResults.DummyScrollBar.Track)
		ApplyScrollBarThumb(AuctionHouseFrame.WoWTokenResults.DummyScrollBar.Track.Thumb)

		ApplyDropDown(AuctionHouseFrame.CommoditiesSellFrame.Duration.Dropdown)
		ApplyDropDown(AuctionHouseFrame.ItemSellFrame.Duration.Dropdown)
		ApplyFilterDropDown(AuctionHouseFrame.SearchBar.FilterButton)
	end
end)