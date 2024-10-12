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
	frame:SetPoint("TOPRIGHT", 4, 4)
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
	if frame.TopTileStreaks then
		frame.TopTileStreaks:ClearAllPoints()
		frame.TopTileStreaks:SetPoint("TOPLEFT", 0, -21)
		frame.TopTileStreaks:SetPoint("TOPRIGHT", -2, -21)
	end

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

	frame.NineSlice.RightEdge:SetSize(132, 132)
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

	frame.NineSlice.RightEdge:SetSize(132, 132)
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

	frame.NineSlice.RightEdge:SetSize(132, 132)
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

	frame.NineSlice.RightEdge:SetSize(132, 132)
	frame.NineSlice.RightEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalVertical", false, true)
	frame.NineSlice.RightEdge:SetTexCoord(0.263671875, 0.521484375, 0, 1)
end

function ApplyNineSliceNoPortraitOld(frame)
	frame.NineSlice.TopEdge:SetSize(256, 28)
	frame.NineSlice.TopEdge:SetTexture("Interface\\FrameGeneral\\_UI-Frame", true)
	frame.NineSlice.TopEdge:SetTexCoord(0, 1, 0.43750000, 0.65625000)

	frame.NineSlice.TopLeftCorner:SetSize(32, 32)
	frame.NineSlice.TopLeftCorner:SetTexture("Interface\\FrameGeneral\\UI-Frame")
	frame.NineSlice.TopLeftCorner:SetTexCoord(0.63281250, 0.88281250, 0.28125000, 0.53125000)
	frame.NineSlice.TopLeftCorner:ClearAllPoints()
	frame.NineSlice.TopLeftCorner:SetPoint("TOPLEFT")

	frame.NineSlice.TopRightCorner:SetSize(33, 33)
	frame.NineSlice.TopRightCorner:SetTexture("Interface\\FrameGeneral\\UI-Frame")
	frame.NineSlice.TopRightCorner:SetTexCoord(0.63281250, 0.89062500, 0.00781250, 0.26562500)
	frame.NineSlice.TopRightCorner:ClearAllPoints()
	frame.NineSlice.TopRightCorner:SetPoint("TOPRIGHT")

	frame.NineSlice.BottomEdge:SetSize(256, 9)
	frame.NineSlice.BottomEdge:SetTexture("Interface\\FrameGeneral\\_UI-Frame", true)
	frame.NineSlice.BottomEdge:SetTexCoord(0, 1, 0.20312500, 0.27343750)

	frame.NineSlice.BottomLeftCorner:SetSize(14, 14)
	frame.NineSlice.BottomLeftCorner:SetTexture("Interface\\FrameGeneral\\UI-Frame")
	frame.NineSlice.BottomLeftCorner:SetTexCoord(0.00781250, 0.11718750, 0.63281250, 0.74218750)
	frame.NineSlice.BottomLeftCorner:ClearAllPoints()
	frame.NineSlice.BottomLeftCorner:SetPoint("BOTTOMLEFT", 0, -4)

	frame.NineSlice.BottomRightCorner:SetSize(11, 11)
	frame.NineSlice.BottomRightCorner:SetTexture("Interface\\FrameGeneral\\UI-Frame")
	frame.NineSlice.BottomRightCorner:SetTexCoord(0.13281250, 0.21875000, 0.89843750, 0.98437500)
	frame.NineSlice.BottomRightCorner:ClearAllPoints()
	frame.NineSlice.BottomRightCorner:SetPoint("BOTTOMRIGHT", 0, -4)

	frame.NineSlice.LeftEdge:SetSize(16, 256)
	frame.NineSlice.LeftEdge:SetTexture("Interface\\FrameGeneral\\!UI-Frame", false, true)
	frame.NineSlice.LeftEdge:SetTexCoord(0.35937500, 0.60937500, 0, 1)

	frame.NineSlice.RightEdge:SetSize(10, 256)
	frame.NineSlice.RightEdge:SetTexture("Interface\\FrameGeneral\\!UI-Frame", false, true)
	frame.NineSlice.RightEdge:SetTexCoord(0.17187500, 0.32812500, 0, 1)
	frame.NineSlice.RightEdge:SetPoint("TOPRIGHT", frame.NineSlice.TopRightCorner, "BOTTOMRIGHT", 1, 0)
end

