if not _G.DressUpFrame then return end

DressUpFrame.PortraitContainer.CircleMask:Hide()

DressUpFramePortrait:SetSize(61, 61)
DressUpFramePortrait:ClearAllPoints()
DressUpFramePortrait:SetPoint("TOPLEFT", -6, 8)

DressUpFramePortraitFrame:SetParent(DressUpFrame.PortraitContainer)
DressUpFramePortraitFrame:SetDrawLayer("OVERLAY", 1)