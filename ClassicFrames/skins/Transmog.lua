local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Transmog" then
		ApplyCloseButton(TransmogFrameCloseButton)

		TransmogFramePortrait:SetSize(61, 61)
		TransmogFramePortrait:ClearAllPoints()
		TransmogFramePortrait:SetPoint("TOPLEFT", -6, 8)

		TransmogFrame.TitleContainer:ClearAllPoints()
		TransmogFrame.TitleContainer:SetPoint("TOPLEFT", TransmogFrame, "TOPLEFT", 58, 0)
		TransmogFrame.TitleContainer:SetPoint("TOPRIGHT", TransmogFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(TransmogFrame)
		ApplyNineSlicePortrait(TransmogFrame)
	end
end)