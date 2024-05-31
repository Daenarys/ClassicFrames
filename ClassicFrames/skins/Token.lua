local TOKEN_BUTTON_OFFSET = 3;

function CfTokenButton_OnLoad(self)
	local name = self:GetName()
	self.count = _G[name.."Count"];
	self.name = _G[name.."Name"];
	self.icon = _G[name.."Icon"];
	self.check = _G[name.."Check"];
	self.expandIcon = _G[name.."ExpandIcon"];
	self.highlight = _G[name.."Highlight"];
	self.stripe = _G[name.."Stripe"];
end

function CfTokenFrame_OnLoad(self)
	self.Container.scrollBar.Show =
		function (self)
			CfTokenFrameContainer:SetPoint("BOTTOMRIGHT", CharacterFrame.Inset, "BOTTOMRIGHT", -23, 4)
			for _, button in next, _G["CfTokenFrameContainer"].buttons do
				button:SetWidth(295)
			end
			CfTokenFrameContainer.scrollChild:SetWidth(295)
			getmetatable(self).__index.Show(self)
		end

	self.Container.scrollBar.Hide =
		function (self)
			CfTokenFrameContainer:SetPoint("BOTTOMRIGHT", CharacterFrame.Inset, "BOTTOMRIGHT", -4, 4)
			for _, button in next, CfTokenFrameContainer.buttons do
				button:SetWidth(317)
			end
			CfTokenFrameContainer.scrollChild:SetWidth(317)
			getmetatable(self).__index.Hide(self)
		end
	CfTokenFrameContainer.update = CfTokenFrame_Update;
end

function CfTokenFrame_OnShow(self)

	-- Create buttons if not created yet
	if (not self.Container.buttons) then
		-- if the currency frame was opened via a keybind before the character frame was opened, CharacterFrame.Inset would not exist during the TokenUI addon load
		self.Container:SetPoint("TOPLEFT", CharacterFrame.Inset, "TOPLEFT", 4, -4)
		self.Container:SetWidth(328)
		self.Container:SetHeight(360)
		HybridScrollFrame_CreateButtons(self.Container, "CfTokenButtonTemplate", 1, -2, "TOPLEFT", "TOPLEFT", 0, -TOKEN_BUTTON_OFFSET)
		local buttons = self.Container.buttons;
		local numButtons = #buttons;
		for i=1, numButtons do
			if ( mod(i, 2) == 1 ) then
				buttons[i].stripe:Hide()
			end
		end
	end

	CfTokenFramePopupCloseButton:SetSize(32, 32)
	CfTokenFramePopupCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
	CfTokenFramePopupCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
	CfTokenFramePopupCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
	CfTokenFramePopupCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
	
	ApplyDialogBorder(CfTokenFramePopup.Border)

	CfTokenFrame_Update()
end

function CfTokenFrame_Update()
	local numTokenTypes = C_CurrencyInfo.GetCurrencyListSize()

	if ( numTokenTypes == 0 ) then
		CharacterFrameTab3:Hide()
	else
		CharacterFrameTab3:Show()
	end

	if (not CfTokenFrameContainer.buttons) then
		return;
	end

	-- Setup the buttons
	local scrollFrame = CfTokenFrameContainer;
	local offset = HybridScrollFrame_GetOffset(scrollFrame)
	local buttons = scrollFrame.buttons;
	local numButtons = #buttons;
	local name, isHeader, isExpanded, isUnused, count, icon;
	local button, index;
	for i=1, numButtons do
		index = offset+i;
		local currencyInfo = C_CurrencyInfo.GetCurrencyListInfo(index)
		button = buttons[i];
		button.check:Hide()
		if ( not currencyInfo or not currencyInfo.name or currencyInfo.name == "" ) then
			button:Hide()
		else
			name = currencyInfo.name;
			isHeader = currencyInfo.isHeader;
			isExpanded = currencyInfo.isHeaderExpanded;
			isUnused = currencyInfo.isTypeUnused;
			count = currencyInfo.quantity;
			icon = currencyInfo.iconFileID;
			if ( isHeader ) then
				button.categoryLeft:Show()
				button.categoryRight:Show()
				button.categoryMiddle:Show()
				button.expandIcon:Show()
				button.count:SetText("")
				button.icon:SetTexture("")
				if ( isExpanded ) then
					button.expandIcon:SetTexCoord(0.5625, 1, 0, 0.4375)
				else
					button.expandIcon:SetTexCoord(0, 0.4375, 0, 0.4375)
				end
				button.highlight:SetTexture("Interface\\TokenFrame\\UI-TokenFrame-CategoryButton")
				button.highlight:SetPoint("TOPLEFT", button, "TOPLEFT", 3, -2)
				button.highlight:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", -3, 2)
				button.name:SetText(name)
				button.name:SetFontObject("GameFontNormal")
				button.name:SetPoint("LEFT", 22, 0)
				button.LinkButton:Hide()
			else
				button.categoryLeft:Hide()
				button.categoryRight:Hide()
				button.categoryMiddle:Hide()
				button.expandIcon:Hide()
				button.count:SetText(BreakUpLargeNumbers(count))
				button.icon:SetTexture(icon)
				button.highlight:SetTexture("Interface\\QuestFrame\\UI-QuestTitleHighlight")
				button.highlight:SetPoint("TOPLEFT", button, "TOPLEFT", 0, 0)
				button.highlight:SetPoint("BOTTOMRIGHT", button, "BOTTOMRIGHT", 0, 0)
				--Gray out the text if the count is 0
				if ( count == 0 ) then
					button.count:SetFontObject("GameFontDisable")
					button.name:SetFontObject("GameFontDisable")
				else
					button.count:SetFontObject("GameFontHighlight")
					button.name:SetFontObject("GameFontHighlight")
				end
				button.name:SetText(name)
				button.name:SetPoint("LEFT", 11, 0)
				button.LinkButton:Show()
			end
			--Manage highlight
			if ( name == CfTokenFrame.selectedToken ) then
				CfTokenFrame.selectedID = index;
				button:LockHighlight()
			else
				button:UnlockHighlight()
			end

			button.index = index;
			button.isHeader = isHeader;
			button.isExpanded = isExpanded;
			button.isUnused = isUnused;
			button:Show()
		end
	end
	local totalHeight = numTokenTypes * (button:GetHeight()+TOKEN_BUTTON_OFFSET)
	local displayedHeight = #buttons * (button:GetHeight()+TOKEN_BUTTON_OFFSET)

	HybridScrollFrame_Update(scrollFrame, totalHeight, displayedHeight)
