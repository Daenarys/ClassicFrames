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
		if not button.IsSkinned then
			button:SetSize(144, 21)
			button:SetNormalFontObject("GameFontHighlight")
			button:SetHighlightFontObject("GameFontHighlight")
			button:SetDisabledFontObject("GameFontDisable")

			button.Left:Hide()
			button.Center:Hide()
			button.Right:Hide()

			button:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight", "ADD")
			button:GetHighlightTexture():SetTexCoord(0, 0.625, 0, 0.6875)

			button:SetPushedTextOffset(1.57, -1.57)

			if (button.CfLeft == nil) then
				button.CfLeft = button:CreateTexture(nil, "BACKGROUND")
				button.CfLeft:SetSize(12, 21)
				button.CfLeft:SetPoint("TOPLEFT")
				button.CfLeft:SetPoint("BOTTOMLEFT")
			end

			if (button.CfRight == nil) then
				button.CfRight = button:CreateTexture(nil, "BACKGROUND")
				button.CfRight:SetSize(12, 21)
				button.CfRight:SetPoint("TOPRIGHT")
				button.CfRight:SetPoint("BOTTOMRIGHT")
			end

			if (button.CfMiddle == nil) then
				button.CfMiddle = button:CreateTexture(nil, "BACKGROUND")
				button.CfMiddle:SetSize(144, 21)
				button.CfMiddle:SetPoint("TOPLEFT", button.CfLeft, "TOPRIGHT")
				button.CfMiddle:SetPoint("BOTTOMRIGHT", button.CfRight, "BOTTOMLEFT")
			end

			button:HookScript("OnUpdate", function()
				local buttonState = button:GetButtonState()

				button.CfLeft:SetTexCoord(0, 0.09375, 0, 0.6875)
				button.CfRight:SetTexCoord(0.53125, 0.625, 0, 0.6875)
				button.CfMiddle:SetTexCoord(0.09375, 0.53125, 0, 0.6875)

				if buttonState == "DISABLED" then
					button.CfLeft:SetTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
					button.CfMiddle:SetTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
					button.CfRight:SetTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
				elseif buttonState == "PUSHED" then
					button.CfLeft:SetTexture("Interface\\Buttons\\UI-Panel-Button-Down")
					button.CfMiddle:SetTexture("Interface\\Buttons\\UI-Panel-Button-Down")
					button.CfRight:SetTexture("Interface\\Buttons\\UI-Panel-Button-Down")
				else
					button.CfLeft:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
					button.CfMiddle:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
					button.CfRight:SetTexture("Interface\\Buttons\\UI-Panel-Button-Up")
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