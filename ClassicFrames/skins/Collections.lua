local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Collections" then
		if CollectionsJournalTab6 then
			CollectionsJournalTab6:Hide()
		end

		ApplyDropDown(HeirloomsJournal.ClassDropdown)
		ApplyDropDown(WardrobeCollectionFrame.ClassDropdown)
		ApplyDropDown(WardrobeCollectionFrame.ItemsCollectionFrame.WeaponDropdown)
		ApplyDropDown(WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantSetsDropdown)

		ApplyFilterDropDown(MountJournal.FilterDropdown)
		ApplyFilterDropDown(PetJournal.FilterDropdown)
		ApplyFilterDropDown(ToyBox.FilterDropdown)
		ApplyFilterDropDown(HeirloomsJournal.FilterDropdown)
		ApplyFilterDropDown(WardrobeCollectionFrame.FilterButton)

		HeirloomsJournal.ClassDropdown:SetWidth(155)
		HeirloomsJournal.ClassDropdown:SetPoint("TOPLEFT", 72, -31)
		HeirloomsJournal.ClassDropdown.Text:SetJustifyH("RIGHT")
		HeirloomsJournal.ClassDropdown.Text:SetPoint("TOPLEFT", 9, -8)
		WardrobeCollectionFrame.ItemsCollectionFrame.WeaponDropdown:SetWidth(155)
		WardrobeCollectionFrame.ItemsCollectionFrame.WeaponDropdown.Text:SetJustifyH("RIGHT")

		hooksecurefunc(WardrobeCollectionFrame, "SetTab", function(self, tabID)
			if tabID == WARDROBE_TAB_ITEMS then
				self.ClassDropdown:Hide()
				self.ItemsCollectionFrame.ModelR1C1:SetPoint("TOP", -238, -85)
				self.ItemsCollectionFrame.PagingFrame:SetPoint("BOTTOM", 22, 38)
				self.ItemsCollectionFrame.SlotsFrame:SetPoint("TOPLEFT", 18, -20)
				self.ItemsCollectionFrame.WeaponDropdown:SetEnabled(false)
				self.ItemsCollectionFrame.WeaponDropdown:SetPoint("TOPRIGHT", -23, -23)
			elseif tabID == WARDROBE_TAB_SETS then
				self.ClassDropdown:Show()
			end
		end)

		hooksecurefunc(WardrobeCollectionFrame.ItemsCollectionFrame, "SetActiveCategory", function(self)
			local _name, isActiveCategoryWeapon;
			if self.transmogLocation:IsAppearance() then
				_name, isActiveCategoryWeapon = C_TransmogCollection.GetCategoryInfo(self:GetActiveCategory())
			end

			self.WeaponDropdown:Show()

			if not isActiveCategoryWeapon then
				self.WeaponDropdown:SetEnabled(false)
			else
				self.WeaponDropdown:SetEnabled(true)
			end
		end)

		hooksecurefunc("CollectionsJournal_UpdateSelectedTab", function(self)
			local selected = CollectionsJournal_GetTab(self)
			if selected == 5 then
				WardrobeCollectionFrame.ItemsCollectionFrame.WeaponDropdown:SetEnabled(false)
			end
		end)
	end
end)