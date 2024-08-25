local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TrainerUI" then
		ApplyCloseButton(ClassTrainerFrameCloseButton)

		ClassTrainerFrame.PortraitContainer.CircleMask:Hide()

		ClassTrainerFramePortrait:SetSize(61, 61)
		ClassTrainerFramePortrait:ClearAllPoints()
		ClassTrainerFramePortrait:SetPoint("TOPLEFT", -6, 8)

		ClassTrainerFrame.TitleContainer:ClearAllPoints()
		ClassTrainerFrame.TitleContainer:SetPoint("TOPLEFT", ClassTrainerFrame, "TOPLEFT", 58, 0)
		ClassTrainerFrame.TitleContainer:SetPoint("TOPRIGHT", ClassTrainerFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(ClassTrainerFrame)
		ApplyNineSlicePortrait(ClassTrainerFrame)

		ClassTrainerFrame.ScrollBar:SetSize(25, 560)
		ClassTrainerFrame.ScrollBar:ClearAllPoints()
		ClassTrainerFrame.ScrollBar:SetPoint("TOPLEFT", ClassTrainerFrame.ScrollBox, "TOPRIGHT", -1, 3)
		ClassTrainerFrame.ScrollBar:SetPoint("BOTTOMLEFT", ClassTrainerFrame.ScrollBox, "BOTTOMRIGHT", 2, -4)

		ApplyScrollBarArrow(ClassTrainerFrame.ScrollBar)
		ApplyScrollBarTrack(ClassTrainerFrame.ScrollBar.Track)
		ApplyScrollBarThumb(ClassTrainerFrame.ScrollBar.Track.Thumb)

		ApplyFilterDropDown(ClassTrainerFrame.FilterDropdown)
	end
end)