for i = 1, 4 do
	_G["StaticPopup"..i].BG:SetAlpha(0)

	_G["StaticPopup"..i].Border = CreateFrame("Frame", nil, _G["StaticPopup"..i], "DialogBorderDarkTemplate")
	ApplyDialogBorder(_G["StaticPopup"..i].Border)
end