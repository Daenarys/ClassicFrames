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

		if (HousingDashboardFrame.NineSlice.TitleBg == nil) then
			HousingDashboardFrame.NineSlice.TitleBg = HousingDashboardFrame.NineSlice:CreateTexture(nil, "BACKGROUND")
			HousingDashboardFrame.NineSlice.TitleBg:SetAtlas("_UI-Frame-TitleTileBg", false)
			HousingDashboardFrame.NineSlice.TitleBg:SetSize(256, 17)
			HousingDashboardFrame.NineSlice.TitleBg:SetHorizTile(true)
			HousingDashboardFrame.NineSlice.TitleBg:SetPoint("TOPLEFT", 54, -3)
			HousingDashboardFrame.NineSlice.TitleBg:SetPoint("TOPRIGHT", -25, -3)
		end

		ApplyNineSlicePortrait(HousingDashboardFrame)

		ApplyScrollBarHybrid(HousingDashboardFrame.CatalogContent.OptionsContainer.ScrollBar)
		ApplyScrollBarThumb(HousingDashboardFrame.CatalogContent.OptionsContainer.ScrollBar.Track.Thumb)

		ApplyDropDown(HousingDashboardFrame.HouseInfoContent.HouseDropdown)
		ApplyFilterDropDown(HousingDashboardFrame.CatalogContent.Filters.FilterDropdown)
	elseif name == "Blizzard_HousingModelPreview" then
		ApplyCloseButton(HousingModelPreviewFrameCloseButton)

		HousingModelPreviewFrame.TitleContainer:ClearAllPoints()
		HousingModelPreviewFrame.TitleContainer:SetPoint("TOPLEFT", HousingModelPreviewFrame, "TOPLEFT", 58, 0)
		HousingModelPreviewFrame.TitleContainer:SetPoint("TOPRIGHT", HousingModelPreviewFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(HousingModelPreviewFrame, true)
		ApplyNineSliceNoPortrait(HousingModelPreviewFrame)
	end
end)