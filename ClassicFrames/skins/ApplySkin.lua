function ApplyCloseButton(frame)
	frame:SetSize(32, 32)
	frame:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
	frame:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
	frame:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
	frame:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
	frame:ClearAllPoints()
	frame:SetPoint("TOPRIGHT", 5.6, 5)
	frame:SetFrameLevel(2)
end

function ApplyCloseButtonOld(frame)
	frame:SetSize(32, 32)
	frame:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
	frame:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
	frame:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
	frame:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
	frame:ClearAllPoints()
	frame:SetPoint("TOPRIGHT", 4, 5)
end

function ApplyTitleBg(frame)
	if (frame.TitleBg == nil) then
		frame.TitleBg = frame:CreateTexture(nil, "BACKGROUND")
		frame.TitleBg:SetAtlas("_UI-Frame-TitleTileBg", false)
		frame.TitleBg:SetSize(256, 18)
		frame.TitleBg:SetHorizTile(true)
		frame.TitleBg:SetPoint("TOPLEFT", 2, -3)
		frame.TitleBg:SetPoint("TOPRIGHT", -25, -3)
	end
end

function ApplyTitleBgNoPortrait(frame)
	if (frame.TitleBg == nil) then
		frame.TitleBg = frame:CreateTexture(nil, "BACKGROUND")
		frame.TitleBg:SetAtlas("_UI-Frame-TitleTileBg", false)
		frame.TitleBg:SetSize(256, 18)
		frame.TitleBg:SetHorizTile(true)
		frame.TitleBg:SetPoint("TOPLEFT", 6, -3)
		frame.TitleBg:SetPoint("TOPRIGHT", -25, -3)
	end
end

function ApplyNineSlicePortrait(frame)
	frame.NineSlice.TopEdge:SetSize(128, 132)
	frame.NineSlice.TopEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalHorizontal", true)
	frame.NineSlice.TopEdge:SetTexCoord(0, 1, 0.263671875, 0.521484375)

	frame.NineSlice.TopLeftCorner:SetSize(132, 132)
	frame.NineSlice.TopLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.TopLeftCorner:SetTexCoord(0.263671875, 0.521484375, 0.263671875, 0.521484375)

	frame.NineSlice.TopRightCorner:SetSize(132, 132)
	frame.NineSlice.TopRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.TopRightCorner:SetTexCoord(0.001953125, 0.259765625, 0.263671875, 0.521484375)

	frame.NineSlice.BottomEdge:SetSize(128, 132)
	frame.NineSlice.BottomEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalHorizontal", true)
	frame.NineSlice.BottomEdge:SetTexCoord(0, 1, 0.001953125, 0.259765625)

	frame.NineSlice.BottomLeftCorner:SetSize(132, 132)
	frame.NineSlice.BottomLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.BottomLeftCorner:SetTexCoord(0.001953125, 0.259765625, 0.001953125, 0.259765625)

	frame.NineSlice.BottomRightCorner:SetSize(132, 132)
	frame.NineSlice.BottomRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.BottomRightCorner:SetTexCoord(0.263671875, 0.521484375, 0.001953125, 0.259765625)

	frame.NineSlice.LeftEdge:SetSize(132, 128)
	frame.NineSlice.LeftEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalVertical", false, true)
	frame.NineSlice.LeftEdge:SetTexCoord(0.001953125, 0.259765625, 0, 1)

	frame.NineSlice.RightEdge:SetSize(132, 128)
	frame.NineSlice.RightEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalVertical", false, true)
	frame.NineSlice.RightEdge:SetTexCoord(0.263671875, 0.521484375, 0, 1)
end

