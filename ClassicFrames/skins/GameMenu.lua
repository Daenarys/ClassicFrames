if not _G.GameMenuFrame then return end

GameMenuFrame.Header:Hide()

if not GameMenuFrameHeader then
	GameMenuFrame:CreateTexture("GameMenuFrameHeader", "ARTWORK")
	GameMenuFrameHeader:SetSize(256, 64)
	GameMenuFrameHeader:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-DialogBox-Header.png")
	GameMenuFrameHeader:SetPoint("TOP", 0, 12)
end

if not GameMenuFrameHeaderText then
	GameMenuFrameHeaderText = GameMenuFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	GameMenuFrameHeaderText:SetText(MAINMENU_BUTTON)
	GameMenuFrameHeaderText:SetPoint("TOP", GameMenuFrameHeader, "TOP", 0, -14)
end

ApplyDialogBorder(GameMenuFrame.Border)