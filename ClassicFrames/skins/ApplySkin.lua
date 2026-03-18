function ApplyDropDown(frame)
	frame.Background:Hide()

	if (frame.Left == nil) then
		frame.Left = frame:CreateTexture(nil, "ARTWORK")
		frame.Left:SetSize(25, 64)
		frame.Left:SetTexture("Interface\\Glues\\CharacterCreate\\CharacterCreate-LabelFrame")
		frame.Left:SetTexCoord(0, 0.1953125, 0, 1)
		frame.Left:SetPoint("TOPLEFT", -18, 18)
	end

	if (frame.Right == nil) then
		frame.Right = frame:CreateTexture(nil, "ARTWORK")
		frame.Right:SetSize(25, 64)
		frame.Right:SetTexture("Interface\\Glues\\CharacterCreate\\CharacterCreate-LabelFrame")
		frame.Right:SetTexCoord(0.8046875, 1, 0, 1)
		frame.Right:SetPoint("TOPRIGHT", 17, 18)
	end

	if (frame.Middle == nil) then
		frame.Middle = frame:CreateTexture(nil, "ARTWORK")
		frame.Middle:SetTexture("Interface\\Glues\\CharacterCreate\\CharacterCreate-LabelFrame")
		frame.Middle:SetTexCoord(0.1953125, 0.8046875, 0, 1)
		frame.Middle:SetPoint("LEFT", frame.Left, "RIGHT")
		frame.Middle:SetPoint("RIGHT", frame.Right, "LEFT")
	end

	frame.Arrow:SetSize(24, 24)
	frame.Arrow:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Up")
	frame.Arrow:ClearAllPoints()
	frame.Arrow:SetPoint("TOPRIGHT", frame.Right, "TOPRIGHT", -16, -18)

	frame.Text:SetFontObject(GameFontHighlightSmall)
	frame.Text:SetPoint("TOPLEFT", 9, -8)
	frame.Text:SetPoint("TOPRIGHT", frame.Arrow, "LEFT", -3, 0)

	frame:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
	frame:GetHighlightTexture():SetSize(24, 24)
	frame:GetHighlightTexture():ClearAllPoints()
	frame:GetHighlightTexture():SetPoint("RIGHT", frame.Arrow, "RIGHT")

	hooksecurefunc(frame, "OnButtonStateChanged", function(self)
		self.Arrow:SetSize(24, 24)
		self.Arrow:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Up")
		if self:IsEnabled() then
			if self:IsDown() then
				self.Arrow:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Down")
			else
				self.Arrow:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Up")
			end
		else
			self.Arrow:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Disabled")
		end
	end)
end

