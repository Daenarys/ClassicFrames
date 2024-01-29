local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ItemUpgradeUI" then
		ApplyCloseButton(ItemUpgradeFrameCloseButton)

		ItemUpgradeFrame.PortraitContainer.CircleMask:Hide()

		ItemUpgradeFramePortrait:SetSize(61, 61)
		ItemUpgradeFramePortrait:ClearAllPoints()
		ItemUpgradeFramePortrait:SetPoint("TOPLEFT", -6, 8)

		ItemUpgradeFrame.TitleContainer:ClearAllPoints()
		ItemUpgradeFrame.TitleContainer:SetPoint("TOPLEFT", ItemUpgradeFrame, "TOPLEFT", 58, 0)
		ItemUpgradeFrame.TitleContainer:SetPoint("TOPRIGHT", ItemUpgradeFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(ItemUpgradeFrame)
		ApplyNineSlicePortrait(ItemUpgradeFrame)
	end
end)