if not _G.CommunitiesFrame then return end

CommunitiesFrame:HookScript("OnUpdate", function(self)
	local displayMode = self:GetDisplayMode()
	if displayMode == COMMUNITIES_FRAME_DISPLAY_MODES.MINIMIZED then
		ApplyCloseButton(CommunitiesFrameCloseButton)

		self.MaximizeMinimizeFrame:SetSize(32, 32)
		self.MaximizeMinimizeFrame:ClearAllPoints()
		self.MaximizeMinimizeFrame:SetPoint("RIGHT", CommunitiesFrameCloseButton, "LEFT", 8.5, 0)
		self.MaximizeMinimizeFrame:SetFrameLevel(2)

		ApplyMaxMinButton(self.MaximizeMinimizeFrame)

		self.TitleContainer:ClearAllPoints()
		self.TitleContainer:SetPoint("TOPLEFT", self, "TOPLEFT", 58, 0)
		self.TitleContainer:SetPoint("TOPRIGHT", self, "TOPRIGHT", -58, 0)

		ApplyTitleBg(self, true)
		ApplyNineSliceNoPortraitMinimizable(self)

		self.Chat.ScrollBar:SetSize(25, 560)
		self.Chat.ScrollBar:ClearAllPoints()
		self.Chat.ScrollBar:SetPoint("TOPLEFT", self.Chat.MessageFrame, "TOPRIGHT", 5, 5)
		self.Chat.ScrollBar:SetPoint("BOTTOMLEFT", self.Chat.MessageFrame, "BOTTOMRIGHT", 2, -9)

		ApplyScrollBarArrow(self.Chat.ScrollBar)
		ApplyScrollBarTrack(self.Chat.ScrollBar.Track)
		ApplyScrollBarThumb(self.Chat.ScrollBar.Track.Thumb)
	else
		ApplyCloseButton(CommunitiesFrameCloseButton)

		self.MaximizeMinimizeFrame:SetSize(32, 32)
		self.MaximizeMinimizeFrame:ClearAllPoints()
		self.MaximizeMinimizeFrame:SetPoint("RIGHT", CommunitiesFrameCloseButton, "LEFT", 8.5, 0)
		self.MaximizeMinimizeFrame:SetFrameLevel(2)

		ApplyMaxMinButton(self.MaximizeMinimizeFrame)

		CommunitiesFramePortrait:SetSize(61, 61)
		CommunitiesFramePortrait:ClearAllPoints()
		CommunitiesFramePortrait:SetPoint("TOPLEFT", -6, 8)

		self.PortraitOverlay.Portrait:SetSize(61, 61)
		self.PortraitOverlay.Portrait:ClearAllPoints()
		self.PortraitOverlay.Portrait:SetPoint("TOPLEFT", -6, 8)

		self.PortraitOverlay.TabardBackground:SetSize(62, 62)
		self.PortraitOverlay.TabardBackground:ClearAllPoints()
		self.PortraitOverlay.TabardBackground:SetPoint("TOPLEFT", -7, 8)

		self.PortraitOverlay.TabardEmblem:ClearAllPoints()
		self.PortraitOverlay.TabardEmblem:SetPoint("CENTER", self.PortraitOverlay, "TOPLEFT", 24, -24)

		self.PortraitOverlay.TabardBorder:SetSize(61, 60)
		self.PortraitOverlay.TabardBorder:ClearAllPoints()
		self.PortraitOverlay.TabardBorder:SetPoint("TOPLEFT", -6, 7)

		self.TitleContainer:ClearAllPoints()
		self.TitleContainer:SetPoint("TOPLEFT", self, "TOPLEFT", 58, 0)
		self.TitleContainer:SetPoint("TOPRIGHT", self, "TOPRIGHT", -58, 0)

		ApplyTitleBg(self)
		ApplyNineSlicePortraitMinimizable(self)

		self.Chat.ScrollBar:SetSize(25, 560)
		self.Chat.ScrollBar:ClearAllPoints()
		self.Chat.ScrollBar:SetPoint("TOPLEFT", self.Chat.MessageFrame, "TOPRIGHT", 8, 5)
		self.Chat.ScrollBar:SetPoint("BOTTOMLEFT", self.Chat.MessageFrame, "BOTTOMRIGHT", 8, -30)

		ApplyScrollBarArrow(self.Chat.ScrollBar)
		ApplyScrollBarTrack(self.Chat.ScrollBar.Track)
		ApplyScrollBarThumb(self.Chat.ScrollBar.Track.Thumb)
	end
end)

