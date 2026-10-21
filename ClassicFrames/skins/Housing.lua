local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_HousingDashboard" then
		ApplyDropDown(HousingDashboardFrame.HouseInfoContent.HouseDropdown)
		ApplyFilterDropDown(HousingDashboardFrame.CatalogContent.Filters.FilterDropdown)
	end
end)