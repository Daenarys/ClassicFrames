if not _G.SocialUIFrame then return end

SocialUIFrame:SetSize(338, 424)

ApplyCloseButton(SocialUIFrameCloseButton)

SocialUIFramePortrait:SetSize(61, 61)
SocialUIFramePortrait:ClearAllPoints()
SocialUIFramePortrait:SetPoint("TOPLEFT", -6, 8)

SocialUIFrame.TitleContainer:ClearAllPoints()
SocialUIFrame.TitleContainer:SetPoint("TOPLEFT", SocialUIFrame, "TOPLEFT", 58, 0)
SocialUIFrame.TitleContainer:SetPoint("TOPRIGHT", SocialUIFrame, "TOPRIGHT", -58, 0)

ApplyTitleBg(SocialUIFrame)
ApplyNineSlicePortrait(SocialUIFrame)

SocialUIFrame.TopTileStreaks:Show()

SocialUIFrame.Bg:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock", true, true)

if (SocialUIFrame.Inset == nil) then
	SocialUIFrame.Inset = CreateFrame("Frame", nil, SocialUIFrame, "InsetFrameTemplate");
	SocialUIFrame.Inset:ClearAllPoints()
	SocialUIFrame.Inset:SetPoint("TOPLEFT", 4, -83)
	SocialUIFrame.Inset:SetPoint("BOTTOMRIGHT", -6, 38)
end

SocialUIFrame.TopFade:SetAlpha(0)
SocialUIFrame.BottomFade:SetAlpha(0)

SocialUIFrame.BattleNetBar:SetWidth(338)
SocialUIFrame.BattleNetBar.Background:SetAlpha(0)

ApplyDropDown(SocialUIFrame.BattleNetBar.ControlsContainer.OnlineStatusDropdown)
SocialUIFrame.BattleNetBar.ControlsContainer.OnlineStatusDropdown:SetWidth(43)
SocialUIFrame.BattleNetBar.ControlsContainer.OnlineStatusDropdown:SetPoint("LEFT", SocialUIFrame.BattleNetBar.ControlsContainer, "LEFT", 61, 3)
SocialUIFrame.BattleNetBar.ControlsContainer.OnlineStatusDropdown.Text:ClearAllPoints()
SocialUIFrame.BattleNetBar.ControlsContainer.OnlineStatusDropdown.Text:SetPoint("CENTER", -7, -2)

SocialUIFrame.BattleNetBar.ControlsContainer.BattleNetMenuButton:SetSize(32, 32)
SocialUIFrame.BattleNetBar.ControlsContainer.BattleNetMenuButton:ClearAllPoints()
SocialUIFrame.BattleNetBar.ControlsContainer.BattleNetMenuButton:SetPoint("RIGHT", SocialUIFrame.BattleNetBar.ControlsContainer, "RIGHT", -5, 2)
SocialUIFrame.BattleNetBar.ControlsContainer.BattleNetMenuButton:SetNormalTexture("Interface\\FriendsFrame\\broadcast-normal")
SocialUIFrame.BattleNetBar.ControlsContainer.BattleNetMenuButton:SetPushedTexture("Interface\\FriendsFrame\\broadcast-press")
SocialUIFrame.BattleNetBar.ControlsContainer.BattleNetMenuButton:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
SocialUIFrame.BattleNetBar.ControlsContainer.BattleNetMenuButton.Icon:Hide()

SocialUIFrame.BattleNetBar.ControlsContainer.PersonalBattleTagDisplay.CopyBattleTagToClipboardButton:SetAlpha(0)
SocialUIFrame.BattleNetBar.ControlsContainer.PersonalBattleTagDisplay.DisplayText:SetFontObject(GameFontNormal)

