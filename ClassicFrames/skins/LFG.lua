local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_GroupFinder_VanillaStyle" then
		ApplyCloseButton(LFGParentFrameCloseButton)

		if LFGListingFrame then
			LFGListingFramePortrait:SetSize(61, 61)
			LFGListingFramePortrait:ClearAllPoints()
			LFGListingFramePortrait:SetPoint("TOPLEFT", -6, 8)

			LFGListingFrame.TitleContainer:ClearAllPoints()
			LFGListingFrame.TitleContainer:SetPoint("TOPLEFT", LFGListingFrame, "TOPLEFT", 58, 0)
			LFGListingFrame.TitleContainer:SetPoint("TOPRIGHT", LFGListingFrame, "TOPRIGHT", -58, 0)

			ApplyTitleBg(LFGListingFrame)
			ApplyNineSlicePortrait(LFGListingFrame)

			ApplyScrollBarHybrid(LFGListingFrameActivityViewScrollBar, true)
			ApplyScrollBarThumb(LFGListingFrameActivityViewScrollBar.Track.Thumb)

			ApplyDropDown(LFGListingFrameGroupRoleButtonsRoleDropdown)
		end
		if LFGBrowseFrame then
			LFGBrowseFramePortrait:SetSize(61, 61)
			LFGBrowseFramePortrait:ClearAllPoints()
			LFGBrowseFramePortrait:SetPoint("TOPLEFT", -6, 8)

			LFGBrowseFrame.TitleContainer:ClearAllPoints()
			LFGBrowseFrame.TitleContainer:SetPoint("TOPLEFT", LFGBrowseFrame, "TOPLEFT", 58, 0)
			LFGBrowseFrame.TitleContainer:SetPoint("TOPRIGHT", LFGBrowseFrame, "TOPRIGHT", -58, 0)

			ApplyTitleBg(LFGBrowseFrame)
			ApplyNineSlicePortrait(LFGBrowseFrame)

			ApplyScrollBarHybrid(LFGBrowseFrameScrollBar, true)
			ApplyScrollBarThumb(LFGBrowseFrameScrollBar.Track.Thumb)

			ApplyDropDown(LFGBrowseFrameActivityDropdown)
			ApplyDropDown(LFGBrowseFrameCategoryDropdown)
		end
		if LFGWhoListFrame then
			LFGWhoListFramePortrait:SetSize(61, 61)
			LFGWhoListFramePortrait:ClearAllPoints()
			LFGWhoListFramePortrait:SetPoint("TOPLEFT", -6, 8)

			LFGWhoListFrame.TitleContainer:ClearAllPoints()
			LFGWhoListFrame.TitleContainer:SetPoint("TOPLEFT", LFGWhoListFrame, "TOPLEFT", 58, 0)
			LFGWhoListFrame.TitleContainer:SetPoint("TOPRIGHT", LFGWhoListFrame, "TOPRIGHT", -58, 0)

			ApplyTitleBg(LFGWhoListFrame)
			ApplyNineSlicePortrait(LFGWhoListFrame)

			ApplyScrollBarHybrid(LFGWhoListFrame.ScrollBar, true)
			ApplyScrollBarThumb(LFGWhoListFrame.ScrollBar.Track.Thumb)

			ApplyFilterDropDown(LFGWhoListFrame.FilterDropdown)
		end
	end
end)