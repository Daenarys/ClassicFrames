local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_InspectUI" then
		InspectFrame.PortraitContainer.CircleMask:Hide()

		InspectFramePortrait:SetSize(61, 61)
		InspectFramePortrait:ClearAllPoints()
		InspectFramePortrait:SetPoint("TOPLEFT", -6, 8)

		InspectFramePortraitFrame:SetParent(InspectFrame.PortraitContainer)
		InspectFramePortraitFrame:SetDrawLayer("OVERLAY", 1)
	end
end)