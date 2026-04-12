local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TrainerUI" then
		ApplyCloseButton(ClassTrainerFrameCloseButton)

		ClassTrainerFramePortrait:SetSize(61, 61)
		ClassTrainerFramePortrait:ClearAllPoints()
		ClassTrainerFramePortrait:SetPoint("TOPLEFT", -6, 8)

		ClassTrainerFrame.TitleContainer:ClearAllPoints()
		ClassTrainerFrame.TitleContainer:SetPoint("TOPLEFT", ClassTrainerFrame, "TOPLEFT", 58, 0)
		ClassTrainerFrame.TitleContainer:SetPoint("TOPRIGHT", ClassTrainerFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(ClassTrainerFrame)
		ApplyNineSlicePortrait(ClassTrainerFrame)

		ClassTrainerFrame.ScrollBar:ClearAllPoints()
		ClassTrainerFrame.ScrollBar:SetPoint("TOPLEFT", ClassTrainerFrame.ScrollBox, "TOPRIGHT", 7, 2)
		ClassTrainerFrame.ScrollBar:SetPoint("BOTTOMLEFT", ClassTrainerFrame.ScrollBox, "BOTTOMRIGHT", 7, -1)

		ApplyScrollBarHybrid(ClassTrainerFrame.ScrollBar)
		ApplyScrollBarThumb(ClassTrainerFrame.ScrollBar.Track.Thumb)

		ApplyFilterDropDown(ClassTrainerFrame.FilterDropdown)
	end
end)