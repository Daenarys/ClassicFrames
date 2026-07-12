function ApplyCloseButton(frame, defaultPos)
	frame:SetSize(32, 32)
	frame:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
	frame:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
	frame:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
	frame:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

	if not defaultPos then
		frame:ClearAllPoints()
		frame:SetPoint("TOPRIGHT", 4, 5)
	end
end

function ApplyTitleBg(frame, noPortrait)
	if (frame.TitleBg == nil) then
		frame.TitleBg = frame:CreateTexture(nil, "BACKGROUND")
		frame.TitleBg:SetAtlas("_UI-Frame-TitleTileBg", false)
		frame.TitleBg:SetHorizTile(true)
		if noPortrait then
			frame.TitleBg:SetSize(256, 18)
			frame.TitleBg:SetPoint("TOPLEFT", 6, -3)
			frame.TitleBg:SetPoint("TOPRIGHT", -25, -3)
		else
			frame.TitleBg:SetSize(256, 17)
			frame.TitleBg:SetPoint("TOPLEFT", 2, -3)
			frame.TitleBg:SetPoint("TOPRIGHT", -25, -3)
		end
	end
end

function ApplyNineSlicePortrait(frame)
	if (frame.Bg:GetTexture() == 374155) then
		frame.Bg:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-Background-Rock", true, true)
	end

	if frame.TopTileStreaks then
		frame.TopTileStreaks:ClearAllPoints()
		frame.TopTileStreaks:SetPoint("TOPLEFT", 0, -21)
		frame.TopTileStreaks:SetPoint("TOPRIGHT", -2, -21)
	end

	frame.NineSlice.TopEdge:SetSize(256, 28)
	frame.NineSlice.TopEdge:SetTexture("Interface\\FrameGeneral\\_UI-Frame", true)
	frame.NineSlice.TopEdge:SetTexCoord(0, 1, 0.43750000, 0.65625000)
	frame.NineSlice.TopEdge:ClearAllPoints()
	frame.NineSlice.TopEdge:SetPoint("TOPLEFT", frame.NineSlice.TopLeftCorner, "TOPRIGHT", 0, -10)
	frame.NineSlice.TopEdge:SetPoint("TOPRIGHT", frame.NineSlice.TopRightCorner, "TOPLEFT")

	frame.NineSlice.TopLeftCorner:SetSize(78, 78)
	frame.NineSlice.TopLeftCorner:SetTexture("Interface\\FrameGeneral\\UI-Frame")
	frame.NineSlice.TopLeftCorner:SetTexCoord(0.00781250, 0.61718750, 0.00781250, 0.61718750)
	frame.NineSlice.TopLeftCorner:ClearAllPoints()
	frame.NineSlice.TopLeftCorner:SetPoint("TOPLEFT", -14, 11)

	frame.NineSlice.TopRightCorner:SetSize(33, 33)
	frame.NineSlice.TopRightCorner:SetTexture("Interface\\FrameGeneral\\UI-Frame")
	frame.NineSlice.TopRightCorner:SetTexCoord(0.63281250, 0.89062500, 0.00781250, 0.26562500)
	frame.NineSlice.TopRightCorner:ClearAllPoints()
	frame.NineSlice.TopRightCorner:SetPoint("TOPRIGHT", 0, 1)

	frame.NineSlice.BottomEdge:SetSize(256, 9)
	frame.NineSlice.BottomEdge:SetTexture("Interface\\FrameGeneral\\_UI-Frame", true)
	frame.NineSlice.BottomEdge:SetTexCoord(0, 1, 0.20312500, 0.27343750)
	frame.NineSlice.BottomEdge:ClearAllPoints()
	frame.NineSlice.BottomEdge:SetPoint("BOTTOMLEFT", frame.NineSlice.BottomLeftCorner, "BOTTOMRIGHT")
	frame.NineSlice.BottomEdge:SetPoint("BOTTOMRIGHT", frame.NineSlice.BottomRightCorner, "BOTTOMLEFT")

	frame.NineSlice.BottomLeftCorner:SetSize(14, 14)
	frame.NineSlice.BottomLeftCorner:SetTexture("Interface\\FrameGeneral\\UI-Frame")
	frame.NineSlice.BottomLeftCorner:SetTexCoord(0.00781250, 0.11718750, 0.63281250, 0.74218750)
	frame.NineSlice.BottomLeftCorner:ClearAllPoints()
	frame.NineSlice.BottomLeftCorner:SetPoint("BOTTOMLEFT", -6, -5)

	frame.NineSlice.BottomRightCorner:SetSize(11, 11)
	frame.NineSlice.BottomRightCorner:SetTexture("Interface\\FrameGeneral\\UI-Frame")
	frame.NineSlice.BottomRightCorner:SetTexCoord(0.13281250, 0.21875000, 0.89843750, 0.98437500)
	frame.NineSlice.BottomRightCorner:ClearAllPoints()
	frame.NineSlice.BottomRightCorner:SetPoint("BOTTOMRIGHT", 0, -5)

	frame.NineSlice.LeftEdge:SetSize(16, 256)
	frame.NineSlice.LeftEdge:SetTexture("Interface\\FrameGeneral\\!UI-Frame", false, true)
	frame.NineSlice.LeftEdge:SetTexCoord(0.35937500, 0.60937500, 0, 1)
	frame.NineSlice.LeftEdge:ClearAllPoints()
	frame.NineSlice.LeftEdge:SetPoint("TOPLEFT", frame.NineSlice.TopLeftCorner, "BOTTOMLEFT", 8, 0)
	frame.NineSlice.LeftEdge:SetPoint("BOTTOMLEFT", frame.NineSlice.BottomLeftCorner, "TOPLEFT")

	frame.NineSlice.RightEdge:SetSize(10, 256)
	frame.NineSlice.RightEdge:SetTexture("Interface\\FrameGeneral\\!UI-Frame", false, true)
	frame.NineSlice.RightEdge:SetTexCoord(0.17187500, 0.32812500, 0, 1)
	frame.NineSlice.RightEdge:ClearAllPoints()
	frame.NineSlice.RightEdge:SetPoint("TOPRIGHT", frame.NineSlice.TopRightCorner, "BOTTOMRIGHT", 1, 0)
	frame.NineSlice.RightEdge:SetPoint("BOTTOMRIGHT", frame.NineSlice.BottomRightCorner, "TOPRIGHT")
