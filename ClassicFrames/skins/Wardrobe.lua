local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Collections" or name == "Blizzard_Wardrobe" then
		ApplyDropDown(WardrobeTransmogFrame.OutfitDropdown)
	end
end)

ApplyDialogBorder(WardrobeOutfitEditFrame.Border)