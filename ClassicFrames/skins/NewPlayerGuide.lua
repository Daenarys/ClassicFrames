local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_NewPlayerExperienceGuide" then
		ApplyCloseButton(GuideFrameCloseButton)

		GuideFramePortrait:SetSize(61, 61)
		GuideFramePortrait:ClearAllPoints()
		GuideFramePortrait:SetPoint("TOPLEFT", -6, 8)

		GuideFrame.TitleContainer:ClearAllPoints()
		GuideFrame.TitleContainer:SetPoint("TOPLEFT", GuideFrame, "TOPLEFT", 58, 0)
		GuideFrame.TitleContainer:SetPoint("TOPRIGHT", GuideFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(GuideFrame)
		ApplyNineSlicePortrait(GuideFrame)

		ApplyScrollBarArrow(GuideFrame.ScrollFrame.ScrollBar)
		ApplyScrollBarTrack(GuideFrame.ScrollFrame.ScrollBar.Track)
		ApplyScrollBarThumb(GuideFrame.ScrollFrame.ScrollBar.Track.Thumb)
	end
end)