if not _G.PetStableFrame then return end

PetStableFrame.PortraitContainer.CircleMask:Hide()

PetStableFramePortrait:SetSize(61, 61)
PetStableFramePortrait:ClearAllPoints()
PetStableFramePortrait:SetPoint("TOPLEFT", -6, 8)

PetStableFramePortraitFrame:SetParent(PetStableFrame.PortraitContainer)
PetStableFramePortraitFrame:SetDrawLayer("OVERLAY", 1)