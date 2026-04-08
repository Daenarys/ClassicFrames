if not _G.CharacterFrame then return end

ApplyCloseButton(CharacterFrameCloseButton)

CharacterFramePortrait:SetSize(61, 61)
CharacterFramePortrait:ClearAllPoints()
CharacterFramePortrait:SetPoint("TOPLEFT", -6, 8)

CharacterFrame.TitleContainer:ClearAllPoints()
CharacterFrame.TitleContainer:SetPoint("TOPLEFT", CharacterFrame, "TOPLEFT", 58, 0)
CharacterFrame.TitleContainer:SetPoint("TOPRIGHT", CharacterFrame, "TOPRIGHT", -58, 0)

ApplyTitleBg(CharacterFrame)
ApplyNineSlicePortrait(CharacterFrame)

CharacterFrameTab2:ClearAllPoints()
CharacterFrameTab2:SetPoint("LEFT", CharacterFrameTab1, "RIGHT", -15, 0)
CharacterFrameTab3:ClearAllPoints()
CharacterFrameTab3:SetPoint("LEFT", CharacterFrameTab2, "RIGHT", -15, 0)

for i = 1, 3 do
	ApplyBottomTab(_G['CharacterFrameTab'..i])

	_G["CharacterFrameTab"..i]:HookScript("OnShow", function(self)
		self:SetWidth(40 + self:GetFontString():GetStringWidth())
	end)
end

CharacterFrame.Background:Hide()
ReputationFrame.filterDropdown:Hide()
TokenFrame.CurrencyTransferLogToggleButton:Hide()
TokenFrame.filterDropdown:Hide()

ReputationFrame.ScrollBar:SetSize(25, 560)
ReputationFrame.ScrollBar:ClearAllPoints()
ReputationFrame.ScrollBar:SetPoint("TOPLEFT", ReputationFrame.ScrollBox, "TOPRIGHT", -3, 3)
ReputationFrame.ScrollBar:SetPoint("BOTTOMLEFT", ReputationFrame.ScrollBox, "BOTTOMRIGHT", 3, -1)

ApplyScrollBarArrow(ReputationFrame.ScrollBar)
ApplyScrollBarTrack(ReputationFrame.ScrollBar.Track)
ApplyScrollBarThumb(ReputationFrame.ScrollBar.Track.Thumb)

ReputationFrame.ReputationDetailFrame.CloseButton:SetSize(32, 32)
ReputationFrame.ReputationDetailFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
ReputationFrame.ReputationDetailFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
ReputationFrame.ReputationDetailFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
ReputationFrame.ReputationDetailFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
ReputationFrame.ReputationDetailFrame.CloseButton:ClearAllPoints()
ReputationFrame.ReputationDetailFrame.CloseButton:SetPoint("TOPRIGHT", -2, -3)

ReputationFrame.ReputationDetailFrame.ScrollingDescriptionScrollBar.Track.Begin:Hide()
ReputationFrame.ReputationDetailFrame.ScrollingDescriptionScrollBar.Track.End:Hide()
ReputationFrame.ReputationDetailFrame.ScrollingDescriptionScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(ReputationFrame.ReputationDetailFrame.ScrollingDescriptionScrollBar, true)
ApplyScrollBarThumb(ReputationFrame.ReputationDetailFrame.ScrollingDescriptionScrollBar.Track.Thumb)

if (ReputationDetailCorner == nil) then
	ReputationFrame.ReputationDetailFrame:CreateTexture("ReputationDetailCorner", "OVERLAY")
	ReputationDetailCorner:SetSize(32, 32)
	ReputationDetailCorner:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Corner")
	ReputationDetailCorner:SetPoint("TOPRIGHT", -6, -7)
end

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

hooksecurefunc(ReputationHeaderMixin, "Initialize", function(self)
	if not self.IsSkinned then
		self:SetHitRectInsets(0, 267, 0, 6)
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

		self:HookScript("OnMouseDown", function()
			self.Name:SetPoint("LEFT", 20, 0)
		end)

		self:HookScript("OnMouseUp", function()
			self.Name:SetPoint("LEFT", 20, 0)
		end)

		self.IsSkinned = true
	end

	if self:IsCollapsed() then
		self.ExpandOrCollapseButton:SetTexture("Interface\\Buttons\\UI-PlusButton-Up")
	else
		self.ExpandOrCollapseButton:SetTexture("Interface\\Buttons\\UI-MinusButton-Up")
	end
end)

