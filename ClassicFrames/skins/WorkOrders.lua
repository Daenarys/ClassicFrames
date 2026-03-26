local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ProfessionsCustomerOrders" then
		ApplyCloseButton(ProfessionsCustomerOrdersFrameCloseButton)

		ProfessionsCustomerOrdersFramePortrait:SetSize(61, 61)
		ProfessionsCustomerOrdersFramePortrait:ClearAllPoints()
		ProfessionsCustomerOrdersFramePortrait:SetPoint("TOPLEFT", -6, 8)

		ProfessionsCustomerOrdersFrame.TitleContainer:ClearAllPoints()
		ProfessionsCustomerOrdersFrame.TitleContainer:SetPoint("TOPLEFT", ProfessionsCustomerOrdersFrame, "TOPLEFT", 58, 0)
		ProfessionsCustomerOrdersFrame.TitleContainer:SetPoint("TOPRIGHT", ProfessionsCustomerOrdersFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(ProfessionsCustomerOrdersFrame)
		ApplyNineSlicePortrait(ProfessionsCustomerOrdersFrame)

		ProfessionsCustomerOrdersFrameOrdersTab:ClearAllPoints()
		ProfessionsCustomerOrdersFrameOrdersTab:SetPoint("LEFT", ProfessionsCustomerOrdersFrameBrowseTab, "RIGHT", -15, 0)

		ApplyBottomTab(ProfessionsCustomerOrdersFrameBrowseTab)
		ApplyBottomTab(ProfessionsCustomerOrdersFrameOrdersTab)

		ProfessionsCustomerOrdersFrame:HookScript("OnShow", function()
			ProfessionsCustomerOrdersFrameBrowseTab:SetWidth(50 + ProfessionsCustomerOrdersFrameBrowseTab:GetFontString():GetStringWidth())
			ProfessionsCustomerOrdersFrameOrdersTab:SetWidth(50 + ProfessionsCustomerOrdersFrameOrdersTab:GetFontString():GetStringWidth())
		end)

		ApplyScrollBarArrow(ProfessionsCustomerOrdersFrame.BrowseOrders.CategoryList.ScrollBar)
		ApplyScrollBarTrack(ProfessionsCustomerOrdersFrame.BrowseOrders.CategoryList.ScrollBar.Track)
		ApplyScrollBarThumb(ProfessionsCustomerOrdersFrame.BrowseOrders.CategoryList.ScrollBar.Track.Thumb)

		ApplyScrollBarArrow(ProfessionsCustomerOrdersFrame.BrowseOrders.RecipeList.ScrollBar)
		ApplyScrollBarTrack(ProfessionsCustomerOrdersFrame.BrowseOrders.RecipeList.ScrollBar.Track)
		ApplyScrollBarThumb(ProfessionsCustomerOrdersFrame.BrowseOrders.RecipeList.ScrollBar.Track.Thumb)

		ApplyScrollBarArrow(ProfessionsCustomerOrdersFrame.MyOrdersPage.OrderList.ScrollBar)
		ApplyScrollBarTrack(ProfessionsCustomerOrdersFrame.MyOrdersPage.OrderList.ScrollBar.Track)
		ApplyScrollBarThumb(ProfessionsCustomerOrdersFrame.MyOrdersPage.OrderList.ScrollBar.Track.Thumb)

		ApplyDropDown(ProfessionsCustomerOrdersFrame.Form.OrderRecipientDropdown)
		ApplyDropDown(ProfessionsCustomerOrdersFrame.Form.PaymentContainer.DurationDropdown)
		ApplyDropDown(ProfessionsCustomerOrdersFrame.Form.MinimumQuality.Dropdown)
		ApplyFilterDropDown(ProfessionsCustomerOrdersFrame.BrowseOrders.SearchBar.FilterDropdown)
	end
end)