local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_BlackMarketUI" then
		ApplyCloseButton(BlackMarketFrame.CloseButton)

		ApplyScrollBarArrow(BlackMarketFrame.ScrollBar)
		ApplyScrollBarTrack(BlackMarketFrame.ScrollBar.Track)
		ApplyScrollBarThumb(BlackMarketFrame.ScrollBar.Track.Thumb)
	end
end)