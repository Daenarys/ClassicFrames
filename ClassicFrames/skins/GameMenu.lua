if not _G.GameMenuFrame then return end

ApplyDialogBorder(GameMenuFrame.Border)
ApplyDialogHeader(GameMenuFrame.Header)

GameMenuFrame.Header:SetWidth(139.3777)
GameMenuFrame.Header.Text:SetFontObject("GameFontNormal")
GameMenuFrame.Header.Text:SetText(MAIN_MENU)

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

			button.Left:SetAlpha(0)
			button.Center:SetAlpha(0)
			button.Right:SetAlpha(0)

			button:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight", "ADD")
			button:GetHighlightTexture():SetTexCoord(0, 0.625, 0, 0.6875)

			button:SetPushedTextOffset(1.57, -1.57)

			if (button.Background == nil) then
				button.Background = button:CreateTexture(nil, "BACKGROUND")
				button.Background:SetAllPoints()
			end

			button:HookScript("OnUpdate", function()
				local buttonState = button:GetButtonState()

				button.Background:SetTexCoord(0, 0.625, 0, 0.6875)

				if buttonState == "DISABLED" then
					button.Background:SetTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
				elseif buttonState == "PUSHED" then
					button.Background:SetTexture("Interface\\Buttons\\UI-Panel-Button-Down")
				else
					button.Background:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
				end
			end)

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