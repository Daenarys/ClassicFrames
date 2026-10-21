local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ProfessionsCustomerOrders" then
		ApplyDropDown(ProfessionsCustomerOrdersFrame.Form.OrderRecipientDropdown)
		ApplyDropDown(ProfessionsCustomerOrdersFrame.Form.PaymentContainer.DurationDropdown)
		ApplyDropDown(ProfessionsCustomerOrdersFrame.Form.MinimumQuality.Dropdown)
		ApplyFilterDropDown(ProfessionsCustomerOrdersFrame.BrowseOrders.SearchBar.FilterDropdown)
	end
end)