end

function ApplyNineSliceNoPortrait(frame)
	frame.NineSlice.TopEdge:SetSize(256, 28)
	frame.NineSlice.TopEdge:SetTexture("Interface\\FrameGeneral\\_UI-Frame", true)
	frame.NineSlice.TopEdge:SetTexCoord(0, 1, 0.43750000, 0.65625000)
	frame.NineSlice.TopEdge:ClearAllPoints()
	frame.NineSlice.TopEdge:SetPoint("TOPLEFT", frame.NineSlice.TopLeftCorner, "TOPRIGHT")
	frame.NineSlice.TopEdge:SetPoint("TOPRIGHT", frame.NineSlice.TopRightCorner, "TOPLEFT")

	frame.NineSlice.TopLeftCorner:SetSize(32, 32)
	frame.NineSlice.TopLeftCorner:SetTexture("Interface\\FrameGeneral\\UI-Frame")
	frame.NineSlice.TopLeftCorner:SetTexCoord(0.63281250, 0.88281250, 0.28125000, 0.53125000)
	frame.NineSlice.TopLeftCorner:ClearAllPoints()
	frame.NineSlice.TopLeftCorner:SetPoint("TOPLEFT", 0, 1)

	frame.NineSlice.TopRightCorner:SetSize(33, 33)
	frame.NineSlice.TopRightCorner:SetTexture("Interface\\FrameGeneral\\UI-Frame")
	frame.NineSlice.TopRightCorner:SetTexCoord(0.63281250, 0.89062500, 0.00781250, 0.26562500)
	frame.NineSlice.TopRightCorner:ClearAllPoints()
	frame.NineSlice.TopRightCorner:SetPoint("TOPRIGHT", 0, 1)

	frame.NineSlice.BottomEdge:SetSize(256, 9)
	frame.NineSlice.BottomEdge:SetTexture("Interface\\FrameGeneral\\_UI-Frame", true)
	frame.NineSlice.BottomEdge:SetTexCoord(0, 1, 0.20312500, 0.27343750)
	frame.NineSlice.BottomEdge:ClearAllPoints()
	frame.NineSlice.BottomEdge:SetPoint("BOTTOMLEFT", frame.NineSlice.BottomLeftCorner, "BOTTOMRIGHT")
	frame.NineSlice.BottomEdge:SetPoint("BOTTOMRIGHT", frame.NineSlice.BottomRightCorner, "BOTTOMLEFT")

	frame.NineSlice.BottomLeftCorner:SetSize(14, 14)
	frame.NineSlice.BottomLeftCorner:SetTexture("Interface\\FrameGeneral\\UI-Frame")
	frame.NineSlice.BottomLeftCorner:SetTexCoord(0.00781250, 0.11718750, 0.63281250, 0.74218750)
	frame.NineSlice.BottomLeftCorner:ClearAllPoints()
	frame.NineSlice.BottomLeftCorner:SetPoint("BOTTOMLEFT", 0, -5)

	frame.NineSlice.BottomRightCorner:SetSize(11, 11)
	frame.NineSlice.BottomRightCorner:SetTexture("Interface\\FrameGeneral\\UI-Frame")
	frame.NineSlice.BottomRightCorner:SetTexCoord(0.13281250, 0.21875000, 0.89843750, 0.98437500)
	frame.NineSlice.BottomRightCorner:ClearAllPoints()
	frame.NineSlice.BottomRightCorner:SetPoint("BOTTOMRIGHT", 0, -5)

	frame.NineSlice.LeftEdge:SetSize(16, 256)
	frame.NineSlice.LeftEdge:SetTexture("Interface\\FrameGeneral\\!UI-Frame", false, true)
	frame.NineSlice.LeftEdge:SetTexCoord(0.35937500, 0.60937500, 0, 1)
	frame.NineSlice.LeftEdge:ClearAllPoints()
	frame.NineSlice.LeftEdge:SetPoint("TOPLEFT", frame.NineSlice.TopLeftCorner, "BOTTOMLEFT")
	frame.NineSlice.LeftEdge:SetPoint("BOTTOMLEFT", frame.NineSlice.BottomLeftCorner, "TOPLEFT")

	frame.NineSlice.RightEdge:SetSize(10, 256)
	frame.NineSlice.RightEdge:SetTexture("Interface\\FrameGeneral\\!UI-Frame", false, true)
	frame.NineSlice.RightEdge:SetTexCoord(0.17187500, 0.32812500, 0, 1)
	frame.NineSlice.RightEdge:ClearAllPoints()
	frame.NineSlice.RightEdge:SetPoint("TOPRIGHT", frame.NineSlice.TopRightCorner, "BOTTOMRIGHT", 1, 0)
	frame.NineSlice.RightEdge:SetPoint("BOTTOMRIGHT", frame.NineSlice.BottomRightCorner, "TOPRIGHT")
