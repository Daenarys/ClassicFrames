local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ItemSocketingUI" then
		ItemSocketingFrame.PortraitContainer.CircleMask:Hide()

		ItemSocketingFramePortrait:SetSize(61, 61)
		ItemSocketingFramePortrait:ClearAllPoints()
		ItemSocketingFramePortrait:SetPoint("TOPLEFT", -6, 8)

		ItemSocketingFramePortraitFrame:SetParent(ItemSocketingFrame.PortraitContainer)
		ItemSocketingFramePortraitFrame:SetDrawLayer("OVERLAY", 1)
	end
end)