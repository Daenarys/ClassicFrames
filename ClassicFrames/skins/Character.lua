if not _G.CharacterFrame then return end

CharacterFrame.Background:Hide()
ReputationFrame.filterDropdown:Hide()
TokenFrame.CurrencyTransferLogToggleButton:Hide()
TokenFrame.filterDropdown:Hide()

if (ReputationFrame.FactionLabel == nil) then
	ReputationFrame.FactionLabel = ReputationFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	ReputationFrame.FactionLabel:SetText(FACTION)
	ReputationFrame.FactionLabel:SetPoint("TOPLEFT", 70, -42)
end
if (ReputationFrame.StandingLabel == nil) then
	ReputationFrame.StandingLabel = ReputationFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
	ReputationFrame.StandingLabel:SetText(STANDING)
	ReputationFrame.StandingLabel:SetPoint("TOPLEFT", 215, -42)
end

hooksecurefunc(ReputationHeaderMixin, 'Initialize', function(self)
	if not self.IsSkinned then
		self:SetHitRectInsets(0, 267, 0, 0)
		self.Name:SetPoint("LEFT", 20, 0)

		self.Left:SetAlpha(0)
		self.Right:SetAlpha(0)
		self.Middle:SetAlpha(0)

		if (self.ExpandOrCollapseButton == nil) then
			self.ExpandOrCollapseButton = self:CreateTexture(nil, "ARTWORK")
			self.ExpandOrCollapseButton:SetSize(16, 16)
			self.ExpandOrCollapseButton:SetPoint("LEFT")
		end

		self.HighlightLeft:SetAlpha(0)
		self.HighlightRight:SetAlpha(0)
		self.HighlightMiddle:SetAlpha(0)

		self:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight")
		self:GetHighlightTexture():SetAllPoints(self.ExpandOrCollapseButton)

		self.IsSkinned = true
	end

	if self:IsCollapsed() then
		self.ExpandOrCollapseButton:SetTexture("Interface\\Buttons\\UI-PlusButton-Up")
	else
		self.ExpandOrCollapseButton:SetTexture("Interface\\Buttons\\UI-MinusButton-Up")
	end

	hooksecurefunc(self, 'ToggleCollapsed', function()
		if self:IsCollapsed() then
			self.ExpandOrCollapseButton:SetTexture("Interface\\Buttons\\UI-PlusButton-Up")
		else
			self.ExpandOrCollapseButton:SetTexture("Interface\\Buttons\\UI-MinusButton-Up")
		end
	end)
end)

hooksecurefunc(ReputationEntryMixin, 'Initialize', function(self, elementData)
	if not self.IsSkinned then
		if (self.Content.Background == nil) then
			self.Content.Background = self:CreateTexture(nil, "BACKGROUND")
			self.Content.Background:SetSize(0, 21)
			self.Content.Background:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ReputationBar")
			self.Content.Background:SetTexCoord(0.0, 0.7578125, 0.0, 0.328125)
			self.Content.Background:SetPoint("TOPRIGHT", self.Content.ReputationBar.LeftTexture, "TOPLEFT")
			self.Content.Background:SetPoint("LEFT", 15, 0)
			self.Content.Background:Hide()
		end

		self.Content.AccountWideIcon:SetPoint("LEFT", -7, 0)
		self.Content.Name:SetPoint("LEFT", self.Content.AccountWideIcon, "RIGHT", 10, 0)

		self.IsSkinned = true
	end

	if elementData.isHeader and not elementData.isHeaderWithRep then
		self.Content.Background:Hide()
		self.Content.Name:SetFontObject(GameFontNormalLeft)
	else
		self.Content.Background:Show()
		self.Content.Name:SetFontObject(GameFontHighlightSmall)
		self.Content.ReputationBar.LeftTexture:SetHeight(21)
		self.Content.ReputationBar.LeftTexture:SetTexCoord(0.7578125, 1.0, 0.0, 0.328125)
		self.Content.ReputationBar.RightTexture:SetHeight(21)
		self.Content.ReputationBar.RightTexture:SetTexCoord(0.0, 0.1640625, 0.34375, 0.671875)
	end
end)

hooksecurefunc(ReputationSubHeaderMixin, 'Initialize', function(self, elementData)
	if elementData.isHeaderWithRep then
		self.ToggleCollapseButton:SetPoint("LEFT", self.Content.AccountWideIcon, "RIGHT", 5, 1)
	else
		self.ToggleCollapseButton:SetPoint("LEFT", self.Content.AccountWideIcon, "RIGHT", 3, 0)
	end
end)

hooksecurefunc(ReputationSubHeaderToggleCollapseButtonMixin, "RefreshIcon", function(self)
	self:SetSize(16, 16)
	if self:GetHeader():IsCollapsed() then
		self:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
		self:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-Up")
	else
		self:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
		self:SetPushedTexture("Interface\\Buttons\\UI-MinusButton-Up")
	end
end)