end

function ApplyDialogBorder(frame)
	frame.TopLeftCorner:SetAlpha(0)
	frame.TopRightCorner:SetAlpha(0)
	frame.BottomLeftCorner:SetAlpha(0)
	frame.BottomRightCorner:SetAlpha(0)
	frame.TopEdge:SetAlpha(0)
	frame.BottomEdge:SetAlpha(0)
	frame.LeftEdge:SetAlpha(0)
	frame.RightEdge:SetAlpha(0)

	local backdrop = CreateFrame("Frame", nil, frame, "BackdropTemplate")
	backdrop:SetBackdrop(BACKDROP_DIALOG_EDGE_32)
	backdrop:SetAllPoints()
	backdrop:SetFrameLevel(frame:GetFrameLevel())
end

function ApplyDialogHeader(frame)
	frame.LeftBG:SetSize(14, 40)
	frame.LeftBG:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-DialogBox-Header")
	frame.LeftBG:SetTexCoord(0.2265625, 0.28125, 0, 0.625)
	frame.LeftBG:SetTexelSnappingBias(1)

	frame.RightBG:SetSize(14, 40)
	frame.RightBG:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-DialogBox-Header")
	frame.RightBG:SetTexCoord(0.71484375, 0.76953125, 0, 0.625)
	frame.RightBG:SetTexelSnappingBias(1)
	frame.RightBG:SetPoint("RIGHT", -1, 0)

	frame.CenterBG:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-DialogBox-Header")
	frame.CenterBG:SetTexCoord(0.28125, 0.71484375, 0, 0.625)
	frame.CenterBG:SetHorizTile(false)
	frame.CenterBG:SetTexelSnappingBias(1)
end

function ApplyScrollBarArrow(frame, defaultPos)
	frame.Back:SetSize(18, 16)
	frame.Back:SetNormalTexture("Interface\\Buttons\\UI-ScrollBar-ScrollUpButton-Up")
	frame.Back:GetNormalTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)
	frame.Back:SetPushedTexture("Interface\\Buttons\\UI-ScrollBar-ScrollUpButton-Down")
	frame.Back:GetPushedTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)
	frame.Back:SetDisabledTexture("Interface\\Buttons\\UI-ScrollBar-ScrollUpButton-Disabled")
	frame.Back:GetDisabledTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)
	frame.Back:SetHighlightTexture("Interface\\Buttons\\UI-ScrollBar-ScrollUpButton-Highlight", "ADD")
	frame.Back:GetHighlightTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)

	frame.Forward:SetSize(18, 16)
	frame.Forward:SetNormalTexture("Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Up")
	frame.Forward:GetNormalTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)
	frame.Forward:SetPushedTexture("Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Down")
	frame.Forward:GetPushedTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)
	frame.Forward:SetDisabledTexture("Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Disabled")
	frame.Forward:GetDisabledTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)
	frame.Forward:SetHighlightTexture("Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Highlight", "ADD")
	frame.Forward:GetHighlightTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)

	if not defaultPos then
		frame.Back:SetPoint("TOP", 0, -4)
		frame.Forward:SetPoint("BOTTOM", 0, 3)
	end
