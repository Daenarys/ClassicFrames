CommunitiesFrame:HookScript("OnUpdate", function(self)
	local displayMode = self:GetDisplayMode();
	if displayMode == COMMUNITIES_FRAME_DISPLAY_MODES.MINIMIZED then
		self.MaximizeMinimizeFrame:ClearAllPoints()
		self.MaximizeMinimizeFrame:SetPoint("RIGHT", CommunitiesFrameCloseButton, "LEFT", 10, 0)

		self.MaximizeMinimizeFrame.MinimizeButton:SetDisabledTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-Panel-SmallerButton-Disabled")

		if not self.ButtonFrameEdge then
			self.ButtonFrameEdge = self.MaximizeMinimizeFrame:CreateTexture(nil, "OVERLAY")
			self.ButtonFrameEdge:SetAtlas("UI-OuterBorderButtonPatch", true)
			self.ButtonFrameEdge:ClearAllPoints()
			self.ButtonFrameEdge:SetPoint("CENTER", self.MaximizeMinimizeFrame, "LEFT", 6, 0)
		end

		CommunitiesFrame.Chat.ScrollBar:SetSize(25, 560)
		CommunitiesFrame.Chat.ScrollBar:ClearAllPoints()
		CommunitiesFrame.Chat.ScrollBar:SetPoint("TOPLEFT", CommunitiesFrame.Chat.MessageFrame, "TOPRIGHT", 5, 5)
		CommunitiesFrame.Chat.ScrollBar:SetPoint("BOTTOMLEFT", CommunitiesFrame.Chat.MessageFrame, "BOTTOMRIGHT", 2, -9)

		ApplyScrollBarArrow(CommunitiesFrame.Chat.ScrollBar)
		ApplyScrollBarTrack(CommunitiesFrame.Chat.ScrollBar.Track)
		ApplyScrollBarThumb(CommunitiesFrame.Chat.ScrollBar.Track.Thumb)
	else
		self.MaximizeMinimizeFrame:ClearAllPoints()
		self.MaximizeMinimizeFrame:SetPoint("RIGHT", CommunitiesFrameCloseButton, "LEFT", 10, 0)

		self.MaximizeMinimizeFrame.MinimizeButton:SetDisabledTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-Panel-SmallerButton-Disabled")

		if not self.ButtonFrameEdge then
			self.ButtonFrameEdge = self.MaximizeMinimizeFrame:CreateTexture(nil, "OVERLAY")
			self.ButtonFrameEdge:SetAtlas("UI-OuterBorderButtonPatch", true)
			self.ButtonFrameEdge:ClearAllPoints()
			self.ButtonFrameEdge:SetPoint("CENTER", self.MaximizeMinimizeFrame, "LEFT", 6, 0)
		end

		CommunitiesFrameCommunitiesList.ScrollBar:SetSize(25, 560)
		CommunitiesFrameCommunitiesList.ScrollBar:ClearAllPoints()
		CommunitiesFrameCommunitiesList.ScrollBar:SetPoint("TOPLEFT", CommunitiesFrameCommunitiesList.ScrollBox, "TOPRIGHT", -2, 0)
		CommunitiesFrameCommunitiesList.ScrollBar:SetPoint("BOTTOMLEFT", CommunitiesFrameCommunitiesList.ScrollBox, "BOTTOMRIGHT", 1, -5)

		if (CommunitiesFrameCommunitiesList.ScrollBar.BG == nil) then
			CommunitiesFrameCommunitiesList.ScrollBar.BG = CommunitiesFrameCommunitiesList.ScrollBar:CreateTexture(nil, "BACKGROUND");
			CommunitiesFrameCommunitiesList.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			CommunitiesFrameCommunitiesList.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(CommunitiesFrameCommunitiesList.ScrollBar)
		ApplyScrollBarTrack(CommunitiesFrameCommunitiesList.ScrollBar.Track)
		ApplyScrollBarThumb(CommunitiesFrameCommunitiesList.ScrollBar.Track.Thumb)

		CommunitiesFrame.Chat.ScrollBar:SetSize(25, 560)
		CommunitiesFrame.Chat.ScrollBar:ClearAllPoints()
		CommunitiesFrame.Chat.ScrollBar:SetPoint("TOPLEFT", CommunitiesFrame.Chat.MessageFrame, "TOPRIGHT", 8, 5)
		CommunitiesFrame.Chat.ScrollBar:SetPoint("BOTTOMLEFT", CommunitiesFrame.Chat.MessageFrame, "BOTTOMRIGHT", 8, -30)

		ApplyScrollBarArrow(CommunitiesFrame.Chat.ScrollBar)
		ApplyScrollBarTrack(CommunitiesFrame.Chat.ScrollBar.Track)
		ApplyScrollBarThumb(CommunitiesFrame.Chat.ScrollBar.Track.Thumb)

		CommunitiesFrame.MemberList.ScrollBar:SetSize(25, 560)
		CommunitiesFrame.MemberList.ScrollBar:ClearAllPoints()
		CommunitiesFrame.MemberList.ScrollBar:SetPoint("TOPLEFT", CommunitiesFrame.MemberList, "TOPRIGHT", -3, 3)
		CommunitiesFrame.MemberList.ScrollBar:SetPoint("BOTTOMLEFT", CommunitiesFrame.MemberList, "BOTTOMRIGHT", 0, -2)

		ApplyScrollBarArrow(CommunitiesFrame.MemberList.ScrollBar)
		ApplyScrollBarTrack(CommunitiesFrame.MemberList.ScrollBar.Track)
		ApplyScrollBarThumb(CommunitiesFrame.MemberList.ScrollBar.Track.Thumb)

		CommunitiesFrame.GuildBenefitsFrame.Rewards.ScrollBar:SetSize(25, 560)
		CommunitiesFrame.GuildBenefitsFrame.Rewards.ScrollBar:ClearAllPoints()
		CommunitiesFrame.GuildBenefitsFrame.Rewards.ScrollBar:SetPoint("TOPLEFT", CommunitiesFrame.GuildBenefitsFrame.Rewards, "TOPRIGHT", -2, 3)
		CommunitiesFrame.GuildBenefitsFrame.Rewards.ScrollBar:SetPoint("BOTTOMLEFT", CommunitiesFrame.GuildBenefitsFrame.Rewards, "BOTTOMRIGHT", 1, -4)

		ApplyScrollBarArrow(CommunitiesFrame.GuildBenefitsFrame.Rewards.ScrollBar)
		ApplyScrollBarTrack(CommunitiesFrame.GuildBenefitsFrame.Rewards.ScrollBar.Track)
		ApplyScrollBarThumb(CommunitiesFrame.GuildBenefitsFrame.Rewards.ScrollBar.Track.Thumb)

		CommunitiesFrame.GuildBenefitsFrame.Perks.ScrollBar:SetSize(25, 560)
		CommunitiesFrame.GuildBenefitsFrame.Perks.ScrollBar:ClearAllPoints()
		CommunitiesFrame.GuildBenefitsFrame.Perks.ScrollBar:SetPoint("TOPLEFT", CommunitiesFrame.GuildBenefitsFrame.Perks, "TOPRIGHT", -8, 3)
		CommunitiesFrame.GuildBenefitsFrame.Perks.ScrollBar:SetPoint("BOTTOMLEFT", CommunitiesFrame.GuildBenefitsFrame.Perks, "BOTTOMRIGHT", -5, -4)

		ApplyScrollBarArrow(CommunitiesFrame.GuildBenefitsFrame.Perks.ScrollBar)
		ApplyScrollBarTrack(CommunitiesFrame.GuildBenefitsFrame.Perks.ScrollBar.Track)
		ApplyScrollBarThumb(CommunitiesFrame.GuildBenefitsFrame.Perks.ScrollBar.Track.Thumb)

		CommunitiesFrame.NotificationSettingsDialog.ScrollFrame.ScrollBar:ClearAllPoints()
		CommunitiesFrame.NotificationSettingsDialog.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", CommunitiesFrame.NotificationSettingsDialog.ScrollFrame, "TOPRIGHT", -11, -5)
		CommunitiesFrame.NotificationSettingsDialog.ScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", CommunitiesFrame.NotificationSettingsDialog.ScrollFrame, "BOTTOMRIGHT", 11, 5)

		CommunitiesFrameGuildDetailsFrameNews.ScrollBar:SetSize(25, 560)
		CommunitiesFrameGuildDetailsFrameNews.ScrollBar:ClearAllPoints()
		CommunitiesFrameGuildDetailsFrameNews.ScrollBar:SetPoint("TOPLEFT", CommunitiesFrameGuildDetailsFrameNews, "TOPRIGHT", -13, 3)
		CommunitiesFrameGuildDetailsFrameNews.ScrollBar:SetPoint("BOTTOMLEFT", CommunitiesFrameGuildDetailsFrameNews, "BOTTOMRIGHT", -10, -4)

		ApplyScrollBarArrow(CommunitiesFrameGuildDetailsFrameNews.ScrollBar)
		ApplyScrollBarTrack(CommunitiesFrameGuildDetailsFrameNews.ScrollBar.Track)
		ApplyScrollBarThumb(CommunitiesFrameGuildDetailsFrameNews.ScrollBar.Track.Thumb)

		ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar:SetSize(25, 560)
		ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar:ClearAllPoints()
		ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar:SetPoint("TOPLEFT", ClubFinderCommunityAndGuildFinderFrame.CommunityCards, "TOPRIGHT", -20, 3)
		ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar:SetPoint("BOTTOMLEFT", ClubFinderCommunityAndGuildFinderFrame.CommunityCards, "BOTTOMRIGHT", -17, -3)

		ApplyScrollBarArrow(ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar)
		ApplyScrollBarTrack(ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar.Track)
		ApplyScrollBarThumb(ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar.Track.Thumb)
	
		ClubFinderGuildFinderFrame.OptionsList.TankRoleFrame.Icon:SetAtlas("UI-Frame-TankIcon", true)
		ClubFinderGuildFinderFrame.OptionsList.HealerRoleFrame.Icon:SetAtlas("UI-Frame-HealerIcon", true)
		ClubFinderGuildFinderFrame.OptionsList.DpsRoleFrame.Icon:SetAtlas("UI-Frame-DpsIcon", true)

		ClubFinderCommunityAndGuildFinderFrame.OptionsList.TankRoleFrame.Icon:SetAtlas("UI-Frame-TankIcon", true)
		ClubFinderCommunityAndGuildFinderFrame.OptionsList.HealerRoleFrame.Icon:SetAtlas("UI-Frame-HealerIcon", true)
		ClubFinderCommunityAndGuildFinderFrame.OptionsList.DpsRoleFrame.Icon:SetAtlas("UI-Frame-DpsIcon", true)

		ApplyDialogBorder(CommunitiesFrame.GuildMemberDetailFrame.Border)
		ApplyDialogBorder(CommunitiesFrame.RecruitmentDialog.BG)
		ApplyDialogBorder(ClubFinderGuildFinderFrame.RequestToJoinFrame.BG)
		ApplyDialogBorder(ClubFinderCommunityAndGuildFinderFrame.RequestToJoinFrame.BG)
		ApplyDialogBorder(CommunitiesFrame.ClubFinderInvitationFrame.WarningDialog.BG)
	end
end)