local repview = ReputationFrame.ScrollBox:GetView()
if repview then
	repview:SetPadding(1,1,8,8,0)
end

hooksecurefunc(TokenHeaderMixin, 'Initialize', function(self)
	if not self.IsSkinned then
		self.Name:ClearAllPoints()
		self.Name:SetPoint("LEFT", 22, 1)

		if self.Left then
			self.Left:SetSize(76, 16)
			self.Left:ClearAllPoints()
			self.Left:SetPoint("LEFT")
			self.Left:SetTexture("Interface\\Buttons\\CollapsibleHeader")
			self.Left:SetTexCoord(0.17578125, 0.47265625, 0.29687500, 0.54687500)
		end

		if self.Right then
			self.Right:ClearAllPoints()
			self.Right:SetPoint("RIGHT")

			hooksecurefunc(self, "UpdateCollapsedState", function()
				self.Right:SetSize(76, 16)
				self.Right:SetTexture("Interface\\Buttons\\CollapsibleHeader")
				self.Right:SetTexCoord(0.17578125, 0.47265625, 0.01562500, 0.26562500)
			end)
		end

		if self.Middle then
			self.Middle:SetSize(0, 16)
			self.Middle:ClearAllPoints()
			self.Middle:SetPoint("TOPLEFT", self.Left, "TOPRIGHT", -20, 0)
			self.Middle:SetPoint("BOTTOMRIGHT", self.Right, "BOTTOMLEFT", 20, 0)
			self.Middle:SetTexture("Interface\\Buttons\\CollapsibleHeader")
			self.Middle:SetTexCoord(0.48046875, 0.98046875, 0.01562500, 0.26562500)
		end

		if (self.ExpandIcon == nil) then
			self.ExpandIcon = self:CreateTexture(nil, "OVERLAY")
			self.ExpandIcon:SetSize(7, 7)
			self.ExpandIcon:SetTexture("Interface\\Buttons\\UI-PlusMinus-Buttons")
			self.ExpandIcon:SetPoint("LEFT", 8, 0)
		end

		self.HighlightLeft:SetAlpha(0)
		self.HighlightRight:SetAlpha(0)
		self.HighlightMiddle:SetAlpha(0)

		self:SetHighlightTexture("Interface\\TokenFrame\\UI-TokenFrame-CategoryButton")
		self:GetHighlightTexture():SetTexCoord(0, 1, 0.609375, 0.796875)
		self:GetHighlightTexture():ClearAllPoints()
		self:GetHighlightTexture():SetPoint("TOPLEFT", 3, -7)
		self:GetHighlightTexture():SetPoint("BOTTOMRIGHT", -3, 7)

		self.IsSkinned = true
	end

	if self:IsCollapsed() then
		self.ExpandIcon:SetTexCoord(0, 0.4375, 0, 0.4375)
	else
		self.ExpandIcon:SetTexCoord(0.5625, 1, 0, 0.4375)
	end

	hooksecurefunc(self, 'ToggleCollapsed', function()
		if self:IsCollapsed() then
			self.ExpandIcon:SetTexCoord(0, 0.4375, 0, 0.4375)
		else
			self.ExpandIcon:SetTexCoord(0.5625, 1, 0, 0.4375)
		end
	end)
end)

hooksecurefunc(TokenEntryMixin, 'Initialize', function(self)
	if not self.IsSkinned then
		self.Content.CurrencyIcon:SetSize(15, 15)

		self.IsSkinned = true
	end
end)

hooksecurefunc(TokenSubHeaderToggleCollapseButtonMixin, "RefreshIcon", function(self)
	self:SetSize(16, 16)
	if self:GetHeader():IsCollapsed() then
		self:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
		self:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-Up")
	else
		self:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
		self:SetPushedTexture("Interface\\Buttons\\UI-MinusButton-Up")
	end
end)

local tokenview = TokenFrame.ScrollBox:GetView()
if tokenview then
	tokenview:SetPadding(-2, 0, 2, 3, 0)
end

ApplyDropDown(GearManagerPopupFrame.BorderBox.IconTypeDropdown)

hooksecurefunc(CharacterFrame, "UpdatePortrait", function(self)
	self:SetPortraitToSpecIcon()
end)

hooksecurefunc(CharacterFrame, "UpdateSize", function(self)
	if ReputationFrame:IsShown() or TokenFrame:IsShown() then
		self:SetWidth(338)
	end
end)

hooksecurefunc(CharacterFrame, "UpdateTitle", function(self)
	self:SetTitleColor(HIGHLIGHT_FONT_COLOR)
	self:SetTitle(UnitPVPName("player"))
end)