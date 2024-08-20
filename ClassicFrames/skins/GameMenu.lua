if not _G.GameMenuFrame then return end

ApplyDialogBorder(GameMenuFrame.Border)
ApplyDialogHeader(GameMenuFrame.Header)

GameMenuFrame.Header:SetWidth(139.3777)
GameMenuFrame.Header.Text:SetFontObject("GameFontNormal")

GameMenuFrame:HookScript("OnShow", function(self)
	self.topPadding = 32
	self.leftPadding = 26
	self.rightPadding = 26
	self.bottomPadding = 18

	for button in GameMenuFrame.buttonPool:EnumerateActive() do
		button:SetSize(144, 21)
		button:SetNormalFontObject("GameFontHighlight")
		button:SetHighlightFontObject("GameFontHighlight")
		button:SetDisabledFontObject("GameFontDisable")
	end
end)