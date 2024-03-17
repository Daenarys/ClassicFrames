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

ReputationFrame.ScrollBar:SetSize(25, 560)
ReputationFrame.ScrollBar:ClearAllPoints()
ReputationFrame.ScrollBar:SetPoint("TOPLEFT", ReputationFrame.ScrollBox, "TOPRIGHT", -1, 3)
ReputationFrame.ScrollBar:SetPoint("BOTTOMLEFT", ReputationFrame.ScrollBox, "BOTTOMRIGHT", 2, -1)

ApplyScrollBarArrow(ReputationFrame.ScrollBar)
ApplyScrollBarTrack(ReputationFrame.ScrollBar.Track)
ApplyScrollBarThumb(ReputationFrame.ScrollBar.Track.Thumb)

ReputationDetailCloseButton:SetSize(32, 32)
ReputationDetailCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
ReputationDetailCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
ReputationDetailCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
ReputationDetailCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
ReputationDetailCloseButton:ClearAllPoints()
ReputationDetailCloseButton:SetPoint("TOPRIGHT", -3, -3)

if (ReputationDetailFrameCorner == nil) then
	ReputationDetailFrame:CreateTexture("ReputationDetailFrameCorner", "OVERLAY")
	ReputationDetailFrameCorner:SetSize(32, 32)
	ReputationDetailFrameCorner:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Corner")
	ReputationDetailFrameCorner:ClearAllPoints()
	ReputationDetailFrameCorner:SetPoint("TOPRIGHT", -6, -7)
end

ApplyDialogBorder(ReputationDetailFrame.Border)

TokenFrame.ScrollBar:SetSize(25, 560)
TokenFrame.ScrollBar:ClearAllPoints()
TokenFrame.ScrollBar:SetPoint("TOPLEFT", TokenFrame.ScrollBox, "TOPRIGHT", -1, 3)
TokenFrame.ScrollBar:SetPoint("BOTTOMLEFT", TokenFrame.ScrollBox, "BOTTOMRIGHT", 2, -1)

ApplyScrollBarArrow(TokenFrame.ScrollBar)
ApplyScrollBarTrack(TokenFrame.ScrollBar.Track)
ApplyScrollBarThumb(TokenFrame.ScrollBar.Track.Thumb)

select(4, TokenFramePopup:GetChildren()):SetSize(32, 32)
select(4, TokenFramePopup:GetChildren()):SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
select(4, TokenFramePopup:GetChildren()):SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
select(4, TokenFramePopup:GetChildren()):SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
select(4, TokenFramePopup:GetChildren()):SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
select(4, TokenFramePopup:GetChildren()):ClearAllPoints()
select(4, TokenFramePopup:GetChildren()):SetPoint("TOPRIGHT", -3, -3)

if (TokenFramePopupCorner == nil) then
	TokenFramePopup:CreateTexture("TokenFramePopupCorner")
	TokenFramePopupCorner:SetSize(32, 32)
	TokenFramePopupCorner:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Corner")
	TokenFramePopupCorner:ClearAllPoints()
	TokenFramePopupCorner:SetPoint("TOPRIGHT", -6, -7)
end

ApplyDialogBorder(TokenFramePopup.Border)

PaperDollFrame.TitleManagerPane.ScrollBar:SetSize(25, 560)
PaperDollFrame.TitleManagerPane.ScrollBar:ClearAllPoints()
PaperDollFrame.TitleManagerPane.ScrollBar:SetPoint("TOPLEFT", PaperDollFrame.TitleManagerPane.ScrollBox, "TOPRIGHT", 1, 1)
PaperDollFrame.TitleManagerPane.ScrollBar:SetPoint("BOTTOMLEFT", PaperDollFrame.TitleManagerPane.ScrollBox, "BOTTOMRIGHT", 4, -1)

ApplyScrollBarArrow(PaperDollFrame.TitleManagerPane.ScrollBar)
ApplyScrollBarTrack(PaperDollFrame.TitleManagerPane.ScrollBar.Track)
ApplyScrollBarThumb(PaperDollFrame.TitleManagerPane.ScrollBar.Track.Thumb)

