local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_NewPlayerExperienceGuide" then
		ApplyCloseButton(GuideFrameCloseButton)

		GuideFrame.PortraitContainer.CircleMask:Hide()

		GuideFramePortrait:SetSize(61, 61)
		GuideFramePortrait:ClearAllPoints()
		GuideFramePortrait:SetPoint("TOPLEFT", -6, 8)

		GuideFrame.TitleContainer:ClearAllPoints()
		GuideFrame.TitleContainer:SetPoint("TOPLEFT", GuideFrame, "TOPLEFT", 58, 0)
		GuideFrame.TitleContainer:SetPoint("TOPRIGHT", GuideFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(GuideFrame)
		ApplyNineSlicePortrait(GuideFrame)

		GuideFrame.ScrollFrame.ScrollBar:SetSize(25, 560)
		GuideFrame.ScrollFrame.ScrollBar:ClearAllPoints()
		GuideFrame.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", GuideFrame.ScrollFrame, "TOPRIGHT", -2, 70)
		GuideFrame.ScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", GuideFrame.ScrollFrame, "BOTTOMRIGHT", 1, -1)

		if (GuideFrame.ScrollFrame.ScrollBar.BG == nil) then
			GuideFrame.ScrollFrame.ScrollBar.BG = GuideFrame.ScrollFrame.ScrollBar:CreateTexture(nil, "BACKGROUND");
			GuideFrame.ScrollFrame.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			GuideFrame.ScrollFrame.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(GuideFrame.ScrollFrame.ScrollBar)
		ApplyScrollBarTrack(GuideFrame.ScrollFrame.ScrollBar.Track)
		ApplyScrollBarThumb(GuideFrame.ScrollFrame.ScrollBar.Track.Thumb)
	end
end)