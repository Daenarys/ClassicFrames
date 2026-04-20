if not _G.FriendsFrame then return end

FriendsFrame:SetWidth(338)

ApplyCloseButton(FriendsFrameCloseButton)

FriendsFramePortrait:SetSize(61, 61)
FriendsFramePortrait:ClearAllPoints()
FriendsFramePortrait:SetPoint("TOPLEFT", -6, 8)

FriendsFrame.TitleContainer:ClearAllPoints()
FriendsFrame.TitleContainer:SetPoint("TOPLEFT", FriendsFrame, "TOPLEFT", 58, 0)
FriendsFrame.TitleContainer:SetPoint("TOPRIGHT", FriendsFrame, "TOPRIGHT", -58, 0)

ApplyTitleBg(FriendsFrame)
ApplyNineSlicePortrait(FriendsFrame)

FriendsFrameBattlenetFrame:ClearAllPoints()
FriendsFrameBattlenetFrame:SetPoint("TOPLEFT", FriendsTabHeader, "TOPLEFT", 109, -26)

FriendsFrameBattlenetFrame.ContactsMenuButton.Icon:Hide()
FriendsFrameBattlenetFrame.ContactsMenuButton:SetNormalTexture("Interface\\FriendsFrame\\broadcast-normal")
FriendsFrameBattlenetFrame.ContactsMenuButton:SetPushedTexture("Interface\\FriendsFrame\\broadcast-press")

FriendsFrameTab2:ClearAllPoints()
FriendsFrameTab2:SetPoint("LEFT", FriendsFrameTab1, "RIGHT", -15, 0)
FriendsFrameTab3:ClearAllPoints()
FriendsFrameTab3:SetPoint("LEFT", FriendsFrameTab2, "RIGHT", -15, 0)
FriendsFrameTab4:ClearAllPoints()
FriendsFrameTab4:SetPoint("LEFT", FriendsFrameTab3, "RIGHT", -15, 0)

for i = 1, 4 do
	ApplyBottomTab(_G['FriendsFrameTab'..i])

	_G["FriendsFrameTab"..i]:HookScript("OnShow", function(self)
		if _G["FriendsFrameTab"..i] == FriendsFrameTab1 then
			self:SetWidth(40 + self:GetFontString():GetStringWidth())
		elseif _G["FriendsFrameTab"..i] == FriendsFrameTab2 then
			self:SetWidth(51 + self:GetFontString():GetStringWidth())
		elseif _G["FriendsFrameTab"..i] == FriendsFrameTab3 then
			self:SetWidth(52 + self:GetFontString():GetStringWidth())
		end
	end)
	
	hooksecurefunc("FriendsFrame_UpdateQuickJoinTab", function()
		FriendsFrameTab4:SetWidth(40 + FriendsFrameTab4:GetFontString():GetStringWidth())
	end)
end

FriendsTabHeader.TabSystem:SetPoint("TOPLEFT", 18, -54)

for i = 1, FriendsTabHeader.TabSystem:GetNumChildren() do
	local tab = select(i, FriendsTabHeader.TabSystem:GetChildren())

	ApplyTopTabNew(tab)
end

hooksecurefunc(FriendsTabHeader.TabSystem, 'Layout', function(self)
	self.tabs[1]:SetWidth(31 + self.tabs[1]:GetFontString():GetStringWidth())
	self.tabs[2]:SetWidth(29 + self.tabs[2]:GetFontString():GetStringWidth())
	self.tabs[2]:ClearAllPoints()
	self.tabs[2]:SetPoint("LEFT", self.tabs[1], "RIGHT")
	self.tabs[3]:SetWidth(32 + self.tabs[3]:GetFontString():GetStringWidth())
	self.tabs[3]:ClearAllPoints()
	self.tabs[3]:SetPoint("LEFT", self.tabs[2], "RIGHT")
end)

