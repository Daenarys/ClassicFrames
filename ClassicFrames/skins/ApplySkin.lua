local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function(self, event, name)
	if event == "PLAYER_LOGIN" then
		if not ( GetCVarBool("useUiScale") ) then
			SetCVar("useUiScale", 1)
			SetCVar("uiScale", 0.7111111111)
		end
	end
end)

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
	frame.LeftEdge:ClearAllPoints()
	frame.LeftEdge:SetPoint("TOPLEFT", frame.TopLeftCorner, "BOTTOMLEFT")
	frame.LeftEdge:SetPoint("BOTTOMLEFT", frame.BottomLeftCorner, "TOPLEFT")

	frame.RightEdge:SetSize(32, 32)
	frame.RightEdge:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UIFrameDiamondMetalVertical", false, true)
	frame.RightEdge:SetTexCoord(0.2734375, 0.5234375, 0, 1)
	frame.RightEdge:ClearAllPoints()
	frame.RightEdge:SetPoint("TOPRIGHT", frame.TopRightCorner, "BOTTOMRIGHT")
	frame.RightEdge:SetPoint("BOTTOMRIGHT", frame.BottomRightCorner, "TOPRIGHT")
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