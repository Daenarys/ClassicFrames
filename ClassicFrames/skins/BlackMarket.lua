local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_BlackMarketUI" then
		ApplyCloseButtonOld(BlackMarketFrame.CloseButton)

		BlackMarketFrame.ScrollBar:SetSize(25, 560)
		BlackMarketFrame.ScrollBar:ClearAllPoints()
		BlackMarketFrame.ScrollBar:SetPoint("TOPLEFT", BlackMarketFrame.ScrollBox, "TOPRIGHT", -1, 1)
		BlackMarketFrame.ScrollBar:SetPoint("BOTTOMLEFT", BlackMarketFrame.ScrollBox, "BOTTOMRIGHT", 2, -2)

		ApplyScrollBarArrow(BlackMarketFrame.ScrollBar)
		ApplyScrollBarTrack(BlackMarketFrame.ScrollBar.Track)
		ApplyScrollBarThumb(BlackMarketFrame.ScrollBar.Track.Thumb)
	end
end)