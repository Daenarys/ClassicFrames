if not _G.StableFrame then return end

ApplyCloseButton(StableFrameCloseButton)

StableFramePortrait:SetSize(61, 61)
StableFramePortrait:ClearAllPoints()
StableFramePortrait:SetPoint("TOPLEFT", -6, 8)

StableFrame.TitleContainer:ClearAllPoints()
StableFrame.TitleContainer:SetPoint("TOPLEFT", StableFrame, "TOPLEFT", 58, 0)
StableFrame.TitleContainer:SetPoint("TOPRIGHT", StableFrame, "TOPRIGHT", -58, 0)

StableFrame.MainHelpButton.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

ApplyTitleBg(StableFrame)
ApplyNineSlicePortrait(StableFrame)

ApplyScrollBarArrow(StableFrame.StabledPetList.ScrollBar)
ApplyScrollBarTrack(StableFrame.StabledPetList.ScrollBar.Track)
ApplyScrollBarThumb(StableFrame.StabledPetList.ScrollBar.Track.Thumb)

ApplyDropDown(StableFrame.PetModelScene.PetInfo.Specialization)
ApplyFilterDropDown(StableFrame.StabledPetList.FilterBar.FilterDropdown)