if not _G.FriendsFrame then return end

FriendsFrame:SetWidth(338)
WhoFrameColumnHeader1:SetWidth(83)

FriendsFrameBattlenetFrame:ClearAllPoints()
FriendsFrameBattlenetFrame:SetPoint("TOPLEFT", FriendsTabHeader, "TOPLEFT", 109, -26)

FriendsFrameBattlenetFrame.ContactsMenuButton.Icon:Hide()
FriendsFrameBattlenetFrame.ContactsMenuButton:SetNormalTexture("Interface\\FriendsFrame\\broadcast-normal")
FriendsFrameBattlenetFrame.ContactsMenuButton:SetPushedTexture("Interface\\FriendsFrame\\broadcast-press")

ApplyDropDown(FriendsFrameStatusDropdown)
FriendsFrameStatusDropdown:SetWidth(43)
FriendsFrameStatusDropdown:SetPoint("RIGHT", FriendsFrameBattlenetFrame, "LEFT", -5, 0)
FriendsFrameStatusDropdown.Text:ClearAllPoints()
FriendsFrameStatusDropdown.Text:SetPoint("CENTER", -7, -2)

ApplyDropDown(WhoFrameDropdown)
WhoFrameDropdown:SetPoint("TOPLEFT", 0, -2)

FriendsTabHeader.TabSystem:SetPoint("TOPLEFT", 18, -51)

for i = 1, FriendsTabHeader.TabSystem:GetNumChildren() do
	local tab = select(i, FriendsTabHeader.TabSystem:GetChildren())

	ApplyTopTab(tab)
end

hooksecurefunc(FriendsTabHeader.TabSystem, 'Layout', function(self)
	self.tabs[1]:SetWidth(34 + self.tabs[1]:GetFontString():GetStringWidth())
	self.tabs[2]:ClearAllPoints()
	self.tabs[2]:SetPoint("LEFT", self.tabs[1], "RIGHT", 3, 0)
	self.tabs[3]:ClearAllPoints()
	self.tabs[3]:SetPoint("LEFT", self.tabs[2], "RIGHT", 3, 0)
end)