SocialUIFrame.BattleNetBar.ControlsContainer.BattleNetBackground:ClearAllPoints()
SocialUIFrame.BattleNetBar.ControlsContainer.BattleNetBackground:SetPoint("LEFT", SocialUIFrame.BattleNetBar.ControlsContainer.OnlineStatusDropdown, "LEFT", 48, 0)
SocialUIFrame.BattleNetBar.ControlsContainer.BattleNetBackground:SetPoint("RIGHT", SocialUIFrame.BattleNetBar.ControlsContainer.BattleNetMenuButton, "LEFT", -2, 0)

SocialUIFrame.FriendsList.FilterBar:Hide()
SocialUIFrame.FriendsList.TopDivider:SetAlpha(0)
SocialUIFrame.FriendsList.BottomDivider:SetAlpha(0)

ApplyRedButton(SocialUIFrame.FriendsList.ActionButton)
SocialUIFrame.FriendsList.ActionButton:ClearAllPoints()
SocialUIFrame.FriendsList.ActionButton:SetPoint("BOTTOMLEFT", 4, 4)

SocialUIFrame.FriendsList.ScrollBar:ClearAllPoints()
SocialUIFrame.FriendsList.ScrollBar:SetPoint("TOPLEFT", SocialUIFrame.FriendsList.ScrollBox, "TOPRIGHT", 3, 36)
SocialUIFrame.FriendsList.ScrollBar:SetPoint("BOTTOMLEFT", SocialUIFrame.FriendsList.ScrollBox, "BOTTOMRIGHT", 3, -11)

ApplyScrollBarHybrid(SocialUIFrame.FriendsList.ScrollBar, true, true)
ApplyScrollBarThumb(SocialUIFrame.FriendsList.ScrollBar.Track.Thumb)

SocialUIFrame.FriendRequestsList.TopDivider:SetAlpha(0)
SocialUIFrame.FriendRequestsList.BottomDivider:SetAlpha(0)

ApplyRedButton(SocialUIFrame.FriendRequestsList.ActionButton)
SocialUIFrame.FriendRequestsList.ActionButton:ClearAllPoints()
SocialUIFrame.FriendRequestsList.ActionButton:SetPoint("BOTTOMLEFT", 4, 4)

SocialUIFrame.FriendRequestsList.ScrollBar:ClearAllPoints()
SocialUIFrame.FriendRequestsList.ScrollBar:SetPoint("TOPLEFT", SocialUIFrame.FriendRequestsList.ScrollBox, "TOPRIGHT", 3, -2)
SocialUIFrame.FriendRequestsList.ScrollBar:SetPoint("BOTTOMLEFT", SocialUIFrame.FriendRequestsList.ScrollBox, "BOTTOMRIGHT", 3, -11)

ApplyScrollBarHybrid(SocialUIFrame.FriendRequestsList.ScrollBar, true, true)
ApplyScrollBarThumb(SocialUIFrame.FriendRequestsList.ScrollBar.Track.Thumb)

ApplyRedButton(SocialUIFrame.RaidFrame.ConvertToRaidButton)
SocialUIFrame.RaidFrame.ConvertToRaidButton:SetSize(115, 21)
SocialUIFrame.RaidFrame.ConvertToRaidButton:ClearAllPoints()
SocialUIFrame.RaidFrame.ConvertToRaidButton:SetPoint("BOTTOMRIGHT", -4, 4)

ApplyRedButton(SocialUIFrame.RaidFrame.RaidInfoButton)
SocialUIFrame.RaidFrame.RaidInfoButton:SetSize(90, 21)
SocialUIFrame.RaidFrame.RaidInfoButton:ClearAllPoints()
SocialUIFrame.RaidFrame.RaidInfoButton:SetPoint("TOPRIGHT", SocialUIFrame.RaidFrame, "TOPRIGHT", -8, -20)

ApplyCloseButton(SocialUIFrame.RaidInfoFrame.CloseButton, true)
SocialUIFrame.RaidInfoFrame.CloseButton:ClearAllPoints()
SocialUIFrame.RaidInfoFrame.CloseButton:SetPoint("TOPRIGHT", -2, -3)

