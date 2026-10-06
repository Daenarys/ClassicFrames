if not _G.SocialUIFrame then return end

ApplyCloseButton(SocialUIFrameCloseButton)

SocialUIFramePortrait:SetSize(60, 60)
SocialUIFramePortrait:ClearAllPoints()
SocialUIFramePortrait:SetPoint("TOPLEFT", -5, 7)

SocialUIFrame.TitleContainer:ClearAllPoints()
SocialUIFrame.TitleContainer:SetPoint("TOPLEFT", SocialUIFrame, "TOPLEFT", 58, 0)
SocialUIFrame.TitleContainer:SetPoint("TOPRIGHT", SocialUIFrame, "TOPRIGHT", -58, 0)

ApplyTitleBg(SocialUIFrame)
ApplyNineSlicePortrait(SocialUIFrame)

ApplyScrollBarHybrid(SocialUIFrame.FriendsList.ScrollBar, true, true)
ApplyScrollBarThumb(SocialUIFrame.FriendsList.ScrollBar.Track.Thumb)

ApplyScrollBarHybrid(SocialUIFrame.RecentAlliesList.ScrollBar, true, true)
ApplyScrollBarThumb(SocialUIFrame.RecentAlliesList.ScrollBar.Track.Thumb)

ApplyScrollBarHybrid(SocialUIFrame.FriendRequestsList.ScrollBar, true, true)
ApplyScrollBarThumb(SocialUIFrame.FriendRequestsList.ScrollBar.Track.Thumb)

ApplyScrollBarHybrid(SocialUIFrame.RaidInfoFrame.ScrollBar, true, true)
ApplyScrollBarThumb(SocialUIFrame.RaidInfoFrame.ScrollBar.Track.Thumb)

ApplyCloseButton(AddFriendFrame.CloseButton, true)
AddFriendFrame.CloseButton:ClearAllPoints()
AddFriendFrame.CloseButton:SetPoint("TOPRIGHT", -5, -5)

ApplyDialogBorder(AddFriendFrame.Border)
ApplyDialogBorder(SocialUIFrame.BattleNetBroadcastFrame.Border)
ApplyDialogBorder(SocialUIFrame.RaidInfoFrame.Border)

ApplyDropDown(SocialUIFrame.BattleNetBar.ControlsContainer.OnlineStatusDropdown)
ApplyFilterDropDown(SocialUIFrame.FriendsList.FilterBar.SearchFilterDropdown)
ApplyFilterDropDown(SocialUIFrame.RecentAlliesList.FilterBar.SearchFilterDropdown)

hooksecurefunc(SocialUIFrame, "RefreshTabs", function()
	for tab in SocialUIFrame.socialTabPool:EnumerateActive() do
		ApplySideTab(tab)

		tab:ClearAllPoints()
		if (tab.tabData.tabName == SOCIAL_UI_FRIENDS_TAB_NAME) then
			tab:SetPoint("TOPLEFT", SocialUIFrame, "TOPRIGHT", 0, -36)
		elseif (tab.tabData.tabName == SOCIAL_UI_RECENT_ALLIES_TAB_NAME) then
			tab:SetPoint("TOPLEFT", SocialUIFrame, "TOPRIGHT", 0, -88)
		elseif (tab.tabData.tabName == SOCIAL_UI_FRIEND_REQUESTS_TAB_NAME) then
			tab:SetPoint("TOPLEFT", SocialUIFrame, "TOPRIGHT", 0, -140)
		elseif (tab.tabData.tabName == SOCIAL_UI_RAID_TAB_NAME) then
			tab:SetPoint("TOPLEFT", SocialUIFrame, "TOPRIGHT", 0, -192)
		end
	end
end)