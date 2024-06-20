local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_BlackMarketUI" then
		BlackMarketFrame.CloseButton:SetSize(32, 32)
		BlackMarketFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		BlackMarketFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		BlackMarketFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		BlackMarketFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		BlackMarketFrame.CloseButton:ClearAllPoints()
		BlackMarketFrame.CloseButton:SetPoint("TOPRIGHT", 4, 5)

		BlackMarketFrame.ScrollBar:SetSize(25, 560)
		BlackMarketFrame.ScrollBar:ClearAllPoints()
		BlackMarketFrame.ScrollBar:SetPoint("TOPLEFT", BlackMarketFrame.ScrollBox, "TOPRIGHT", -1, 1)
		BlackMarketFrame.ScrollBar:SetPoint("BOTTOMLEFT", BlackMarketFrame.ScrollBox, "BOTTOMRIGHT", 2, -2)

		ApplyScrollBarArrow(BlackMarketFrame.ScrollBar)
		ApplyScrollBarTrack(BlackMarketFrame.ScrollBar.Track)
		ApplyScrollBarThumb(BlackMarketFrame.ScrollBar.Track.Thumb)
	end
end)