if not _G.GameMenuFrame then return end

ApplyDialogBorder(GameMenuFrame.Border)
ApplyDialogHeader(GameMenuFrame.Header)

GameMenuFrame.Header:SetWidth(139.3777)
GameMenuFrame.Header.Text:SetFontObject("GameFontNormal")

if GameMenuFrame.EditModeNotification then
	GameMenuFrame.EditModeNotification:SetAlpha(0)
end

hooksecurefunc(GameMenuFrame, "InitButtons", function(self)
	self.topPadding = 33
	self.leftPadding = 26
	self.rightPadding = 26
	self.bottomPadding = -20

	for button in self.buttonPool:EnumerateActive() do
		if not button.IsSkinned then
			button:SetSize(144, 21)
			button:SetNormalFontObject("GameFontHighlight")
			button:SetHighlightFontObject("GameFontHighlight")
			button:SetDisabledFontObject("GameFontDisable")

			ApplyRedButton(button)

			button.IsSkinned = true
		end
	end
end)

hooksecurefunc(GameMenuFrame, "Layout", function(self)
	for button in self.buttonPool:EnumerateActive() do
		local text = button:GetText()
		if (text == _G["GAMEMENU_SUPPORT"]) then
			button:SetPoint("TOPLEFT", 26, -32)
		elseif (text == _G["GAMEMENU_OPTIONS"]) then
			button:SetPoint("TOPLEFT", 26, -54)
		elseif (text == _G["HUD_EDIT_MODE_MENU"]) then
			button:SetPoint("TOPLEFT", 26, -76)
		elseif (text == _G["MACROS"]) then
			button:SetPoint("TOPLEFT", 26, -98)
		elseif (text == _G["ADDONS"]) then
			button:SetPoint("TOPLEFT", 26, -120)
		elseif (text == _G["LOG_OUT"]) then
			button:SetPoint("TOPLEFT", 26, -142)
		elseif (text == _G["EXIT_GAME"]) then
			button:SetPoint("TOPLEFT", 26, -164)
		elseif (text == _G["RETURN_TO_GAME"]) then
			button:SetPoint("TOPLEFT", 26, -201)
		end
	end
end)