if not _G.CharacterFrame then return end

ApplyCloseButton(CharacterFrameCloseButton)

CharacterFrame.PortraitContainer.CircleMask:Hide()

CharacterFramePortrait:SetSize(61, 61)
CharacterFramePortrait:ClearAllPoints()
CharacterFramePortrait:SetPoint("TOPLEFT", -6, 8)

CharacterFrame.TitleContainer:ClearAllPoints()
CharacterFrame.TitleContainer:SetPoint("TOPLEFT", CharacterFrame, "TOPLEFT", 58, 1)
CharacterFrame.TitleContainer:SetPoint("TOPRIGHT", CharacterFrame, "TOPRIGHT", -58, 1)

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

ReputationFrame.ScrollBar:SetSize(25, 560)
ReputationFrame.ScrollBar:ClearAllPoints()
ReputationFrame.ScrollBar:SetPoint("TOPLEFT", ReputationFrame.ScrollBox, "TOPRIGHT", -1, 3)
ReputationFrame.ScrollBar:SetPoint("BOTTOMLEFT", ReputationFrame.ScrollBox, "BOTTOMRIGHT", 2, -1)

ApplyScrollBarArrow(ReputationFrame.ScrollBar)
ApplyScrollBarTrack(ReputationFrame.ScrollBar.Track)
ApplyScrollBarThumb(ReputationFrame.ScrollBar.Track.Thumb)

ReputationFrame.ReputationDetailFrame.CloseButton:SetSize(32, 32)
ReputationFrame.ReputationDetailFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
ReputationFrame.ReputationDetailFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
ReputationFrame.ReputationDetailFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
ReputationFrame.ReputationDetailFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
ReputationFrame.ReputationDetailFrame.CloseButton:ClearAllPoints()
ReputationFrame.ReputationDetailFrame.CloseButton:SetPoint("TOPRIGHT", -3, -3)

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

ReputationFrame.filterDropdown:Hide()
TokenFrame.filterDropdown:Hide()

ApplyDialogBorder(ReputationFrame.ReputationDetailFrame.Border)

TokenFrame.ScrollBar:SetSize(25, 560)
TokenFrame.ScrollBar:ClearAllPoints()
TokenFrame.ScrollBar:SetPoint("TOPLEFT", TokenFrame.ScrollBox, "TOPRIGHT", -1, 3)
TokenFrame.ScrollBar:SetPoint("BOTTOMLEFT", TokenFrame.ScrollBox, "BOTTOMRIGHT", 2, -1)

ApplyScrollBarArrow(TokenFrame.ScrollBar)
ApplyScrollBarTrack(TokenFrame.ScrollBar.Track)
ApplyScrollBarThumb(TokenFrame.ScrollBar.Track.Thumb)

TokenFrame.CurrencyTransferLogToggleButton:Hide()

select(5, TokenFramePopup:GetChildren()):SetSize(32, 32)
select(5, TokenFramePopup:GetChildren()):SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
select(5, TokenFramePopup:GetChildren()):SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
select(5, TokenFramePopup:GetChildren()):SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
select(5, TokenFramePopup:GetChildren()):SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
select(5, TokenFramePopup:GetChildren()):ClearAllPoints()
select(5, TokenFramePopup:GetChildren()):SetPoint("TOPRIGHT", -3, -3)

if (TokenFramePopupCorner == nil) then
	TokenFramePopup:CreateTexture("TokenFramePopupCorner", "OVERLAY")
	TokenFramePopupCorner:SetSize(32, 32)
	TokenFramePopupCorner:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Corner")
	TokenFramePopupCorner:SetPoint("TOPRIGHT", -6, -7)
end

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

hooksecurefunc(CharacterFrame, "UpdatePortrait", function(self)
	self:SetPortraitToSpecIcon()
end)

hooksecurefunc(CharacterFrame, "UpdateSize", function(self)
	if ReputationFrame:IsShown() then
		self:SetWidth(338)
	elseif TokenFrame:IsShown() then
		self:SetWidth(338)
	end
end)

hooksecurefunc(CharacterFrame, "UpdateTitle", function(self)
	self:SetTitleColor(HIGHLIGHT_FONT_COLOR)
	self:SetTitle(UnitPVPName("player"))
end)

CharacterModelScene.ControlFrame:HookScript("OnShow", function(self)
	ApplyControlFrame(self)
end)

CharacterFrame:HookScript("OnShow", function()
	CfPlayerFrameHealthBar.showNumeric = true;
	CfPlayerFrameManaBar.showNumeric = true;
	CfPlayerFrameHealthBar:ShowStatusBarText()
	CfPlayerFrameManaBar:ShowStatusBarText()
end)

CharacterFrame:HookScript("OnHide", function()
	CfPlayerFrameHealthBar.showNumeric = nil;
	CfPlayerFrameManaBar.showNumeric = nil;
	CfPlayerFrameHealthBar:HideStatusBarText()
	CfPlayerFrameManaBar:HideStatusBarText()
end)

PaperDollFrame:HookScript("OnShow", function()
	CharacterModelScene.ControlFrame:Hide()
end)