end

function CfTokenFramePopup_CloseIfHidden()
	-- This handles the case where you close a category with the selected token popup shown
	local numTokenTypes = C_CurrencyInfo.GetCurrencyListSize()
	local selectedFound;
	for i=1, numTokenTypes do
		if ( CfTokenFrame.selectedToken == C_CurrencyInfo.GetCurrencyListInfo(i).name ) then
			selectedFound = 1;
		end
	end
	if ( not selectedFound ) then
		CfTokenFramePopup:Hide()
	end
end

function CfTokenButton_OnClick(self)
	if ( self.isHeader ) then
		if ( self.isExpanded ) then
			C_CurrencyInfo.ExpandCurrencyList(self.index, false)
		else
			C_CurrencyInfo.ExpandCurrencyList(self.index, true)
		end
	else
		CfTokenFrame.selectedToken = self.name:GetText()
		local linkedToChat = false;
		if ( IsModifiedClick("CHATLINK") ) then
			linkedToChat = HandleModifiedItemClick(C_CurrencyInfo.GetCurrencyListLink(self.index))
		end
		if ( not linkedToChat ) then
			if ( CfTokenFramePopup:IsShown() ) then
				if ( CfTokenFrame.selectedID == self.index ) then
					CfTokenFramePopup:Hide()
				else
					CfTokenFramePopup:Show()
				end
			else
				CfTokenFramePopup:Show()
			end
			CfTokenFrame.selectedID = self.index;
			CfTokenFrame_UpdatePopup(self)
		end
	end
	CfTokenFrame_Update()
	CfTokenFramePopup_CloseIfHidden()
end

function CfTokenFrame_UpdatePopup(button)
	CfTokenFramePopupInactiveCheckBox:SetChecked(button.isUnused)
end

CfInactiveCurrencyCheckBoxMixin = {};

function CfInactiveCurrencyCheckBoxMixin:OnLoad()
	self.Text:SetText(UNUSED)
	self.Text:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
end

function CfInactiveCurrencyCheckBoxMixin:OnClick()
	if ( self:GetChecked() ) then
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
		C_CurrencyInfo.SetCurrencyUnused(CfTokenFrame.selectedID, true)
	else
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF)
		C_CurrencyInfo.SetCurrencyUnused(CfTokenFrame.selectedID, false)
	end
	local numTokens = C_CurrencyInfo.GetCurrencyListSize()
	for i=1, numTokens do
		if (  C_CurrencyInfo.GetCurrencyListInfo(i).name == CfTokenFrame.selectedToken ) then
			CfTokenFrame.selectedID = i;
			break;
		end
	end
	CfTokenFrame_Update()
	CfTokenFramePopup_CloseIfHidden()
end

function CfInactiveCurrencyCheckBoxMixin:OnEnter()
	GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
	GameTooltip_AddNormalLine(GameTooltip, TOKEN_MOVE_TO_UNUSED)
	GameTooltip:Show()
end

CfBackpackCurrencyCheckBoxMixin = {};

function CfBackpackCurrencyCheckBoxMixin:OnLoad()
	self:Disable()
	self.Text:SetText(SHOW_ON_BACKPACK)
	self.Text:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
end

TokenFrame.ScrollBox:Hide()
TokenFrame.ScrollBar:Hide()

TokenFrame:HookScript("OnShow", function()
	CfTokenFrame:Show()
end)

TokenFrame:HookScript("OnHide", function()
	CfTokenFrame:Hide()
end)