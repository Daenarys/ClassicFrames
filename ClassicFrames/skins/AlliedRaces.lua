local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AlliedRacesUI" then
		ApplyCloseButton(AlliedRacesFrameCloseButton)

		AlliedRacesFrame.PortraitContainer.CircleMask:Hide()

		AlliedRacesFramePortrait:SetSize(61, 61)
		AlliedRacesFramePortrait:ClearAllPoints()
		AlliedRacesFramePortrait:SetPoint("TOPLEFT", -6, 8)

		AlliedRacesFrame.TitleContainer:ClearAllPoints()
		AlliedRacesFrame.TitleContainer:SetPoint("TOPLEFT", AlliedRacesFrame, "TOPLEFT", 58, 0)
		AlliedRacesFrame.TitleContainer:SetPoint("TOPRIGHT", AlliedRacesFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(AlliedRacesFrame)
		ApplyNineSlicePortrait(AlliedRacesFrame)

		AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar:SetSize(25, 560)
		AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar:ClearAllPoints()
		AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", AlliedRacesFrame.RaceInfoFrame.ScrollFrame, "TOPRIGHT", -2, 59)
		AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", AlliedRacesFrame.RaceInfoFrame.ScrollFrame, "BOTTOMRIGHT", -2, -5)

		if (AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar.BG == nil) then
			AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar.BG = AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar:CreateTexture(nil, "BACKGROUND");
			AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar.BG:SetColorTexture(0, 0, 0, 1)
			AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar)
		ApplyScrollBarTrack(AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar.Track)
		ApplyScrollBarThumb(AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar.Track.Thumb)
	end
end)