hooksecurefunc(ReputationEntryMixin, "Initialize", function(self, elementData)
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

ApplyDialogBorder(ReputationFrame.ReputationDetailFrame.Border)

TokenFrame.ScrollBar:SetSize(25, 560)
TokenFrame.ScrollBar:ClearAllPoints()
TokenFrame.ScrollBar:SetPoint("TOPLEFT", TokenFrame.ScrollBox, "TOPRIGHT", -3, 3)
TokenFrame.ScrollBar:SetPoint("BOTTOMLEFT", TokenFrame.ScrollBox, "BOTTOMRIGHT", 3, -1)

ApplyScrollBarArrow(TokenFrame.ScrollBar)
ApplyScrollBarTrack(TokenFrame.ScrollBar.Track)
ApplyScrollBarThumb(TokenFrame.ScrollBar.Track.Thumb)

select(5, TokenFramePopup:GetChildren()):SetSize(32, 32)
select(5, TokenFramePopup:GetChildren()):SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
select(5, TokenFramePopup:GetChildren()):SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
select(5, TokenFramePopup:GetChildren()):SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
select(5, TokenFramePopup:GetChildren()):SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
select(5, TokenFramePopup:GetChildren()):ClearAllPoints()
select(5, TokenFramePopup:GetChildren()):SetPoint("TOPRIGHT", -2, -3)

if (TokenFramePopupCorner == nil) then
	TokenFramePopup:CreateTexture("TokenFramePopupCorner", "OVERLAY")
	TokenFramePopupCorner:SetSize(32, 32)
	TokenFramePopupCorner:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Corner")
	TokenFramePopupCorner:SetPoint("TOPRIGHT", -6, -7)
end

hooksecurefunc(TokenHeaderMixin, "Initialize", function(self)
	if not self.IsSkinned then
		self.Name:SetPoint("LEFT", 22, 0)

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
			self.Middle:SetPoint("LEFT", self.Left, "RIGHT", -20, 0)
			self.Middle:SetPoint("RIGHT", self.Right, "LEFT", 20, 0)
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

		self:HookScript("OnMouseDown", function()
			self.Name:SetPoint("LEFT", 22, 0)
		end)

		self:HookScript("OnMouseUp", function()
			self.Name:SetPoint("LEFT", 22, 0)
		end)

		self.IsSkinned = true
	end

	if self:IsCollapsed() then
		self.ExpandIcon:SetTexCoord(0, 0.4375, 0, 0.4375)
	else
		self.ExpandIcon:SetTexCoord(0.5625, 1, 0, 0.4375)
	end
end)

hooksecurefunc(TokenSubHeaderToggleCollapseButtonMixin, "RefreshIcon", function(self)
	if self:GetHeader():IsCollapsed() then
		self:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
		self:SetPushedTexture("Interface\\Buttons\\UI-PlusButton-Up")
	else
		self:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
		self:SetPushedTexture("Interface\\Buttons\\UI-MinusButton-Up")
	end
end)

ApplyDialogBorder(TokenFramePopup.Border)

PaperDollFrame.TitleManagerPane.ScrollBar:SetSize(25, 560)
PaperDollFrame.TitleManagerPane.ScrollBar:ClearAllPoints()
PaperDollFrame.TitleManagerPane.ScrollBar:SetPoint("TOPLEFT", PaperDollFrame.TitleManagerPane.ScrollBox, "TOPRIGHT", 2, 0)
PaperDollFrame.TitleManagerPane.ScrollBar:SetPoint("BOTTOMLEFT", PaperDollFrame.TitleManagerPane.ScrollBox, "BOTTOMRIGHT", 2, -1)

ApplyScrollBarArrow(PaperDollFrame.TitleManagerPane.ScrollBar)
ApplyScrollBarTrack(PaperDollFrame.TitleManagerPane.ScrollBar.Track)
ApplyScrollBarThumb(PaperDollFrame.TitleManagerPane.ScrollBar.Track.Thumb)

PaperDollFrame.EquipmentManagerPane.ScrollBar:SetSize(25, 560)
PaperDollFrame.EquipmentManagerPane.ScrollBar:ClearAllPoints()
PaperDollFrame.EquipmentManagerPane.ScrollBar:SetPoint("TOPLEFT", PaperDollFrame.EquipmentManagerPane.ScrollBox, "TOPRIGHT", 2, 23)
PaperDollFrame.EquipmentManagerPane.ScrollBar:SetPoint("BOTTOMLEFT", PaperDollFrame.EquipmentManagerPane.ScrollBox, "BOTTOMRIGHT", 2, -1)

ApplyScrollBarArrow(PaperDollFrame.EquipmentManagerPane.ScrollBar)
ApplyScrollBarTrack(PaperDollFrame.EquipmentManagerPane.ScrollBar.Track)
ApplyScrollBarThumb(PaperDollFrame.EquipmentManagerPane.ScrollBar.Track.Thumb)

GearManagerPopupFrame.IconSelector.ScrollBar:SetSize(25, 560)
GearManagerPopupFrame.IconSelector.ScrollBar:ClearAllPoints()
GearManagerPopupFrame.IconSelector.ScrollBar:SetPoint("TOPRIGHT", -3, 30)
GearManagerPopupFrame.IconSelector.ScrollBar:SetPoint("BOTTOMRIGHT", -3, -2)

ApplyScrollBarArrow(GearManagerPopupFrame.IconSelector.ScrollBar)
ApplyScrollBarTrack(GearManagerPopupFrame.IconSelector.ScrollBar.Track)
ApplyScrollBarThumb(GearManagerPopupFrame.IconSelector.ScrollBar.Track.Thumb)

ApplyDropDown(GearManagerPopupFrame.BorderBox.IconTypeDropdown)
GearManagerPopupFrame.BorderBox.IconTypeDropdown.Text:SetJustifyH("RIGHT")

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

CharacterModelScene.ControlFrame:HookScript("OnShow", function(self)
	self:SetPoint("TOP")
end)

PaperDollFrame:HookScript("OnShow", function()
	CharacterModelScene.ControlFrame:Hide()
end)