if not _G.GameMenuFrame then return end

ApplyDialogBorder(GameMenuFrame.Border)

GameMenuFrame.Header:Hide()

if (GameMenuFrameHeader == nil) then
	GameMenuFrameHeader = GameMenuFrame:CreateTexture(nil, "ARTWORK")
	GameMenuFrameHeader:SetSize(256, 64)
	GameMenuFrameHeader:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-DialogBox-Header")
	GameMenuFrameHeader:SetPoint("TOP", 0, 12)
end

if (GameMenuFrameHeaderText == nil) then
	GameMenuFrameHeaderText = GameMenuFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	GameMenuFrameHeaderText:SetText(MAINMENU_BUTTON)
	GameMenuFrameHeaderText:SetPoint("TOP", GameMenuFrameHeader, "TOP", 0, -14)
end