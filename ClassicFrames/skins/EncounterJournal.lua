local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_EncounterJournal" then
		ApplyDropDown(EncounterJournal.LootJournalViewDropdown)
		ApplyDropDown(EncounterJournal.LootJournal.ClassDropdown)
		ApplyDropDown(EncounterJournal.LootJournal.RuneforgePowerDropdown)
		ApplyDropDown(EncounterJournal.LootJournalItems.ItemSetsFrame.ClassDropdown)
		ApplyDropDown(EncounterJournalInstanceSelect.ExpansionDropdown)
		ApplyDropDown(EncounterJournalEncounterFrameInfo.LootContainer.filter)
		ApplyDropDown(EncounterJournalEncounterFrameInfo.LootContainer.slotFilter)
		ApplyDropDown(EncounterJournalEncounterFrameInfoDifficulty)
	end
end)