function ApplyNineSlicePortraitMinimizable(frame)
	frame.NineSlice.TopEdge:SetSize(128, 132)
	frame.NineSlice.TopEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalHorizontal", true)
	frame.NineSlice.TopEdge:SetTexCoord(0, 1, 0.263671875, 0.521484375)

	frame.NineSlice.TopLeftCorner:SetSize(132, 132)
	frame.NineSlice.TopLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.TopLeftCorner:SetTexCoord(0.263671875, 0.521484375, 0.263671875, 0.521484375)

	frame.NineSlice.TopRightCorner:SetSize(132, 132)
	frame.NineSlice.TopRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.TopRightCorner:SetTexCoord(0.001953125, 0.259765625, 0.525390625, 0.783203125)

	frame.NineSlice.BottomEdge:SetSize(128, 132)
	frame.NineSlice.BottomEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalHorizontal", true)
	frame.NineSlice.BottomEdge:SetTexCoord(0, 1, 0.001953125, 0.259765625)

	frame.NineSlice.BottomLeftCorner:SetSize(132, 132)
	frame.NineSlice.BottomLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.BottomLeftCorner:SetTexCoord(0.001953125, 0.259765625, 0.001953125, 0.259765625)

	frame.NineSlice.BottomRightCorner:SetSize(132, 132)
	frame.NineSlice.BottomRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.BottomRightCorner:SetTexCoord(0.263671875, 0.521484375, 0.001953125, 0.259765625)

	frame.NineSlice.LeftEdge:SetSize(132, 128)
	frame.NineSlice.LeftEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalVertical", false, true)
	frame.NineSlice.LeftEdge:SetTexCoord(0.001953125, 0.259765625, 0, 1)

	frame.NineSlice.RightEdge:SetSize(132, 128)
	frame.NineSlice.RightEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalVertical", false, true)
	frame.NineSlice.RightEdge:SetTexCoord(0.263671875, 0.521484375, 0, 1)
end

function ApplyNineSliceNoPortrait(frame)
	frame.NineSlice.TopEdge:SetSize(128, 132)
	frame.NineSlice.TopEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalHorizontal", true)
	frame.NineSlice.TopEdge:SetTexCoord(0, 1, 0.263671875, 0.521484375)

	frame.NineSlice.TopLeftCorner:SetSize(132, 132)
	frame.NineSlice.TopLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.TopLeftCorner:SetTexCoord(0.525390625, 0.783203125, 0.001953125, 0.259765625)

	frame.NineSlice.TopRightCorner:SetSize(132, 132)
	frame.NineSlice.TopRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.TopRightCorner:SetTexCoord(0.001953125, 0.259765625, 0.263671875, 0.521484375)

	frame.NineSlice.BottomEdge:SetSize(128, 132)
	frame.NineSlice.BottomEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalHorizontal", true)
	frame.NineSlice.BottomEdge:SetTexCoord(0, 1, 0.001953125, 0.259765625)

	frame.NineSlice.BottomLeftCorner:SetSize(132, 132)
	frame.NineSlice.BottomLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.BottomLeftCorner:SetTexCoord(0.001953125, 0.259765625, 0.001953125, 0.259765625)

	frame.NineSlice.BottomRightCorner:SetSize(132, 132)
	frame.NineSlice.BottomRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.BottomRightCorner:SetTexCoord(0.263671875, 0.521484375, 0.001953125, 0.259765625)

	frame.NineSlice.LeftEdge:SetSize(132, 128)
	frame.NineSlice.LeftEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalVertical", false, true)
	frame.NineSlice.LeftEdge:SetTexCoord(0.001953125, 0.259765625, 0, 1)

	frame.NineSlice.RightEdge:SetSize(132, 128)
	frame.NineSlice.RightEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalVertical", false, true)
	frame.NineSlice.RightEdge:SetTexCoord(0.263671875, 0.521484375, 0, 1)
end

