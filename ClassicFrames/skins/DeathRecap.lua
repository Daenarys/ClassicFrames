local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_DeathRecap" then
		ApplyCloseButton(DeathRecapFrame.CloseXButton, true)

		DeathRecapFrame.ScrollBar.Track.Begin:Hide()
		DeathRecapFrame.ScrollBar.Track.End:Hide()
		DeathRecapFrame.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(DeathRecapFrame.ScrollBar, true)
		ApplyScrollBarThumb(DeathRecapFrame.ScrollBar.Track.Thumb)
	end
end)