end

function ApplyScrollBarTrack(frame)
	frame:ClearAllPoints()
	frame:SetPoint("TOPLEFT", 4, -22)
	frame:SetPoint("BOTTOMRIGHT", -4, 22)

	frame.Begin:SetSize(31, 102)
	frame.Begin:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ScrollBar")
	frame.Begin:SetTexCoord(0, 0.484375, 0, 0.4)
	frame.Begin:ClearAllPoints()
	frame.Begin:SetPoint("TOPLEFT", -7, 23)

	frame.End:SetSize(31, 106)
	frame.End:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ScrollBar")
	frame.End:SetTexCoord(0.515625, 1, 0, 0.4140625)
	frame.End:ClearAllPoints()
	frame.End:SetPoint("BOTTOMLEFT", -7, -21)

	frame.Middle:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ScrollBar")
	frame.Middle:SetTexCoord(0, 0.484375, 0.75, 1)
end

function ApplyScrollBarHybrid(frame, showBg, isTrim)
	-- arrows
	frame.Back:SetSize(18, 16)
	frame.Back:SetNormalTexture("Interface\\Buttons\\UI-ScrollBar-ScrollUpButton-Up")
	frame.Back:GetNormalTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)
	frame.Back:SetPushedTexture("Interface\\Buttons\\UI-ScrollBar-ScrollUpButton-Down")
	frame.Back:GetPushedTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)
	frame.Back:SetDisabledTexture("Interface\\Buttons\\UI-ScrollBar-ScrollUpButton-Disabled")
	frame.Back:GetDisabledTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)
	frame.Back:SetHighlightTexture("Interface\\Buttons\\UI-ScrollBar-ScrollUpButton-Highlight", "ADD")
	frame.Back:GetHighlightTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)

	frame.Forward:SetSize(18, 16)
	frame.Forward:SetNormalTexture("Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Up")
	frame.Forward:GetNormalTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)
	frame.Forward:SetPushedTexture("Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Down")
	frame.Forward:GetPushedTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)
	frame.Forward:SetDisabledTexture("Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Disabled")
	frame.Forward:GetDisabledTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)
	frame.Forward:SetHighlightTexture("Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Highlight", "ADD")
	frame.Forward:GetHighlightTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)
	frame.Forward:SetPoint("BOTTOM", 0, 1)

	-- bg
	if showBg then
		if (frame.BG == nil) then
			frame.BG = frame:CreateTexture(nil, "BACKGROUND")
			frame.BG:SetColorTexture(0, 0, 0, 0.85)
			frame.BG:SetPoint("TOPLEFT", -5, 0)
			frame.BG:SetPoint("BOTTOMRIGHT", 5, 0)
		end
	end

	-- track
	if isTrim then
		frame.Track.Begin:SetSize(24, 48)
		frame.Track.Begin:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ScrollBar")
		frame.Track.Begin:SetTexCoord(0, 0.45, 0, 0.2)
		frame.Track.Begin:ClearAllPoints()
		frame.Track.Begin:SetPoint("TOPLEFT", -10, 22)

		frame.Track.End:SetSize(24, 64)
		frame.Track.End:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ScrollBar")
		frame.Track.End:SetTexCoord(0.515625, 0.97, 0.1440625, 0.4140625)
		frame.Track.End:ClearAllPoints()
		frame.Track.End:SetPoint("BOTTOMLEFT", -10, -19)

		frame.Track.Middle:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ScrollBar")
		frame.Track.Middle:SetTexCoord(0, 0.45, 0.1640625, 1)
	else
		frame.Track.Begin:SetSize(27, 48)
		frame.Track.Begin:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ScrollBar")
		frame.Track.Begin:SetTexCoord(0, 0.484375, 0, 0.2)
		frame.Track.Begin:ClearAllPoints()
		frame.Track.Begin:SetPoint("TOPLEFT", -10, 22)

		frame.Track.End:SetSize(27, 64)
		frame.Track.End:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ScrollBar")
		frame.Track.End:SetTexCoord(0.515625, 1, 0.1440625, 0.4140625)
		frame.Track.End:ClearAllPoints()
		frame.Track.End:SetPoint("BOTTOMLEFT", -10, -19)

		frame.Track.Middle:SetTexture("Interface\\PaperDollInfoFrame\\UI-Character-ScrollBar")
		frame.Track.Middle:SetTexCoord(0, 0.484375, 0.1640625, 1)
	end
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

