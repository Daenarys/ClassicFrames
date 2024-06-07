if not _G.MerchantFrame then return end

ApplyCloseButton(MerchantFrameCloseButton)

MerchantFrame.PortraitContainer.CircleMask:Hide()

MerchantFramePortrait:SetSize(61, 61)
MerchantFramePortrait:ClearAllPoints()
MerchantFramePortrait:SetPoint("TOPLEFT", -6, 8)

MerchantFrame.TitleContainer:ClearAllPoints()
MerchantFrame.TitleContainer:SetPoint("TOPLEFT", MerchantFrame, "TOPLEFT", 58, 0)
MerchantFrame.TitleContainer:SetPoint("TOPRIGHT", MerchantFrame, "TOPRIGHT", -58, 0)

ApplyTitleBg(MerchantFrame)
ApplyNineSlicePortrait(MerchantFrame)

MerchantFrameBottomLeftBorder:SetSize(256, 61)
MerchantFrameBottomLeftBorder:SetTexture("Interface\\MerchantFrame\\UI-Merchant-BottomBorder")
MerchantFrameBottomLeftBorder:SetTexCoord(0, 1, 0, 0.4765625)

if (MerchantFrameBottomRightBorder == nil) then
	MerchantFrame:CreateTexture("MerchantFrameBottomRightBorder", "OVERLAY")
	MerchantFrameBottomRightBorder:SetSize(76, 61)
	MerchantFrameBottomRightBorder:SetTexture("Interface\\MerchantFrame\\UI-Merchant-BottomBorder")
	MerchantFrameBottomRightBorder:SetTexCoord(0, 0.296875, 0.4765625, 0.953125)
	MerchantFrameBottomRightBorder:SetPoint("LEFT", MerchantFrameBottomLeftBorder, "RIGHT")
end

if (MerchantRepairText == nil) then
	MerchantFrame:CreateFontString("MerchantRepairText", "BORDER", "GameFontHighlightSmall")
	MerchantRepairText:SetText(REPAIR_ITEMS)
end

MerchantFrameTab2:ClearAllPoints()
MerchantFrameTab2:SetPoint("LEFT", MerchantFrameTab1, "RIGHT", -16, 0)

for i = 1, 2 do
	ApplyBottomTab(_G['MerchantFrameTab'..i])

	_G["MerchantFrameTab"..i]:HookScript("OnShow", function(self)
		self:SetWidth(40 + self:GetFontString():GetStringWidth())
	end)
end

ApplyDropDown(MerchantFrame.FilterDropdown)

hooksecurefunc("MerchantFrame_UpdateMerchantInfo", function()
	MerchantBuyBackItemItemButton.UndoFrame:Hide()
	MerchantSellAllJunkButton:Hide()
	MerchantFrameBottomRightBorder:Show()
	MerchantBuyBackItemNameFrame:Show()

	local numBuybackItems = GetNumBuybackItems()
	local buybackName = GetBuybackItemInfo(numBuybackItems)
	if ( buybackName ) then
		MerchantBuyBackItemMoneyFrame:Show()
		
	else
		MerchantBuyBackItemMoneyFrame:Hide()
	end

	MerchantBuyBackItem:SetSize(153, 37)
	MerchantBuyBackItem:ClearAllPoints()
	MerchantBuyBackItem:SetPoint("TOPLEFT", MerchantItem10, "BOTTOMLEFT", 0, -53)
	MerchantBuyBackItemItemButton:SetItemButtonScale(1)
	MerchantBuyBackItemName:SetSize(90, 30)
	MerchantBuyBackItemName:ClearAllPoints()
	MerchantBuyBackItemName:SetPoint("LEFT", MerchantBuyBackItemSlotTexture, "RIGHT", -5, 10)
	MerchantBuyBackItemNameFrame:SetSize(128, 64)

	MerchantRepairItemButton.Icon:SetTexture("Interface\\MerchantFrame\\UI-Merchant-RepairIcons")
	MerchantRepairItemButton.Icon:SetTexCoord(0, 0.28125, 0, 0.5625)
	MerchantRepairItemButton:DisableDrawLayer("BACKGROUND")
	MerchantRepairAllButton.Icon:SetTexture("Interface\\MerchantFrame\\UI-Merchant-RepairIcons")
	MerchantRepairAllButton.Icon:SetTexCoord(0.28125, 0.5625, 0, 0.5625)
	MerchantRepairAllButton:DisableDrawLayer("BACKGROUND")
	MerchantGuildBankRepairButton:SetSize(32, 32)
	MerchantGuildBankRepairButton:ClearAllPoints()
	MerchantGuildBankRepairButton:SetPoint("LEFT", MerchantRepairAllButton, "RIGHT", 4, 0)
	MerchantGuildBankRepairButton:DisableDrawLayer("BACKGROUND")
	MerchantGuildBankRepairButton.Icon:SetTexture("Interface\\MerchantFrame\\UI-Merchant-RepairIcons")
	MerchantGuildBankRepairButton.Icon:SetTexCoord(0.5625, 0.84375, 0, 0.5625)

	if ContainerFrame1MoneyFrame then
		ContainerFrame1MoneyFrame:ClearAllPoints()
		ContainerFrame1MoneyFrame:SetPoint("TOPRIGHT", ContainerFrame1, "TOPRIGHT", -2, -272)
	end
end)

hooksecurefunc("MerchantFrame_UpdateBuybackInfo", function()
	MerchantFrameBottomRightBorder:Hide()
	MerchantRepairText:Hide()
end)

hooksecurefunc("MerchantFrame_UpdateRepairButtons", function()
	if ( CanMerchantRepair() ) then
		if ( CanGuildBankRepair() ) then
			MerchantRepairAllButton:SetWidth(32)
			MerchantRepairAllButton:SetHeight(32)
			MerchantRepairItemButton:SetWidth(32)
			MerchantRepairItemButton:SetHeight(32)
			MerchantRepairItemButton:SetPoint("RIGHT", MerchantRepairAllButton, "LEFT", -4, 0)

			MerchantRepairAllButton:SetPoint("BOTTOMRIGHT", MerchantFrame, "BOTTOMLEFT", 100, 30)
			MerchantRepairText:ClearAllPoints()
			MerchantRepairText:SetPoint("CENTER", MerchantFrame, "BOTTOMLEFT", 80, 68)
		else
			MerchantRepairAllButton:SetWidth(36)
			MerchantRepairAllButton:SetHeight(36)
			MerchantRepairItemButton:SetWidth(36)
			MerchantRepairItemButton:SetHeight(36)
			MerchantRepairItemButton:SetPoint("RIGHT", MerchantRepairAllButton, "LEFT", -2, 0)

			MerchantRepairAllButton:SetPoint("BOTTOMRIGHT", MerchantFrame, "BOTTOMLEFT", 160, 32)
			MerchantRepairText:ClearAllPoints()
			MerchantRepairText:SetPoint("BOTTOMLEFT", MerchantFrame, "BOTTOMLEFT", 14, 45)
		end
		MerchantRepairText:Show()
	else
		MerchantRepairText:Hide()
	end
end)