CommunitiesFrame.MemberList.ScrollBar:SetSize(25, 560)
CommunitiesFrame.MemberList.ScrollBar:ClearAllPoints()
CommunitiesFrame.MemberList.ScrollBar:SetPoint("TOPLEFT", CommunitiesFrame.MemberList, "TOPRIGHT", -3, 3)
CommunitiesFrame.MemberList.ScrollBar:SetPoint("BOTTOMLEFT", CommunitiesFrame.MemberList, "BOTTOMRIGHT", 0, -2)

ApplyScrollBarArrow(CommunitiesFrame.MemberList.ScrollBar)
ApplyScrollBarTrack(CommunitiesFrame.MemberList.ScrollBar.Track)
ApplyScrollBarThumb(CommunitiesFrame.MemberList.ScrollBar.Track.Thumb)

CommunitiesFrame.NotificationSettingsDialog.ScrollFrame.ScrollBar.Track.Begin:Hide()
CommunitiesFrame.NotificationSettingsDialog.ScrollFrame.ScrollBar.Track.End:Hide()
CommunitiesFrame.NotificationSettingsDialog.ScrollFrame.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(CommunitiesFrame.NotificationSettingsDialog.ScrollFrame.ScrollBar, true)
ApplyScrollBarThumb(CommunitiesFrame.NotificationSettingsDialog.ScrollFrame.ScrollBar.Track.Thumb)

CommunitiesFrame.GuildBenefitsFrame.Rewards.ScrollBar:SetSize(25, 560)
CommunitiesFrame.GuildBenefitsFrame.Rewards.ScrollBar:ClearAllPoints()
CommunitiesFrame.GuildBenefitsFrame.Rewards.ScrollBar:SetPoint("TOPLEFT", CommunitiesFrame.GuildBenefitsFrame.Rewards, "TOPRIGHT", -2, 3)
CommunitiesFrame.GuildBenefitsFrame.Rewards.ScrollBar:SetPoint("BOTTOMLEFT", CommunitiesFrame.GuildBenefitsFrame.Rewards, "BOTTOMRIGHT", 1, -4)

ApplyScrollBarArrow(CommunitiesFrame.GuildBenefitsFrame.Rewards.ScrollBar)
ApplyScrollBarTrack(CommunitiesFrame.GuildBenefitsFrame.Rewards.ScrollBar.Track)
ApplyScrollBarThumb(CommunitiesFrame.GuildBenefitsFrame.Rewards.ScrollBar.Track.Thumb)

CommunitiesFrameCommunitiesList.ScrollBar:ClearAllPoints()
CommunitiesFrameCommunitiesList.ScrollBar:SetPoint("TOPLEFT", CommunitiesFrameCommunitiesList.ScrollBox, "TOPRIGHT", 6, -1)
CommunitiesFrameCommunitiesList.ScrollBar:SetPoint("BOTTOMLEFT", CommunitiesFrameCommunitiesList.ScrollBox, "BOTTOMRIGHT", 6, -4)

ApplyScrollBarHybrid(CommunitiesFrameCommunitiesList.ScrollBar, true)
ApplyScrollBarThumb(CommunitiesFrameCommunitiesList.ScrollBar.Track.Thumb)

CommunitiesFrameGuildDetailsFrameNews.ScrollBar:SetSize(25, 560)
CommunitiesFrameGuildDetailsFrameNews.ScrollBar:ClearAllPoints()
CommunitiesFrameGuildDetailsFrameNews.ScrollBar:SetPoint("TOPLEFT", CommunitiesFrameGuildDetailsFrameNews, "TOPRIGHT", -13, 3)
CommunitiesFrameGuildDetailsFrameNews.ScrollBar:SetPoint("BOTTOMLEFT", CommunitiesFrameGuildDetailsFrameNews, "BOTTOMRIGHT", -10, -4)

ApplyScrollBarArrow(CommunitiesFrameGuildDetailsFrameNews.ScrollBar)
ApplyScrollBarTrack(CommunitiesFrameGuildDetailsFrameNews.ScrollBar.Track)
ApplyScrollBarThumb(CommunitiesFrameGuildDetailsFrameNews.ScrollBar.Track.Thumb)

CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar.Track.Begin:Hide()
CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar.Track.End:Hide()
CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar, true)
ApplyScrollBarThumb(CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar.Track.Thumb)

ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar:ClearAllPoints()
ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar:SetPoint("TOPLEFT", ClubFinderCommunityAndGuildFinderFrame.CommunityCards, "TOPRIGHT", -9, -1)
ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar:SetPoint("BOTTOMLEFT", ClubFinderCommunityAndGuildFinderFrame.CommunityCards, "BOTTOMRIGHT", -9, -4)

ApplyScrollBarHybrid(ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar)
ApplyScrollBarThumb(ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar.Track.Thumb)

CommunitiesGuildTextEditFrame.Container.ScrollFrame.ScrollBar.Track.Begin:Hide()
CommunitiesGuildTextEditFrame.Container.ScrollFrame.ScrollBar.Track.End:Hide()
CommunitiesGuildTextEditFrame.Container.ScrollFrame.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(CommunitiesGuildTextEditFrame.Container.ScrollFrame.ScrollBar, true)
ApplyScrollBarThumb(CommunitiesGuildTextEditFrame.Container.ScrollFrame.ScrollBar.Track.Thumb)

ClubFinderGuildFinderFrame.OptionsList.TankRoleFrame.Icon:SetAtlas("UI-Frame-TankIcon", true)
ClubFinderGuildFinderFrame.OptionsList.HealerRoleFrame.Icon:SetAtlas("UI-Frame-HealerIcon", true)
ClubFinderGuildFinderFrame.OptionsList.DpsRoleFrame.Icon:SetAtlas("UI-Frame-DpsIcon", true)

ClubFinderCommunityAndGuildFinderFrame.OptionsList.TankRoleFrame.Icon:SetAtlas("UI-Frame-TankIcon", true)
ClubFinderCommunityAndGuildFinderFrame.OptionsList.HealerRoleFrame.Icon:SetAtlas("UI-Frame-HealerIcon", true)
ClubFinderCommunityAndGuildFinderFrame.OptionsList.DpsRoleFrame.Icon:SetAtlas("UI-Frame-DpsIcon", true)

ApplyCloseButton(CommunitiesFrame.GuildMemberDetailFrame.CloseButton, true)
ApplyCloseButton(CommunitiesGuildLogFrameCloseButton, true)
ApplyCloseButton(CommunitiesGuildNewsFiltersFrame.CloseButton, true)
ApplyCloseButton(CommunitiesGuildTextEditFrameCloseButton, true)
ApplyCloseButton(GuildControlUICloseButton, true)

ApplyDialogBorder(CommunitiesFrame.GuildMemberDetailFrame.Border)
ApplyDialogBorder(CommunitiesFrame.RecruitmentDialog.BG)
ApplyDialogBorder(CommunitiesFrame.ClubFinderInvitationFrame.RequestToJoinFrame.BG)
ApplyDialogBorder(CommunitiesFrame.ClubFinderInvitationFrame.WarningDialog.BG)
ApplyDialogBorder(ClubFinderGuildFinderFrame.RequestToJoinFrame.BG)
ApplyDialogBorder(ClubFinderCommunityAndGuildFinderFrame.RequestToJoinFrame.BG)

ApplyDropDown(ClubFinderGuildFinderFrame.OptionsList.ClubFilterDropdown)
ApplyDropDown(ClubFinderGuildFinderFrame.OptionsList.ClubSizeDropdown)
ApplyDropDown(ClubFinderCommunityAndGuildFinderFrame.OptionsList.ClubFilterDropdown)
ApplyDropDown(ClubFinderCommunityAndGuildFinderFrame.OptionsList.SortByDropdown)
ApplyDropDown(CommunitiesFrame.NotificationSettingsDialog.CommunitiesListDropdown)
ApplyDropDown(CommunitiesFrame.CommunitiesListDropdown)
ApplyDropDown(CommunitiesFrame.GuildMemberListDropdown)
ApplyDropDown(CommunitiesFrame.StreamDropdown)
ApplyDropDown(CommunitiesFrame.GuildMemberDetailFrame.RankDropdown)
ApplyDropDown(CommunitiesFrame.RecruitmentDialog.ClubFocusDropdown)
ApplyDropDown(CommunitiesFrame.RecruitmentDialog.LookingForDropdown)
ApplyDropDown(CommunitiesFrame.RecruitmentDialog.LanguageDropdown)
ApplyDropDown(GuildControlUINavigationDropdown)

ClubFinderGuildFinderFrame.OptionsList.ClubSizeDropdown.Text:SetJustifyH("RIGHT")
ClubFinderCommunityAndGuildFinderFrame.OptionsList.SortByDropdown.Text:SetJustifyH("RIGHT")