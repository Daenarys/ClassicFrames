local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Collections" then
		MountJournal.ScrollBar:ClearAllPoints()
		MountJournal.ScrollBar:SetPoint("TOPLEFT", MountJournal.ScrollBox, "TOPRIGHT", 1, 36)
		MountJournal.ScrollBar:SetPoint("BOTTOMLEFT", MountJournal.ScrollBox, "BOTTOMRIGHT", 4, -4)

		PetJournal.ScrollBar:SetSize(25, 560)
		PetJournal.ScrollBar:ClearAllPoints()
		PetJournal.ScrollBar:SetPoint("TOPLEFT", PetJournal.ScrollBox, "TOPRIGHT", 1, 36)
		PetJournal.ScrollBar:SetPoint("BOTTOMLEFT", PetJournal.ScrollBox, "BOTTOMRIGHT", 4, -4)

		if (PetJournal.ScrollBar.BG == nil) then
			PetJournal.ScrollBar.BG = PetJournal.ScrollBar:CreateTexture(nil, "BACKGROUND")
			PetJournal.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			PetJournal.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(PetJournal.ScrollBar)
		ApplyScrollBarTrack(PetJournal.ScrollBar.Track)
		ApplyScrollBarThumb(PetJournal.ScrollBar.Track.Thumb)
		
		ApplyDropDown(HeirloomsJournal.ClassDropdown)
		ApplyDropDown(WardrobeCollectionFrame.ItemsCollectionFrame.WeaponDropdown)
		ApplyFilterDropDown(MountJournal.FilterDropdown)
		ApplyFilterDropDown(PetJournal.FilterDropdown)
		ApplyFilterDropDown(ToyBox.FilterDropdown)
		ApplyFilterDropDown(HeirloomsJournal.FilterDropdown)
		ApplyFilterDropDown(WardrobeCollectionFrame.FilterButton)

		ToyBox:HookScript("OnShow", function(self)
			SetPortraitToTexture(self:GetParent().portrait, "Interface\\Icons\\Trade_Archaeology_ChestofTinyGlassAnimals")
			self:GetParent().portrait:SetTexCoord(0, 1, 0, 1)
		end)
		HeirloomsJournal:HookScript("OnShow", function(self)
			self:GetParent().portrait:SetTexCoord(0, 1, 0, 1)
		end)
		WardrobeCollectionFrame:HookScript("OnShow", function(self)
			self:GetParent().portrait:SetTexCoord(0, 1, 0, 1)
		end)
	end
end)