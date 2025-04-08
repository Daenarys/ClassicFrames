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
	frame.TopEdge:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UIFrameDiamondMetal")
	frame.TopEdge:SetTexCoord(0, 0.5, 0.13671875, 0.26171875)

	frame.TopLeftCorner:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UIFrameDiamondMetal")
	frame.TopLeftCorner:SetTexCoord(0.015625, 0.515625, 0.53515625, 0.66015625)

	frame.TopRightCorner:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UIFrameDiamondMetal")
	frame.TopRightCorner:SetTexCoord(0.015625, 0.515625, 0.66796875, 0.79296875)

	frame.BottomEdge:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UIFrameDiamondMetal")
	frame.BottomEdge:SetTexCoord(0, 0.5, 0.00390625, 0.12890625)

	frame.BottomLeftCorner:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UIFrameDiamondMetal")
	frame.BottomLeftCorner:SetTexCoord(0.015625, 0.515625, 0.26953125, 0.39453125)

	frame.BottomRightCorner:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UIFrameDiamondMetal")
	frame.BottomRightCorner:SetTexCoord(0.015625, 0.515625, 0.40234375, 0.52734375)

	frame.LeftEdge:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UIFrameDiamondMetalVertical")
	frame.LeftEdge:SetTexCoord(0.0078125, 0.2578125, 0, 1)

	frame.RightEdge:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UIFrameDiamondMetalVertical")
	frame.RightEdge:SetTexCoord(0.2734375, 0.5234375, 0, 1)
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
	frame.Arrow:SetTexelSnappingBias(0)

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
end