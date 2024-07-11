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
	self.topPadding = 32
	self.leftPadding = 26
	self.rightPadding = 26
	self.bottomPadding = 19

	for button in GameMenuFrame.buttonPool:EnumerateActive() do
		button:HookScript("OnUpdate", function()
			buttonState = button:GetButtonState()

			button:SetSize(144, 21)
			button:SetNormalFontObject("GameFontHighlight")
			button:SetHighlightFontObject("GameFontHighlight")
			button:SetDisabledFontObject("GameFontDisable")

			button:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight", "ADD")
			button:GetHighlightTexture():SetTexCoord(0, 0.625, 0, 0.6875)

			if buttonState == "DISABLED" then
				button.Left:SetTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
				button.Center:SetTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
				button.Right:SetTexture("Interface\\Buttons\\UI-Panel-Button-Disabled")
			elseif buttonState == "PUSHED" then
				button.Left:SetTexture("Interface\\Buttons\\UI-Panel-Button-Down");
				button.Center:SetTexture("Interface\\Buttons\\UI-Panel-Button-Down");
				button.Right:SetTexture("Interface\\Buttons\\UI-Panel-Button-Down");
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