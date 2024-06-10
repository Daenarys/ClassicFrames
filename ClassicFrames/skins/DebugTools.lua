local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_DebugTools" then
		TableAttributeDisplay.CloseButton:SetSize(32, 32)
		TableAttributeDisplay.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		TableAttributeDisplay.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		TableAttributeDisplay.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		TableAttributeDisplay.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		TableAttributeDisplay.CloseButton:ClearAllPoints()
		TableAttributeDisplay.CloseButton:SetPoint("TOPRIGHT", 2, 1)

		TableAttributeDisplay.LinesScrollFrame.ScrollBar:SetSize(25, 560)
		TableAttributeDisplay.LinesScrollFrame.ScrollBar:ClearAllPoints()
		TableAttributeDisplay.LinesScrollFrame.ScrollBar:SetPoint("TOPLEFT", TableAttributeDisplay.LinesScrollFrame, "TOPRIGHT", 1, 3)
		TableAttributeDisplay.LinesScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", TableAttributeDisplay.LinesScrollFrame, "BOTTOMRIGHT", 1, -4)

		TableAttributeDisplay.LinesScrollFrame.ScrollBar.Track:ClearAllPoints()
		TableAttributeDisplay.LinesScrollFrame.ScrollBar.Track:SetPoint("TOPLEFT", 4, -22)
		TableAttributeDisplay.LinesScrollFrame.ScrollBar.Track:SetPoint("BOTTOMRIGHT", -4, 22)

		TableAttributeDisplay.LinesScrollFrame.ScrollBar.Track.Begin:Hide()
		TableAttributeDisplay.LinesScrollFrame.ScrollBar.Track.End:Hide()
		TableAttributeDisplay.LinesScrollFrame.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(TableAttributeDisplay.LinesScrollFrame.ScrollBar)
		ApplyScrollBarThumb(TableAttributeDisplay.LinesScrollFrame.ScrollBar.Track.Thumb)

		TableAttributeDisplay.ScrollFrameArt:ClearAllPoints()
		TableAttributeDisplay.ScrollFrameArt:SetPoint("TOPLEFT", TableAttributeDisplay.LinesScrollFrame, "TOPLEFT", 0, 6)
		TableAttributeDisplay.ScrollFrameArt:SetPoint("BOTTOMRIGHT", TableAttributeDisplay.LinesScrollFrame.ScrollBar, "BOTTOMRIGHT",  2, -2)

		ApplySearchBox(TableAttributeDisplay.FilterBox)
	end
end)