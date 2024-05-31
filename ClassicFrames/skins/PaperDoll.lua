if not _G.PaperDollFrame then return end

local STRIPE_COLOR = {r=0.9, g=0.9, b=1};

function CfPaperDollTitlesPane_OnLoad(self)
	HybridScrollFrame_OnLoad(self)
	self.update = CfPaperDollTitlesPane_UpdateScrollFrame;
	HybridScrollFrame_CreateButtons(self, "CfPlayerTitleButtonTemplate", 2, -4)
end

function CfPaperDollTitlesPane_UpdateScrollFrame()
	local buttons = CfPaperDollTitlesPane.buttons;
	local playerTitles = CfPaperDollTitlesPane.titles;
	local numButtons = #buttons;
	local scrollOffset = HybridScrollFrame_GetOffset(CfPaperDollTitlesPane)
	local playerTitle;
	for i = 1, numButtons do
		playerTitle = playerTitles[i + scrollOffset];
		if ( playerTitle ) then
			buttons[i]:Show()
			buttons[i].text:SetText(playerTitle.name)
			buttons[i].titleId = playerTitle.id;
			if ( CfPaperDollTitlesPane.selected == playerTitle.id ) then
				buttons[i].Check:Show()
				buttons[i].SelectedBar:Show()
			else
				buttons[i].Check:Hide()
				buttons[i].SelectedBar:Hide()
			end

			if ((i+scrollOffset) == 1) then
				buttons[i].BgTop:Show()
				buttons[i].BgMiddle:SetPoint("TOP", buttons[i].BgTop, "BOTTOM")
			else
				buttons[i].BgTop:Hide()
				buttons[i].BgMiddle:SetPoint("TOP")
			end

			if ((i+scrollOffset) == #playerTitles) then
				buttons[i].BgBottom:Show()
				buttons[i].BgMiddle:SetPoint("BOTTOM", buttons[i].BgBottom, "TOP")
			else
				buttons[i].BgBottom:Hide()
				buttons[i].BgMiddle:SetPoint("BOTTOM")
			end

			if ((i+scrollOffset)%2 == 0) then
				buttons[i].Stripe:SetColorTexture(STRIPE_COLOR.r, STRIPE_COLOR.g, STRIPE_COLOR.b)
				buttons[i].Stripe:SetAlpha(0.1)
				buttons[i].Stripe:Show()
			else
				buttons[i].Stripe:Hide()
			end
		else
			buttons[i]:Hide()
		end
	end
end

local function PlayerTitleSort(a, b) return a.name < b.name; end

function CfPaperDollTitlesPane_Update()
	local currentTitle = GetCurrentTitle()
	local buttons = CfPaperDollTitlesPane.buttons;
	local playerTitles = GetKnownTitles()
	if ( currentTitle > 0 and currentTitle <= GetNumTitles() and IsTitleKnown(currentTitle) ) then
		CfPaperDollTitlesPane.selected = currentTitle;
	else
		CfPaperDollTitlesPane.selected = -1;
	end

	table.sort(playerTitles, PlayerTitleSort)
	playerTitles[1].name = PLAYER_TITLE_NONE;
	CfPaperDollTitlesPane.titles = playerTitles;

	HybridScrollFrame_Update(CfPaperDollTitlesPane, #playerTitles * PLAYER_TITLE_HEIGHT + 20 , CfPaperDollTitlesPane:GetHeight())
	CfPaperDollTitlesPane_UpdateScrollFrame()
end

function CfPlayerTitleButton_OnClick(self)
	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF)
	SetCurrentTitle(self.titleId)
end

PaperDollFrame.TitleManagerPane.ScrollBox:Hide()
PaperDollFrame.TitleManagerPane.ScrollBar:Hide()

PaperDollFrame.TitleManagerPane:HookScript("OnShow", function()
	CfPaperDollTitlesPane:Show()
end)

PaperDollFrame.TitleManagerPane:HookScript("OnHide", function()
	CfPaperDollTitlesPane:Hide()
end)

PaperDollFrame:HookScript("OnEvent", function(self, event, ...)
	local unit = ...;
	
	if ( event == "KNOWN_TITLES_UPDATE" or (event == "UNIT_NAME_UPDATE" and unit == "player")) then
		if (CfPaperDollTitlesPane:IsShown()) then
			CfPaperDollTitlesPane_Update()
		end
	end
end)