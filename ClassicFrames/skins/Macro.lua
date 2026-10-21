local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_MacroUI" then
		ApplyDropDown(MacroPopupFrame.BorderBox.IconTypeDropdown)
		MacroPopupFrame.BorderBox.IconTypeDropdown.Text:SetJustifyH("RIGHT")
	end
end)