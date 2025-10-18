local a = CreateFrame("Frame")
a:RegisterEvent("ADDON_LOADED")
a:SetScript("OnEvent", function(self, event, name)
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
	end
end)

local b = CreateFrame("Frame")
b:RegisterEvent("ADDON_LOADED")
b:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_HousingHouseFinder" then
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
	end
end)

local c = CreateFrame("Frame")
c:RegisterEvent("ADDON_LOADED")
c:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_HousingCornerstone" then
		if HousingCornerstoneVisitorFrame then
			HousingCornerstoneVisitorFrameCloseButton:SetSize(32, 32)
			HousingCornerstoneVisitorFrameCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			HousingCornerstoneVisitorFrameCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			HousingCornerstoneVisitorFrameCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			HousingCornerstoneVisitorFrameCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
			HousingCornerstoneVisitorFrameCloseButton:ClearAllPoints()
			HousingCornerstoneVisitorFrameCloseButton:SetPoint("TOPRIGHT", 4, 4)
		end
	end
end)

local d = CreateFrame("Frame")
d:RegisterEvent("ADDON_LOADED")
d:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_HousingHouseSettings" then
		HousingHouseSettingsFrame.CloseButton:SetSize(32, 32)
		HousingHouseSettingsFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		HousingHouseSettingsFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		HousingHouseSettingsFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		HousingHouseSettingsFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		HousingHouseSettingsFrame.CloseButton:ClearAllPoints()
		HousingHouseSettingsFrame.CloseButton:SetPoint("TOPRIGHT", -4, -4)

		ApplyDropDown(HousingHouseSettingsFrame.HouseOwnerDropdown)
	end
end)

local e = CreateFrame("Frame")
e:RegisterEvent("ADDON_LOADED")
e:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_HouseEditor" then
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