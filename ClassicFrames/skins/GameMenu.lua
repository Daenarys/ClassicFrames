if not _G.GameMenuFrame then return end

ApplyDialogBorder(GameMenuFrame.Border)
ApplyDialogHeader(GameMenuFrame.Header)

GameMenuFrame.Header:SetWidth(141)
GameMenuFrame.Header.Text:SetFontObject("GameFontNormal")

GameMenuFrame:HookScript("OnShow", function(self)
	self.topPadding = 32
	self.leftPadding = 26
	self.rightPadding = 26
	self.bottomPadding = 18

	for button in self.buttonPool:EnumerateActive() do
		button:SetSize(144, 21)
		button:SetNormalFontObject("GameFontHighlight")
		button:SetHighlightFontObject("GameFontHighlight")
		button:SetDisabledFontObject("GameFontDisable")

		button:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight", "ADD")
		button:GetHighlightTexture():SetTexCoord(0, 0.625, 0, 0.6875)

		button:HookScript("OnUpdate", function()
			local buttonState = button:GetButtonState()

			if buttonState == "DISABLED" then
				button.Left:SetTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
				button.Center:SetTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
				button.Right:SetTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
			elseif buttonState == "PUSHED" then
				button.Left:SetTexture("Interface\\Buttons\\UI-Panel-Button-Down")
				button.Center:SetTexture("Interface\\Buttons\\UI-Panel-Button-Down")
				button.Right:SetTexture("Interface\\Buttons\\UI-Panel-Button-Down")
			else
				button.Left:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
				button.Center:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
				button.Right:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
			end

			button.Left:SetScale(1)
			button.Left:SetSize(12, 21)
			button.Left:SetTexCoord(0, 0.09375, 0, 0.6875)
			button.Center:SetScale(1)
			button.Center:SetTexCoord(0.09375, 0.53125, 0, 0.6875)
			button.Right:SetScale(1)
			button.Right:SetSize(12, 21)
			button.Right:SetTexCoord(0.53125, 0.625, 0, 0.6875)
		end)
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