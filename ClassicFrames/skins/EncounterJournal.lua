local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_EncounterJournal" then
		ApplyDropDown(EncounterJournalInstanceSelect.ExpansionDropdown)

		ApplyEJDropDown(EncounterJournalEncounterFrameInfo.LootContainer.filter)
		EncounterJournalEncounterFrameInfo.LootContainer.filter:SetPoint("TOPLEFT", EncounterJournal, "TOPRIGHT", -361, -77)
		hooksecurefunc(EncounterJournalEncounterFrameInfo.LootContainer.filter, "UpdateText", function(self)
			self.Text:SetText(GEAR_FILTER)
		end)

		ApplyEJDropDown(EncounterJournalEncounterFrameInfo.LootContainer.slotFilter)
		EncounterJournalEncounterFrameInfo.LootContainer.slotFilter:SetPoint("LEFT", EncounterJournalEncounterFrameInfo.LootContainer.filter, "RIGHT", 9, 0)

		ApplyEJDropDown(EncounterJournalEncounterFrameInfoDifficulty)
		EncounterJournalEncounterFrameInfoDifficulty:SetPoint("TOPRIGHT", -6, -13)
	end
end)