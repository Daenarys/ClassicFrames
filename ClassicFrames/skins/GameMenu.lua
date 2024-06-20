if not _G.GameMenuFrame then return end

ApplyDialogBorder(GameMenuFrame.Border)
ApplyDialogHeader(GameMenuFrame.Header)

GameMenuFrame.Header:SetWidth(139.3777)
GameMenuFrame.Header.Text:SetFontObject("GameFontNormal")

hooksecurefunc(GameMenuFrame, "InitButtons", function(self)
	for button in self.buttonPool:EnumerateActive() do
		button:SetSize(144, 21)

		button:SetNormalFontObject("GameFontHighlight")
		button:SetHighlightFontObject("GameFontHighlight")
		button:SetDisabledFontObject("GameFontDisable")

		button:GetFontString():ClearAllPoints()
		button:GetFontString():SetPoint("CENTER", 0, 1)
	end
end)

GameMenuFrame:HookScript("OnShow", function(self)
	self.topPadding = 32
	self.leftPadding = 26
	self.rightPadding = 26
	self.bottomPadding = 19
end)