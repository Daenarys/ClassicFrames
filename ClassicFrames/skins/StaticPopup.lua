for i = 1, 4 do
	_G["StaticPopup"..i].BG.Top:SetAtlas("UI-DiamondDialogBox-ClassicBorder")
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

if RPETurnStrafeStyleMixin then
	hooksecurefunc(RPETurnStrafeStyleMixin, "OnLoad", function(self)
		self.BG.Top:SetAtlas("UI-DiamondDialogBox-ClassicBorder")
		self.CloseButton:SetSize(32, 32)
		self.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		self.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		self.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		self.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		self.CloseButton:ClearAllPoints()
		self.CloseButton:SetPoint("TOPRIGHT", -4, -4)
	end)
end