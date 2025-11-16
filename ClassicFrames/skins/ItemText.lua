if not _G.ItemTextFrame then return end

ApplyCloseButton(ItemTextFrameCloseButton)

ItemTextFrame.PortraitContainer.CircleMask:Hide()

select(3, ItemTextFrame:GetRegions()):SetSize(58, 58)
select(3, ItemTextFrame:GetRegions()):ClearAllPoints()
select(3, ItemTextFrame:GetRegions()):SetPoint("TOPLEFT", -5, 5)

ItemTextFrame.TitleContainer:ClearAllPoints()
ItemTextFrame.TitleContainer:SetPoint("TOPLEFT", ItemTextFrame, "TOPLEFT", 58, 0)
ItemTextFrame.TitleContainer:SetPoint("TOPRIGHT", ItemTextFrame, "TOPRIGHT", -58, 0)

ApplyTitleBg(ItemTextFrame)
ApplyNineSlicePortrait(ItemTextFrame)

ItemTextScrollFrame.ScrollBar:SetSize(25, 560)
ItemTextScrollFrame.ScrollBar:ClearAllPoints()
ItemTextScrollFrame.ScrollBar:SetPoint("TOPLEFT", ItemTextScrollFrame, "TOPRIGHT", 1, 3)
ItemTextScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", ItemTextScrollFrame, "BOTTOMRIGHT", 4, -2)

if (ItemTextScrollFrame.ScrollBar.BG == nil) then
	ItemTextScrollFrame.ScrollBar.BG = ItemTextScrollFrame.ScrollBar:CreateTexture(nil, "BACKGROUND")
	ItemTextScrollFrame.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
	ItemTextScrollFrame.ScrollBar.BG:SetAllPoints()
end

ApplyScrollBarArrow(ItemTextScrollFrame.ScrollBar)
ApplyScrollBarTrack(ItemTextScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(ItemTextScrollFrame.ScrollBar.Track.Thumb)