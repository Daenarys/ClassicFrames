if not _G.AccountStoreFrame then return end

ApplyCloseButton(AccountStoreFrameCloseButton)

AccountStoreFrame.PortraitContainer.CircleMask:Hide()

AccountStoreFramePortrait:SetSize(61, 61)
AccountStoreFramePortrait:ClearAllPoints()
AccountStoreFramePortrait:SetPoint("TOPLEFT", -6, 8)

AccountStoreFrame.TitleContainer:ClearAllPoints()
AccountStoreFrame.TitleContainer:SetPoint("TOPLEFT", AccountStoreFrame, "TOPLEFT", 58, 0)
AccountStoreFrame.TitleContainer:SetPoint("TOPRIGHT", AccountStoreFrame, "TOPRIGHT", -58, 0)

ApplyTitleBg(AccountStoreFrame)
ApplyNineSlicePortrait(AccountStoreFrame)

AccountStoreFrame.CategoryList.ScrollBar:SetSize(25, 560)
AccountStoreFrame.CategoryList.ScrollBar:ClearAllPoints()
AccountStoreFrame.CategoryList.ScrollBar:SetPoint("TOPLEFT", AccountStoreFrame.CategoryList.ScrollBox, "TOPRIGHT", 0, 3)
AccountStoreFrame.CategoryList.ScrollBar:SetPoint("BOTTOMLEFT", AccountStoreFrame.CategoryList.ScrollBox, "BOTTOMRIGHT", 0, -2)

if (AccountStoreFrame.CategoryList.ScrollBar.BG == nil) then
	AccountStoreFrame.CategoryList.ScrollBar.BG = AccountStoreFrame.CategoryList.ScrollBar:CreateTexture(nil, "BACKGROUND")
	AccountStoreFrame.CategoryList.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
	AccountStoreFrame.CategoryList.ScrollBar.BG:SetAllPoints()
end

ApplyScrollBarArrow(AccountStoreFrame.CategoryList.ScrollBar)
ApplyScrollBarTrack(AccountStoreFrame.CategoryList.ScrollBar.Track)
ApplyScrollBarThumb(AccountStoreFrame.CategoryList.ScrollBar.Track.Thumb)