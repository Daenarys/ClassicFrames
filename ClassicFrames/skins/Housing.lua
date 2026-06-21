local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_HousingModelPreview" then
		ApplyCloseButton(HousingModelPreviewFrameCloseButton)

		HousingModelPreviewFrame.TitleContainer:ClearAllPoints()
		HousingModelPreviewFrame.TitleContainer:SetPoint("TOPLEFT", HousingModelPreviewFrame, "TOPLEFT", 58, 0)
		HousingModelPreviewFrame.TitleContainer:SetPoint("TOPRIGHT", HousingModelPreviewFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(HousingModelPreviewFrame, true)
		ApplyNineSliceNoPortrait(HousingModelPreviewFrame)
	end
end)