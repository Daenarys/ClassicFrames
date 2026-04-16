if not _G.MerchantFrame then return end

ApplyCloseButton(MerchantFrameCloseButton)

MerchantFramePortrait:SetSize(61, 61)
MerchantFramePortrait:ClearAllPoints()
MerchantFramePortrait:SetPoint("TOPLEFT", -6, 8)

MerchantFrame.TitleContainer:ClearAllPoints()
MerchantFrame.TitleContainer:SetPoint("TOPLEFT", MerchantFrame, "TOPLEFT", 58, 0)
MerchantFrame.TitleContainer:SetPoint("TOPRIGHT", MerchantFrame, "TOPRIGHT", -58, 0)

ApplyTitleBg(MerchantFrame)
ApplyNineSlicePortrait(MerchantFrame)

MerchantFrameTab2:ClearAllPoints()
MerchantFrameTab2:SetPoint("LEFT", MerchantFrameTab1, "RIGHT", -16, 0)

for i = 1, 2 do
	ApplyBottomTab(_G['MerchantFrameTab'..i])

	_G["MerchantFrameTab"..i]:HookScript("OnShow", function(self)
		self:SetWidth(40 + self:GetFontString():GetStringWidth())
	end)
end

ApplyDropDown(MerchantFrame.FilterDropdown)