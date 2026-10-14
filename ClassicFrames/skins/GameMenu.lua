if not _G.GameMenuFrame then return end

ApplyDialogBorder(GameMenuFrame.Border)
ApplyDialogHeader(GameMenuFrame.Header)

GameMenuFrame.Header:SetWidth(139.3777)
GameMenuFrame.Header.Text:SetFontObject("GameFontNormal")

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
		elseif (text == _G["BLIZZARD_STORE"]) then
			button:SetPoint("TOPLEFT", 26, -54)
		elseif (text == _G["GAMEMENU_NEW_BUTTON"]) then
			button:SetPoint("TOPLEFT", 26, -76)
		elseif (text == _G["GAMEMENU_OPTIONS"]) then
			if C_SplashScreen.CanViewSplashScreen() then
				button:SetPoint("TOPLEFT", 26, -113)
			else
				button:SetPoint("TOPLEFT", 26, -91)
			end
		elseif (text == _G["HUD_EDIT_MODE_MENU"]) then
			if C_SplashScreen.CanViewSplashScreen() then
				button:SetPoint("TOPLEFT", 26, -135)
			else
				button:SetPoint("TOPLEFT", 26, -113)
			end
		elseif (text == _G["MACROS"]) then
			if C_SplashScreen.CanViewSplashScreen() and EditModeManagerFrame:CanEnterEditMode() then
				button:SetPoint("TOPLEFT", 26, -157)
			elseif not C_SplashScreen.CanViewSplashScreen() and not EditModeManagerFrame:CanEnterEditMode() then
				button:SetPoint("TOPLEFT", 26, -113)
			else
				button:SetPoint("TOPLEFT", 26, -135)
			end
		elseif (text == _G["ADDONS"]) then
			if C_SplashScreen.CanViewSplashScreen() and EditModeManagerFrame:CanEnterEditMode() then
				button:SetPoint("TOPLEFT", 26, -179)
			elseif not C_SplashScreen.CanViewSplashScreen() and not EditModeManagerFrame:CanEnterEditMode() then
				button:SetPoint("TOPLEFT", 26, -135)
			else
				button:SetPoint("TOPLEFT", 26, -157)
			end
		elseif (text == _G["LOG_OUT"]) then
			if C_SplashScreen.CanViewSplashScreen() and EditModeManagerFrame:CanEnterEditMode() then
				button:SetPoint("TOPLEFT", 26, -216)
			elseif not C_SplashScreen.CanViewSplashScreen() and not EditModeManagerFrame:CanEnterEditMode() then
				button:SetPoint("TOPLEFT", 26, -172)
			else
				button:SetPoint("TOPLEFT", 26, -194)
			end
		elseif (text == _G["EXIT_GAME"]) then
			if C_SplashScreen.CanViewSplashScreen() and EditModeManagerFrame:CanEnterEditMode() then
				button:SetPoint("TOPLEFT", 26, -238)
			elseif not C_SplashScreen.CanViewSplashScreen() and not EditModeManagerFrame:CanEnterEditMode() then
				button:SetPoint("TOPLEFT", 26, -194)
			else
				button:SetPoint("TOPLEFT", 26, -216)
			end
		elseif (text == _G["RETURN_TO_GAME"]) then
			if C_SplashScreen.CanViewSplashScreen() and EditModeManagerFrame:CanEnterEditMode() then
				button:SetPoint("TOPLEFT", 26, -275)
			elseif not C_SplashScreen.CanViewSplashScreen() and not EditModeManagerFrame:CanEnterEditMode() then
				button:SetPoint("TOPLEFT", 26, -231)
			else
				button:SetPoint("TOPLEFT", 26, -253)
			end
		end
	end
end)