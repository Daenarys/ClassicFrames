local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AlliedRacesUI" then
		ApplyCloseButton(AlliedRacesFrameCloseButton)

		AlliedRacesFramePortrait:SetSize(61, 61)
		AlliedRacesFramePortrait:ClearAllPoints()
		AlliedRacesFramePortrait:SetPoint("TOPLEFT", -6, 8)

		AlliedRacesFrame.TitleContainer:ClearAllPoints()
		AlliedRacesFrame.TitleContainer:SetPoint("TOPLEFT", AlliedRacesFrame, "TOPLEFT", 58, 0)
		AlliedRacesFrame.TitleContainer:SetPoint("TOPRIGHT", AlliedRacesFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(AlliedRacesFrame)
		ApplyNineSlicePortrait(AlliedRacesFrame)

		ApplyScrollBarArrow(AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar)
		ApplyScrollBarTrack(AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar.Track)
		ApplyScrollBarThumb(AlliedRacesFrame.RaceInfoFrame.ScrollFrame.ScrollBar.Track.Thumb)
	end
end)