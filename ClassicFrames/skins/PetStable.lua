if not _G.PetStableFrame then return end

ApplyCloseButton(PetStableFrameCloseButton)

PetStableFrame.PortraitContainer.CircleMask:Hide()

PetStableFramePortrait:SetSize(61, 61)
PetStableFramePortrait:ClearAllPoints()
PetStableFramePortrait:SetPoint("TOPLEFT", -6, 8)

PetStableFrame.TitleContainer:ClearAllPoints()
PetStableFrame.TitleContainer:SetPoint("TOPLEFT", PetStableFrame, "TOPLEFT", 58, 1)
PetStableFrame.TitleContainer:SetPoint("TOPRIGHT", PetStableFrame, "TOPRIGHT", -58, 1)

ApplyTitleBg(PetStableFrame)
ApplyNineSlicePortrait(PetStableFrame)