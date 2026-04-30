local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TorghastLevelPicker" then
		ApplyCloseButton(TorghastLevelPickerFrame.CloseButton, true)
	end
end)