function ApplyFilterDropDown(frame)
	frame:SetHeight(22)
	frame.Background:Hide()

	if (frame.TopLeft == nil) then
		frame.TopLeft = frame:CreateTexture(nil, "BACKGROUND")
		frame.TopLeft:SetSize(12, 6)
		frame.TopLeft:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
		frame.TopLeft:SetTexCoord(0, 0.09375, 0, 0.1875)
		frame.TopLeft:SetPoint("TOPLEFT")
	end

	if (frame.TopRight == nil) then
		frame.TopRight = frame:CreateTexture(nil, "BACKGROUND")
		frame.TopRight:SetSize(12, 6)
		frame.TopRight:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
		frame.TopRight:SetTexCoord(0.53125, 0.625, 0, 0.1875)
		frame.TopRight:SetPoint("TOPRIGHT")
	end

	if (frame.BottomLeft == nil) then
		frame.BottomLeft = frame:CreateTexture(nil, "BACKGROUND")
		frame.BottomLeft:SetSize(12, 6)
		frame.BottomLeft:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
		frame.BottomLeft:SetTexCoord(0, 0.09375, 0.625, 0.8125)
		frame.BottomLeft:SetPoint("BOTTOMLEFT")
	end

	if (frame.BottomRight == nil) then
		frame.BottomRight = frame:CreateTexture(nil, "BACKGROUND")
		frame.BottomRight:SetSize(12, 6)
		frame.BottomRight:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
		frame.BottomRight:SetTexCoord(0.53125, 0.625, 0.625, 0.8125)
		frame.BottomRight:SetPoint("BOTTOMRIGHT")
	end

	if (frame.TopMiddle == nil) then
		frame.TopMiddle = frame:CreateTexture(nil, "BACKGROUND")
		frame.TopMiddle:SetSize(56, 6)
		frame.TopMiddle:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
		frame.TopMiddle:SetTexCoord(0.09375, 0.53125, 0, 0.1875)
		frame.TopMiddle:SetPoint("TOPLEFT", frame.TopLeft, "TOPRIGHT")
		frame.TopMiddle:SetPoint("BOTTOMRIGHT", frame.TopRight, "BOTTOMLEFT")
	end

	if (frame.MiddleLeft == nil) then
		frame.MiddleLeft = frame:CreateTexture(nil, "BACKGROUND")
		frame.MiddleLeft:SetSize(12, 14)
		frame.MiddleLeft:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
		frame.MiddleLeft:SetTexCoord(0, 0.09375, 0.1875, 0.625)
		frame.MiddleLeft:SetPoint("TOPRIGHT", frame.TopLeft, "BOTTOMRIGHT")
		frame.MiddleLeft:SetPoint("BOTTOMLEFT", frame.BottomLeft, "TOPLEFT")
	end

	if (frame.MiddleRight == nil) then
		frame.MiddleRight = frame:CreateTexture(nil, "BACKGROUND")
		frame.MiddleRight:SetSize(12, 14)
		frame.MiddleRight:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
		frame.MiddleRight:SetTexCoord(0.53125, 0.625, 0.1875, 0.625)
		frame.MiddleRight:SetPoint("TOPRIGHT", frame.TopRight, "BOTTOMRIGHT")
		frame.MiddleRight:SetPoint("BOTTOMLEFT", frame.BottomRight, "TOPLEFT")
	end

	if (frame.BottomMiddle == nil) then
		frame.BottomMiddle = frame:CreateTexture(nil, "BACKGROUND")
		frame.BottomMiddle:SetSize(56, 6)
		frame.BottomMiddle:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
		frame.BottomMiddle:SetTexCoord(0.09375, 0.53125, 0.625, 0.8125)
		frame.BottomMiddle:SetPoint("TOPLEFT", frame.BottomLeft, "TOPRIGHT")
		frame.BottomMiddle:SetPoint("BOTTOMRIGHT", frame.BottomRight, "BOTTOMLEFT")
	end

	if (frame.MiddleMiddle == nil) then
		frame.MiddleMiddle = frame:CreateTexture(nil, "BACKGROUND")
		frame.MiddleMiddle:SetSize(56, 14)
		frame.MiddleMiddle:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
		frame.MiddleMiddle:SetTexCoord(0.09375, 0.53125, 0.1875, 0.625)
		frame.MiddleMiddle:SetPoint("TOPLEFT", frame.TopLeft, "BOTTOMRIGHT")
		frame.MiddleMiddle:SetPoint("BOTTOMRIGHT", frame.BottomRight, "TOPLEFT")
	end

	if (frame.Icon == nil) then
		frame.Icon = frame:CreateTexture(nil, "ARTWORK")
		frame.Icon:SetSize(10, 12)
		frame.Icon:SetTexture("Interface\\ChatFrame\\ChatFrameExpandArrow")
		frame.Icon:SetPoint("RIGHT", -5, 0)
	end

	frame.Text:SetFontObject(GameFontHighlightSmall)
	frame.Text:ClearAllPoints()
	frame.Text:SetPoint("CENTER", 0, -1)

	frame:SetHighlightTexture("Interface\\Buttons\\UI-Silver-Button-Highlight", "ADD")
	frame:GetHighlightTexture():SetTexCoord(0, 1, 0.03, 0.7175)

	frame:HookScript("OnEnable", function(self)
		self.Text:SetFontObject(GameFontHighlightSmall)
	end)
