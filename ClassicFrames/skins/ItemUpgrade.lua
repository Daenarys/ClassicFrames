local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ItemUpgradeUI" then
		ApplyDropDown(ItemUpgradeFrame.ItemInfo.Dropdown)
		ItemUpgradeFrame.ItemInfo.Dropdown.Text:SetJustifyH("RIGHT")
		ItemUpgradeFrame.ItemInfo.Dropdown.Text:SetPoint("TOPLEFT", 9, -6)
	end
end)