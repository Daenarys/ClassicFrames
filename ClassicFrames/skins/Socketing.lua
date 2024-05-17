local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ItemSocketingUI" then
		ApplyCloseButton(ItemSocketingFrameCloseButton)

		ItemSocketingFrame.PortraitContainer.CircleMask:Hide()

		ItemSocketingFramePortrait:SetSize(61, 61)
		ItemSocketingFramePortrait:ClearAllPoints()
		ItemSocketingFramePortrait:SetPoint("TOPLEFT", -6, 8)

		ItemSocketingFrame.TitleContainer:ClearAllPoints()
		ItemSocketingFrame.TitleContainer:SetPoint("TOPLEFT", ItemSocketingFrame, "TOPLEFT", 58, 0)
		ItemSocketingFrame.TitleContainer:SetPoint("TOPRIGHT", ItemSocketingFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(ItemSocketingFrame)
		ApplyNineSlicePortrait(ItemSocketingFrame)

		ItemSocketingScrollFrame.ScrollBar:SetSize(25, 560)
		ItemSocketingScrollFrame.ScrollBar:ClearAllPoints()
		ItemSocketingScrollFrame.ScrollBar:SetPoint("TOPLEFT", ItemSocketingScrollFrame, "TOPRIGHT", -21, 1)
		ItemSocketingScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", ItemSocketingScrollFrame, "BOTTOMRIGHT", -21, -4)

		ApplyScrollBarArrow(ItemSocketingScrollFrame.ScrollBar)
		ApplyScrollBarTrack(ItemSocketingScrollFrame.ScrollBar.Track)
		ApplyScrollBarThumb(ItemSocketingScrollFrame.ScrollBar.Track.Thumb)
	end
end)