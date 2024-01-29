if not _G.BankFrame then return end

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

for i = 1, 2 do
	ApplyBottomTab(_G['BankFrameTab'..i])

	_G["BankFrameTab"..i]:HookScript("OnShow", function(self)
		if _G["BankFrameTab"..i] == BankFrameTab1 then
			self:SetWidth(49 + self:GetFontString():GetStringWidth())
		elseif _G["BankFrameTab"..i] == BankFrameTab2 then
			self:SetWidth(40 + self:GetFontString():GetStringWidth())
		end
	end)
end

hooksecurefunc(BankFrame, "Show", function()
	if _G.ContainerFrame1MoneyFrame then
		_G.ContainerFrame1MoneyFrame:ClearAllPoints()
		_G.ContainerFrame1MoneyFrame:SetPoint("TOPRIGHT", _G.ContainerFrame1, "TOPRIGHT", -2, -272)
	end
end)