function ApplyNineSliceNoPortraitMinimizable(frame)
	frame.NineSlice.TopEdge:SetSize(128, 132)
	frame.NineSlice.TopEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalHorizontal", true)
	frame.NineSlice.TopEdge:SetTexCoord(0, 1, 0.263671875, 0.521484375)

	frame.NineSlice.TopLeftCorner:SetSize(132, 132)
	frame.NineSlice.TopLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.TopLeftCorner:SetTexCoord(0.525390625, 0.783203125, 0.001953125, 0.259765625)

	frame.NineSlice.TopRightCorner:SetSize(132, 132)
	frame.NineSlice.TopRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.TopRightCorner:SetTexCoord(0.001953125, 0.259765625, 0.525390625, 0.783203125)

	frame.NineSlice.BottomEdge:SetSize(128, 132)
	frame.NineSlice.BottomEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalHorizontal", true)
	frame.NineSlice.BottomEdge:SetTexCoord(0, 1, 0.001953125, 0.259765625)

	frame.NineSlice.BottomLeftCorner:SetSize(132, 132)
	frame.NineSlice.BottomLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.BottomLeftCorner:SetTexCoord(0.001953125, 0.259765625, 0.001953125, 0.259765625)

	frame.NineSlice.BottomRightCorner:SetSize(132, 132)
	frame.NineSlice.BottomRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.BottomRightCorner:SetTexCoord(0.263671875, 0.521484375, 0.001953125, 0.259765625)

	frame.NineSlice.LeftEdge:SetSize(132, 128)
	frame.NineSlice.LeftEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalVertical", false, true)
	frame.NineSlice.LeftEdge:SetTexCoord(0.001953125, 0.259765625, 0, 1)

	frame.NineSlice.RightEdge:SetSize(132, 128)
	frame.NineSlice.RightEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalVertical", false, true)
	frame.NineSlice.RightEdge:SetTexCoord(0.263671875, 0.521484375, 0, 1)
end

function ApplyDialogBorder(frame)
	frame.TopEdge:SetTexture("Interface\\FrameGeneral\\UIFrameDiamondMetal")
	frame.TopEdge:SetTexCoord(0, 0.5, 0.13671875, 0.26171875)

	frame.TopLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameDiamondMetal")
	frame.TopLeftCorner:SetTexCoord(0.015625, 0.515625, 0.53515625, 0.66015625)

	frame.TopRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameDiamondMetal")
	frame.TopRightCorner:SetTexCoord(0.015625, 0.515625, 0.66796875, 0.79296875)

	frame.BottomEdge:SetTexture("Interface\\FrameGeneral\\UIFrameDiamondMetal")
	frame.BottomEdge:SetTexCoord(0, 0.5, 0.00390625, 0.12890625)

	frame.BottomLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameDiamondMetal")
	frame.BottomLeftCorner:SetTexCoord(0.015625, 0.515625, 0.26953125, 0.39453125)

	frame.BottomRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameDiamondMetal")
	frame.BottomRightCorner:SetTexCoord(0.015625, 0.515625, 0.40234375, 0.52734375)

	frame.LeftEdge:SetTexture("Interface\\FrameGeneral\\UIFrameDiamondMetalVertical")
	frame.LeftEdge:SetTexCoord(0.0078125, 0.2578125, 0, 1)

	frame.RightEdge:SetTexture("Interface\\FrameGeneral\\UIFrameDiamondMetalVertical")
	frame.RightEdge:SetTexCoord(0.2734375, 0.5234375, 0, 1)
end

function ApplyDialogHeader(frame)
	frame.LeftBG:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UIFrameDiamondMetalHeader")
	frame.LeftBG:SetTexCoord(0.0078125, 0.507812, 0.316406, 0.621094)

	frame.CenterBG:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UIFrameDiamondMetalHeader")
	frame.CenterBG:SetTexCoord(0, 0.5, 0.00390625, 0.308594)

	frame.RightBG:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UIFrameDiamondMetalHeader")
	frame.RightBG:SetTexCoord(0.0078125, 0.507812, 0.628906, 0.933594)
end

function ApplyScrollBarArrow(frame)
	frame.Back:SetSize(18, 16)
	frame.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
	frame.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
	frame.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
	frame.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")
	frame.Back:ClearAllPoints()
	frame.Back:SetPoint("TOPLEFT", 4, -4)

	frame.Forward:SetSize(18, 16)
	frame.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
	frame.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
	frame.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
	frame.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")
	frame.Forward:ClearAllPoints()
	frame.Forward:SetPoint("BOTTOMLEFT", 4, 4)
end

function ApplyScrollBarTrack(frame)
	frame:ClearAllPoints()
	frame:SetPoint("TOPLEFT", 4, -22)
	frame:SetPoint("BOTTOMRIGHT", -4, 22)
	
	frame.Begin:SetAtlas("UI-ScrollBar-EndCap-Top", true)
	frame.Begin:ClearAllPoints()
	frame.Begin:SetPoint("TOPLEFT", -4, 22)

	frame.End:SetAtlas("UI-ScrollBar-EndCap-Bottom", true)
	frame.End:ClearAllPoints()
	frame.End:SetPoint("BOTTOMLEFT", -4, -22)

	frame.Middle:SetAtlas("!UI-ScrollBar-Center", true)
