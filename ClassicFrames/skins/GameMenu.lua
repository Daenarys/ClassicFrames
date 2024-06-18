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
	if not self.buttonPool then return end

	for button in self.buttonPool:EnumerateActive() do
		button:SetSize(144, 21)

		button:SetNormalFontObject("GameFontHighlight")
		button:SetHighlightFontObject("GameFontHighlight")
		button:SetDisabledFontObject("GameFontDisable")

		button:HookScript("OnUpdate", function()
			button.Left:SetSize(12, 21)
			button.Left:SetScale(1)
			button.Left:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
			button.Left:SetTexCoord(0, 0.09375, 0, 0.6875)
			button.Left:SetPoint("TOPLEFT")
			button.Left:SetPoint("BOTTOMLEFT")
			button.Center:SetScale(1)
			button.Center:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
			button.Center:SetTexCoord(0.09375, 0.53125, 0, 0.6875)
			button.Center:SetHorizTile(false)
			button.Right:SetSize(12, 21)
			button.Right:SetScale(1)
			button.Right:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
			button.Right:SetTexCoord(0.53125, 0.625, 0, 0.6875)
			button.Right:SetPoint("TOPRIGHT")
			button.Right:SetPoint("BOTTOMRIGHT")
		end)
	end
end)

GameMenuFrame:HookScript("OnShow", function(self)
	self.topPadding = 32
	self.leftPadding = 26
	self.rightPadding = 26
	self.bottomPadding = 17
end)