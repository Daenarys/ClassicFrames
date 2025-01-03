if _G.BankFrame then
	ApplyCloseButton(BankFrameCloseButton)

	BankFrame.PortraitContainer.CircleMask:Hide()

	BankFramePortrait:SetSize(61, 61)
	BankFramePortrait:ClearAllPoints()
	BankFramePortrait:SetPoint("TOPLEFT", -6, 8)

	BankFrame.TitleContainer:ClearAllPoints()
	BankFrame.TitleContainer:SetPoint("TOPLEFT", BankFrame, "TOPLEFT", 58, 0)
	BankFrame.TitleContainer:SetPoint("TOPRIGHT", BankFrame, "TOPRIGHT", -58, 0)

	ApplyTitleBg(BankFrame)
	ApplyNineSlicePortrait(BankFrame)

	BankFrameTab2:ClearAllPoints()
	BankFrameTab2:SetPoint("LEFT", BankFrameTab1, "RIGHT", -15, 0)

	BankFrameTab3:ClearAllPoints()
	BankFrameTab3:SetPoint("LEFT", BankFrameTab2, "RIGHT", -15, 0)

	for i = 1, 3 do
		ApplyBottomTab(_G['BankFrameTab'..i])

		_G["BankFrameTab"..i]:HookScript("OnShow", function(self)
			if _G["BankFrameTab"..i] == BankFrameTab1 then
				self:SetWidth(49 + self:GetFontString():GetStringWidth())
			else
				self:SetWidth(40 + self:GetFontString():GetStringWidth())
			end
		end)
	end

	ApplySearchBox(BankItemSearchBox)

	hooksecurefunc(BankFrame, "Show", function()
		if ContainerFrame1MoneyFrame then
			ContainerFrame1MoneyFrame:ClearAllPoints()
			ContainerFrame1MoneyFrame:SetPoint("TOPRIGHT", ContainerFrame1, "TOPRIGHT", -2, -272)
		end
	end)
end

if _G.AccountBankPanel then
	AccountBankPanel.TabSettingsMenu.IconSelector.ScrollBar:SetSize(25, 560)
	AccountBankPanel.TabSettingsMenu.IconSelector.ScrollBar:ClearAllPoints()
	AccountBankPanel.TabSettingsMenu.IconSelector.ScrollBar:SetPoint("TOPRIGHT", -3, 30)
	AccountBankPanel.TabSettingsMenu.IconSelector.ScrollBar:SetPoint("BOTTOMRIGHT", -3, -2)

	ApplyScrollBarArrow(AccountBankPanel.TabSettingsMenu.IconSelector.ScrollBar)
	ApplyScrollBarTrack(AccountBankPanel.TabSettingsMenu.IconSelector.ScrollBar.Track)
	ApplyScrollBarThumb(AccountBankPanel.TabSettingsMenu.IconSelector.ScrollBar.Track.Thumb)

	ApplyDropDown(AccountBankPanel.TabSettingsMenu.BorderBox.IconTypeDropdown)
	ApplyDropDown(AccountBankPanel.TabSettingsMenu.DepositSettingsMenu.ExpansionFilterDropdown)
end