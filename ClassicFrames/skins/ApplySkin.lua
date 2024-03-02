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

function ApplyTitleBg(frame)
	if (frame.TitleBg == nil) then
		frame.TitleBg = frame:CreateTexture(nil, "BACKGROUND");
		frame.TitleBg:SetAtlas("_UI-Frame-TitleTileBg", false)
		frame.TitleBg:SetSize(256, 18)
		frame.TitleBg:SetHorizTile(true)
		frame.TitleBg:ClearAllPoints()
		frame.TitleBg:SetPoint("TOPLEFT", 2, -3)
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
	frame.NineSlice.TopEdge:ClearAllPoints()
	frame.NineSlice.TopEdge:SetPoint("TOPLEFT", frame.NineSlice.TopLeftCorner, "TOPRIGHT")
	frame.NineSlice.TopEdge:SetPoint("TOPRIGHT", frame.NineSlice.TopRightCorner, "TOPLEFT")

	frame.NineSlice.TopLeftCorner:SetSize(132, 132)
	frame.NineSlice.TopLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.TopLeftCorner:SetTexCoord(0.263671875, 0.521484375, 0.263671875, 0.521484375)
	frame.NineSlice.TopLeftCorner:ClearAllPoints()
	frame.NineSlice.TopLeftCorner:SetPoint("TOPLEFT", -13, 16)

	frame.NineSlice.TopRightCorner:SetSize(132, 132)
	frame.NineSlice.TopRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.TopRightCorner:SetTexCoord(0.001953125, 0.259765625, 0.263671875, 0.521484375)
	frame.NineSlice.TopRightCorner:ClearAllPoints()
	frame.NineSlice.TopRightCorner:SetPoint("TOPRIGHT", 4, 16)

	frame.NineSlice.BottomEdge:SetSize(128, 132)
	frame.NineSlice.BottomEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalHorizontal", true)
	frame.NineSlice.BottomEdge:SetTexCoord(0, 1, 0.001953125, 0.259765625)
	frame.NineSlice.BottomEdge:ClearAllPoints()
	frame.NineSlice.BottomEdge:SetPoint("BOTTOMLEFT", frame.NineSlice.BottomLeftCorner, "BOTTOMRIGHT")
	frame.NineSlice.BottomEdge:SetPoint("BOTTOMRIGHT", frame.NineSlice.BottomRightCorner, "BOTTOMLEFT")

	frame.NineSlice.BottomLeftCorner:SetSize(132, 132)
	frame.NineSlice.BottomLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.BottomLeftCorner:SetTexCoord(0.001953125, 0.259765625, 0.001953125, 0.259765625)
	frame.NineSlice.BottomLeftCorner:ClearAllPoints()
	frame.NineSlice.BottomLeftCorner:SetPoint("BOTTOMLEFT", -13, -3)

	frame.NineSlice.BottomRightCorner:SetSize(132, 132)
	frame.NineSlice.BottomRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.BottomRightCorner:SetTexCoord(0.263671875, 0.521484375, 0.001953125, 0.259765625)
	frame.NineSlice.BottomRightCorner:ClearAllPoints()
	frame.NineSlice.BottomRightCorner:SetPoint("BOTTOMRIGHT", 4, -3)

	frame.NineSlice.LeftEdge:SetSize(132, 128)
	frame.NineSlice.LeftEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalVertical", false, true)
	frame.NineSlice.LeftEdge:SetTexCoord(0.001953125, 0.259765625, 0, 1)
	frame.NineSlice.LeftEdge:ClearAllPoints()
	frame.NineSlice.LeftEdge:SetPoint("TOPLEFT", frame.NineSlice.TopLeftCorner, "BOTTOMLEFT")
	frame.NineSlice.LeftEdge:SetPoint("BOTTOMLEFT", frame.NineSlice.BottomLeftCorner, "TOPLEFT")

	frame.NineSlice.RightEdge:SetSize(132, 132)
	frame.NineSlice.RightEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalVertical", false, true)
	frame.NineSlice.RightEdge:SetTexCoord(0.263671875, 0.521484375, 0, 1)
	frame.NineSlice.RightEdge:ClearAllPoints()
	frame.NineSlice.RightEdge:SetPoint("TOPRIGHT", frame.NineSlice.TopRightCorner, "BOTTOMRIGHT")
	frame.NineSlice.RightEdge:SetPoint("BOTTOMRIGHT", frame.NineSlice.BottomRightCorner, "TOPRIGHT")
end

