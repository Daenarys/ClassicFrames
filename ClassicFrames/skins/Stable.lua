if not _G.StableFrame then return end

ApplyCloseButton(StableFrameCloseButton)

StableFrame.PortraitContainer.CircleMask:Hide()

StableFramePortrait:SetSize(61, 61)
StableFramePortrait:ClearAllPoints()
StableFramePortrait:SetPoint("TOPLEFT", -6, 8)

StableFrame.TitleContainer:ClearAllPoints()
StableFrame.TitleContainer:SetPoint("TOPLEFT", StableFrame, "TOPLEFT", 58, 0)
StableFrame.TitleContainer:SetPoint("TOPRIGHT", StableFrame, "TOPRIGHT", -58, 0)

StableFrame.MainHelpButton.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

ApplyTitleBg(StableFrame)
ApplyNineSlicePortrait(StableFrame)

StableFrame.StabledPetList.ScrollBar:SetSize(25, 560)
StableFrame.StabledPetList.ScrollBar:ClearAllPoints()
StableFrame.StabledPetList.ScrollBar:SetPoint("TOPLEFT", StableFrame.StabledPetList.ScrollBox, "TOPRIGHT", -7, 6)
StableFrame.StabledPetList.ScrollBar:SetPoint("BOTTOMLEFT", StableFrame.StabledPetList.ScrollBox, "BOTTOMRIGHT", -7, -1)

ApplyScrollBarArrow(StableFrame.StabledPetList.ScrollBar)
ApplyScrollBarTrack(StableFrame.StabledPetList.ScrollBar.Track)
ApplyScrollBarThumb(StableFrame.StabledPetList.ScrollBar.Track.Thumb)

if (StableFrame.StabledPetList.ScrollBar.BG == nil) then
	StableFrame.StabledPetList.ScrollBar.BG = StableFrame.StabledPetList.ScrollBar:CreateTexture(nil, "BACKGROUND")
	StableFrame.StabledPetList.ScrollBar.BG:SetColorTexture(0, 0, 0, 0.75)
	StableFrame.StabledPetList.ScrollBar.BG:SetAllPoints()
end

ApplySearchBox(StableFrame.StabledPetList.FilterBar.SearchBox)
ApplyFilterDropDown(StableFrame.StabledPetList.FilterBar.FilterDropdown)