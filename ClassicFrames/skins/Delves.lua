local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_DelvesDifficultyPicker" then
		ApplyDropDown(DelvesDifficultyPickerFrame.Dropdown)
	end
end)

if DelvesCompanionAbilityListFrame then
	ApplyDropDown(DelvesCompanionAbilityListFrame.DelvesCompanionRoleDropdown)
	DelvesCompanionAbilityListFrame.DelvesCompanionRoleDropdown.Text:SetJustifyH("RIGHT")
end