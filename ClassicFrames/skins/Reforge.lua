local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ReforgingUI" then
		ReforgingFrame.PortraitContainer.CircleMask:Hide()

		ReforgingFramePortrait:SetSize(61, 61)
		ReforgingFramePortrait:ClearAllPoints()
		ReforgingFramePortrait:SetPoint("TOPLEFT", -6, 8)

		ReforgingFramePortraitFrame:SetParent(ReforgingFrame.PortraitContainer)
		ReforgingFramePortraitFrame:SetDrawLayer("OVERLAY", 1)
	end
end)