function ApplyTopTabNew(frame)
	frame:SetHeight(32)

	if (frame.LeftDisabled == nil) then
		frame.LeftDisabled = frame:CreateTexture(nil, "BACKGROUND")
		frame.LeftDisabled:SetSize(16, 32)
		frame.LeftDisabled:SetTexture("Interface\\HelpFrame\\HelpFrameTab-Active")
		frame.LeftDisabled:SetTexCoord(0, 0.25, 0, 1)
		frame.LeftDisabled:SetPoint("BOTTOMLEFT")
	end

	if (frame.RightDisabled == nil) then
		frame.RightDisabled = frame:CreateTexture(nil, "BACKGROUND")
		frame.RightDisabled:SetSize(16, 32)
		frame.RightDisabled:SetTexture("Interface\\HelpFrame\\HelpFrameTab-Active")
		frame.RightDisabled:SetTexCoord(0.75, 1, 0, 1)
		frame.RightDisabled:SetPoint("BOTTOMRIGHT")
	end

	if (frame.MiddleDisabled == nil) then
		frame.MiddleDisabled = frame:CreateTexture(nil, "BACKGROUND")
		frame.MiddleDisabled:SetSize(32, 32)
		frame.MiddleDisabled:SetTexture("Interface\\HelpFrame\\HelpFrameTab-Active")
		frame.MiddleDisabled:SetTexCoord(0.25, 0.75, 0, 1)
		frame.MiddleDisabled:SetHorizTile(false)
		frame.MiddleDisabled:SetPoint("TOPLEFT", frame.LeftDisabled, "TOPRIGHT")
		frame.MiddleDisabled:SetPoint("TOPRIGHT", frame.RightDisabled, "TOPLEFT")
	end

	if (frame.CfLeft == nil) then
		frame.CfLeft = frame:CreateTexture(nil, "BACKGROUND")
		frame.CfLeft:SetSize(16, 32)
		frame.CfLeft:SetTexture("Interface\\HelpFrame\\HelpFrameTab-Inactive")
		frame.CfLeft:SetTexCoord(0, 0.25, 0, 1)
		frame.CfLeft:SetPoint("BOTTOMLEFT", 0, 3)
	end

	if (frame.CfRight == nil) then
		frame.CfRight = frame:CreateTexture(nil, "BACKGROUND")
		frame.CfRight:SetSize(16, 32)
		frame.CfRight:SetTexture("Interface\\HelpFrame\\HelpFrameTab-Inactive")
		frame.CfRight:SetTexCoord(0.75, 1, 0, 1)
		frame.CfRight:SetPoint("BOTTOMRIGHT", 0, 3)
	end

	if (frame.CfMiddle == nil) then
		frame.CfMiddle = frame:CreateTexture(nil, "BACKGROUND")
		frame.CfMiddle:SetSize(32, 32)
		frame.CfMiddle:SetTexture("Interface\\HelpFrame\\HelpFrameTab-Inactive")
		frame.CfMiddle:SetTexCoord(0.25, 0.75, 0, 1)
		frame.CfMiddle:SetHorizTile(false)
		frame.CfMiddle:SetPoint("TOPLEFT", frame.CfLeft, "TOPRIGHT")
		frame.CfMiddle:SetPoint("TOPRIGHT", frame.CfRight, "TOPLEFT")
	end

	frame.LeftHighlight:Hide()
	frame.MiddleHighlight:Hide()
	frame.RightHighlight:Hide()

	frame:SetHighlightTexture("Interface\\PaperDollInfoFrame\\UI-Character-Tab-Highlight")
	frame:GetHighlightTexture():ClearAllPoints()
	frame:GetHighlightTexture():SetPoint("TOPLEFT", 0, -5)
	frame:GetHighlightTexture():SetPoint("BOTTOMRIGHT", 0, -5)

	frame.Text:ClearAllPoints()
	frame.Text:SetPoint("BOTTOM", 0, 9)

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
		frame.LeftDisabled:SetShown(isSelected)
		frame.MiddleDisabled:SetShown(isSelected)
		frame.RightDisabled:SetShown(isSelected)
	end)
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

	frame:HookScript("OnDisable", function(self)
		self.Text:SetFontObject(GameFontDisableSmall)
	end)
end