end

function ApplyScrollBarThumb(frame)
	frame:SetWidth(18)

	frame.Begin:SetAtlas("UI-ScrollBar-Knob-EndCap-Top", true)
	frame.End:SetAtlas("UI-ScrollBar-Knob-EndCap-Bottom", true)
	frame.Middle:SetAtlas("UI-ScrollBar-Knob-Center", true)

	frame.Middle:ClearAllPoints()
	frame.Middle:SetPoint("TOPLEFT", 0, -5)
	frame.Middle:SetPoint("BOTTOMRIGHT", 0, 5)

	frame.upBeginTexture = "UI-ScrollBar-Knob-EndCap-Top"
	frame.upMiddleTexture = "UI-ScrollBar-Knob-Center"
	frame.upEndTexture = "UI-ScrollBar-Knob-EndCap-Bottom"
	frame.overBeginTexture = "UI-ScrollBar-Knob-MouseOver-EndCap-Top"
	frame.overMiddleTexture = "UI-ScrollBar-Knob-MouseOver-Center"
	frame.overEndTexture = "UI-ScrollBar-Knob-MouseOver-EndCap-Bottom"
	frame.downBeginTexture = "UI-ScrollBar-Knob-EndCap-Top-Disabled"
	frame.downMiddleTexture = "UI-ScrollBar-Knob-Center-Disabled"
	frame.downEndTexture = "UI-ScrollBar-Knob-EndCap-Bottom-Disabled"
end

function ApplyBottomTab(frame)
	frame.LeftActive:SetSize(20, 35)
	frame.LeftActive:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ActiveTab")
	frame.LeftActive:SetTexCoord(0, 0.15625, 0, 0.546875)
	frame.LeftActive:SetPoint("TOPLEFT")

	frame.RightActive:SetSize(20, 35)
	frame.RightActive:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ActiveTab")
	frame.RightActive:SetTexCoord(0.84375, 1, 0, 0.546875)
	frame.RightActive:SetPoint("TOPRIGHT")

	frame.MiddleActive:SetSize(88, 35)
	frame.MiddleActive:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ActiveTab")
	frame.MiddleActive:SetTexCoord(0.15625, 0.84375, 0, 0.546875)
	frame.MiddleActive:SetHorizTile(false)

	frame.Left:SetSize(20, 32)
	frame.Left:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-InActiveTab")
	frame.Left:SetTexCoord(0, 0.15625, 0, 1)
	frame.Left:SetPoint("TOPLEFT", 0, -1)

	frame.Right:SetSize(20, 32)
	frame.Right:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-InActiveTab")
	frame.Right:SetTexCoord(0.84375, 1, 0, 1)
	frame.Right:SetPoint("TOPRIGHT", 0, -1)

	frame.Middle:SetSize(88, 32)
	frame.Middle:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-InActiveTab")
	frame.Middle:SetTexCoord(0.15625, 0.84375, 0, 1)
	frame.Middle:SetHorizTile(false)

	frame.LeftHighlight:Hide()
	frame.MiddleHighlight:Hide()
	frame.RightHighlight:Hide()

	frame:SetHighlightTexture("Interface\\PaperDollInfoFrame\\UI-Character-Tab-RealHighlight")
	frame:GetHighlightTexture():ClearAllPoints()
	frame:GetHighlightTexture():SetPoint("TOPLEFT", 3, 5)
	frame:GetHighlightTexture():SetPoint("BOTTOMRIGHT", -3, 0)
end

