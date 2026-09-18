local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_LegacySystem" then
		ApplyCloseButton(LegacySystemFrameCloseButton)

		LegacySystemFramePortrait:SetSize(61, 61)
		LegacySystemFramePortrait:ClearAllPoints()
		LegacySystemFramePortrait:SetPoint("TOPLEFT", -6, 8)

		LegacySystemFrame.TitleContainer:ClearAllPoints()
		LegacySystemFrame.TitleContainer:SetPoint("TOPLEFT", LegacySystemFrame, "TOPLEFT", 58, 0)
		LegacySystemFrame.TitleContainer:SetPoint("TOPRIGHT", LegacySystemFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(LegacySystemFrame)
		ApplyNineSlicePortrait(LegacySystemFrame)
	end
end)