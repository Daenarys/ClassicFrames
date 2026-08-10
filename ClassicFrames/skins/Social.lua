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

ApplyScrollBarHybrid(SocialUIFrame.QuickJoinFrame.ScrollBar, true, true)
ApplyScrollBarThumb(SocialUIFrame.QuickJoinFrame.ScrollBar.Track.Thumb)

ApplyScrollBarHybrid(SocialUIFrame.RaidInfoFrame.ScrollBar, true, true)
ApplyScrollBarThumb(SocialUIFrame.RaidInfoFrame.ScrollBar.Track.Thumb)

ApplyDialogBorder(AddFriendFrame.Border)
ApplyDialogBorder(SocialUIFrame.BattleNetBroadcastFrame.Border)
ApplyDialogBorder(SocialUIFrame.RaidInfoFrame.Border)

ApplyDropDown(SocialUIFrame.BattleNetBar.ControlsContainer.OnlineStatusDropdown)
ApplyFilterDropDown(SocialUIFrame.FriendsList.FilterBar.SearchFilterDropdown)
ApplyFilterDropDown(SocialUIFrame.RecentAlliesList.FilterBar.SearchFilterDropdown)