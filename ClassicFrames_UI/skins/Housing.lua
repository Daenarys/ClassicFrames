local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_HousingDashboard" then
		ApplyCloseButton(HousingDashboardFrameCloseButton)

		HousingDashboardFramePortrait:SetSize(61, 61)
		HousingDashboardFramePortrait:ClearAllPoints()
		HousingDashboardFramePortrait:SetPoint("TOPLEFT", -6, 8)

		HousingDashboardFrame.TitleContainer:ClearAllPoints()
		HousingDashboardFrame.TitleContainer:SetPoint("TOPLEFT", HousingDashboardFrame, "TOPLEFT", 58, 0)
		HousingDashboardFrame.TitleContainer:SetPoint("TOPRIGHT", HousingDashboardFrame, "TOPRIGHT", -58, 0)

		ApplyNineSlicePortrait(HousingDashboardFrame)

		if (HousingDashboardFrame.NineSlice.TitleBg == nil) then
			HousingDashboardFrame.NineSlice.TitleBg = HousingDashboardFrame.NineSlice:CreateTexture(nil, "BACKGROUND")
			HousingDashboardFrame.NineSlice.TitleBg:SetAtlas("_UI-Frame-TitleTileBg", false)
			HousingDashboardFrame.NineSlice.TitleBg:SetSize(256, 17)
			HousingDashboardFrame.NineSlice.TitleBg:SetHorizTile(true)
			HousingDashboardFrame.NineSlice.TitleBg:SetPoint("TOPLEFT", 54, -3)
			HousingDashboardFrame.NineSlice.TitleBg:SetPoint("TOPRIGHT", -25, -3)
		end

		HousingDashboardFrame.CatalogContent.OptionsContainer.ScrollBar:SetSize(25, 560)
		HousingDashboardFrame.CatalogContent.OptionsContainer.ScrollBar:ClearAllPoints()
		HousingDashboardFrame.CatalogContent.OptionsContainer.ScrollBar:SetPoint("TOPLEFT", HousingDashboardFrame.CatalogContent.OptionsContainer.ScrollBox, "TOPRIGHT")
		HousingDashboardFrame.CatalogContent.OptionsContainer.ScrollBar:SetPoint("BOTTOMLEFT", HousingDashboardFrame.CatalogContent.OptionsContainer.ScrollBox, "BOTTOMRIGHT")

		ApplyScrollBarArrow(HousingDashboardFrame.CatalogContent.OptionsContainer.ScrollBar)
		ApplyScrollBarTrack(HousingDashboardFrame.CatalogContent.OptionsContainer.ScrollBar.Track)
		ApplyScrollBarThumb(HousingDashboardFrame.CatalogContent.OptionsContainer.ScrollBar.Track.Thumb)

		ApplyDropDown(HousingDashboardFrame.HouseInfoContent.HouseDropdown)
		ApplyFilterDropDown(HousingDashboardFrame.CatalogContent.Filters.FilterDropdown)
	elseif name == "Blizzard_HousingHouseFinder" then
		ApplyCloseButton(HouseFinderFrameCloseButton)

		HouseFinderFramePortrait:SetSize(61, 61)
		HouseFinderFramePortrait:ClearAllPoints()
		HouseFinderFramePortrait:SetPoint("TOPLEFT", -6, 8)

		HouseFinderFrame.TitleContainer:ClearAllPoints()
		HouseFinderFrame.TitleContainer:SetPoint("TOPLEFT", HouseFinderFrame, "TOPLEFT", 58, 0)
		HouseFinderFrame.TitleContainer:SetPoint("TOPRIGHT", HouseFinderFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(HouseFinderFrame)
		ApplyNineSlicePortrait(HouseFinderFrame)
	elseif name == "Blizzard_HousingModelPreview" then
		ApplyCloseButton(HousingModelPreviewFrameCloseButton)

		HousingModelPreviewFrame.TitleContainer:ClearAllPoints()
		HousingModelPreviewFrame.TitleContainer:SetPoint("TOPLEFT", HousingModelPreviewFrame, "TOPLEFT", 58, 0)
		HousingModelPreviewFrame.TitleContainer:SetPoint("TOPRIGHT", HousingModelPreviewFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBgNoPortrait(HousingModelPreviewFrame)
		ApplyNineSliceNoPortrait(HousingModelPreviewFrame)
	end
end)