function ApplyTopTab(frame)
	frame.LeftActive:SetSize(16, 32)
	frame.LeftActive:SetTexture("Interface\\HelpFrame\\HelpFrameTab-Active")
	frame.LeftActive:SetTexCoord(0, 0.25, 0, 1)
	frame.LeftActive:SetPoint("BOTTOMLEFT", 0, -3)

	frame.RightActive:SetSize(16, 32)
	frame.RightActive:SetTexture("Interface\\HelpFrame\\HelpFrameTab-Active")
	frame.RightActive:SetTexCoord(0.75, 1, 0, 1)
	frame.RightActive:SetPoint("BOTTOMRIGHT", 0, -3)

	frame.MiddleActive:SetSize(32, 32)
	frame.MiddleActive:SetTexture("Interface\\HelpFrame\\HelpFrameTab-Active")
	frame.MiddleActive:SetTexCoord(0.25, 0.75, 0, 1)
	frame.MiddleActive:SetHorizTile(false)

	frame.Left:SetSize(16, 32)
	frame.Left:SetTexture("Interface\\HelpFrame\\HelpFrameTab-Inactive")
	frame.Left:SetTexCoord(0, 0.25, 0, 1)
	frame.Left:SetPoint("BOTTOMLEFT")

	frame.Right:SetSize(16, 32)
	frame.Right:SetTexture("Interface\\HelpFrame\\HelpFrameTab-Inactive")
	frame.Right:SetTexCoord(0.75, 1, 0, 1)
	frame.Right:SetPoint("TOPRIGHT")

	frame.Middle:SetSize(32, 32)
	frame.Middle:SetTexture("Interface\\HelpFrame\\HelpFrameTab-Inactive")
	frame.Middle:SetTexCoord(0.25, 0.75, 0, 1)
	frame.Middle:SetHorizTile(false)

	frame.LeftHighlight:Hide()
	frame.MiddleHighlight:Hide()
	frame.RightHighlight:Hide()

	frame:SetHighlightTexture("Interface\\PaperDollInfoFrame\\UI-Character-Tab-Highlight")
	frame:GetHighlightTexture():ClearAllPoints()
	frame:GetHighlightTexture():SetPoint("TOPLEFT", 2, -8)
	frame:GetHighlightTexture():SetPoint("BOTTOMRIGHT", 2, -8)

	frame.Text:ClearAllPoints()
	frame.Text:SetPoint("BOTTOM", 0, 6)
end

function ApplySearchBox(frame)
	frame.Left:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\CommonSearch")
	frame.Left:SetTexCoord(0.886719, 0.949219, 0.0078125, 0.320312)

	frame.Right:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\CommonSearch")
	frame.Right:SetTexCoord(0.00390625, 0.0664062, 0.335938, 0.648438)

	frame.Middle:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\CommonSearch")
	frame.Middle:SetTexCoord(0.00390625, 0.878906, 0.0078125, 0.320312)
end

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
	frame.Background:Hide()

	if (frame.TopLeft == nil) then
		frame.TopLeft = frame:CreateTexture(nil, "BACKGROUND")
		frame.TopLeft:SetSize(12, 6)
		frame.TopLeft:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
		frame.TopLeft:SetTexCoord(0, 0.09375, 0, 0.1875)
		frame.TopLeft:SetPoint("TOPLEFT", 0, 2)
	end

	if (frame.TopRight == nil) then
		frame.TopRight = frame:CreateTexture(nil, "BACKGROUND")
		frame.TopRight:SetSize(12, 6)
		frame.TopRight:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
		frame.TopRight:SetTexCoord(0.53125, 0.625, 0, 0.1875)
		frame.TopRight:SetPoint("TOPRIGHT", 0, 2)
	end

	if (frame.BottomLeft == nil) then
		frame.BottomLeft = frame:CreateTexture(nil, "BACKGROUND")
		frame.BottomLeft:SetSize(12, 6)
		frame.BottomLeft:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
		frame.BottomLeft:SetTexCoord(0, 0.09375, 0.625, 0.8125)
		frame.BottomLeft:SetPoint("BOTTOMLEFT", 0, -2)
	end

	if (frame.BottomRight == nil) then
		frame.BottomRight = frame:CreateTexture(nil, "BACKGROUND")
		frame.BottomRight:SetSize(12, 6)
		frame.BottomRight:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
		frame.BottomRight:SetTexCoord(0.53125, 0.625, 0.625, 0.8125)
		frame.BottomRight:SetPoint("BOTTOMRIGHT", 0, -2)
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
end