PaperDollFrame.EquipmentManagerPane.ScrollBar:SetSize(25, 560)
PaperDollFrame.EquipmentManagerPane.ScrollBar:ClearAllPoints()
PaperDollFrame.EquipmentManagerPane.ScrollBar:SetPoint("TOPLEFT", PaperDollFrame.EquipmentManagerPane.ScrollBox, "TOPRIGHT", 1, 24)
PaperDollFrame.EquipmentManagerPane.ScrollBar:SetPoint("BOTTOMLEFT", PaperDollFrame.EquipmentManagerPane.ScrollBox, "BOTTOMRIGHT", 4, -1)

ApplyScrollBarArrow(PaperDollFrame.EquipmentManagerPane.ScrollBar)
ApplyScrollBarTrack(PaperDollFrame.EquipmentManagerPane.ScrollBar.Track)
ApplyScrollBarThumb(PaperDollFrame.EquipmentManagerPane.ScrollBar.Track.Thumb)

_G.PaperDollFrame:HookScript("OnShow", function()
	CharacterModelScene.ControlFrame:Hide()
end)

_G.CharacterModelScene.ControlFrame:HookScript("OnShow", function(self)
	self:SetSize(94, 23)
	self:ClearAllPoints()
	self:SetPoint("TOP", 0, -2)

	if (self.Right == nil) then
		self.Right = self:CreateTexture(nil, "BACKGROUND");
		self.Right:SetSize(23, 23)
		self.Right:SetTexture("Interface\\Common\\UI-ModelControlPanel")
		self.Right:SetTexCoord(0.01562500, 0.37500000, 0.42968750, 0.60937500)
		self.Right:SetPoint("RIGHT")
	end

	if (self.Left == nil) then
		self.Left = self:CreateTexture(nil, "BACKGROUND");
		self.Left:SetSize(23, 23)
		self.Left:SetTexture("Interface\\Common\\UI-ModelControlPanel")
		self.Left:SetTexCoord(0.40625000, 0.76562500, 0.42968750, 0.60937500)
		self.Left:SetPoint("LEFT")
	end

	if (self.Middle == nil) then
		self.Middle = self:CreateTexture(nil, "BACKGROUND");
		self.Middle:SetSize(32, 23)
		self.Middle:SetTexture("Interface\\Common\\UI-ModelControlPanel")
		self.Middle:SetTexCoord(0, 1, 0.62500000, 0.80468750)
		self.Middle:SetPoint("LEFT", self.Left, "RIGHT")
		self.Middle:SetPoint("RIGHT", self.Right, "LEFT")
	end

	self.zoomInButton:SetSize(18, 18)
	self.zoomInButton:ClearAllPoints()
	self.zoomInButton:SetPoint("LEFT", 2, 0)
	self.zoomInButton.Icon:SetTexture("Interface\\Common\\UI-ModelControlPanel")
	self.zoomInButton.Icon:SetTexCoord(0.57812500, 0.82812500, 0.14843750, 0.27343750)
	self.zoomInButton:SetHighlightTexture("Interface\\Common\\UI-ModelControlPanel")
	self.zoomInButton:GetHighlightTexture():SetTexCoord(0.57812500, 0.82812500, 0.00781250, 0.13281250)
	self.zoomInButton:GetHighlightTexture():SetSize(16, 16)
	self.zoomInButton:GetHighlightTexture():SetAlpha(1)

	if (self.zoomInButton.Bg == nil) then
		self.zoomInButton.Bg = self.zoomInButton:CreateTexture(nil, "BACKGROUND");
		self.zoomInButton.Bg:SetSize(16, 16)
		self.zoomInButton.Bg:SetTexture("Interface\\Common\\UI-ModelControlPanel")
		self.zoomInButton.Bg:SetTexCoord(0.29687500, 0.54687500, 0.14843750, 0.27343750)
		self.zoomInButton.Bg:SetPoint("CENTER")
	end

	self.zoomOutButton:SetSize(18, 18)
	self.zoomOutButton:ClearAllPoints()
	self.zoomOutButton:SetPoint("LEFT", self.zoomInButton, "RIGHT")
	self.zoomOutButton.Icon:SetTexture("Interface\\Common\\UI-ModelControlPanel")
	self.zoomOutButton.Icon:SetTexCoord(0.29687500, 0.54687500, 0.00781250, 0.13281250)
	self.zoomOutButton:SetHighlightTexture("Interface\\Common\\UI-ModelControlPanel")
	self.zoomOutButton:GetHighlightTexture():SetTexCoord(0.57812500, 0.82812500, 0.00781250, 0.13281250)
	self.zoomOutButton:GetHighlightTexture():SetSize(16, 16)
	self.zoomOutButton:GetHighlightTexture():SetAlpha(1)

	if (self.zoomOutButton.Bg == nil) then
		self.zoomOutButton.Bg = self.zoomOutButton:CreateTexture(nil, "BACKGROUND");
		self.zoomOutButton.Bg:SetSize(16, 16)
		self.zoomOutButton.Bg:SetTexture("Interface\\Common\\UI-ModelControlPanel")
		self.zoomOutButton.Bg:SetTexCoord(0.29687500, 0.54687500, 0.14843750, 0.27343750)
		self.zoomOutButton.Bg:SetPoint("CENTER")
	end

	self.rotateLeftButton:SetSize(18, 18)
	self.rotateLeftButton:ClearAllPoints()
	self.rotateLeftButton:SetPoint("LEFT", self.zoomOutButton, "RIGHT")
	self.rotateLeftButton.Icon:SetTexture("Interface\\Common\\UI-ModelControlPanel")
	self.rotateLeftButton.Icon:SetTexCoord(0.01562500, 0.26562500, 0.28906250, 0.41406250)
	self.rotateLeftButton:SetHighlightTexture("Interface\\Common\\UI-ModelControlPanel")
	self.rotateLeftButton:GetHighlightTexture():SetTexCoord(0.57812500, 0.82812500, 0.00781250, 0.13281250)
	self.rotateLeftButton:GetHighlightTexture():SetSize(16, 16)
	self.rotateLeftButton:GetHighlightTexture():SetAlpha(1)

	if (self.rotateLeftButton.Bg == nil) then
		self.rotateLeftButton.Bg = self.rotateLeftButton:CreateTexture(nil, "BACKGROUND");
		self.rotateLeftButton.Bg:SetSize(16, 16)
		self.rotateLeftButton.Bg:SetTexture("Interface\\Common\\UI-ModelControlPanel")
		self.rotateLeftButton.Bg:SetTexCoord(0.29687500, 0.54687500, 0.14843750, 0.27343750)
		self.rotateLeftButton.Bg:SetPoint("CENTER")
	end

	self.rotateRightButton:SetSize(18, 18)
	self.rotateRightButton:ClearAllPoints()
	self.rotateRightButton:SetPoint("LEFT", self.rotateLeftButton, "RIGHT")
	self.rotateRightButton.Icon:SetTexture("Interface\\Common\\UI-ModelControlPanel")
	self.rotateRightButton.Icon:SetTexCoord(0.57812500, 0.82812500, 0.28906250, 0.41406250)
	self.rotateRightButton:SetHighlightTexture("Interface\\Common\\UI-ModelControlPanel")
	self.rotateRightButton:GetHighlightTexture():SetTexCoord(0.57812500, 0.82812500, 0.00781250, 0.13281250)
	self.rotateRightButton:GetHighlightTexture():SetSize(16, 16)
	self.rotateRightButton:GetHighlightTexture():SetAlpha(1)

	if (self.rotateRightButton.Bg == nil) then
		self.rotateRightButton.Bg = self.rotateRightButton:CreateTexture(nil, "BACKGROUND");
		self.rotateRightButton.Bg:SetSize(16, 16)
		self.rotateRightButton.Bg:SetTexture("Interface\\Common\\UI-ModelControlPanel")
		self.rotateRightButton.Bg:SetTexCoord(0.29687500, 0.54687500, 0.14843750, 0.27343750)
		self.rotateRightButton.Bg:SetPoint("CENTER")
	end

	self.resetButton:SetSize(18, 18)
	self.resetButton:ClearAllPoints()
	self.resetButton:SetPoint("LEFT", self.rotateRightButton, "RIGHT")
	self.resetButton.Icon:SetTexture("Interface\\Common\\UI-ModelControlPanel")
	self.resetButton.Icon:SetTexCoord(0.01562500, 0.26562500, 0.00781250, 0.13281250)
	self.resetButton:SetHighlightTexture("Interface\\Common\\UI-ModelControlPanel")
	self.resetButton:GetHighlightTexture():SetTexCoord(0.57812500, 0.82812500, 0.00781250, 0.13281250)
	self.resetButton:GetHighlightTexture():SetSize(16, 16)
	self.resetButton:GetHighlightTexture():SetAlpha(1)

	if (self.resetButton.Bg == nil) then
		self.resetButton.Bg = self.resetButton:CreateTexture(nil, "BACKGROUND");
		self.resetButton.Bg:SetSize(16, 16)
		self.resetButton.Bg:SetTexture("Interface\\Common\\UI-ModelControlPanel")
		self.resetButton.Bg:SetTexCoord(0.29687500, 0.54687500, 0.14843750, 0.27343750)
		self.resetButton.Bg:SetPoint("CENTER")
	end
end)

