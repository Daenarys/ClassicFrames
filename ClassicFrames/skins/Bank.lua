if not _G.BankFrame then return end

ApplyCloseButton(BankFrameCloseButton)

BankFramePortrait:SetSize(61, 61)
BankFramePortrait:ClearAllPoints()
BankFramePortrait:SetPoint("TOPLEFT", -6, 8)

BankFrame.TitleContainer:ClearAllPoints()
BankFrame.TitleContainer:SetPoint("TOPLEFT", BankFrame, "TOPLEFT", 58, 0)
BankFrame.TitleContainer:SetPoint("TOPRIGHT", BankFrame, "TOPRIGHT", -58, 0)

ApplyTitleBg(BankFrame)
ApplyNineSlicePortrait(BankFrame)

for i = 1, BankFrame.TabSystem:GetNumChildren() do
	local tab = select(i, BankFrame.TabSystem:GetChildren())

	ApplyBottomTab(tab)
end

hooksecurefunc(BankFrame.TabSystem, 'Layout', function(self)
	self.tabs[1]:SetWidth(49 + self.tabs[1]:GetFontString():GetStringWidth())
	self.tabs[1]:ClearAllPoints()
	self.tabs[1]:SetPoint("TOPLEFT", BankFrame, "BOTTOMLEFT", 11, 2)
	self.tabs[2]:SetWidth(40 + self.tabs[2]:GetFontString():GetStringWidth())
	self.tabs[2]:ClearAllPoints()
	self.tabs[2]:SetPoint("LEFT", self.tabs[1], "RIGHT", -15, 0)
end)

BankPanel.TabSettingsMenu.IconSelector.ScrollBar:SetSize(25, 560)
BankPanel.TabSettingsMenu.IconSelector.ScrollBar:ClearAllPoints()
BankPanel.TabSettingsMenu.IconSelector.ScrollBar:SetPoint("TOPRIGHT", -3, 30)
BankPanel.TabSettingsMenu.IconSelector.ScrollBar:SetPoint("BOTTOMRIGHT", -3, -2)

ApplyScrollBarArrow(BankPanel.TabSettingsMenu.IconSelector.ScrollBar)
ApplyScrollBarTrack(BankPanel.TabSettingsMenu.IconSelector.ScrollBar.Track)
ApplyScrollBarThumb(BankPanel.TabSettingsMenu.IconSelector.ScrollBar.Track.Thumb)

ApplyDropDown(BankPanel.TabSettingsMenu.BorderBox.IconTypeDropdown)
ApplyDropDown(BankPanel.TabSettingsMenu.DepositSettingsMenu.ExpansionFilterDropdown)