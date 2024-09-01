if not _G.GameMenuFrame then return end

ApplyDialogBorder(GameMenuFrame.Border)
ApplyDialogHeader(GameMenuFrame.Header)

GameMenuFrame.Header:SetWidth(139.3777)
GameMenuFrame.Header.Text:SetFontObject("GameFontNormal")

GameMenuFrame:HookScript("OnShow", function(self)
	self.topPadding = 32
	self.leftPadding = 26
	self.rightPadding = 26
	self.bottomPadding = 12

	for button in self.buttonPool:EnumerateActive() do
		button:SetSize(144, 21)
		button:SetNormalFontObject("GameFontHighlight")
		button:SetHighlightFontObject("GameFontHighlight")
		button:SetDisabledFontObject("GameFontDisable")
	end
end)

hooksecurefunc(GameMenuFrame, "Layout", function(self)
	for button in self.buttonPool:EnumerateActive() do
		local text = button:GetText()
		if (text == _G["GAMEMENU_SUPPORT"]) then
			button:SetPoint("TOPLEFT", 26, -32)
		elseif (text == _G["BLIZZARD_STORE"]) then
			button:SetPoint("TOPLEFT", 26, -54)
		elseif (text == _G["GAMEMENU_NEW_BUTTON"]) then
			button:SetPoint("TOPLEFT", 26, -76)
		elseif (text == _G["GAMEMENU_OPTIONS"]) then
			button:SetPoint("TOPLEFT", 26, -113)
		elseif (text == _G["HUD_EDIT_MODE_MENU"]) then
			button:SetPoint("TOPLEFT", 26, -135)
		elseif (text == _G["MACROS"]) then
			button:SetPoint("TOPLEFT", 26, -157)
		elseif (text == _G["ADDONS"]) then
			button:SetPoint("TOPLEFT", 26, -179)
		elseif (text == _G["LOG_OUT"]) then
			button:SetPoint("TOPLEFT", 26, -216)
		elseif (text == _G["EXIT_GAME"]) then
			button:SetPoint("TOPLEFT", 26, -238)
		elseif (text == _G["RETURN_TO_GAME"]) then
			button:SetPoint("TOPLEFT", 26, -275)	
		end
	end
end)