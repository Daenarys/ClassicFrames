local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_HousingDashboard" then
		ApplyCloseButton(HousingDashboardFrameCloseButton)

		HousingDashboardFrame.PortraitContainer.CircleMask:Hide()

		HousingDashboardFramePortrait:SetSize(61, 61)
		HousingDashboardFramePortrait:ClearAllPoints()
		HousingDashboardFramePortrait:SetPoint("TOPLEFT", -6, 8)

		HousingDashboardFrame.TitleContainer:ClearAllPoints()
		HousingDashboardFrame.TitleContainer:SetPoint("TOPLEFT", HousingDashboardFrame, "TOPLEFT", 58, 0)
		HousingDashboardFrame.TitleContainer:SetPoint("TOPRIGHT", HousingDashboardFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(HousingDashboardFrame)
		ApplyNineSlicePortrait(HousingDashboardFrame)

		HousingDashboardFrame.CatalogContent.OptionsContainer.ScrollBar:SetSize(25, 560)
		HousingDashboardFrame.CatalogContent.OptionsContainer.ScrollBar:ClearAllPoints()
		HousingDashboardFrame.CatalogContent.OptionsContainer.ScrollBar:SetPoint("TOPLEFT", HousingDashboardFrame.CatalogContent.OptionsContainer.ScrollBox, "TOPRIGHT")
		HousingDashboardFrame.CatalogContent.OptionsContainer.ScrollBar:SetPoint("BOTTOMLEFT", HousingDashboardFrame.CatalogContent.OptionsContainer.ScrollBox, "BOTTOMRIGHT")

		ApplyScrollBarArrow(HousingDashboardFrame.CatalogContent.OptionsContainer.ScrollBar)
		ApplyScrollBarTrack(HousingDashboardFrame.CatalogContent.OptionsContainer.ScrollBar.Track)
		ApplyScrollBarThumb(HousingDashboardFrame.CatalogContent.OptionsContainer.ScrollBar.Track.Thumb)

		ApplyFilterDropDown(HousingDashboardFrame.CatalogContent.Filters.FilterDropdown)
	end
end)