function ApplyNineSlicePortraitMinimizable(frame)
	frame.NineSlice.TopEdge:SetSize(128, 132)
	frame.NineSlice.TopEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalHorizontal", true)
	frame.NineSlice.TopEdge:SetTexCoord(0, 1, 0.263671875, 0.521484375)
	frame.NineSlice.TopEdge:ClearAllPoints()
	frame.NineSlice.TopEdge:SetPoint("TOPLEFT", frame.NineSlice.TopLeftCorner, "TOPRIGHT")
	frame.NineSlice.TopEdge:SetPoint("TOPRIGHT", frame.NineSlice.TopRightCorner, "TOPLEFT")

	frame.NineSlice.TopLeftCorner:SetSize(132, 132)
	frame.NineSlice.TopLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.TopLeftCorner:SetTexCoord(0.263671875, 0.521484375, 0.263671875, 0.521484375)
	frame.NineSlice.TopLeftCorner:ClearAllPoints()
	frame.NineSlice.TopLeftCorner:SetPoint("TOPLEFT", -13, 16)

	frame.NineSlice.TopRightCorner:SetSize(132, 132)
	frame.NineSlice.TopRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.TopRightCorner:SetTexCoord(0.001953125, 0.259765625, 0.525390625, 0.783203125)
	frame.NineSlice.TopRightCorner:ClearAllPoints()
	frame.NineSlice.TopRightCorner:SetPoint("TOPRIGHT", 4, 16)

	frame.NineSlice.BottomEdge:SetSize(128, 132)
	frame.NineSlice.BottomEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalHorizontal", true)
	frame.NineSlice.BottomEdge:SetTexCoord(0, 1, 0.001953125, 0.259765625)
	frame.NineSlice.BottomEdge:ClearAllPoints()
	frame.NineSlice.BottomEdge:SetPoint("BOTTOMLEFT", frame.NineSlice.BottomLeftCorner, "BOTTOMRIGHT")
	frame.NineSlice.BottomEdge:SetPoint("BOTTOMRIGHT", frame.NineSlice.BottomRightCorner, "BOTTOMLEFT")

	frame.NineSlice.BottomLeftCorner:SetSize(132, 132)
	frame.NineSlice.BottomLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.BottomLeftCorner:SetTexCoord(0.001953125, 0.259765625, 0.001953125, 0.259765625)
	frame.NineSlice.BottomLeftCorner:ClearAllPoints()
	frame.NineSlice.BottomLeftCorner:SetPoint("BOTTOMLEFT", -13, -3)

	frame.NineSlice.BottomRightCorner:SetSize(132, 132)
	frame.NineSlice.BottomRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.BottomRightCorner:SetTexCoord(0.263671875, 0.521484375, 0.001953125, 0.259765625)
	frame.NineSlice.BottomRightCorner:ClearAllPoints()
	frame.NineSlice.BottomRightCorner:SetPoint("BOTTOMRIGHT", 4, -3)

	frame.NineSlice.LeftEdge:SetSize(132, 128)
	frame.NineSlice.LeftEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalVertical", false, true)
	frame.NineSlice.LeftEdge:SetTexCoord(0.001953125, 0.259765625, 0, 1)
	frame.NineSlice.LeftEdge:ClearAllPoints()
	frame.NineSlice.LeftEdge:SetPoint("TOPLEFT", frame.NineSlice.TopLeftCorner, "BOTTOMLEFT")
	frame.NineSlice.LeftEdge:SetPoint("BOTTOMLEFT", frame.NineSlice.BottomLeftCorner, "TOPLEFT")

	frame.NineSlice.RightEdge:SetSize(132, 132)
	frame.NineSlice.RightEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalVertical", false, true)
	frame.NineSlice.RightEdge:SetTexCoord(0.263671875, 0.521484375, 0, 1)
	frame.NineSlice.RightEdge:ClearAllPoints()
	frame.NineSlice.RightEdge:SetPoint("TOPRIGHT", frame.NineSlice.TopRightCorner, "BOTTOMRIGHT")
	frame.NineSlice.RightEdge:SetPoint("BOTTOMRIGHT", frame.NineSlice.BottomRightCorner, "TOPRIGHT")
end

