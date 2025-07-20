local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Collections" or name == "Blizzard_Wardrobe" then
		WardrobeFrame.PortraitContainer.CircleMask:Hide()

		WardrobeFramePortrait:SetSize(61, 61)
		WardrobeFramePortrait:ClearAllPoints()
		WardrobeFramePortrait:SetPoint("TOPLEFT", -6, 8)

		WardrobeFramePortraitFrame:SetParent(WardrobeFrame.PortraitContainer)
		WardrobeFramePortraitFrame:SetDrawLayer("OVERLAY", 1)
		
		ApplyDropDown(WardrobeTransmogFrame.OutfitDropdown)
	end
end)

ApplyDialogBorder(WardrobeOutfitEditFrame.Border)