function ApplyDialogBorder(frame)
	frame.TopEdge:SetSize(32, 32)
	frame.TopEdge:SetTexture("Interface\\FrameGeneral\\UIFrameDiamondMetal", true)
	frame.TopEdge:SetTexCoord(0, 0.5, 0.13671875, 0.26171875)

	frame.TopLeftCorner:SetSize(32, 32)
	frame.TopLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameDiamondMetal")
	frame.TopLeftCorner:SetTexCoord(0.015625, 0.515625, 0.53515625, 0.66015625)

	frame.TopRightCorner:SetSize(32, 32)
	frame.TopRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameDiamondMetal")
	frame.TopRightCorner:SetTexCoord(0.015625, 0.515625, 0.66796875, 0.79296875)

	frame.BottomEdge:SetSize(32, 32)
	frame.BottomEdge:SetTexture("Interface\\FrameGeneral\\UIFrameDiamondMetal", true)
	frame.BottomEdge:SetTexCoord(0, 0.5, 0.00390625, 0.12890625)

	frame.BottomLeftCorner:SetSize(32, 32)
	frame.BottomLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameDiamondMetal")
	frame.BottomLeftCorner:SetTexCoord(0.015625, 0.515625, 0.26953125, 0.39453125)

	frame.BottomRightCorner:SetSize(32, 32)
	frame.BottomRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameDiamondMetal")
	frame.BottomRightCorner:SetTexCoord(0.015625, 0.515625, 0.40234375, 0.52734375)

	frame.LeftEdge:SetSize(32, 32)
	frame.LeftEdge:SetTexture("Interface\\FrameGeneral\\UIFrameDiamondMetalVertical", false, true)
	frame.LeftEdge:SetTexCoord(0.0078125, 0.2578125, 0, 1)

	frame.RightEdge:SetSize(32, 32)
	frame.RightEdge:SetTexture("Interface\\FrameGeneral\\UIFrameDiamondMetalVertical", false, true)
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

