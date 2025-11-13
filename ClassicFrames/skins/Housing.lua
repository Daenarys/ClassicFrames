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

		ApplyDropDown(HousingDashboardFrame.HouseInfoContent.HouseDropdown)
		ApplyFilterDropDown(HousingDashboardFrame.CatalogContent.Filters.FilterDropdown)
	elseif name == "Blizzard_HousingBulletinBoard" then
		HousingBulletinBoardFrame.ResidentsTab.ScrollBar:SetSize(25, 560)
		HousingBulletinBoardFrame.ResidentsTab.ScrollBar:ClearAllPoints()
		HousingBulletinBoardFrame.ResidentsTab.ScrollBar:SetPoint("TOPLEFT", HousingBulletinBoardFrame.ResidentsTab, "TOPRIGHT", -31, -108)
		HousingBulletinBoardFrame.ResidentsTab.ScrollBar:SetPoint("BOTTOMLEFT", HousingBulletinBoardFrame.ResidentsTab, "BOTTOMRIGHT", -31, 43)

		if (HousingBulletinBoardFrame.ResidentsTab.ScrollBar.BG == nil) then
			HousingBulletinBoardFrame.ResidentsTab.ScrollBar.BG = HousingBulletinBoardFrame.ResidentsTab.ScrollBar:CreateTexture(nil, "BACKGROUND")
			HousingBulletinBoardFrame.ResidentsTab.ScrollBar.BG:SetColorTexture(0, 0, 0, .1)
			HousingBulletinBoardFrame.ResidentsTab.ScrollBar.BG:SetAllPoints()
		end

		HousingBulletinBoardFrame.ResidentsTab.ScrollBar.Track:ClearAllPoints()
		HousingBulletinBoardFrame.ResidentsTab.ScrollBar.Track:SetPoint("TOPLEFT", 4, -22)
		HousingBulletinBoardFrame.ResidentsTab.ScrollBar.Track:SetPoint("BOTTOMRIGHT", -4, 22)

		HousingBulletinBoardFrame.ResidentsTab.ScrollBar.Track.Begin:Hide()
		HousingBulletinBoardFrame.ResidentsTab.ScrollBar.Track.End:Hide()
		HousingBulletinBoardFrame.ResidentsTab.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(HousingBulletinBoardFrame.ResidentsTab.ScrollBar)
		ApplyScrollBarThumb(HousingBulletinBoardFrame.ResidentsTab.ScrollBar.Track.Thumb)
	elseif name == "Blizzard_HousingHouseFinder" then
		ApplyCloseButton(HouseFinderFrameCloseButton)

		HouseFinderFrame.PortraitContainer.CircleMask:Hide()

		HouseFinderFramePortrait:SetSize(61, 61)
		HouseFinderFramePortrait:ClearAllPoints()
		HouseFinderFramePortrait:SetPoint("TOPLEFT", -6, 8)

		HouseFinderFrame.TitleContainer:ClearAllPoints()
		HouseFinderFrame.TitleContainer:SetPoint("TOPLEFT", HouseFinderFrame, "TOPLEFT", 58, 0)
		HouseFinderFrame.TitleContainer:SetPoint("TOPRIGHT", HouseFinderFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(HouseFinderFrame)
		ApplyNineSlicePortrait(HouseFinderFrame)
	elseif name == "Blizzard_HousingHouseSettings" then
		ApplyDropDown(HousingHouseSettingsFrame.HouseOwnerDropdown)
	elseif name == "Blizzard_HouseEditor" then
		HouseEditorFrame.StoragePanel.OptionsContainer.ScrollBar:SetSize(25, 560)
		HouseEditorFrame.StoragePanel.OptionsContainer.ScrollBar:ClearAllPoints()
		HouseEditorFrame.StoragePanel.OptionsContainer.ScrollBar:SetPoint("TOPLEFT", HouseEditorFrame.StoragePanel.OptionsContainer.ScrollBox, "TOPRIGHT", -2, 2)
		HouseEditorFrame.StoragePanel.OptionsContainer.ScrollBar:SetPoint("BOTTOMLEFT", HouseEditorFrame.StoragePanel.OptionsContainer.ScrollBox, "BOTTOMRIGHT", 2, -2)

		ApplyScrollBarArrow(HouseEditorFrame.StoragePanel.OptionsContainer.ScrollBar)
		ApplyScrollBarTrack(HouseEditorFrame.StoragePanel.OptionsContainer.ScrollBar.Track)
		ApplyScrollBarThumb(HouseEditorFrame.StoragePanel.OptionsContainer.ScrollBar.Track.Thumb)

		for i = 1, HouseEditorFrame.StoragePanel.TabSystem:GetNumChildren() do
			local tab = select(i, HouseEditorFrame.StoragePanel.TabSystem:GetChildren())

			ApplyBottomTab(tab)
		end

		ApplyFilterDropDown(HouseEditorFrame.StoragePanel.Filters.FilterDropdown)
	end
end)