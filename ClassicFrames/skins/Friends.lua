if not _G.FriendsFrame then return end

ApplyCloseButton(FriendsFrameCloseButton)

FriendsFrame.PortraitContainer.CircleMask:Hide()

FriendsFramePortrait:SetSize(61, 61)
FriendsFramePortrait:ClearAllPoints()
FriendsFramePortrait:SetPoint("TOPLEFT", -6, 8)

FriendsFrame.TitleContainer:ClearAllPoints()
FriendsFrame.TitleContainer:SetPoint("TOPLEFT", FriendsFrame, "TOPLEFT", 58, 0)
FriendsFrame.TitleContainer:SetPoint("TOPRIGHT", FriendsFrame, "TOPRIGHT", -24, 0)

ApplyTitleBg(FriendsFrame)
ApplyNineSlicePortrait(FriendsFrame)

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

FriendsListFrame.ScrollBar:SetSize(25, 560)
FriendsListFrame.ScrollBar:ClearAllPoints()
FriendsListFrame.ScrollBar:SetPoint("TOPLEFT", FriendsListFrame.ScrollBox, "TOPRIGHT", -2, 1)
FriendsListFrame.ScrollBar:SetPoint("BOTTOMLEFT", FriendsListFrame.ScrollBox, "BOTTOMRIGHT", 1, -3)

ApplyScrollBarArrow(FriendsListFrame.ScrollBar)
ApplyScrollBarTrack(FriendsListFrame.ScrollBar.Track)
ApplyScrollBarThumb(FriendsListFrame.ScrollBar.Track.Thumb)

ApplyCloseButton(FriendsFrame.IgnoreListWindow.CloseButton)

FriendsFrame.IgnoreListWindow.TitleContainer:ClearAllPoints()
FriendsFrame.IgnoreListWindow.TitleContainer:SetPoint("TOPLEFT", FriendsFrame.IgnoreListWindow, "TOPLEFT", 58, 0)
FriendsFrame.IgnoreListWindow.TitleContainer:SetPoint("TOPRIGHT", FriendsFrame.IgnoreListWindow, "TOPRIGHT", -58, 0)

ApplyTitleBg(FriendsFrame.IgnoreListWindow)
ApplyNineSliceNoPortrait(FriendsFrame.IgnoreListWindow)

FriendsFrame.IgnoreListWindow.ScrollBar:SetSize(25, 560)
FriendsFrame.IgnoreListWindow.ScrollBar:ClearAllPoints()
FriendsFrame.IgnoreListWindow.ScrollBar:SetPoint("TOPLEFT", FriendsFrame.IgnoreListWindow.ScrollBox, "TOPRIGHT", -2, 1)
FriendsFrame.IgnoreListWindow.ScrollBar:SetPoint("BOTTOMLEFT", FriendsFrame.IgnoreListWindow.ScrollBox, "BOTTOMRIGHT", 1, -1)

ApplyScrollBarArrow(FriendsFrame.IgnoreListWindow.ScrollBar)
ApplyScrollBarTrack(FriendsFrame.IgnoreListWindow.ScrollBar.Track)
ApplyScrollBarThumb(FriendsFrame.IgnoreListWindow.ScrollBar.Track.Thumb)

RecentAlliesFrame.List.ScrollBar:SetSize(25, 560)
RecentAlliesFrame.List.ScrollBar:ClearAllPoints()
RecentAlliesFrame.List.ScrollBar:SetPoint("TOPLEFT", RecentAlliesFrame.List.ScrollBox, "TOPRIGHT", -2, 1)
RecentAlliesFrame.List.ScrollBar:SetPoint("BOTTOMLEFT", RecentAlliesFrame.List.ScrollBox, "BOTTOMRIGHT", 1, -3)

ApplyScrollBarArrow(RecentAlliesFrame.List.ScrollBar)
ApplyScrollBarTrack(RecentAlliesFrame.List.ScrollBar.Track)
ApplyScrollBarThumb(RecentAlliesFrame.List.ScrollBar.Track.Thumb)

RecruitAFriendFrame.RecruitList.ScrollBar:SetSize(25, 560)
RecruitAFriendFrame.RecruitList.ScrollBar:ClearAllPoints()
RecruitAFriendFrame.RecruitList.ScrollBar:SetPoint("TOPLEFT", RecruitAFriendFrame.RecruitList.ScrollBox, "TOPRIGHT", -2, 1)
RecruitAFriendFrame.RecruitList.ScrollBar:SetPoint("BOTTOMLEFT", RecruitAFriendFrame.RecruitList.ScrollBox, "BOTTOMRIGHT", 1, -3)

