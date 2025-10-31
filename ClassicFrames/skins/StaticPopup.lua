for i = 1, 4 do
	_G["StaticPopup"..i].BG.Top:SetAlpha(0)
	_G["StaticPopup"..i].BG.Bottom:SetAlpha(0)
	_G["StaticPopup"..i.."EditBox"].NineSlice:SetAlpha(0)

	if (_G["StaticPopup"..i].BG.Bg == nil) then
		_G["StaticPopup"..i].BG.Bg = _G["StaticPopup"..i].BG:CreateTexture(nil, "BACKGROUND")
		_G["StaticPopup"..i].BG.Bg:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Background")
		_G["StaticPopup"..i].BG.Bg:SetPoint("TOPLEFT", _G["StaticPopup"..i].BG, "TOPLEFT", 7, -7)
		_G["StaticPopup"..i].BG.Bg:SetPoint("BOTTOMRIGHT", _G["StaticPopup"..i].BG, "BOTTOMRIGHT", -7, 7)
	end

	if (_G["StaticPopup"..i].BG.TopLeftCorner == nil) then
		_G["StaticPopup"..i].BG.TopLeftCorner = _G["StaticPopup"..i].BG:CreateTexture(nil, "BORDER")
		_G["StaticPopup"..i].BG.TopLeftCorner:SetSize(32, 32)
		_G["StaticPopup"..i].BG.TopLeftCorner:SetPoint("TOPLEFT", _G["StaticPopup"..i].BG, "TOPLEFT")
	end

	if (_G["StaticPopup"..i].BG.TopRightCorner == nil) then
		_G["StaticPopup"..i].BG.TopRightCorner = _G["StaticPopup"..i].BG:CreateTexture(nil, "BORDER")
		_G["StaticPopup"..i].BG.TopRightCorner:SetSize(32, 32)
		_G["StaticPopup"..i].BG.TopRightCorner:SetPoint("TOPRIGHT", _G["StaticPopup"..i].BG, "TOPRIGHT")
	end

	if (_G["StaticPopup"..i].BG.TopEdge == nil) then
		_G["StaticPopup"..i].BG.TopEdge = _G["StaticPopup"..i].BG:CreateTexture(nil, "BORDER")
		_G["StaticPopup"..i].BG.TopEdge:SetHeight(32)
		_G["StaticPopup"..i].BG.TopEdge:SetPoint("TOPLEFT", _G["StaticPopup"..i].BG.TopLeftCorner, "TOPRIGHT")
		_G["StaticPopup"..i].BG.TopEdge:SetPoint("TOPRIGHT", _G["StaticPopup"..i].BG.TopRightCorner, "TOPLEFT")
	end

	if (_G["StaticPopup"..i].BG.BottomLeftCorner == nil) then
		_G["StaticPopup"..i].BG.BottomLeftCorner = _G["StaticPopup"..i].BG:CreateTexture(nil, "BORDER")
		_G["StaticPopup"..i].BG.BottomLeftCorner:SetSize(32, 32)
		_G["StaticPopup"..i].BG.BottomLeftCorner:SetPoint("BOTTOMLEFT", _G["StaticPopup"..i].BG, "BOTTOMLEFT")
	end

	if (_G["StaticPopup"..i].BG.BottomRightCorner == nil) then
		_G["StaticPopup"..i].BG.BottomRightCorner = _G["StaticPopup"..i].BG:CreateTexture(nil, "BORDER")
		_G["StaticPopup"..i].BG.BottomRightCorner:SetSize(32, 32)
		_G["StaticPopup"..i].BG.BottomRightCorner:SetPoint("BOTTOMRIGHT", _G["StaticPopup"..i].BG, "BOTTOMRIGHT")
	end

	if (_G["StaticPopup"..i].BG.BottomEdge == nil) then
		_G["StaticPopup"..i].BG.BottomEdge = _G["StaticPopup"..i].BG:CreateTexture(nil, "BORDER")
		_G["StaticPopup"..i].BG.BottomEdge:SetHeight(32)
		_G["StaticPopup"..i].BG.BottomEdge:SetPoint("BOTTOMLEFT", _G["StaticPopup"..i].BG.BottomLeftCorner, "BOTTOMRIGHT")
		_G["StaticPopup"..i].BG.BottomEdge:SetPoint("BOTTOMRIGHT", _G["StaticPopup"..i].BG.BottomRightCorner, "BOTTOMLEFT")
	end

	if (_G["StaticPopup"..i].BG.LeftEdge == nil) then
		_G["StaticPopup"..i].BG.LeftEdge = _G["StaticPopup"..i].BG:CreateTexture(nil, "BORDER")
		_G["StaticPopup"..i].BG.LeftEdge:SetWidth(32)
		_G["StaticPopup"..i].BG.LeftEdge:SetPoint("TOPLEFT", _G["StaticPopup"..i].BG.TopLeftCorner, "BOTTOMLEFT")
		_G["StaticPopup"..i].BG.LeftEdge:SetPoint("BOTTOMLEFT", _G["StaticPopup"..i].BG.BottomLeftCorner, "TOPLEFT")
	end

	if (_G["StaticPopup"..i].BG.RightEdge == nil) then
		_G["StaticPopup"..i].BG.RightEdge = _G["StaticPopup"..i].BG:CreateTexture(nil, "BORDER")
		_G["StaticPopup"..i].BG.RightEdge:SetWidth(32)
		_G["StaticPopup"..i].BG.RightEdge:SetPoint("TOPRIGHT", _G["StaticPopup"..i].BG.TopRightCorner, "BOTTOMRIGHT")
		_G["StaticPopup"..i].BG.RightEdge:SetPoint("BOTTOMRIGHT", _G["StaticPopup"..i].BG.BottomRightCorner, "TOPRIGHT")
	end

	ApplyDialogBorder(_G["StaticPopup"..i].BG)

	if (_G["StaticPopup"..i.."EditBox"].Left == nil) then
		_G["StaticPopup"..i.."EditBox"].Left = _G["StaticPopup"..i.."EditBox"]:CreateTexture(nil, "BACKGROUND")
		_G["StaticPopup"..i.."EditBox"].Left:SetSize(32, 32)
		_G["StaticPopup"..i.."EditBox"].Left:SetTexture("Interface\\ChatFrame\\UI-ChatInputBorder-Left2")
		_G["StaticPopup"..i.."EditBox"].Left:SetPoint("LEFT", -5, 0)
	end

	if (_G["StaticPopup"..i.."EditBox"].Right == nil) then
		_G["StaticPopup"..i.."EditBox"].Right = _G["StaticPopup"..i.."EditBox"]:CreateTexture(nil, "BACKGROUND")
		_G["StaticPopup"..i.."EditBox"].Right:SetSize(32, 32)
		_G["StaticPopup"..i.."EditBox"].Right:SetTexture("Interface\\ChatFrame\\UI-ChatInputBorder-Right2")
		_G["StaticPopup"..i.."EditBox"].Right:SetPoint("RIGHT", 5, 0)
	end

	if (_G["StaticPopup"..i.."EditBox"].Mid == nil) then
		_G["StaticPopup"..i.."EditBox"].Mid = _G["StaticPopup"..i.."EditBox"]:CreateTexture(nil, "BACKGROUND")
		_G["StaticPopup"..i.."EditBox"].Mid:SetSize(0, 32)
		_G["StaticPopup"..i.."EditBox"].Mid:SetTexture("Interface\\ChatFrame\\UI-ChatInputBorder-Mid2")
		_G["StaticPopup"..i.."EditBox"].Mid:SetPoint("TOPLEFT", _G["StaticPopup"..i.."EditBox"].Left, "TOPRIGHT")
		_G["StaticPopup"..i.."EditBox"].Mid:SetPoint("TOPRIGHT", _G["StaticPopup"..i.."EditBox"].Right, "TOPLEFT")
	end
end