function ApplyControlFrame(frame)
	frame:SetSize(94, 23)
	frame:ClearAllPoints()
	frame:SetPoint("TOP", 0, -2)

	if (frame.Right == nil) then
		frame.Right = frame:CreateTexture(nil, "BACKGROUND")
		frame.Right:SetSize(23, 23)
		frame.Right:SetTexture("Interface\\Common\\UI-ModelControlPanel")
		frame.Right:SetTexCoord(0.01562500, 0.37500000, 0.42968750, 0.60937500)
		frame.Right:SetPoint("RIGHT")
	end

	if (frame.Left == nil) then
		frame.Left = frame:CreateTexture(nil, "BACKGROUND")
		frame.Left:SetSize(23, 23)
		frame.Left:SetTexture("Interface\\Common\\UI-ModelControlPanel")
		frame.Left:SetTexCoord(0.40625000, 0.76562500, 0.42968750, 0.60937500)
		frame.Left:SetPoint("LEFT")
	end

	if (frame.Middle == nil) then
		frame.Middle = frame:CreateTexture(nil, "BACKGROUND")
		frame.Middle:SetSize(32, 23)
		frame.Middle:SetTexture("Interface\\Common\\UI-ModelControlPanel")
		frame.Middle:SetTexCoord(0, 1, 0.62500000, 0.80468750)
		frame.Middle:SetPoint("LEFT", frame.Left, "RIGHT")
		frame.Middle:SetPoint("RIGHT", frame.Right, "LEFT")
	end

	frame.zoomInButton:SetSize(18, 18)
	frame.zoomInButton:ClearAllPoints()
	frame.zoomInButton:SetPoint("LEFT", 2, 0)
	frame.zoomInButton.Icon:SetTexture("Interface\\Common\\UI-ModelControlPanel")
	frame.zoomInButton.Icon:SetTexCoord(0.57812500, 0.82812500, 0.14843750, 0.27343750)
	frame.zoomInButton.NormalTexture:Hide()
	frame.zoomInButton.HighlightTexture:SetTexture("Interface\\Common\\UI-ModelControlPanel")
	frame.zoomInButton.HighlightTexture:SetTexCoord(0.57812500, 0.82812500, 0.00781250, 0.13281250)
	frame.zoomInButton.HighlightTexture:SetSize(16, 16)
	frame.zoomInButton.HighlightTexture:ClearAllPoints()
	frame.zoomInButton.HighlightTexture:SetPoint("CENTER")
	frame.zoomInButton.HighlightTexture:SetAlpha(1)
	frame.zoomInButton:SetHitRectInsets(0, 0, 0, 0)

	if (frame.zoomInButton.Bg == nil) then
		frame.zoomInButton.Bg = frame.zoomInButton:CreateTexture(nil, "BACKGROUND")
		frame.zoomInButton.Bg:SetSize(16, 16)
		frame.zoomInButton.Bg:SetTexture("Interface\\Common\\UI-ModelControlPanel")
		frame.zoomInButton.Bg:SetTexCoord(0.29687500, 0.54687500, 0.14843750, 0.27343750)
		frame.zoomInButton.Bg:SetPoint("CENTER")
	end

	frame.zoomOutButton:SetSize(18, 18)
	frame.zoomOutButton:ClearAllPoints()
	frame.zoomOutButton:SetPoint("LEFT", frame.zoomInButton, "RIGHT")
	frame.zoomOutButton.Icon:SetTexture("Interface\\Common\\UI-ModelControlPanel")
	frame.zoomOutButton.Icon:SetTexCoord(0.29687500, 0.54687500, 0.00781250, 0.13281250)
	frame.zoomOutButton.NormalTexture:Hide()
	frame.zoomOutButton.HighlightTexture:SetTexture("Interface\\Common\\UI-ModelControlPanel")
	frame.zoomOutButton.HighlightTexture:SetTexCoord(0.57812500, 0.82812500, 0.00781250, 0.13281250)
	frame.zoomOutButton.HighlightTexture:SetSize(16, 16)
	frame.zoomOutButton.HighlightTexture:ClearAllPoints()
	frame.zoomOutButton.HighlightTexture:SetPoint("CENTER")
	frame.zoomOutButton.HighlightTexture:SetAlpha(1)
	frame.zoomOutButton:SetHitRectInsets(0, 0, 0, 0)

	if (frame.zoomOutButton.Bg == nil) then
		frame.zoomOutButton.Bg = frame.zoomOutButton:CreateTexture(nil, "BACKGROUND")
		frame.zoomOutButton.Bg:SetSize(16, 16)
		frame.zoomOutButton.Bg:SetTexture("Interface\\Common\\UI-ModelControlPanel")
		frame.zoomOutButton.Bg:SetTexCoord(0.29687500, 0.54687500, 0.14843750, 0.27343750)
		frame.zoomOutButton.Bg:SetPoint("CENTER")
	end

	frame.rotateLeftButton:SetSize(18, 18)
	frame.rotateLeftButton:ClearAllPoints()
	frame.rotateLeftButton:SetPoint("LEFT", frame.zoomOutButton, "RIGHT")
	frame.rotateLeftButton.Icon:SetTexture("Interface\\Common\\UI-ModelControlPanel")
	frame.rotateLeftButton.Icon:SetTexCoord(0.01562500, 0.26562500, 0.28906250, 0.41406250)
	frame.rotateLeftButton.NormalTexture:Hide()
	frame.rotateLeftButton.HighlightTexture:SetTexture("Interface\\Common\\UI-ModelControlPanel")
	frame.rotateLeftButton.HighlightTexture:SetTexCoord(0.57812500, 0.82812500, 0.00781250, 0.13281250)
	frame.rotateLeftButton.HighlightTexture:SetSize(16, 16)
	frame.rotateLeftButton.HighlightTexture:ClearAllPoints()
	frame.rotateLeftButton.HighlightTexture:SetPoint("CENTER")
	frame.rotateLeftButton.HighlightTexture:SetAlpha(1)
	frame.rotateLeftButton:SetHitRectInsets(0, 0, 0, 0)

	if (frame.rotateLeftButton.Bg == nil) then
		frame.rotateLeftButton.Bg = frame.rotateLeftButton:CreateTexture(nil, "BACKGROUND")
		frame.rotateLeftButton.Bg:SetSize(16, 16)
		frame.rotateLeftButton.Bg:SetTexture("Interface\\Common\\UI-ModelControlPanel")
		frame.rotateLeftButton.Bg:SetTexCoord(0.29687500, 0.54687500, 0.14843750, 0.27343750)
		frame.rotateLeftButton.Bg:SetPoint("CENTER")
	end

	frame.rotateRightButton:SetSize(18, 18)
	frame.rotateRightButton:ClearAllPoints()
	frame.rotateRightButton:SetPoint("LEFT", frame.rotateLeftButton, "RIGHT")
	frame.rotateRightButton.Icon:SetTexture("Interface\\Common\\UI-ModelControlPanel")
	frame.rotateRightButton.Icon:SetTexCoord(0.57812500, 0.82812500, 0.28906250, 0.41406250)
	frame.rotateRightButton.NormalTexture:Hide()
	frame.rotateRightButton.HighlightTexture:SetTexture("Interface\\Common\\UI-ModelControlPanel")
	frame.rotateRightButton.HighlightTexture:SetTexCoord(0.57812500, 0.82812500, 0.00781250, 0.13281250)
	frame.rotateRightButton.HighlightTexture:SetSize(16, 16)
	frame.rotateRightButton.HighlightTexture:ClearAllPoints()
	frame.rotateRightButton.HighlightTexture:SetPoint("CENTER")
	frame.rotateRightButton.HighlightTexture:SetAlpha(1)
	frame.rotateRightButton:SetHitRectInsets(0, 0, 0, 0)

	if (frame.rotateRightButton.Bg == nil) then
		frame.rotateRightButton.Bg = frame.rotateRightButton:CreateTexture(nil, "BACKGROUND")
		frame.rotateRightButton.Bg:SetSize(16, 16)
		frame.rotateRightButton.Bg:SetTexture("Interface\\Common\\UI-ModelControlPanel")
		frame.rotateRightButton.Bg:SetTexCoord(0.29687500, 0.54687500, 0.14843750, 0.27343750)
		frame.rotateRightButton.Bg:SetPoint("CENTER")
	end

	frame.resetButton:SetSize(18, 18)
	frame.resetButton:ClearAllPoints()
	frame.resetButton:SetPoint("LEFT", frame.rotateRightButton, "RIGHT")
	frame.resetButton.Icon:SetTexture("Interface\\Common\\UI-ModelControlPanel")
	frame.resetButton.Icon:SetTexCoord(0.01562500, 0.26562500, 0.00781250, 0.13281250)
	frame.resetButton.NormalTexture:Hide()
	frame.resetButton.HighlightTexture:SetTexture("Interface\\Common\\UI-ModelControlPanel")
	frame.resetButton.HighlightTexture:SetTexCoord(0.57812500, 0.82812500, 0.00781250, 0.13281250)
	frame.resetButton.HighlightTexture:SetSize(16, 16)
	frame.resetButton.HighlightTexture:ClearAllPoints()
	frame.resetButton.HighlightTexture:SetPoint("CENTER")
	frame.resetButton.HighlightTexture:SetAlpha(1)
	frame.resetButton:SetHitRectInsets(0, 0, 0, 0)

	if (frame.resetButton.Bg == nil) then
		frame.resetButton.Bg = frame.resetButton:CreateTexture(nil, "BACKGROUND")
		frame.resetButton.Bg:SetSize(16, 16)
		frame.resetButton.Bg:SetTexture("Interface\\Common\\UI-ModelControlPanel")
		frame.resetButton.Bg:SetTexCoord(0.29687500, 0.54687500, 0.14843750, 0.27343750)
		frame.resetButton.Bg:SetPoint("CENTER")
	end
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
	frame.Background:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\CommonDropdownClassic")
	frame.Background:SetTexCoord(0.480469, 0.964844, 0.00390625, 0.144531)
	frame.Background:ClearAllPoints()
	frame.Background:SetPoint("TOPLEFT", -2, 1)
	frame.Background:SetPoint("BOTTOMRIGHT", 2, -4)

	frame.Arrow:SetSize(22, 22)
	frame.Arrow:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\CommonDropdownClassic")
	frame.Arrow:SetTexCoord(0.199219, 0.308594, 0.832031, 0.941406)
	frame.Arrow:ClearAllPoints()
	frame.Arrow:SetPoint("RIGHT", -2, -1)

	frame.Text:SetFontObject(GameFontHighlightSmall)
	frame.Text:SetPoint("TOPLEFT", 10, -8)

	hooksecurefunc(frame, "OnButtonStateChanged", function(self)
		self.Arrow:SetSize(22, 22)
		self.Arrow:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\CommonDropdownClassic")
		if self:IsEnabled() then
			if self:IsDownOver() then
				self.Arrow:SetTexCoord(0.199219, 0.308594, 0.714844, 0.824219)
			elseif self:IsOver() then
				self.Arrow:SetTexCoord(0.808594, 0.917969, 0.269531, 0.378906)
			elseif self:IsDown() then
				self.Arrow:SetTexCoord(0.199219, 0.308594, 0.597656, 0.707031)
			else
				self.Arrow:SetTexCoord(0.199219, 0.308594, 0.832031, 0.941406)
			end
		else
			self.Arrow:SetTexCoord(0.808594, 0.917969, 0.152344, 0.261719)
		end
	end)
end

function ApplyFilterDropDown(frame)
	frame.Background:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\CommonDropdownClassic")
	frame.Background:SetTexCoord(0.660156, 0.980469, 0.480469, 0.589844)
	frame.Background:ClearAllPoints()
	frame.Background:SetPoint("TOPLEFT", -3, 1)
	frame.Background:SetPoint("BOTTOMRIGHT", 3, -5)

	frame.Text:SetFontObject(GameFontHighlightSmall)

	hooksecurefunc(frame, "OnButtonStateChanged", function(self)
		self.Background:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\CommonDropdownClassic")
		if self:IsEnabled() then
			if self:IsDownOver() then
				self.Background:SetTexCoord(0.332031, 0.652344, 0.480469, 0.589844)
			elseif self:IsOver() then
				self.Background:SetTexCoord(0.480469, 0.800781, 0.269531, 0.378906)
			elseif self:IsDown() then
				self.Background:SetTexCoord(0.00390625, 0.324219, 0.480469, 0.589844)
			else
				self.Background:SetTexCoord(0.660156, 0.980469, 0.480469, 0.589844)
			end
		else
			self.Background:SetTexCoord(0.480469, 0.800781, 0.152344, 0.261719)
		end
	end)
end