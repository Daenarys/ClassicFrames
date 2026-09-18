if not _G.PetStableFrame then return end

ApplyCloseButton(PetStableFrameCloseButton)

PetStableFramePortrait:SetSize(61, 61)
PetStableFramePortrait:ClearAllPoints()
PetStableFramePortrait:SetPoint("TOPLEFT", -6, 8)

PetStableFrame.TitleContainer:ClearAllPoints()
PetStableFrame.TitleContainer:SetPoint("TOPLEFT", PetStableFrame, "TOPLEFT", 58, 0)
PetStableFrame.TitleContainer:SetPoint("TOPRIGHT", PetStableFrame, "TOPRIGHT", -58, 0)

ApplyTitleBg(PetStableFrame)
ApplyNineSlicePortrait(PetStableFrame)