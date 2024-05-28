if not _G.GameMenuFrame then return end

ApplyDialogBorder(GameMenuFrame.Border)
ApplyDialogHeader(GameMenuFrame.Header)

GameMenuFrame.Header:SetWidth(139.377)
GameMenuFrame.Header.Text:SetFontObject("GameFontNormal")
GameMenuFrame.Header.Text:ClearAllPoints()
GameMenuFrame.Header.Text:SetPoint("TOP", 0, -12)

hooksecurefunc(GameMenuFrame, "Layout", function(self)
	if C_StorePublic.IsEnabled() then
		self:SetSize(195, 320)
	else
		self:SetSize(195, 292)
	end
end)

hooksecurefunc(GameMenuFrame, "InitButtons", function(self)
	local tableData = self.buttonPool.activeObjects
	for obj in pairs(tableData) do 
		obj:SetSize(144, 21)

		obj:SetNormalFontObject("GameFontHighlight")
		obj:SetHighlightFontObject("GameFontHighlight")
		obj:SetDisabledFontObject("GameFontDisable")

		obj:GetFontString():ClearAllPoints()
		obj:GetFontString():SetPoint("CENTER", 0, 1)

		obj:SetPoint("CENTER", GameMenuFrame, "TOP", 0, -42)
	end
end)

hooksecurefunc(GameMenuFrame, "AddSection", function(self)
	self.sectionSpacing = 15
end)

GameMenuFrame:HookScript("OnShow", function(self)
	self.topPadding = 32
	self.leftPadding = 26
	self.rightPadding = 26
	self.bottomPadding = 3
	self.spacing = 1
end)