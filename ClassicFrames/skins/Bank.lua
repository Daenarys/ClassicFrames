if not _G.BankFrame then return end

BankFrame.PortraitContainer.CircleMask:Hide()

BankFramePortrait:SetSize(61, 61)
BankFramePortrait:ClearAllPoints()
BankFramePortrait:SetPoint("TOPLEFT", -6, 8)

BankFramePortraitFrame:SetParent(BankFrame.PortraitContainer)
BankFramePortraitFrame:SetDrawLayer("OVERLAY", 1)