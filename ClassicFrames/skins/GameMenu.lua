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

hooksecurefunc(GameMenuFrame, "InitButtons", function(self)
	for obj in self.buttonPool:EnumerateActive() do
		obj:SetSize(144, 21)

		obj:SetNormalFontObject("GameFontHighlight")
		obj:SetHighlightFontObject("GameFontHighlight")
		obj:SetDisabledFontObject("GameFontDisable")

		obj:GetFontString():ClearAllPoints()
		obj:GetFontString():SetPoint("CENTER", 0, 1)
	end
end)

GameMenuFrame:HookScript("OnShow", function(self)
	self.topPadding = 32
	self.leftPadding = 26
	self.rightPadding = 26
	self.bottomPadding = 17
end)