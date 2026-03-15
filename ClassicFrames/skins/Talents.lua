local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_PlayerSpells" then
		PlayerSpellsFrame.TalentsFrame.SearchBox:SetPoint("LEFT", PlayerSpellsFrame.TalentsFrame.LoadSystem, "RIGHT", -10, 1)
		ApplyDropDown(PlayerSpellsFrame.TalentsFrame.LoadSystem.Dropdown)
		PlayerSpellsFrame.TalentsFrame.LoadSystem.Dropdown:SetWidth(165)
		PlayerSpellsFrame.TalentsFrame.LoadSystem.Dropdown:SetPoint("LEFT", 3, 1)
		PlayerSpellsFrame.TalentsFrame.LoadSystem.Dropdown.Text:SetJustifyH("RIGHT")

	end
end)