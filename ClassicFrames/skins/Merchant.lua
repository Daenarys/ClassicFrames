if not _G.MerchantFrame then return end

MerchantFrame.PortraitContainer.CircleMask:Hide()

MerchantFramePortrait:SetSize(61, 61)
MerchantFramePortrait:ClearAllPoints()
MerchantFramePortrait:SetPoint("TOPLEFT", -6, 8)

MerchantFramePortraitFrame:SetParent(MerchantFrame.PortraitContainer)
MerchantFramePortraitFrame:SetDrawLayer("OVERLAY", 1)