FriendsListFrame.ScrollBar:ClearAllPoints()
FriendsListFrame.ScrollBar:SetPoint("TOPLEFT", FriendsListFrame.ScrollBox, "TOPRIGHT", 6, 3)
FriendsListFrame.ScrollBar:SetPoint("BOTTOMLEFT", FriendsListFrame.ScrollBox, "BOTTOMRIGHT", 6, -2)

ApplyScrollBarHybrid(FriendsListFrame.ScrollBar, true, true)
ApplyScrollBarThumb(FriendsListFrame.ScrollBar.Track.Thumb)

ApplyCloseButton(FriendsFrame.IgnoreListWindow.CloseButton)

FriendsFrame.IgnoreListWindow.TitleContainer:ClearAllPoints()
FriendsFrame.IgnoreListWindow.TitleContainer:SetPoint("TOPLEFT", FriendsFrame.IgnoreListWindow, "TOPLEFT", 58, 0)
FriendsFrame.IgnoreListWindow.TitleContainer:SetPoint("TOPRIGHT", FriendsFrame.IgnoreListWindow, "TOPRIGHT", -58, 0)

ApplyTitleBg(FriendsFrame.IgnoreListWindow, true)
ApplyNineSliceNoPortrait(FriendsFrame.IgnoreListWindow)

FriendsFrame.IgnoreListWindow.ScrollBar:SetSize(25, 560)
FriendsFrame.IgnoreListWindow.ScrollBar:ClearAllPoints()
FriendsFrame.IgnoreListWindow.ScrollBar:SetPoint("TOPLEFT", FriendsFrame.IgnoreListWindow.ScrollBox, "TOPRIGHT", -2, 2)
FriendsFrame.IgnoreListWindow.ScrollBar:SetPoint("BOTTOMLEFT", FriendsFrame.IgnoreListWindow.ScrollBox, "BOTTOMRIGHT", 2, -2)

ApplyScrollBarArrow(FriendsFrame.IgnoreListWindow.ScrollBar)
ApplyScrollBarTrack(FriendsFrame.IgnoreListWindow.ScrollBar.Track)
ApplyScrollBarThumb(FriendsFrame.IgnoreListWindow.ScrollBar.Track.Thumb)

ApplyDialogBorder(FriendsFrameBattlenetFrame.BroadcastFrame.Border)

RecentAlliesFrame.List.ScrollBar:ClearAllPoints()
RecentAlliesFrame.List.ScrollBar:SetPoint("TOPLEFT", RecentAlliesFrame.List.ScrollBox, "TOPRIGHT", 6, 3)
RecentAlliesFrame.List.ScrollBar:SetPoint("BOTTOMLEFT", RecentAlliesFrame.List.ScrollBox, "BOTTOMRIGHT", 6, -2)

ApplyScrollBarHybrid(RecentAlliesFrame.List.ScrollBar, true, true)
ApplyScrollBarThumb(RecentAlliesFrame.List.ScrollBar.Track.Thumb)

RecruitAFriendFrame.RecruitList.ScrollBar:ClearAllPoints()
RecruitAFriendFrame.RecruitList.ScrollBar:SetPoint("TOPLEFT", RecruitAFriendFrame.RecruitList.ScrollBox, "TOPRIGHT", 6, 3)
RecruitAFriendFrame.RecruitList.ScrollBar:SetPoint("BOTTOMLEFT", RecruitAFriendFrame.RecruitList.ScrollBox, "BOTTOMRIGHT", 6, -3)

ApplyScrollBarHybrid(RecruitAFriendFrame.RecruitList.ScrollBar, true, true)
ApplyScrollBarThumb(RecruitAFriendFrame.RecruitList.ScrollBar.Track.Thumb)

ApplyCloseButton(RecruitAFriendRecruitmentFrame.CloseButton, true)
RecruitAFriendRecruitmentFrame.CloseButton:ClearAllPoints()
RecruitAFriendRecruitmentFrame.CloseButton:SetPoint("TOPRIGHT", -5, -5)

ApplyDialogBorder(RecruitAFriendRecruitmentFrame.Border)

