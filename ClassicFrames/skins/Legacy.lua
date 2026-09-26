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

		ApplyTitleBg(LegacySystemFrame.NineSlice, false, true)
		ApplyNineSlicePortrait(LegacySystemFrame)

		ApplyScrollBarHybrid(LegacySystemFrame.ChallengesPage.CategoryList.ScrollBar, true)
		ApplyScrollBarThumb(LegacySystemFrame.ChallengesPage.CategoryList.ScrollBar.Track.Thumb)

		ApplyScrollBarHybrid(LegacySystemFrame.ChallengesPage.DetailPane.ScrollBar, true)
		ApplyScrollBarThumb(LegacySystemFrame.ChallengesPage.DetailPane.ScrollBar.Track.Thumb)

		ApplyFilterDropDown(LegacySystemFrame.ChallengesPage.CategoryList.FilterDropdown)

		ApplySideTab(LegacySystemFrame.LegacyRewardTrackTab)
		LegacySystemFrame.LegacyRewardTrackTab:SetPoint("TOPLEFT", LegacySystemFrame, "TOPRIGHT", 0, -36)

		ApplySideTab(LegacySystemFrame.LegacyChallengeTab)
		LegacySystemFrame.LegacyChallengeTab:SetPoint("TOPLEFT", LegacySystemFrame.LegacyRewardTrackTab, "BOTTOMLEFT", 0, -20)

		ApplySideTab(LegacySystemFrame.LegacyTreeTab)
		LegacySystemFrame.LegacyTreeTab:SetPoint("TOPLEFT", LegacySystemFrame.LegacyChallengeTab, "BOTTOMLEFT", 0, -20)
	end
end)