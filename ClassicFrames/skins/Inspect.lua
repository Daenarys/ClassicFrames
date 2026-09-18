local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_InspectUI" then
		ApplyCloseButton(InspectFrameCloseButton)

		InspectFramePortrait:SetSize(61, 61)
		InspectFramePortrait:ClearAllPoints()
		InspectFramePortrait:SetPoint("TOPLEFT", -6, 8)

		InspectFrame.TitleContainer:ClearAllPoints()
		InspectFrame.TitleContainer:SetPoint("TOPLEFT", InspectFrame, "TOPLEFT", 58, 0)
		InspectFrame.TitleContainer:SetPoint("TOPRIGHT", InspectFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(InspectFrame)
		ApplyNineSlicePortrait(InspectFrame)
	end
end)