function ApplyEJDropDown(frame)
	frame:SetWidth(101)

	frame.Arrow:Hide()
	frame.Background:Hide()

	if (frame.UpLeft == nil) then
		frame.UpLeft = frame:CreateTexture(nil, "ARTWORK")
		frame.UpLeft:SetSize(13, 26)
		frame.UpLeft:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
		frame.UpLeft:SetTexCoord(0.90039063, 0.95117188, 0.04980469, 0.07519531)
		frame.UpLeft:SetPoint("TOPLEFT")
	end

	if (frame.UpRight == nil) then
		frame.UpRight = frame:CreateTexture(nil, "ARTWORK")
		frame.UpRight:SetSize(13, 26)
		frame.UpRight:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
		frame.UpRight:SetTexCoord(0.90039063, 0.95117188, 0.04980469, 0.07519531)
		frame.UpRight:SetPoint("TOPRIGHT")
	end

	if (frame.UpMiddle == nil) then
		frame.UpMiddle = frame:CreateTexture(nil, "ARTWORK")
		frame.UpMiddle:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures_Tile")
		frame.UpMiddle:SetTexCoord(0, 1, 0.00195313, 0.05273438)
		frame.UpMiddle:SetPoint("TOPLEFT", frame.UpLeft, "TOPRIGHT")
		frame.UpMiddle:SetPoint("BOTTOMRIGHT", frame.UpRight, "BOTTOMLEFT")
	end

	if (frame.DownLeft == nil) then
		frame.DownLeft = frame:CreateTexture(nil, "ARTWORK")
		frame.DownLeft:SetSize(13, 26)
		frame.DownLeft:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
		frame.DownLeft:SetTexCoord(0.63476563, 0.68554688, 0.06738281, 0.09277344)
		frame.DownLeft:SetPoint("TOPLEFT")
		frame.DownLeft:Hide()
	end

	if (frame.DownRight == nil) then
		frame.DownRight = frame:CreateTexture(nil, "ARTWORK")
		frame.DownRight:SetSize(13, 26)
		frame.DownRight:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
		frame.DownRight:SetTexCoord(0.63476563, 0.68554688, 0.06738281, 0.09277344)
		frame.DownRight:SetPoint("TOPRIGHT")
		frame.DownRight:Hide()
	end

	if (frame.DownMiddle == nil) then
		frame.DownMiddle = frame:CreateTexture(nil, "ARTWORK")
		frame.DownMiddle:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures_Tile")
		frame.DownMiddle:SetTexCoord(0, 1, 0.05664063, 0.10742188)
		frame.DownMiddle:SetPoint("TOPLEFT", frame.DownLeft, "TOPRIGHT")
		frame.DownMiddle:SetPoint("BOTTOMRIGHT", frame.DownRight, "BOTTOMLEFT")
		frame.DownMiddle:Hide()
	end

	if (frame.HighLeft == nil) then
		frame.HighLeft = frame:CreateTexture(nil, "HIGHLIGHT")
		frame.HighLeft:SetSize(13, 26)
		frame.HighLeft:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
		frame.HighLeft:SetTexCoord(0.72656250, 0.77734375, 0.06738281, 0.09277344)
		frame.HighLeft:SetPoint("TOPLEFT")
	end

	if (frame.HighRight == nil) then
		frame.HighRight = frame:CreateTexture(nil, "HIGHLIGHT")
		frame.HighRight:SetSize(13, 26)
		frame.HighRight:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures")
		frame.HighRight:SetTexCoord(0.72656250, 0.77734375, 0.06738281, 0.09277344)
		frame.HighRight:SetPoint("TOPRIGHT")
	end

	if (frame.HighMiddle == nil) then
		frame.HighMiddle = frame:CreateTexture(nil, "HIGHLIGHT")
		frame.HighMiddle:SetTexture("Interface\\EncounterJournal\\UI-EncounterJournalTextures_Tile")
		frame.HighMiddle:SetTexCoord(0, 1, 0.11132813, 0.16210938)
		frame.HighMiddle:SetPoint("TOPLEFT", frame.HighLeft, "TOPRIGHT")
		frame.HighMiddle:SetPoint("BOTTOMRIGHT", frame.HighRight, "BOTTOMLEFT")
	end

	frame.Text:ClearAllPoints()
	frame.Text:SetPoint("CENTER", 0, -1)
	frame.Text:SetFontObject(GameFontNormalSmall)
	frame.Text:SetTextColor(0.973, 0.902, 0.581)

	hooksecurefunc(frame, "OnButtonStateChanged", function(self)
		self.Text:SetTextColor(0.973, 0.902, 0.581)
	end)

	local l, t, _, b, r = frame.UpLeft:GetTexCoord()
	frame.UpLeft:SetTexCoord(l, l + (r-l)/2, t, b)
	l, t, _, b, r = frame.UpRight:GetTexCoord()
	frame.UpRight:SetTexCoord(l + (r-l)/2, r, t, b)

	l, t, _, b, r = frame.DownLeft:GetTexCoord();
	frame.DownLeft:SetTexCoord(l, l + (r-l)/2, t, b);
	l, t, _, b, r = frame.DownRight:GetTexCoord();
	frame.DownRight:SetTexCoord(l + (r-l)/2, r, t, b);

	l, t, _, b, r = frame.HighLeft:GetTexCoord();
	frame.HighLeft:SetTexCoord(l, l + (r-l)/2, t, b)
	l, t, _, b, r = frame.HighRight:GetTexCoord()
	frame.HighRight:SetTexCoord(l + (r-l)/2, r, t, b)

	frame:HookScript("OnMouseDown", function(self)
		if self:IsEnabled() then
			self.UpLeft:Hide()
			self.UpRight:Hide()
			self.UpMiddle:Hide()
			self.DownLeft:Show()
			self.DownRight:Show()
			self.DownMiddle:Show()
			if self.Text then
				self.Text:AdjustPointsOffset(1, -1)
			end
		end
	end)

	frame:HookScript("OnMouseUp", function(self)
		if self:IsEnabled() then
			self.UpLeft:Show()
			self.UpRight:Show()
			self.UpMiddle:Show()
			self.DownLeft:Hide()
			self.DownRight:Hide()
			self.DownMiddle:Hide()
			if self.Text then
				self.Text:AdjustPointsOffset(-1, 1)
			end
		end
	end)
