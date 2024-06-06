if not _G.GameMenuFrame then return end

ApplyDialogBorder(GameMenuFrame.Border)
ApplyDialogHeader(GameMenuFrame.Header)

GameMenuFrame.Header:SetWidth(139.377)
GameMenuFrame.Header.Text:SetFontObject("GameFontNormal")

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