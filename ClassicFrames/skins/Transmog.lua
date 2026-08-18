local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Transmog" then
		hooksecurefunc(TransmogFrame.WardrobeCollection.TabContent.SituationsFrame, "Refresh", function(frame)
			for situationFrame in TransmogFrame.WardrobeCollection.TabContent.SituationsFrame.SituationFramePool:EnumerateActive() do
				ApplyDropDown(situationFrame.Dropdown)
			end
		end)

		ApplyDropDown(TransmogFrame.WardrobeCollection.TabContent.ItemsFrame.WeaponDropdown)
		ApplyDropDown(TransmogFrame.WardrobeCollection.TabContent.ItemsFrame.WeaponSheatheDropdown)
		ApplyDropDown(TransmogFrame.OutfitPopup.BorderBox.IconTypeDropdown)

		TransmogFrame.WardrobeCollection.TabContent.ItemsFrame.WeaponDropdown.Text:SetJustifyH("RIGHT")
		TransmogFrame.WardrobeCollection.TabContent.ItemsFrame.WeaponSheatheDropdown.Text:SetJustifyH("RIGHT")
		TransmogFrame.OutfitPopup.BorderBox.IconTypeDropdown.Text:SetJustifyH("RIGHT")

		ApplyFilterDropDown(TransmogFrame.WardrobeCollection.TabContent.ItemsFrame.FilterButton)
		ApplyFilterDropDown(TransmogFrame.WardrobeCollection.TabContent.SetsFrame.FilterButton)
	end
end)