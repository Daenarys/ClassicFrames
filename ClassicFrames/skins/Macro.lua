local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_MacroUI" then
		MacroFrame.PortraitContainer.CircleMask:Hide()

		MacroFramePortrait:SetSize(61, 61)
		MacroFramePortrait:ClearAllPoints()
		MacroFramePortrait:SetPoint("TOPLEFT", -6, 8)

		MacroFramePortraitFrame:SetParent(MacroFrame.PortraitContainer)
		MacroFramePortraitFrame:SetDrawLayer("OVERLAY", 1)
		
		ApplyDropDown(MacroPopupFrame.BorderBox.IconTypeDropdown)
	end
end)