if (RaidInfoDetailCorner == nil) then
	SocialUIFrame.RaidInfoFrame:CreateTexture("RaidInfoDetailCorner", "OVERLAY")
	RaidInfoDetailCorner:SetSize(32, 32)
	RaidInfoDetailCorner:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Corner")
	RaidInfoDetailCorner:SetPoint("TOPRIGHT", -6, -7)
end

SocialUIFrame.RaidInfoFrame.ScrollBar:ClearAllPoints()
SocialUIFrame.RaidInfoFrame.ScrollBar:SetPoint("TOPLEFT", SocialUIFrame.RaidInfoFrame.ScrollBox, "TOPRIGHT", 10, 4)
SocialUIFrame.RaidInfoFrame.ScrollBar:SetPoint("BOTTOMLEFT", SocialUIFrame.RaidInfoFrame.ScrollBox, "BOTTOMRIGHT", 10, -3)

ApplyScrollBarHybrid(SocialUIFrame.RaidInfoFrame.ScrollBar)
ApplyScrollBarThumb(SocialUIFrame.RaidInfoFrame.ScrollBar.Track.Thumb)

SocialUIFrame.QuickJoinFrame.TopDivider:SetAlpha(0)
SocialUIFrame.QuickJoinFrame.BottomDivider:SetAlpha(0)

ApplyRedButton(SocialUIFrame.QuickJoinFrame.ActionButton)
SocialUIFrame.QuickJoinFrame.ActionButton:ClearAllPoints()
SocialUIFrame.QuickJoinFrame.ActionButton:SetPoint("BOTTOMRIGHT", -4, 4)

SocialUIFrame.QuickJoinFrame.ScrollBar:ClearAllPoints()
SocialUIFrame.QuickJoinFrame.ScrollBar:SetPoint("TOPLEFT", SocialUIFrame.QuickJoinFrame.ScrollBox, "TOPRIGHT", 3, -2)
SocialUIFrame.QuickJoinFrame.ScrollBar:SetPoint("BOTTOMLEFT", SocialUIFrame.QuickJoinFrame.ScrollBox, "BOTTOMRIGHT", 3, -11)

ApplyScrollBarHybrid(SocialUIFrame.QuickJoinFrame.ScrollBar, true, true)
ApplyScrollBarThumb(SocialUIFrame.QuickJoinFrame.ScrollBar.Track.Thumb)

ApplyDialogBorder(AddFriendFrame.Border)
ApplyDialogBorder(SocialUIFrame.BattleNetBroadcastFrame.Border)
ApplyDialogBorder(SocialUIFrame.RaidInfoFrame.Border)

hooksecurefunc(SocialUIFrame, "RefreshTabs", function(self)
	for tab in self.socialTabPool:EnumerateActive() do
		tab:ClearAllPoints()
		if (tab.tabData.tabName == SOCIAL_UI_FRIENDS_TAB_NAME) then
			tab:SetSize(78, 32)
			tab:SetPoint("BOTTOMLEFT", 5, -30)
		elseif (tab.tabData.tabName == SOCIAL_UI_FRIEND_REQUESTS_TAB_NAME) then
			tab:SetSize(120, 32)
			tab:SetPoint("BOTTOMLEFT", 68, -30)
		elseif (tab.tabData.tabName == SOCIAL_UI_RAID_TAB_NAME) then
			tab:SetSize(78, 32)
			tab:SetPoint("BOTTOMLEFT", 173, -30)
		elseif (tab.tabData.tabName == SOCIAL_UI_QUICK_JOIN_TAB_NAME) then
			tab:SetSize(90, 32)
			tab:SetPoint("BOTTOMLEFT", 236, -30)
		elseif (tab.tabData.tabName == SOCIAL_UI_RECENT_ALLIES_TAB_NAME) then
			tab:SetShown(false)
		end
		ApplySocialTab(tab)
	end
end)