function ApplyNineSliceNoPortrait(frame)
	if frame.TopTileStreaks then
		frame.TopTileStreaks:ClearAllPoints()
		frame.TopTileStreaks:SetPoint("TOPLEFT", 0, -21)
		frame.TopTileStreaks:SetPoint("TOPRIGHT", -2, -21)
	end

	frame.NineSlice.TopEdge:SetSize(128, 132)
	frame.NineSlice.TopEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalHorizontal", true)
	frame.NineSlice.TopEdge:SetTexCoord(0, 1, 0.263671875, 0.521484375)
	frame.NineSlice.TopEdge:ClearAllPoints()
	frame.NineSlice.TopEdge:SetPoint("TOPLEFT", frame.NineSlice.TopLeftCorner, "TOPRIGHT")
	frame.NineSlice.TopEdge:SetPoint("TOPRIGHT", frame.NineSlice.TopRightCorner, "TOPLEFT")

	frame.NineSlice.TopLeftCorner:SetSize(132, 132)
	frame.NineSlice.TopLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.TopLeftCorner:SetTexCoord(0.525390625, 0.783203125, 0.001953125, 0.259765625)
	frame.NineSlice.TopLeftCorner:ClearAllPoints()
	frame.NineSlice.TopLeftCorner:SetPoint("TOPLEFT", -12, 16)

	frame.NineSlice.TopRightCorner:SetSize(132, 132)
	frame.NineSlice.TopRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.TopRightCorner:SetTexCoord(0.001953125, 0.259765625, 0.263671875, 0.521484375)
	frame.NineSlice.TopRightCorner:ClearAllPoints()
	frame.NineSlice.TopRightCorner:SetPoint("TOPRIGHT", 4, 16)

	frame.NineSlice.BottomEdge:SetSize(128, 132)
	frame.NineSlice.BottomEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalHorizontal", true)
	frame.NineSlice.BottomEdge:SetTexCoord(0, 1, 0.001953125, 0.259765625)
	frame.NineSlice.BottomEdge:ClearAllPoints()
	frame.NineSlice.BottomEdge:SetPoint("BOTTOMLEFT", frame.NineSlice.BottomLeftCorner, "BOTTOMRIGHT")
	frame.NineSlice.BottomEdge:SetPoint("BOTTOMRIGHT", frame.NineSlice.BottomRightCorner, "BOTTOMLEFT")

	frame.NineSlice.BottomLeftCorner:SetSize(132, 132)
	frame.NineSlice.BottomLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.BottomLeftCorner:SetTexCoord(0.001953125, 0.259765625, 0.001953125, 0.259765625)
	frame.NineSlice.BottomLeftCorner:ClearAllPoints()
	frame.NineSlice.BottomLeftCorner:SetPoint("BOTTOMLEFT", -12, -3)

	frame.NineSlice.BottomRightCorner:SetSize(132, 132)
	frame.NineSlice.BottomRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.BottomRightCorner:SetTexCoord(0.263671875, 0.521484375, 0.001953125, 0.259765625)
	frame.NineSlice.BottomRightCorner:ClearAllPoints()
	frame.NineSlice.BottomRightCorner:SetPoint("BOTTOMRIGHT", 4, -3)

	frame.NineSlice.LeftEdge:SetSize(132, 128)
	frame.NineSlice.LeftEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalVertical", false, true)
	frame.NineSlice.LeftEdge:SetTexCoord(0.001953125, 0.259765625, 0, 1)
	frame.NineSlice.LeftEdge:ClearAllPoints()
	frame.NineSlice.LeftEdge:SetPoint("TOPLEFT", frame.NineSlice.TopLeftCorner, "BOTTOMLEFT")
	frame.NineSlice.LeftEdge:SetPoint("BOTTOMLEFT", frame.NineSlice.BottomLeftCorner, "TOPLEFT")

	frame.NineSlice.RightEdge:SetSize(132, 132)
	frame.NineSlice.RightEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalVertical", false, true)
	frame.NineSlice.RightEdge:SetTexCoord(0.263671875, 0.521484375, 0, 1)
	frame.NineSlice.RightEdge:ClearAllPoints()
	frame.NineSlice.RightEdge:SetPoint("TOPRIGHT", frame.NineSlice.TopRightCorner, "BOTTOMRIGHT")
	frame.NineSlice.RightEdge:SetPoint("BOTTOMRIGHT", frame.NineSlice.BottomRightCorner, "TOPRIGHT")
end