end

function ApplyTopTab(frame)
	frame:SetHeight(32)

	local TOP_TAB_HEIGHT_PERCENT = 0.75
	local TOP_TAB_BOTTOM_TEX_COORD = 1 - TOP_TAB_HEIGHT_PERCENT

	if (frame.CfLeftActive == nil) then
		frame.CfLeftActive = frame:CreateTexture(nil, "BACKGROUND")
		frame.CfLeftActive:SetAtlas("uiframe-activetab-left", true)
		frame.CfLeftActive:SetTexCoord(0, 1, 1, TOP_TAB_BOTTOM_TEX_COORD)
		frame.CfLeftActive:SetHeight(frame.CfLeftActive:GetHeight() * TOP_TAB_HEIGHT_PERCENT)
		frame.CfLeftActive:SetPoint("BOTTOMLEFT", -1, 0)
	end

	if (frame.CfRightActive == nil) then
		frame.CfRightActive = frame:CreateTexture(nil, "BACKGROUND")
		frame.CfRightActive:SetAtlas("uiframe-activetab-right", true)
		frame.CfRightActive:SetTexCoord(0, 1, 1, TOP_TAB_BOTTOM_TEX_COORD)
		frame.CfRightActive:SetHeight(frame.CfRightActive:GetHeight() * TOP_TAB_HEIGHT_PERCENT)
		frame.CfRightActive:SetPoint("BOTTOMRIGHT", 8, 0)
	end

	if (frame.CfMiddleActive == nil) then
		frame.CfMiddleActive = frame:CreateTexture(nil, "BACKGROUND")
		frame.CfMiddleActive:SetAtlas("_uiframe-activetab-center", true)
		frame.CfMiddleActive:SetTexCoord(0, 1, 1, TOP_TAB_BOTTOM_TEX_COORD)
		frame.CfMiddleActive:SetHeight(frame.CfMiddleActive:GetHeight() * TOP_TAB_HEIGHT_PERCENT)
		frame.CfMiddleActive:SetHorizTile(true)
		frame.CfMiddleActive:SetPoint("TOPLEFT", frame.CfLeftActive, "TOPRIGHT")
		frame.CfMiddleActive:SetPoint("TOPRIGHT", frame.CfRightActive, "TOPLEFT")
	end

	if (frame.CfLeft == nil) then
		frame.CfLeft = frame:CreateTexture(nil, "BACKGROUND")
		frame.CfLeft:SetAtlas("uiframe-tab-left", true)
		frame.CfLeft:SetTexCoord(0, 1, 1, TOP_TAB_BOTTOM_TEX_COORD)
		frame.CfLeft:SetHeight(frame.CfLeft:GetHeight() * TOP_TAB_HEIGHT_PERCENT)
		frame.CfLeft:SetPoint("BOTTOMLEFT", -3, 0)
	end

	if (frame.CfRight == nil) then
		frame.CfRight = frame:CreateTexture(nil, "BACKGROUND")
		frame.CfRight:SetAtlas("uiframe-tab-right", true)
		frame.CfRight:SetTexCoord(0, 1, 1, TOP_TAB_BOTTOM_TEX_COORD)
		frame.CfRight:SetHeight(frame.CfRight:GetHeight() * TOP_TAB_HEIGHT_PERCENT)
		frame.CfRight:SetPoint("BOTTOMRIGHT", 7, 0)
	end

	if (frame.CfMiddle == nil) then
		frame.CfMiddle = frame:CreateTexture(nil, "BACKGROUND")
		frame.CfMiddle:SetAtlas("_uiframe-tab-center", true)
		frame.CfMiddle:SetTexCoord(0, 1, 1, TOP_TAB_BOTTOM_TEX_COORD)
		frame.CfMiddle:SetHeight(frame.CfMiddle:GetHeight() * TOP_TAB_HEIGHT_PERCENT)
		frame.CfMiddle:SetHorizTile(true)
		frame.CfMiddle:SetPoint("TOPLEFT", frame.CfLeft, "TOPRIGHT")
		frame.CfMiddle:SetPoint("TOPRIGHT", frame.CfRight, "TOPLEFT")
	end

	if (frame.CfLeftHighlight == nil) then
		frame.CfLeftHighlight = frame:CreateTexture(nil, "HIGHLIGHT")
		frame.CfLeftHighlight:SetAtlas("uiframe-tab-left", true)
		frame.CfLeftHighlight:SetTexCoord(0, 1, 1, TOP_TAB_BOTTOM_TEX_COORD)
		frame.CfLeftHighlight:SetBlendMode("ADD")
		frame.CfLeftHighlight:SetHeight(frame.CfLeftHighlight:GetHeight() * TOP_TAB_HEIGHT_PERCENT)
		frame.CfLeftHighlight:SetPoint("TOPLEFT", frame.CfLeft, "TOPLEFT")
		frame.CfLeftHighlight:SetAlpha(0.4)
	end

	if (frame.CfMiddleHighlight== nil) then
		frame.CfMiddleHighlight = frame:CreateTexture(nil, "HIGHLIGHT")
		frame.CfMiddleHighlight:SetAtlas("_uiframe-tab-center", true)
		frame.CfMiddleHighlight:SetTexCoord(0, 1, 1, TOP_TAB_BOTTOM_TEX_COORD)
		frame.CfMiddleHighlight:SetBlendMode("ADD")
		frame.CfMiddleHighlight:SetHeight(frame.CfMiddleHighlight:GetHeight() * TOP_TAB_HEIGHT_PERCENT)
		frame.CfMiddleHighlight:SetHorizTile(true)
		frame.CfMiddleHighlight:SetPoint("TOPLEFT", frame.CfMiddle, "TOPLEFT")
		frame.CfMiddleHighlight:SetPoint("TOPRIGHT", frame.CfMiddle, "TOPRIGHT")
		frame.CfMiddleHighlight:SetAlpha(0.4)
	end

	if (frame.CfRightHighlight == nil) then
		frame.CfRightHighlight = frame:CreateTexture(nil, "HIGHLIGHT")
		frame.CfRightHighlight:SetAtlas("uiframe-tab-right", true)
		frame.CfRightHighlight:SetTexCoord(0, 1, 1, TOP_TAB_BOTTOM_TEX_COORD)
		frame.CfRightHighlight:SetBlendMode("ADD")
		frame.CfRightHighlight:SetHeight(frame.CfRightHighlight:GetHeight() * TOP_TAB_HEIGHT_PERCENT)
		frame.CfRightHighlight:SetPoint("TOPRIGHT", frame.CfRight, "TOPRIGHT")
		frame.CfRightHighlight:SetAlpha(0.4)
	end

	frame.LeftHighlight:Hide()
	frame.MiddleHighlight:Hide()
	frame.RightHighlight:Hide()

	hooksecurefunc(frame, "SetTabSelected", function(frame, isSelected)
		frame.Left:Hide()
		frame.Middle:Hide()
		frame.Right:Hide()
		frame.LeftActive:Hide()
		frame.RightActive:Hide()
		frame.MiddleActive:Hide()

		frame.CfLeft:SetShown(not isSelected)
		frame.CfMiddle:SetShown(not isSelected)
		frame.CfRight:SetShown(not isSelected)
		frame.CfLeftActive:SetShown(isSelected)
		frame.CfMiddleActive:SetShown(isSelected)
		frame.CfRightActive:SetShown(isSelected)

		if isSelected then
			frame.Text:SetPoint("CENTER", 0, -4)
		else
			frame.Text:SetPoint("CENTER", 0, -8)
		end
	end)
end