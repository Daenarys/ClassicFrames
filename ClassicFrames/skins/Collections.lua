local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Collections" then
		CollectionsJournalPortrait:SetSize(60, 60)
		CollectionsJournalPortrait:ClearAllPoints()
		CollectionsJournalPortrait:SetPoint("TOPLEFT", -6, 7)

		ApplyDropDown(HeirloomsJournal.ClassDropdown)
		ApplyDropDown(WardrobeCollectionFrame.ItemsCollectionFrame.WeaponDropdown)
		ApplyFilterDropDown(MountJournal.FilterDropdown)
		ApplyFilterDropDown(PetJournal.FilterDropdown)
		ApplyFilterDropDown(ToyBox.FilterDropdown)
		ApplyFilterDropDown(HeirloomsJournal.FilterDropdown)
		ApplyFilterDropDown(WardrobeCollectionFrame.FilterButton)
	end
end)