function ApplyNineSliceNoPortraitMinimizable(frame)
	frame.NineSlice.TopEdge:SetSize(128, 132)
	frame.NineSlice.TopEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalHorizontal", true)
	frame.NineSlice.TopEdge:SetTexCoord(0, 1, 0.263671875, 0.521484375)
	frame.NineSlice.TopEdge:ClearAllPoints()
	frame.NineSlice.TopEdge:SetPoint("TOPLEFT", frame.NineSlice.TopLeftCorner, "TOPRIGHT")
	frame.NineSlice.TopEdge:SetPoint("TOPRIGHT", frame.NineSlice.TopRightCorner, "TOPLEFT")

	frame.NineSlice.TopLeftCorner:SetSize(132, 132)
	frame.NineSlice.TopLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.TopLeftCorner:SetTexCoord(0.525390625, 0.783203125, 0.001953125, 0.259765625)
	frame.NineSlice.TopLeftCorner:ClearAllPoints()
	frame.NineSlice.TopLeftCorner:SetPoint("TOPLEFT", -12, 16)

	frame.NineSlice.TopRightCorner:SetSize(132, 132)
	frame.NineSlice.TopRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.TopRightCorner:SetTexCoord(0.001953125, 0.259765625, 0.525390625, 0.783203125)
	frame.NineSlice.TopRightCorner:ClearAllPoints()
	frame.NineSlice.TopRightCorner:SetPoint("TOPRIGHT", 4, 16)

	frame.NineSlice.BottomEdge:SetSize(128, 132)
	frame.NineSlice.BottomEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalHorizontal", true)
	frame.NineSlice.BottomEdge:SetTexCoord(0, 1, 0.001953125, 0.259765625)
	frame.NineSlice.BottomEdge:ClearAllPoints()
	frame.NineSlice.BottomEdge:SetPoint("BOTTOMLEFT", frame.NineSlice.BottomLeftCorner, "BOTTOMRIGHT")
	frame.NineSlice.BottomEdge:SetPoint("BOTTOMRIGHT", frame.NineSlice.BottomRightCorner, "BOTTOMLEFT")

	frame.NineSlice.BottomLeftCorner:SetSize(132, 132)
	frame.NineSlice.BottomLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.BottomLeftCorner:SetTexCoord(0.001953125, 0.259765625, 0.001953125, 0.259765625)
	frame.NineSlice.BottomLeftCorner:ClearAllPoints()
	frame.NineSlice.BottomLeftCorner:SetPoint("BOTTOMLEFT", -12, -3)

	frame.NineSlice.BottomRightCorner:SetSize(132, 132)
	frame.NineSlice.BottomRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
	frame.NineSlice.BottomRightCorner:SetTexCoord(0.263671875, 0.521484375, 0.001953125, 0.259765625)
	frame.NineSlice.BottomRightCorner:ClearAllPoints()
	frame.NineSlice.BottomRightCorner:SetPoint("BOTTOMRIGHT", 4, -3)

	frame.NineSlice.LeftEdge:SetSize(132, 128)
	frame.NineSlice.LeftEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalVertical", false, true)
	frame.NineSlice.LeftEdge:SetTexCoord(0.001953125, 0.259765625, 0, 1)
	frame.NineSlice.LeftEdge:ClearAllPoints()
	frame.NineSlice.LeftEdge:SetPoint("TOPLEFT", frame.NineSlice.TopLeftCorner, "BOTTOMLEFT")
	frame.NineSlice.LeftEdge:SetPoint("BOTTOMLEFT", frame.NineSlice.BottomLeftCorner, "TOPLEFT")

	frame.NineSlice.RightEdge:SetSize(132, 132)
	frame.NineSlice.RightEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalVertical", false, true)
	frame.NineSlice.RightEdge:SetTexCoord(0.263671875, 0.521484375, 0, 1)
	frame.NineSlice.RightEdge:ClearAllPoints()
	frame.NineSlice.RightEdge:SetPoint("TOPRIGHT", frame.NineSlice.TopRightCorner, "BOTTOMRIGHT")
	frame.NineSlice.RightEdge:SetPoint("BOTTOMRIGHT", frame.NineSlice.BottomRightCorner, "TOPRIGHT")
end