end

function ApplyStretchButton(frame)
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
		frame.Icon:SetAtlas("friendslist-categorybutton-arrow-down", true)
		frame.Icon:SetPoint("RIGHT", -5, -2)
	end

	frame.Arrow:Hide()

	frame.Text:SetFontObject(GameFontHighlightSmall)
	frame.Text:SetPoint("TOPLEFT", 11, -8)

	frame:SetHighlightTexture("Interface\\Buttons\\UI-Silver-Button-Highlight", "ADD")
	frame:GetHighlightTexture():SetTexCoord(0, 1, 0.03, 0.7175)

	frame:HookScript("OnMouseDown", function(self)
		if self:IsEnabled() then
			self.TopLeft:SetTexture("Interface\\Buttons\\UI-Silver-Button-Down")
			self.TopRight:SetTexture("Interface\\Buttons\\UI-Silver-Button-Down")
			self.BottomLeft:SetTexture("Interface\\Buttons\\UI-Silver-Button-Down")
			self.BottomRight:SetTexture("Interface\\Buttons\\UI-Silver-Button-Down")
			self.TopMiddle:SetTexture("Interface\\Buttons\\UI-Silver-Button-Down")
			self.MiddleLeft:SetTexture("Interface\\Buttons\\UI-Silver-Button-Down")
			self.MiddleRight:SetTexture("Interface\\Buttons\\UI-Silver-Button-Down")
			self.BottomMiddle:SetTexture("Interface\\Buttons\\UI-Silver-Button-Down")
			self.MiddleMiddle:SetTexture("Interface\\Buttons\\UI-Silver-Button-Down")
			if self.Icon then
				self.Icon:AdjustPointsOffset(1, -1)
			end
			if self.Text then
				self.Text:AdjustPointsOffset(1, -1)
			end
		end
	end)

	frame:HookScript("OnMouseUp", function(self)
		if self:IsEnabled() then
			self.TopLeft:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
			self.TopRight:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
			self.BottomLeft:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
			self.BottomRight:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
			self.TopMiddle:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
			self.MiddleLeft:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
			self.MiddleRight:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
			self.BottomMiddle:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
			self.MiddleMiddle:SetTexture("Interface\\Buttons\\UI-Silver-Button-Up")
			if self.Icon then
				self.Icon:AdjustPointsOffset(-1, 1)
			end
			if self.Text then
				self.Text:AdjustPointsOffset(-1, 1)
			end
		end
	end)
end

function ApplyMaxMinButton(frame)
	frame.MaximizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Up")
	frame.MaximizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Down")
	frame.MaximizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Disabled")
	frame.MaximizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
	frame.MaximizeButton:SetHitRectInsets(5, 5, 5, 5)

	frame.MinimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Up")
	frame.MinimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Down")
	frame.MinimizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Disabled")
	frame.MinimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
	frame.MinimizeButton:SetHitRectInsets(5, 5, 5, 5)
end

function ApplyCheckBox(frame)
	frame:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
	frame:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
	frame:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
	frame:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
	frame:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
end

