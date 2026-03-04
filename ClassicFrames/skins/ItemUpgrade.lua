local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ItemUpgradeUI" then
		ApplyDropDown(ItemUpgradeFrame.ItemInfo.Dropdown)
	end
end)