for i = 1, 4 do
	if not _G["StaticPopup"..i].BG.SetBackdrop then
		Mixin(_G["StaticPopup"..i].BG, BackdropTemplateMixin)
	end
	_G["StaticPopup"..i].BG:SetBackdrop(BACKDROP_DIALOG_32_32)
	_G["StaticPopup"..i].BG.Top:SetAlpha(0)
	_G["StaticPopup"..i].BG.Bottom:SetAlpha(0)
end