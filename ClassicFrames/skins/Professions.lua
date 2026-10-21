local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Professions" then
		ApplyFilterDropDown(ProfessionsFrame.CraftingPage.RecipeList.FilterDropdown)
		ApplyFilterDropDown(ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.FilterDropdown)
	end
end)