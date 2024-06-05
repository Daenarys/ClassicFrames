local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ProfessionsBook" then
		ApplyCloseButton(ProfessionsBookFrameCloseButton)

		ProfessionsBookFrame.PortraitContainer.CircleMask:Hide()

		ProfessionsBookFramePortrait:SetSize(61, 61)
		ProfessionsBookFramePortrait:ClearAllPoints()
		ProfessionsBookFramePortrait:SetPoint("TOPLEFT", -6, 8)

		ProfessionsBookFrame.TitleContainer:ClearAllPoints()
		ProfessionsBookFrame.TitleContainer:SetPoint("TOPLEFT", ProfessionsBookFrame, "TOPLEFT", 58, 0)
		ProfessionsBookFrame.TitleContainer:SetPoint("TOPRIGHT", ProfessionsBookFrame, "TOPRIGHT", -58, 0)

		ProfessionsBookFrameTutorialButton.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

		ApplyTitleBg(ProfessionsBookFrame)
		ApplyNineSlicePortrait(ProfessionsBookFrame)
	end
end)