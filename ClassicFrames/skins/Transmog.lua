local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Transmog" then
		ApplyCloseButton(TransmogFrameCloseButton)

		TransmogFramePortrait:SetSize(61, 61)
		TransmogFramePortrait:ClearAllPoints()
		TransmogFramePortrait:SetPoint("TOPLEFT", -6, 8)

		TransmogFrame.TitleContainer:ClearAllPoints()
		TransmogFrame.TitleContainer:SetPoint("TOPLEFT", TransmogFrame, "TOPLEFT", 58, 0)
		TransmogFrame.TitleContainer:SetPoint("TOPRIGHT", TransmogFrame, "TOPRIGHT", -58, 0)

		TransmogFrame.HelpPlateButton.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

		ApplyTitleBg(TransmogFrame)
		ApplyNineSlicePortrait(TransmogFrame)

		for i = 1, TransmogFrame.WardrobeCollection.TabHeaders:GetNumChildren() do
			local tab = select(i, TransmogFrame.WardrobeCollection.TabHeaders:GetChildren())

			ApplyTopTabNew(tab)
		end

		TransmogFrame.OutfitCollection.OutfitList.ScrollBar.Track.Begin:Hide()
		TransmogFrame.OutfitCollection.OutfitList.ScrollBar.Track.End:Hide()
		TransmogFrame.OutfitCollection.OutfitList.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(TransmogFrame.OutfitCollection.OutfitList.ScrollBar, true)
		ApplyScrollBarThumb(TransmogFrame.OutfitCollection.OutfitList.ScrollBar.Track.Thumb)

		ApplyCheckBox(TransmogFrame.CharacterPreview.ToggleOptions.HideIgnoredToggle.Checkbox)
		ApplyCheckBox(TransmogFrame.CharacterPreview.ToggleOptions.SheatheWeaponToggle.Checkbox)
		ApplyCheckBox(TransmogFrame.WardrobeCollection.TabContent.ItemsFrame.SecondaryAppearanceToggle.Checkbox)
		ApplyCheckBox(TransmogFrame.WardrobeCollection.TabContent.SituationsFrame.EnabledToggle.Checkbox)

		hooksecurefunc(TransmogFrame.WardrobeCollection.TabContent.SituationsFrame, "Refresh", function(frame)
			for situationFrame in TransmogFrame.WardrobeCollection.TabContent.SituationsFrame.SituationFramePool:EnumerateActive() do
				ApplyDropDown(situationFrame.Dropdown)
			end
		end)

		ApplyDropDown(TransmogFrame.WardrobeCollection.TabContent.ItemsFrame.WeaponDropdown)
		ApplyDropDown(TransmogFrame.WardrobeCollection.TabContent.ItemsFrame.WeaponSheatheDropdown)

		TransmogFrame.WardrobeCollection.TabContent.ItemsFrame.WeaponDropdown.Text:SetJustifyH("RIGHT")
		TransmogFrame.WardrobeCollection.TabContent.ItemsFrame.WeaponSheatheDropdown.Text:SetJustifyH("RIGHT")

		ApplyFilterDropDown(TransmogFrame.WardrobeCollection.TabContent.ItemsFrame.FilterButton)
		ApplyFilterDropDown(TransmogFrame.WardrobeCollection.TabContent.SetsFrame.FilterButton)

		TransmogFrame.OutfitPopup.IconSelector.ScrollBar:SetSize(25, 560)
		TransmogFrame.OutfitPopup.IconSelector.ScrollBar:ClearAllPoints()
		TransmogFrame.OutfitPopup.IconSelector.ScrollBar:SetPoint("TOPLEFT", TransmogFrame.OutfitPopup.IconSelector, "TOPRIGHT", -28, 3)
		TransmogFrame.OutfitPopup.IconSelector.ScrollBar:SetPoint("BOTTOMLEFT", TransmogFrame.OutfitPopup.IconSelector, "BOTTOMRIGHT", -25, -3)

		ApplyScrollBarArrow(TransmogFrame.OutfitPopup.IconSelector.ScrollBar)
		ApplyScrollBarTrack(TransmogFrame.OutfitPopup.IconSelector.ScrollBar.Track)
		ApplyScrollBarThumb(TransmogFrame.OutfitPopup.IconSelector.ScrollBar.Track.Thumb)

		ApplyDropDown(TransmogFrame.OutfitPopup.BorderBox.IconTypeDropdown)
		TransmogFrame.OutfitPopup.BorderBox.IconTypeDropdown.Text:SetJustifyH("RIGHT")
	end
end)