ApplyCloseButton(RecruitAFriendRewardsFrame.CloseButton, true)
RecruitAFriendRewardsFrame.CloseButton:ClearAllPoints()
RecruitAFriendRewardsFrame.CloseButton:SetPoint("TOPRIGHT", -5, -5)

ApplyDialogBorder(RecruitAFriendRewardsFrame.Border)

WhoFrameColumnHeader4Middle:SetWidth(48)

WhoFrame.ScrollBar:ClearAllPoints()
WhoFrame.ScrollBar:SetPoint("TOPLEFT", WhoFrame.ScrollBox, "TOPRIGHT", 6, 3)
WhoFrame.ScrollBar:SetPoint("BOTTOMLEFT", WhoFrame.ScrollBox, "BOTTOMRIGHT", 6, -21)

ApplyScrollBarHybrid(WhoFrame.ScrollBar, true, true)
ApplyScrollBarThumb(WhoFrame.ScrollBar.Track.Thumb)

QuickJoinFrame.ScrollBar:ClearAllPoints()
QuickJoinFrame.ScrollBar:SetPoint("TOPLEFT", QuickJoinFrame.ScrollBox, "TOPRIGHT", 7, 4)
QuickJoinFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuickJoinFrame.ScrollBox, "BOTTOMRIGHT", 7, -3)

ApplyScrollBarHybrid(QuickJoinFrame.ScrollBar, true, true)
ApplyScrollBarThumb(QuickJoinFrame.ScrollBar.Track.Thumb)

ApplyCloseButton(AddFriendFrame.CloseButton, true)
AddFriendFrame.CloseButton:ClearAllPoints()
AddFriendFrame.CloseButton:SetPoint("TOPRIGHT", -5, -5)

ApplyDialogBorder(AddFriendFrame.Border)

RaidInfoFrame.ScrollBar:ClearAllPoints()
RaidInfoFrame.ScrollBar:SetPoint("TOPLEFT", RaidInfoFrame.ScrollBox, "TOPRIGHT", 11, 6)
RaidInfoFrame.ScrollBar:SetPoint("BOTTOMLEFT", RaidInfoFrame.ScrollBox, "BOTTOMRIGHT", 11, -4)

ApplyScrollBarHybrid(RaidInfoFrame.ScrollBar)
ApplyScrollBarThumb(RaidInfoFrame.ScrollBar.Track.Thumb)

ApplyCloseButton(RaidInfoCloseButton, true)
RaidInfoCloseButton:ClearAllPoints()
RaidInfoCloseButton:SetPoint("TOPRIGHT", -2, -3)

if (RaidInfoDetailCorner == nil) then
	RaidInfoFrame:CreateTexture("RaidInfoDetailCorner", "OVERLAY")
	RaidInfoDetailCorner:SetSize(32, 32)
	RaidInfoDetailCorner:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Corner")
	RaidInfoDetailCorner:SetPoint("TOPRIGHT", -6, -7)
end

ApplyDialogBorder(RaidInfoFrame.Border)
ApplyDialogHeader(RaidInfoFrame.Header)

RaidFrame.RoleCount.TankIcon:SetAtlas("groupfinder-icon-role-large-tank")
RaidFrame.RoleCount.HealerIcon:SetAtlas("groupfinder-icon-role-large-heal")
RaidFrame.RoleCount.DamagerIcon:SetAtlas("groupfinder-icon-role-large-dps")

ApplyDropDown(FriendsFrameStatusDropdown)
ApplyDropDown(WhoFrameDropdown)

FriendsFrameStatusDropdown:SetWidth(43)
FriendsFrameStatusDropdown:SetPoint("RIGHT", FriendsFrameBattlenetFrame, "LEFT", -5, 0)
FriendsFrameStatusDropdown.Text:ClearAllPoints()
FriendsFrameStatusDropdown.Text:SetPoint("CENTER", -7, -2)

WhoFrameDropdown:SetPoint("TOPLEFT", 0, -2)