hooksecurefunc(ModelSceneControlButtonMixin, "Init", function()
	local level = UnitLevel("player")
	local MIN_PLAYER_LEVEL_FOR_ITEM_LEVEL_DISPLAY = 60

	if ( level >= MIN_PLAYER_LEVEL_FOR_ITEM_LEVEL_DISPLAY ) then
		CharacterStatsPane.ItemLevelCategory:Show()
		CharacterStatsPane.ItemLevelFrame:Show()
		CharacterStatsPane.AttributesCategory:ClearAllPoints()
		CharacterStatsPane.AttributesCategory:SetPoint("TOP", CharacterStatsPane.ItemLevelFrame, "BOTTOM", 0, 0)
	else
		CharacterStatsPane.ItemLevelCategory:Hide()
		CharacterStatsPane.ItemLevelFrame:Hide()
		CharacterStatsPane.AttributesCategory:ClearAllPoints()
		CharacterStatsPane.AttributesCategory:SetPoint("TOP", CharacterStatsPane, "TOP", 0, -2)
	end
end)

hooksecurefunc("PaperDollFrame_UpdateStats", function()
	local level = UnitLevel("player")
	local MIN_PLAYER_LEVEL_FOR_ITEM_LEVEL_DISPLAY = 60

	if ( level >= MIN_PLAYER_LEVEL_FOR_ITEM_LEVEL_DISPLAY ) then
		CharacterStatsPane.ItemLevelCategory:Show()
		CharacterStatsPane.ItemLevelFrame:Show()
		CharacterStatsPane.AttributesCategory:ClearAllPoints()
		CharacterStatsPane.AttributesCategory:SetPoint("TOP", CharacterStatsPane.ItemLevelFrame, "BOTTOM", 0, 0)
	else
		CharacterStatsPane.ItemLevelCategory:Hide()
		CharacterStatsPane.ItemLevelFrame:Hide()
		CharacterStatsPane.AttributesCategory:ClearAllPoints()
		CharacterStatsPane.AttributesCategory:SetPoint("TOP", CharacterStatsPane, "TOP", 0, -2)
	end
end)

_G.CharacterFrame:HookScript("OnShow", function()
	CfPlayerFrameHealthBar.showNumeric = true;
	CfPlayerFrameManaBar.showNumeric = true;
	ShowTextStatusBarText(CfPlayerFrameHealthBar)
	ShowTextStatusBarText(CfPlayerFrameManaBar)
end)

_G.CharacterFrame:HookScript("OnHide", function()
	CfPlayerFrameHealthBar.showNumeric = nil;
	CfPlayerFrameManaBar.showNumeric = nil;
	HideTextStatusBarText(CfPlayerFrameHealthBar)
	HideTextStatusBarText(CfPlayerFrameManaBar)
end)