ApplyScrollBarArrow(RecruitAFriendFrame.RecruitList.ScrollBar)
ApplyScrollBarTrack(RecruitAFriendFrame.RecruitList.ScrollBar.Track)
ApplyScrollBarThumb(RecruitAFriendFrame.RecruitList.ScrollBar.Track.Thumb)

RecruitAFriendRecruitmentFrame.CloseButton:SetSize(32, 32)
RecruitAFriendRecruitmentFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
RecruitAFriendRecruitmentFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
RecruitAFriendRecruitmentFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
RecruitAFriendRecruitmentFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
RecruitAFriendRecruitmentFrame.CloseButton:ClearAllPoints()
RecruitAFriendRecruitmentFrame.CloseButton:SetPoint("TOPRIGHT", -5, -5)

ApplyDialogBorder(RecruitAFriendRecruitmentFrame.Border)

RecruitAFriendRewardsFrame.CloseButton:SetSize(32, 32)
RecruitAFriendRewardsFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
RecruitAFriendRewardsFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
RecruitAFriendRewardsFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
RecruitAFriendRewardsFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
RecruitAFriendRewardsFrame.CloseButton:ClearAllPoints()
RecruitAFriendRewardsFrame.CloseButton:SetPoint("TOPRIGHT", -5, -5)

ApplyDialogBorder(RecruitAFriendRewardsFrame.Border)

WhoFrame.ScrollBar:SetSize(25, 560)
WhoFrame.ScrollBar:ClearAllPoints()
WhoFrame.ScrollBar:SetPoint("TOPLEFT", WhoFrame.ScrollBox, "TOPRIGHT", -2, 1)
WhoFrame.ScrollBar:SetPoint("BOTTOMLEFT", WhoFrame.ScrollBox, "BOTTOMRIGHT", 1, -18)

ApplyScrollBarArrow(WhoFrame.ScrollBar)
ApplyScrollBarTrack(WhoFrame.ScrollBar.Track)
ApplyScrollBarThumb(WhoFrame.ScrollBar.Track.Thumb)

QuickJoinFrame.ScrollBar:SetSize(25, 560)
QuickJoinFrame.ScrollBar:ClearAllPoints()
QuickJoinFrame.ScrollBar:SetPoint("TOPLEFT", QuickJoinFrame.ScrollBox, "TOPRIGHT", -1, 2)
QuickJoinFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuickJoinFrame.ScrollBox, "BOTTOMRIGHT", -1, -2)

ApplyScrollBarArrow(QuickJoinFrame.ScrollBar)
ApplyScrollBarTrack(QuickJoinFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuickJoinFrame.ScrollBar.Track.Thumb)

AddFriendFrame.CloseButton:SetSize(32, 32)
AddFriendFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
AddFriendFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
AddFriendFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
AddFriendFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
AddFriendFrame.CloseButton:ClearAllPoints()
AddFriendFrame.CloseButton:SetPoint("TOPRIGHT", -5, -5)

ApplyDialogBorder(AddFriendFrame.Border)
ApplyDialogBorder(FriendsFrameBattlenetFrame.BroadcastFrame.Border)

RaidInfoFrame.ScrollBar:SetSize(25, 560)
RaidInfoFrame.ScrollBar:ClearAllPoints()
RaidInfoFrame.ScrollBar:SetPoint("TOPLEFT", RaidInfoFrame.ScrollBox, "TOPRIGHT", 5, 3)
RaidInfoFrame.ScrollBar:SetPoint("BOTTOMLEFT", RaidInfoFrame.ScrollBox, "BOTTOMRIGHT", 0, -1)

ApplyScrollBarArrow(RaidInfoFrame.ScrollBar)
ApplyScrollBarTrack(RaidInfoFrame.ScrollBar.Track)
ApplyScrollBarThumb(RaidInfoFrame.ScrollBar.Track.Thumb)

RaidInfoCloseButton:SetSize(32, 32)
RaidInfoCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
RaidInfoCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
RaidInfoCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
RaidInfoCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
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

ApplySearchBox(RecruitAFriendRecruitmentFrame.EditBox)
ApplyDropDown(FriendsFrameStatusDropdown)
ApplyDropDown(WhoFrameDropdown)