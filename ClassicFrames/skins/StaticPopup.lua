for i = 1, STATICPOPUP_NUMDIALOGS do
	ApplyDialogBorder(_G["StaticPopup"..i].Border)

	if _G["StaticPopup"..i.."MoneyInputFrameGold"] then
		_G["StaticPopup"..i.."MoneyInputFrameGold"].texture:SetTexture("Interface\\MoneyFrame\\UI-MoneyIcons")
		_G["StaticPopup"..i.."MoneyInputFrameGold"].texture:SetTexCoord(0, 0.25, 0, 1)
	end
	if _G["StaticPopup"..i.."MoneyInputFrameSilver"] then
		_G["StaticPopup"..i.."MoneyInputFrameSilver"].texture:SetTexture("Interface\\MoneyFrame\\UI-MoneyIcons")
		_G["StaticPopup"..i.."MoneyInputFrameSilver"].texture:SetTexCoord(0.25, 0.5, 0, 1)
	end
	if _G["StaticPopup"..i.."MoneyInputFrameCopper"] then
		_G["StaticPopup"..i.."MoneyInputFrameCopper"].texture:SetTexture("Interface\\MoneyFrame\\UI-MoneyIcons")
		_G["StaticPopup"..i.."MoneyInputFrameCopper"].texture:SetTexCoord(0.5, 0.75, 0, 1)
	end
end