function ApplyDialogBorder(frame)
	frame.TopEdge:SetSize(32, 32)
	frame.TopEdge:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UIFrameDiamondMetal", true)
	frame.TopEdge:SetTexCoord(0, 0.5, 0.13671875, 0.26171875)
	frame.TopEdge:ClearAllPoints()
	frame.TopEdge:SetPoint("TOPLEFT", frame.TopLeftCorner, "TOPRIGHT")
	frame.TopEdge:SetPoint("TOPRIGHT", frame.TopRightCorner, "TOPLEFT")

	frame.TopLeftCorner:SetSize(32, 32)
	frame.TopLeftCorner:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UIFrameDiamondMetal")
	frame.TopLeftCorner:SetTexCoord(0.015625, 0.515625, 0.53515625, 0.66015625)
	frame.TopLeftCorner:ClearAllPoints()
	frame.TopLeftCorner:SetPoint("TOPLEFT")

	frame.TopRightCorner:SetSize(32, 32)
	frame.TopRightCorner:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UIFrameDiamondMetal")
	frame.TopRightCorner:SetTexCoord(0.015625, 0.515625, 0.66796875, 0.79296875)
	frame.TopRightCorner:ClearAllPoints()
	frame.TopRightCorner:SetPoint("TOPRIGHT")

	frame.BottomEdge:SetSize(32, 32)
	frame.BottomEdge:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UIFrameDiamondMetal", true)
	frame.BottomEdge:SetTexCoord(0, 0.5, 0.00390625, 0.12890625)
	frame.BottomEdge:ClearAllPoints()
	frame.BottomEdge:SetPoint("BOTTOMLEFT", frame.BottomLeftCorner, "BOTTOMRIGHT")
	frame.BottomEdge:SetPoint("BOTTOMRIGHT", frame.BottomRightCorner, "BOTTOMLEFT")

	frame.BottomLeftCorner:SetSize(32, 32)
	frame.BottomLeftCorner:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UIFrameDiamondMetal")
	frame.BottomLeftCorner:SetTexCoord(0.015625, 0.515625, 0.26953125, 0.39453125)
	frame.BottomLeftCorner:ClearAllPoints()
	frame.BottomLeftCorner:SetPoint("BOTTOMLEFT")

	frame.BottomRightCorner:SetSize(32, 32)
	frame.BottomRightCorner:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UIFrameDiamondMetal")
	frame.BottomRightCorner:SetTexCoord(0.015625, 0.515625, 0.40234375, 0.52734375)
	frame.BottomRightCorner:ClearAllPoints()
	frame.BottomRightCorner:SetPoint("BOTTOMRIGHT")

	frame.LeftEdge:SetSize(32, 32)
	frame.LeftEdge:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UIFrameDiamondMetalVertical", false, true)
	frame.LeftEdge:SetTexCoord(0.0078125, 0.2578125, 0, 1)
	frame.LeftEdge:SetPoint("TOPLEFT", frame.TopLeftCorner, "BOTTOMLEFT")
	frame.LeftEdge:SetPoint("BOTTOMLEFT", frame.BottomLeftCorner, "TOPLEFT")

	frame.RightEdge:SetSize(32, 32)
	frame.RightEdge:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UIFrameDiamondMetalVertical", false, true)
	frame.RightEdge:SetTexCoord(0.2734375, 0.5234375, 0, 1)
	frame.RightEdge:ClearAllPoints()
	frame.RightEdge:SetPoint("TOPRIGHT", frame.TopRightCorner, "BOTTOMRIGHT")
	frame.RightEdge:SetPoint("BOTTOMRIGHT", frame.BottomRightCorner, "TOPRIGHT")
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
	frame.Forward:SetPoint("BOTTOMLEFT", 4, 4)
end

function ApplyScrollBarTrack(frame)
	frame:SetWidth(18)
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
	frame.Middle:ClearAllPoints()
	frame.Middle:SetPoint("TOPLEFT", frame.Begin, "BOTTOMLEFT")
	frame.Middle:SetPoint("BOTTOMRIGHT", frame.End, "TOPRIGHT")
end

function ApplyScrollBarThumb(frame)
	frame:SetWidth(18)
	frame.Begin:SetAtlas("UI-ScrollBar-Knob-EndCap-Top")
	frame.End:SetAtlas("UI-ScrollBar-Knob-EndCap-Bottom")
	frame.Middle:SetAtlas("UI-ScrollBar-Knob-Center")
	frame.upBeginTexture = "UI-ScrollBar-Knob-EndCap-Top"
	frame.upMiddleTexture = "UI-ScrollBar-Knob-Center"
	frame.upEndTexture = "UI-ScrollBar-Knob-EndCap-Bottom"
	frame.overBeginTexture = "UI-ScrollBar-Knob-MouseOver-EndCap-Top"
	frame.overMiddleTexture = "UI-ScrollBar-Knob-MouseOver-Center"
	frame.overEndTexture = "UI-ScrollBar-Knob-MouseOver-EndCap-Bottom"
	frame.downBeginTexture = "UI-ScrollBar-Knob-EndCap-Top-Disabled"
	frame.downMiddleTexture = "UI-ScrollBar-Knob-Center-Disabled"
	frame.downEndTexture = "UI-ScrollBar-Knob-EndCap-Bottom-Disabled"
	frame.Middle:ClearAllPoints()
	frame.Middle:SetPoint("TOPLEFT", 0, -5)
	frame.Middle:SetPoint("BOTTOMRIGHT", 0, 5)
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
end