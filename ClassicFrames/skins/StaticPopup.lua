for i = 1, 4 do
	if not _G["StaticPopup"..i].BG.SetBackdrop then
		Mixin(_G["StaticPopup"..i].BG, BackdropTemplateMixin)
	end
	_G["StaticPopup"..i].BG:SetBackdrop(BACKDROP_DIALOG_32_32)
	_G["StaticPopup"..i].BG.Top:SetAlpha(0)
	_G["StaticPopup"..i].BG.Bottom:SetAlpha(0)
	_G["StaticPopup"..i.."EditBox"].NineSlice:SetAlpha(0)

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