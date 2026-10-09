local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_FlightMap" then
		ApplyCloseButton(FlightMapFrameCloseButton)

		FlightMapFramePortrait:SetSize(61, 61)
		FlightMapFramePortrait:ClearAllPoints()
		FlightMapFramePortrait:SetPoint("TOPLEFT", -6, 8)

		FlightMapFrame.BorderFrame.TitleContainer:ClearAllPoints()
		FlightMapFrame.BorderFrame.TitleContainer:SetPoint("TOPLEFT", FlightMapFrame, "TOPLEFT", 58, 0)
		FlightMapFrame.BorderFrame.TitleContainer:SetPoint("TOPRIGHT", FlightMapFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(FlightMapFrame)
		ApplyNineSlicePortrait(FlightMapFrame.BorderFrame)
	end
end)