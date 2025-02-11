if not _G.GameMenuFrame then return end

ApplyDialogBorder(GameMenuFrame.Border)
GameMenuFrame.Header:Hide()

if (GameMenuFrameHeader == nil) then
	GameMenuFrameHeader = GameMenuFrame:CreateTexture(nil, "ARTWORK")
	GameMenuFrameHeader:SetSize(256, 64)
	GameMenuFrameHeader:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-DialogBox-Header")
	GameMenuFrameHeader:SetPoint("TOP", 0, 12)
end

if (GameMenuFrameHeaderText == nil) then
	GameMenuFrameHeaderText = GameMenuFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	GameMenuFrameHeaderText:SetText(MAINMENU_BUTTON)
	GameMenuFrameHeaderText:SetPoint("TOP", GameMenuFrameHeader, "TOP", 0, -14)
end

GameMenuFrame:HookScript("OnShow", function(self)
	self.topPadding = 33
	self.leftPadding = 26
	self.rightPadding = 26
	self.bottomPadding = 10

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
			if C_StorePublic.IsEnabled() then
				button:SetPoint("TOPLEFT", 26, -76)
			else
				button:SetPoint("TOPLEFT", 26, -54)
			end
		elseif (text == _G["GAMEMENU_OPTIONS"]) then
			if C_SplashScreen.CanViewSplashScreen() and C_StorePublic.IsEnabled() then
				button:SetPoint("TOPLEFT", 26, -113)
			elseif not C_SplashScreen.CanViewSplashScreen() and not C_StorePublic.IsEnabled() then
				button:SetPoint("TOPLEFT", 26, -69)
			else
				button:SetPoint("TOPLEFT", 26, -91)
			end
		elseif (text == _G["HUD_EDIT_MODE_MENU"]) then
			if C_SplashScreen.CanViewSplashScreen() and C_StorePublic.IsEnabled() then
				button:SetPoint("TOPLEFT", 26, -135)
			elseif not C_SplashScreen.CanViewSplashScreen() and not C_StorePublic.IsEnabled() then
				button:SetPoint("TOPLEFT", 26, -91)
			else
				button:SetPoint("TOPLEFT", 26, -113)
			end
		elseif (text == _G["MACROS"]) then
			if C_SplashScreen.CanViewSplashScreen() and C_StorePublic.IsEnabled() then
				button:SetPoint("TOPLEFT", 26, -157)
		elseif not C_SplashScreen.CanViewSplashScreen() and not C_StorePublic.IsEnabled() then
				button:SetPoint("TOPLEFT", 26, -113)
			else
				button:SetPoint("TOPLEFT", 26, -135)
			end
		elseif (text == _G["ADDONS"]) then
			if C_SplashScreen.CanViewSplashScreen() and C_StorePublic.IsEnabled() then
				button:SetPoint("TOPLEFT", 26, -179)
			elseif not C_SplashScreen.CanViewSplashScreen() and not C_StorePublic.IsEnabled() then
				button:SetPoint("TOPLEFT", 26, -135)
			else
				button:SetPoint("TOPLEFT", 26, -157)
			end
		elseif (text == _G["LOG_OUT"]) then
			if C_SplashScreen.CanViewSplashScreen() and C_StorePublic.IsEnabled() then
				button:SetPoint("TOPLEFT", 26, -216)
			elseif not C_SplashScreen.CanViewSplashScreen() and not C_StorePublic.IsEnabled() then
				button:SetPoint("TOPLEFT", 26, -172)
			else
				button:SetPoint("TOPLEFT", 26, -194)
			end
		elseif (text == _G["EXIT_GAME"]) then
			if C_SplashScreen.CanViewSplashScreen() and C_StorePublic.IsEnabled() then
				button:SetPoint("TOPLEFT", 26, -238)
			elseif not C_SplashScreen.CanViewSplashScreen() and not C_StorePublic.IsEnabled() then
				button:SetPoint("TOPLEFT", 26, -194)
			else
				button:SetPoint("TOPLEFT", 26, -216)
			end
		elseif (text == _G["RETURN_TO_GAME"]) then
			if C_SplashScreen.CanViewSplashScreen() and C_StorePublic.IsEnabled() then
				button:SetPoint("TOPLEFT", 26, -275)
			elseif not C_SplashScreen.CanViewSplashScreen() and not C_StorePublic.IsEnabled() then
				button:SetPoint("TOPLEFT", 26, -231)
			else
				button:SetPoint("TOPLEFT", 26, -253)
			end
		end
	end
end)