function ApplyButtonSeparator(frame)
	local leftHandled = false
	local rightHandled = false

	-- Find out where this button is anchored and adjust positions/separators as necessary
	for i=1, frame:GetNumPoints() do
		local point, relativeTo, relativePoint, offsetX, offsetY = frame:GetPoint(i)

		if (relativeTo:GetObjectType() == "Button" and (point == "TOPLEFT" or point == "LEFT")) then

			if (offsetX == 0 and offsetY == 0) then
				frame:SetPoint(point, relativeTo, relativePoint, 1, 0)
			end

			if (relativeTo.RightSeparator) then
				-- Modify separator to make it a Middle
				frame.LeftSeparator = relativeTo.RightSeparator
			else
				-- Add a Middle separator
				frame.LeftSeparator = frame:CreateTexture(frame:GetName() and frame:GetName().."_LeftSeparator" or nil, "BORDER")
				relativeTo.RightSeparator = frame.LeftSeparator
			end

			frame.LeftSeparator:SetTexture("Interface\\FrameGeneral\\UI-Frame")
			frame.LeftSeparator:SetTexCoord(0.00781250, 0.10937500, 0.75781250, 0.95312500)
			frame.LeftSeparator:SetWidth(13)
			frame.LeftSeparator:SetHeight(25)
			frame.LeftSeparator:SetPoint("TOPRIGHT", frame, "TOPLEFT", 5, 1)

			leftHandled = true

		elseif (relativeTo:GetObjectType() == "Button" and (point == "TOPRIGHT" or point == "RIGHT")) then

			if (offsetX == 0 and offsetY == 0) then
				frame:SetPoint(point, relativeTo, relativePoint, -1, 0)
			end

			if (relativeTo.LeftSeparator) then
				-- Modify separator to make it a Middle
				frame.RightSeparator = relativeTo.LeftSeparator
			else
				-- Add a Middle separator
				frame.RightSeparator = frame:CreateTexture(frame:GetName() and frame:GetName().."_RightSeparator" or nil, "BORDER")
				relativeTo.LeftSeparator = frame.RightSeparator
			end

			frame.RightSeparator:SetTexture("Interface\\FrameGeneral\\UI-Frame")
			frame.RightSeparator:SetTexCoord(0.00781250, 0.10937500, 0.75781250, 0.95312500)
			frame.RightSeparator:SetWidth(13)
			frame.RightSeparator:SetHeight(25)
			frame.RightSeparator:SetPoint("TOPLEFT", frame, "TOPRIGHT", -5, 1)

			rightHandled = true

		elseif (point == "BOTTOMLEFT") then
			if (offsetX == 0 and offsetY == 0) then
				frame:SetPoint(point, relativeTo, relativePoint, 4, 4)
			end
			leftHandled = true
		elseif (point == "BOTTOMRIGHT") then
			if (offsetX == 0 and offsetY == 0) then
				frame:SetPoint(point, relativeTo, relativePoint, -6, 4)
			end
			rightHandled = true
		elseif (point == "BOTTOM") then
			if (offsetY == 0) then
				frame:SetPoint(point, relativeTo, relativePoint, 0, 4)
			end
		end
	end

	-- If this button didn't have a left anchor, add the left border texture
	if (not leftHandled) then
		if (not frame.LeftSeparator) then
			-- Add a Left border
			frame.LeftSeparator = frame:CreateTexture(frame:GetName() and frame:GetName().."_LeftSeparator" or nil, "BORDER")
			frame.LeftSeparator:SetTexture("Interface\\FrameGeneral\\UI-Frame")
			frame.LeftSeparator:SetTexCoord(0.24218750, 0.32812500, 0.63281250, 0.82812500)
			frame.LeftSeparator:SetWidth(11)
			frame.LeftSeparator:SetHeight(25)
			frame.LeftSeparator:SetPoint("TOPRIGHT", frame, "TOPLEFT", 6, 1)
		end
	end

	-- If this button didn't have a right anchor, add the right border texture
	if (not rightHandled) then
		if (not frame.RightSeparator) then
			-- Add a Right border
			frame.RightSeparator = frame:CreateTexture(frame:GetName() and frame:GetName().."_RightSeparator" or nil, "BORDER")
			frame.RightSeparator:SetTexture("Interface\\FrameGeneral\\UI-Frame")
			frame.RightSeparator:SetTexCoord(0.90625000, 0.99218750, 0.00781250, 0.20312500)
			frame.RightSeparator:SetWidth(11)
			frame.RightSeparator:SetHeight(25)
			frame.RightSeparator:SetPoint("TOPLEFT", frame, "TOPRIGHT", -6, 1)
		end
	end
end