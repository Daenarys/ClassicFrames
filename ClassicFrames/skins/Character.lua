if not _G.CharacterFrame then return end

ApplyCloseButton(CharacterFrameCloseButton)

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
ReputationFrame.filterDropdown:Hide()
TokenFrame.CurrencyTransferLogToggleButton:Hide()
TokenFrame.filterDropdown:Hide()

ReputationFrame.ScrollBar:SetSize(25, 560)
ReputationFrame.ScrollBar:ClearAllPoints()
ReputationFrame.ScrollBar:SetPoint("TOPLEFT", ReputationFrame.ScrollBox, "TOPRIGHT", -4, 5)
ReputationFrame.ScrollBar:SetPoint("BOTTOMLEFT", ReputationFrame.ScrollBox, "BOTTOMRIGHT", 4, -3)

ApplyScrollBarArrow(ReputationFrame.ScrollBar)
ApplyScrollBarTrack(ReputationFrame.ScrollBar.Track)
ApplyScrollBarThumb(ReputationFrame.ScrollBar.Track.Thumb)

ApplyCloseButton(ReputationFrame.ReputationDetailFrame.CloseButton, true)
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

ApplyDialogBorder(ReputationFrame.ReputationDetailFrame.Border)

TokenFrame.ScrollBar:SetSize(25, 560)
TokenFrame.ScrollBar:ClearAllPoints()
TokenFrame.ScrollBar:SetPoint("TOPLEFT", TokenFrame.ScrollBox, "TOPRIGHT", -4, 5)
TokenFrame.ScrollBar:SetPoint("BOTTOMLEFT", TokenFrame.ScrollBox, "BOTTOMRIGHT", 4, -3)

ApplyScrollBarArrow(TokenFrame.ScrollBar)
ApplyScrollBarTrack(TokenFrame.ScrollBar.Track)
ApplyScrollBarThumb(TokenFrame.ScrollBar.Track.Thumb)

ApplyCloseButton(select(5, TokenFramePopup:GetChildren()), true)
select(5, TokenFramePopup:GetChildren()):ClearAllPoints()
select(5, TokenFramePopup:GetChildren()):SetPoint("TOPRIGHT", -2, -3)

if (TokenFramePopupCorner == nil) then
	TokenFramePopup:CreateTexture("TokenFramePopupCorner", "OVERLAY")
	TokenFramePopupCorner:SetSize(32, 32)
	TokenFramePopupCorner:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Corner")
	TokenFramePopupCorner:SetPoint("TOPRIGHT", -6, -7)
end

ApplyDialogBorder(TokenFramePopup.Border)

PaperDollFrame.TitleManagerPane.ScrollBar:ClearAllPoints()
PaperDollFrame.TitleManagerPane.ScrollBar:SetPoint("TOPLEFT", PaperDollFrame.TitleManagerPane.ScrollBox, "TOPRIGHT", 10, 1)
PaperDollFrame.TitleManagerPane.ScrollBar:SetPoint("BOTTOMLEFT", PaperDollFrame.TitleManagerPane.ScrollBox, "BOTTOMRIGHT", 10, -1)

ApplyScrollBarHybrid(PaperDollFrame.TitleManagerPane.ScrollBar)
ApplyScrollBarThumb(PaperDollFrame.TitleManagerPane.ScrollBar.Track.Thumb)

PaperDollFrame.EquipmentManagerPane.ScrollBar:ClearAllPoints()
PaperDollFrame.EquipmentManagerPane.ScrollBar:SetPoint("TOPLEFT", PaperDollFrame.EquipmentManagerPane.ScrollBox, "TOPRIGHT", 10, 24)
PaperDollFrame.EquipmentManagerPane.ScrollBar:SetPoint("BOTTOMLEFT", PaperDollFrame.EquipmentManagerPane.ScrollBox, "BOTTOMRIGHT", 10, -1)

ApplyScrollBarHybrid(PaperDollFrame.EquipmentManagerPane.ScrollBar)
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