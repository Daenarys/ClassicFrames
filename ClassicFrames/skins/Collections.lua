local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Collections" then
		ApplyCloseButton(CollectionsJournalCloseButton)

		CollectionsJournalPortrait:SetSize(61, 61)
		CollectionsJournalPortrait:ClearAllPoints()
		CollectionsJournalPortrait:SetPoint("TOPLEFT", -6, 8)

		CollectionsJournal.TitleContainer:ClearAllPoints()
		CollectionsJournal.TitleContainer:SetPoint("TOPLEFT", CollectionsJournal, "TOPLEFT", 58, 0)
		CollectionsJournal.TitleContainer:SetPoint("TOPRIGHT", CollectionsJournal, "TOPRIGHT", -58, 0)

		ApplyTitleBg(CollectionsJournal)
		ApplyNineSlicePortrait(CollectionsJournal)

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

		WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar:ClearAllPoints()
		WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar:SetPoint("TOPLEFT", WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBox, "TOPRIGHT", 10, 34)
		WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar:SetPoint("BOTTOMLEFT", WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBox, "BOTTOMRIGHT", 10, -7)

		ApplyScrollBarHybrid(WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar, true, true)
		ApplyScrollBarThumb(WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar.Track.Thumb)

		ApplyDropDown(WardrobeCollectionFrame.ItemsCollectionFrame.WeaponDropdown)

		WardrobeCollectionFrame.ItemsCollectionFrame.WeaponDropdown:SetWidth(155)
		WardrobeCollectionFrame.ItemsCollectionFrame.WeaponDropdown.Text:SetJustifyH("RIGHT")

		ApplyFilterDropDown(WardrobeCollectionFrame.FilterButton)

		hooksecurefunc(WardrobeCollectionFrame, "SetTab", function(self, tabID)
			if tabID == WARDROBE_TAB_ITEMS then
				self.ItemsCollectionFrame.ModelR1C1:SetPoint("TOP", -238, -85)
				self.ItemsCollectionFrame.PagingFrame:SetPoint("BOTTOM", 22, 38)
				self.ItemsCollectionFrame.SlotsFrame:SetPoint("TOPLEFT", 18, -20)
				self.ItemsCollectionFrame.WeaponDropdown:SetPoint("TOPRIGHT", -23, -23)
			end
			self.ClassDropdown:Hide()
		end)

		hooksecurefunc("CollectionsJournal_CheckAndDisplayTabs", function()
			local prevTab
			for _, tab in ipairs(CollectionsJournal.TabContainer.Tabs) do
				ApplySideTab(tab)

				tab:ClearAllPoints()
				if prevTab then
					tab:SetPoint("TOPLEFT", prevTab, "BOTTOMLEFT", 0, -20)
				else
					tab:SetPoint("TOPLEFT", CollectionsJournal.TabContainer, "TOPLEFT", 0, -36)
				end
				prevTab = tab
			end
		end)
	end
end)