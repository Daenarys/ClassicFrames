if not _G.GameMenuFrame then return end

ApplyDialogBorder(GameMenuFrame.Border)
ApplyDialogHeader(GameMenuFrame.Header)

GameMenuFrame.Header:SetWidth(141)
GameMenuFrame.Header.Text:SetFontObject("GameFontNormal")

hooksecurefunc(GameMenuFrame, "Layout", function(self)
	self:SetSize(195, 320)
end)

hooksecurefunc(GameMenuFrame, 'InitButtons', function(self)
	local tableData = self.buttonPool.activeObjects
	for obj in pairs(tableData) do 
		obj:SetSize(144, 21)

		obj:SetNormalFontObject("GameFontHighlight")
		obj:SetHighlightFontObject("GameFontHighlight")
		obj:SetDisabledFontObject("GameFontDisable")

		obj:GetFontString():ClearAllPoints()
		obj:GetFontString():SetPoint("CENTER", 0, 1)
	end
end)