local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_DebugTools" then
		ApplyCloseButton(TableAttributeDisplay.CloseButton, true)
		TableAttributeDisplay.CloseButton:ClearAllPoints()
		TableAttributeDisplay.CloseButton:SetPoint("TOPRIGHT", 2, 1)

		TableAttributeDisplay.LinesScrollFrame.ScrollBar.Track.Begin:Hide()
		TableAttributeDisplay.LinesScrollFrame.ScrollBar.Track.End:Hide()
		TableAttributeDisplay.LinesScrollFrame.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(TableAttributeDisplay.LinesScrollFrame.ScrollBar, true)
		ApplyScrollBarThumb(TableAttributeDisplay.LinesScrollFrame.ScrollBar.Track.Thumb)
	end
end)