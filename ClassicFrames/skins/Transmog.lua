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

		TransmogFrame.CharacterPreview.HideIgnoredToggle.Checkbox:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
		TransmogFrame.CharacterPreview.HideIgnoredToggle.Checkbox:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
		TransmogFrame.CharacterPreview.HideIgnoredToggle.Checkbox:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
		TransmogFrame.CharacterPreview.HideIgnoredToggle.Checkbox:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
		TransmogFrame.CharacterPreview.HideIgnoredToggle.Checkbox:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")

		TransmogFrame.WardrobeCollection.TabContent.ItemsFrame.SecondaryAppearanceToggle.Checkbox:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
		TransmogFrame.WardrobeCollection.TabContent.ItemsFrame.SecondaryAppearanceToggle.Checkbox:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
		TransmogFrame.WardrobeCollection.TabContent.ItemsFrame.SecondaryAppearanceToggle.Checkbox:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
		TransmogFrame.WardrobeCollection.TabContent.ItemsFrame.SecondaryAppearanceToggle.Checkbox:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
		TransmogFrame.WardrobeCollection.TabContent.ItemsFrame.SecondaryAppearanceToggle.Checkbox:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")

		TransmogFrame.WardrobeCollection.TabContent.SituationsFrame.EnabledToggle.Checkbox:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
		TransmogFrame.WardrobeCollection.TabContent.SituationsFrame.EnabledToggle.Checkbox:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
		TransmogFrame.WardrobeCollection.TabContent.SituationsFrame.EnabledToggle.Checkbox:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
		TransmogFrame.WardrobeCollection.TabContent.SituationsFrame.EnabledToggle.Checkbox:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
		TransmogFrame.WardrobeCollection.TabContent.SituationsFrame.EnabledToggle.Checkbox:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")

		for i = 1, TransmogFrame.WardrobeCollection.TabHeaders:GetNumChildren() do
			local tab = select(i, TransmogFrame.WardrobeCollection.TabHeaders:GetChildren())

			ApplyTopTabNew(tab)
		end

		TransmogFrame.OutfitCollection.OutfitList.ScrollBar:SetSize(25, 560)
		TransmogFrame.OutfitCollection.OutfitList.ScrollBar:SetPoint("RIGHT", TransmogFrame.OutfitCollection.OutfitList, "RIGHT", 4, 0)

		if (TransmogFrame.OutfitCollection.OutfitList.ScrollBar.BG == nil) then
			TransmogFrame.OutfitCollection.OutfitList.ScrollBar.BG = TransmogFrame.OutfitCollection.OutfitList.ScrollBar:CreateTexture(nil, "BACKGROUND")
			TransmogFrame.OutfitCollection.OutfitList.ScrollBar.BG:SetColorTexture(0, 0, 0, .1)
			TransmogFrame.OutfitCollection.OutfitList.ScrollBar.BG:SetAllPoints()
		end

		TransmogFrame.OutfitCollection.OutfitList.ScrollBar.Track:ClearAllPoints()
		TransmogFrame.OutfitCollection.OutfitList.ScrollBar.Track:SetPoint("TOPLEFT", 4, -22)
		TransmogFrame.OutfitCollection.OutfitList.ScrollBar.Track:SetPoint("BOTTOMRIGHT", -4, 22)

		TransmogFrame.OutfitCollection.OutfitList.ScrollBar.Track.Begin:Hide()
		TransmogFrame.OutfitCollection.OutfitList.ScrollBar.Track.End:Hide()
		TransmogFrame.OutfitCollection.OutfitList.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(TransmogFrame.OutfitCollection.OutfitList.ScrollBar)
		ApplyScrollBarThumb(TransmogFrame.OutfitCollection.OutfitList.ScrollBar.Track.Thumb)

		hooksecurefunc(TransmogFrame.WardrobeCollection.TabContent.SituationsFrame, "Refresh", function(frame)
			for situationFrame in TransmogFrame.WardrobeCollection.TabContent.SituationsFrame.SituationFramePool:EnumerateActive() do
				ApplyDropDown(situationFrame.Dropdown)
			end
		end)

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
	end
end)