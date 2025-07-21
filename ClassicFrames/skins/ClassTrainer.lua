local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TrainerUI" then
		ClassTrainerFrameCloseButton:SetPoint("TOPRIGHT", -30, -8)

		ApplyFilterDropDown(ClassTrainerFrame.FilterDropdown)
	end
end)