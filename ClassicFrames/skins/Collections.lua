local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Collections" then
		ApplyCloseButton(CollectionsJournalCloseButton)

		CollectionsJournal.PortraitContainer.CircleMask:Hide()

		CollectionsJournalPortrait:SetSize(61, 61)
		CollectionsJournalPortrait:ClearAllPoints()
		CollectionsJournalPortrait:SetPoint("TOPLEFT", -6, 8)

		CollectionsJournal.TitleContainer:ClearAllPoints()
		CollectionsJournal.TitleContainer:SetPoint("TOPLEFT", CollectionsJournal, "TOPLEFT", 58, 0)
		CollectionsJournal.TitleContainer:SetPoint("TOPRIGHT", CollectionsJournal, "TOPRIGHT", -58, 0)

		PetJournalTutorialButton.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")
		WardrobeCollectionFrame.InfoButton.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

		ApplyTitleBg(CollectionsJournal)
		ApplyNineSlicePortrait(CollectionsJournal)

		CollectionsJournalTab2:ClearAllPoints()
		CollectionsJournalTab2:SetPoint("LEFT", CollectionsJournalTab1, "RIGHT", -16, 0)
		CollectionsJournalTab3:ClearAllPoints()
		CollectionsJournalTab3:SetPoint("LEFT", CollectionsJournalTab2, "RIGHT", -16, 0)
		CollectionsJournalTab4:ClearAllPoints()
		CollectionsJournalTab4:SetPoint("LEFT", CollectionsJournalTab3, "RIGHT", -16, 0)

		hooksecurefunc("CollectionsJournal_CheckAndDisplayHeirloomsTab", function()
			CollectionsJournalTab5:ClearAllPoints()
			if PlayerGetTimerunningSeasonID() then
				CollectionsJournalTab5:SetPoint("LEFT", CollectionsJournalTab3, "RIGHT", -16, 0)
			else
				CollectionsJournalTab5:SetPoint("LEFT", CollectionsJournalTab4, "RIGHT", -16, 0)
			end
		end)

		CollectionsJournalTab6:ClearAllPoints()
		CollectionsJournalTab6:SetPoint("LEFT", CollectionsJournalTab5, "RIGHT", -16, 0)

		for i = 1,6 do
			ApplyBottomTab(_G['CollectionsJournalTab'..i])

			_G["CollectionsJournalTab"..i]:HookScript("OnShow", function(self)
				self:SetWidth(40 + self:GetFontString():GetStringWidth())
			end)
		end

		WardrobeCollectionFrameTab2:ClearAllPoints()
		WardrobeCollectionFrameTab2:SetPoint("LEFT", WardrobeCollectionFrameTab1, "RIGHT")

		for i = 1, 2 do
			ApplyTopTab(_G['WardrobeCollectionFrameTab'..i])

			_G["WardrobeCollectionFrameTab"..i]:HookScript("OnShow", function(self)
				if _G["WardrobeCollectionFrameTab"..i] == WardrobeCollectionFrameTab1 then
					self:SetWidth(58 + self:GetFontString():GetStringWidth())
				elseif _G["WardrobeCollectionFrameTab"..i] == WardrobeCollectionFrameTab2 then
					self:SetWidth(66 + self:GetFontString():GetStringWidth())
				end
			end)
		end

		MountJournal.ScrollBar:SetSize(25, 560)
		MountJournal.ScrollBar:ClearAllPoints()
		MountJournal.ScrollBar:SetPoint("TOPLEFT", MountJournal.ScrollBox, "TOPRIGHT", 1, 36)
		MountJournal.ScrollBar:SetPoint("BOTTOMLEFT", MountJournal.ScrollBox, "BOTTOMRIGHT", 4, -4)

		if (MountJournal.ScrollBar.BG == nil) then
			MountJournal.ScrollBar.BG = MountJournal.ScrollBar:CreateTexture(nil, "BACKGROUND")
			MountJournal.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			MountJournal.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(MountJournal.ScrollBar)
		ApplyScrollBarTrack(MountJournal.ScrollBar.Track)
		ApplyScrollBarThumb(MountJournal.ScrollBar.Track.Thumb)

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

		WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar:SetSize(25, 560)
		WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar:ClearAllPoints()
		WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar:SetPoint("TOPLEFT", WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBox, "TOPRIGHT", 1, 36)
		WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar:SetPoint("BOTTOMLEFT", WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBox, "BOTTOMRIGHT", 4, -8)

		if (WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar.BG == nil) then
			WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar.BG = WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar:CreateTexture(nil, "BACKGROUND")
			WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar)
		ApplyScrollBarTrack(WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar.Track)
		ApplyScrollBarThumb(WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar.Track.Thumb)

		ApplySearchBox(MountJournalSearchBox)
		ApplySearchBox(PetJournalSearchBox)
		ApplySearchBox(ToyBox.searchBox)
		ApplySearchBox(HeirloomsJournalSearchBox)
		ApplySearchBox(WardrobeCollectionFrameSearchBox)

		ApplyDropDown(HeirloomsJournal.ClassDropdown)
		ApplyDropDown(WardrobeCollectionFrame.ClassDropdown)
		ApplyDropDown(WardrobeCollectionFrame.ItemsCollectionFrame.WeaponDropdown)
		ApplyDropDown(WardrobeCollectionFrame.SetsCollectionFrame.DetailsFrame.VariantSetsDropdown)

		ApplyFilterDropDown(MountJournal.FilterDropdown)
		ApplyFilterDropDown(PetJournal.FilterDropdown)
		ApplyFilterDropDown(ToyBox.FilterDropdown)
		ApplyFilterDropDown(HeirloomsJournal.FilterDropdown)
		ApplyFilterDropDown(WardrobeCollectionFrame.FilterButton)

		hooksecurefunc(WardrobeCollectionFrame, "SetContainer", function(self, parent)
			if parent == CollectionsJournal then
				self.ItemsCollectionFrame.ModelR1C1:SetPoint("TOP", -238, -85)
				self.ItemsCollectionFrame.PagingFrame:SetPoint("BOTTOM", 22, 38)
				self.ItemsCollectionFrame.SlotsFrame:SetPoint("TOPLEFT", 18, -20)
				self.ItemsCollectionFrame.WeaponDropdown:SetPoint("TOPRIGHT", -20, -23)
			end
		end)

		hooksecurefunc(WardrobeCollectionFrame, "SetTab", function(self)
			if self.activeFrame == self.ItemsCollectionFrame then
				self.ClassDropdown:Hide()
			elseif self.activeFrame == self.SetsCollectionFrame then
				self.ClassDropdown:Show()
			end
		end)
	end
end)