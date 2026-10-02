if not _G.GameMenuFrame then return end

ApplyDialogBorder(GameMenuFrame.Border)
ApplyDialogHeader(GameMenuFrame.Header)

GameMenuFrame.Header:SetWidth(139.3777)
GameMenuFrame.Header.Text:SetFontObject("GameFontNormal")
GameMenuFrame.Header.Text:SetText(MAIN_MENU)

if GameMenuFrame.EditModeNotification then
	GameMenuFrame.EditModeNotification:SetAlpha(0)
end

hooksecurefunc(GameMenuFrame, "InitButtons", function(self)
	self.topPadding = 33
	self.leftPadding = 25
	self.rightPadding = 25
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
			button:SetPoint("TOPLEFT", 26, -28)
		elseif (text == _G["GAMEMENU_OPTIONS"]) then
			button:SetPoint("TOPLEFT", 26, -50)
		elseif (text == _G["HUD_EDIT_MODE_MENU"]) then
			button:SetPoint("TOPLEFT", 26, -72)
		elseif (text == _G["MACROS"]) then
			button:SetPoint("TOPLEFT", 26, -94)
		elseif (text == _G["ADDONS"]) then
			button:SetPoint("TOPLEFT", 26, -116)
		elseif (text == _G["LOG_OUT"]) then
			button:SetPoint("TOPLEFT", 26, -138)
		elseif (text == _G["EXIT_GAME"]) then
			button:SetPoint("TOPLEFT", 26, -160)
		elseif (text == _G["RETURN_TO_GAME"]) then
			button:SetPoint("TOPLEFT", 26, -197)
		end
	end
end)