local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_PerksProgram" then
		PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar:SetSize(25, 560)
		PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar:ClearAllPoints()
		PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar:SetPoint("TOPLEFT", PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBox, "TOPRIGHT", -6, 4)
		PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar:SetPoint("BOTTOMLEFT", PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBox, "BOTTOMRIGHT", -3, 0)

		if (PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar.BG == nil) then
			PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar.BG = PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar:CreateTexture(nil, "BACKGROUND")
			PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar.BG:SetColorTexture(0, 0, 0, .1)
			PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar.BG:SetAllPoints()
		end

		PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar.Track:SetWidth(18)
		PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar.Track:ClearAllPoints()
		PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar.Track:SetPoint("TOPLEFT", 4, -22)
		PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar.Track:SetPoint("BOTTOMRIGHT", -4, 22)

		PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar.Track.Begin:Hide()
		PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar.Track.End:Hide()
		PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar)
		ApplyScrollBarThumb(PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar.Track.Thumb)

		PerksProgramFrame.ProductsFrame.PerksProgramProductDetailsContainerFrame.SetDetailsScrollBoxContainer.ScrollBar:SetSize(25, 560)

		if (PerksProgramFrame.ProductsFrame.PerksProgramProductDetailsContainerFrame.SetDetailsScrollBoxContainer.ScrollBar.BG == nil) then
			PerksProgramFrame.ProductsFrame.PerksProgramProductDetailsContainerFrame.SetDetailsScrollBoxContainer.ScrollBar.BG = PerksProgramFrame.ProductsFrame.PerksProgramProductDetailsContainerFrame.SetDetailsScrollBoxContainer.ScrollBar:CreateTexture(nil, "BACKGROUND")
			PerksProgramFrame.ProductsFrame.PerksProgramProductDetailsContainerFrame.SetDetailsScrollBoxContainer.ScrollBar.BG:SetColorTexture(0, 0, 0, .1)
			PerksProgramFrame.ProductsFrame.PerksProgramProductDetailsContainerFrame.SetDetailsScrollBoxContainer.ScrollBar.BG:SetAllPoints()
		end

		PerksProgramFrame.ProductsFrame.PerksProgramProductDetailsContainerFrame.SetDetailsScrollBoxContainer.ScrollBar.Track:SetWidth(18)
		PerksProgramFrame.ProductsFrame.PerksProgramProductDetailsContainerFrame.SetDetailsScrollBoxContainer.ScrollBar.Track:ClearAllPoints()
		PerksProgramFrame.ProductsFrame.PerksProgramProductDetailsContainerFrame.SetDetailsScrollBoxContainer.ScrollBar.Track:SetPoint("TOPLEFT", 4, -22)
		PerksProgramFrame.ProductsFrame.PerksProgramProductDetailsContainerFrame.SetDetailsScrollBoxContainer.ScrollBar.Track:SetPoint("BOTTOMRIGHT", -4, 22)

		PerksProgramFrame.ProductsFrame.PerksProgramProductDetailsContainerFrame.SetDetailsScrollBoxContainer.ScrollBar.Track.Begin:Hide()
		PerksProgramFrame.ProductsFrame.PerksProgramProductDetailsContainerFrame.SetDetailsScrollBoxContainer.ScrollBar.Track.End:Hide()
		PerksProgramFrame.ProductsFrame.PerksProgramProductDetailsContainerFrame.SetDetailsScrollBoxContainer.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(PerksProgramFrame.ProductsFrame.PerksProgramProductDetailsContainerFrame.SetDetailsScrollBoxContainer.ScrollBar)
		ApplyScrollBarThumb(PerksProgramFrame.ProductsFrame.PerksProgramProductDetailsContainerFrame.SetDetailsScrollBoxContainer.ScrollBar.Track.Thumb)

		PerksProgramFrame.FooterFrame.RotateButtonContainer.RotateLeftButton.NormalTexture:SetTexture("Interface\\Buttons\\UI-RotationLeft-Button-Up")
		PerksProgramFrame.FooterFrame.RotateButtonContainer.RotateLeftButton.PushedTexture:SetTexture("Interface\\Buttons\\UI-RotationLeft-Button-Down")
		PerksProgramFrame.FooterFrame.RotateButtonContainer.RotateLeftButton.HighlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Round")
		PerksProgramFrame.FooterFrame.RotateButtonContainer.RotateLeftButton.HighlightTexture:SetAlpha(1)
		PerksProgramFrame.FooterFrame.RotateButtonContainer.RotateLeftButton.Icon:Hide()

		PerksProgramFrame.FooterFrame.RotateButtonContainer.RotateRightButton.NormalTexture:SetTexture("Interface\\Buttons\\UI-RotationRight-Button-Up")
		PerksProgramFrame.FooterFrame.RotateButtonContainer.RotateRightButton.PushedTexture:SetTexture("Interface\\Buttons\\UI-RotationRight-Button-Down")
		PerksProgramFrame.FooterFrame.RotateButtonContainer.RotateRightButton.HighlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Round")
		PerksProgramFrame.FooterFrame.RotateButtonContainer.RotateRightButton.HighlightTexture:SetAlpha(1)
		PerksProgramFrame.FooterFrame.RotateButtonContainer.RotateRightButton.Icon:Hide()

		PerksProgramFrame.FooterFrame.TogglePlayerPreview:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
		PerksProgramFrame.FooterFrame.TogglePlayerPreview:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
		PerksProgramFrame.FooterFrame.TogglePlayerPreview:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
		PerksProgramFrame.FooterFrame.TogglePlayerPreview:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
		PerksProgramFrame.FooterFrame.TogglePlayerPreview:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
	end
end)