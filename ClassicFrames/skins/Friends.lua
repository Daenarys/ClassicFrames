if not _G.FriendsFrame then return end

ApplyCloseButton(FriendsFrameCloseButton)

FriendsFrame.PortraitContainer.CircleMask:Hide()

FriendsFramePortrait:SetSize(61, 61)
FriendsFramePortrait:ClearAllPoints()
FriendsFramePortrait:SetPoint("TOPLEFT", -6, 8)

FriendsFrame.TitleContainer:ClearAllPoints()
FriendsFrame.TitleContainer:SetPoint("TOPLEFT", FriendsFrame, "TOPLEFT", 58, 0)
FriendsFrame.TitleContainer:SetPoint("TOPRIGHT", FriendsFrame, "TOPRIGHT", -58, 0)

ApplyTitleBg(FriendsFrame)
ApplyNineSlicePortrait(FriendsFrame)

FriendsFrameBg:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-Background-Rock", true, true)

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

for i = 1, 3 do
	ApplyTopTab(_G['FriendsTabHeaderTab'..i])

	_G["FriendsTabHeaderTab"..i]:HookScript("OnShow", function(self)
		if _G["FriendsTabHeaderTab"..i] == FriendsTabHeaderTab1 then
			self:SetWidth(31 + self:GetFontString():GetStringWidth())
		elseif _G["FriendsTabHeaderTab"..i] == FriendsTabHeaderTab2 then
			self:SetWidth(29 + self:GetFontString():GetStringWidth())
			self:ClearAllPoints()
			self:SetPoint("LEFT", FriendsTabHeaderTab1, "RIGHT")
		elseif _G["FriendsTabHeaderTab"..i] == FriendsTabHeaderTab3 then
			self:SetWidth(32 + self:GetFontString():GetStringWidth())
			self:ClearAllPoints()
			self:SetPoint("LEFT", FriendsTabHeaderTab2, "RIGHT")
		end
	end)
end

FriendsListFrame.ScrollBar:SetSize(25, 560)
FriendsListFrame.ScrollBar:ClearAllPoints()
FriendsListFrame.ScrollBar:SetPoint("TOPLEFT", FriendsListFrame.ScrollBox, "TOPRIGHT", -2, 3)
FriendsListFrame.ScrollBar:SetPoint("BOTTOMLEFT", FriendsListFrame.ScrollBox, "BOTTOMRIGHT", 1, -3)

ApplyScrollBarArrow(FriendsListFrame.ScrollBar)
ApplyScrollBarTrack(FriendsListFrame.ScrollBar.Track)
ApplyScrollBarThumb(FriendsListFrame.ScrollBar.Track.Thumb)

IgnoreListFrame.ScrollBar:SetSize(25, 560)
IgnoreListFrame.ScrollBar:ClearAllPoints()
IgnoreListFrame.ScrollBar:SetPoint("TOPLEFT", IgnoreListFrame.ScrollBox, "TOPRIGHT", -2, 3)
IgnoreListFrame.ScrollBar:SetPoint("BOTTOMLEFT", IgnoreListFrame.ScrollBox, "BOTTOMRIGHT", 1, -1)

ApplyScrollBarArrow(IgnoreListFrame.ScrollBar)
ApplyScrollBarTrack(IgnoreListFrame.ScrollBar.Track)
ApplyScrollBarThumb(IgnoreListFrame.ScrollBar.Track.Thumb)

RecruitAFriendFrame.RecruitList.ScrollBar:SetSize(25, 560)
RecruitAFriendFrame.RecruitList.ScrollBar:ClearAllPoints()
RecruitAFriendFrame.RecruitList.ScrollBar:SetPoint("TOPLEFT", RecruitAFriendFrame.RecruitList.ScrollBox, "TOPRIGHT", -2, 3)
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
WhoFrame.ScrollBar:SetPoint("TOPLEFT", WhoFrame.ScrollBox, "TOPRIGHT", -2, 3)
WhoFrame.ScrollBar:SetPoint("BOTTOMLEFT", WhoFrame.ScrollBox, "BOTTOMRIGHT", 1, -18)

ApplyScrollBarArrow(WhoFrame.ScrollBar)
ApplyScrollBarTrack(WhoFrame.ScrollBar.Track)
ApplyScrollBarThumb(WhoFrame.ScrollBar.Track.Thumb)

QuickJoinFrame.ScrollBar:SetSize(25, 560)
QuickJoinFrame.ScrollBar:ClearAllPoints()
QuickJoinFrame.ScrollBar:SetPoint("TOPLEFT", QuickJoinFrame.ScrollBox, "TOPRIGHT", -1, 4)
QuickJoinFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuickJoinFrame.ScrollBox, "BOTTOMRIGHT", 2, -2)

ApplyScrollBarArrow(QuickJoinFrame.ScrollBar)
ApplyScrollBarTrack(QuickJoinFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuickJoinFrame.ScrollBar.Track.Thumb)

ApplyDialogBorder(AddFriendFrame.Border)
ApplyDialogBorder(FriendsFrameBattlenetFrame.BroadcastFrame.Border)

RaidInfoFrame.ScrollBar:SetSize(25, 560)
RaidInfoFrame.ScrollBar:ClearAllPoints()
RaidInfoFrame.ScrollBar:SetPoint("TOPLEFT", RaidInfoFrame.ScrollBox, "TOPRIGHT", 4, 3)
RaidInfoFrame.ScrollBar:SetPoint("BOTTOMLEFT", RaidInfoFrame.ScrollBox, "BOTTOMRIGHT", 7, -2)

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

RaidInfoFrame.Header:Hide()

if not RaidInfoFrameHeader then
	RaidInfoFrame:CreateTexture("RaidInfoFrameHeader", "OVERLAY")
	RaidInfoFrameHeader:SetSize(256, 64)
	RaidInfoFrameHeader:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-DialogBox-Header.png")
	RaidInfoFrameHeader:SetPoint("TOP", 0, 12)
end

if not RaidInfoFrameHeaderText then
	local RaidInfoFrameHeaderText = RaidInfoFrame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	RaidInfoFrameHeaderText:SetText(RAID_INFORMATION)
	RaidInfoFrameHeaderText:SetPoint("TOP", RaidInfoFrameHeader, 0, -14)
end

ApplyDialogBorder(RaidInfoFrame.Border)

if not RaidInfoDetailCorner then
	RaidInfoFrame:CreateTexture("RaidInfoDetailCorner", "OVERLAY")
	RaidInfoDetailCorner:SetSize(32, 32)
	RaidInfoDetailCorner:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Corner")
	RaidInfoDetailCorner:SetPoint("TOPRIGHT", -6, -7)
end

RaidFrame.RoleCount.TankIcon:SetAtlas("groupfinder-icon-role-large-tank")
RaidFrame.RoleCount.HealerIcon:SetAtlas("groupfinder-icon-role-large-heal")
RaidFrame.RoleCount.DamagerIcon:SetAtlas("groupfinder-icon-role-large-dps")