local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AzeriteRespecUI" then
		ApplyCloseButton(AzeriteRespecFrameCloseButton)

		AzeriteRespecFrame.PortraitContainer.CircleMask:Hide()

		AzeriteRespecFramePortrait:SetSize(61, 61)
		AzeriteRespecFramePortrait:ClearAllPoints()
		AzeriteRespecFramePortrait:SetPoint("TOPLEFT", -6, 8)

		AzeriteRespecFrame.TitleContainer:ClearAllPoints()
		AzeriteRespecFrame.TitleContainer:SetPoint("TOPLEFT", AzeriteRespecFrame, "TOPLEFT", 58, 0)
		AzeriteRespecFrame.TitleContainer:SetPoint("TOPRIGHT", AzeriteRespecFrame, "TOPRIGHT", -58, 0)

		ApplyNineSlicePortrait(AzeriteRespecFrame)
	end
end)