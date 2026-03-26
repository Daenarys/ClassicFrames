if not _G.CommunitiesFrame then return end

CommunitiesFrame:HookScript("OnUpdate", function(self)
	local displayMode = self:GetDisplayMode()
	if displayMode == COMMUNITIES_FRAME_DISPLAY_MODES.MINIMIZED then
		ApplyCloseButton(CommunitiesFrameCloseButton)

		self.TitleContainer:ClearAllPoints()
		self.TitleContainer:SetPoint("TOPLEFT", self, "TOPLEFT", 58, 0)
		self.TitleContainer:SetPoint("TOPRIGHT", self, "TOPRIGHT", -58, 0)

		self.MaximizeMinimizeFrame:SetSize(32, 32)
		self.MaximizeMinimizeFrame:ClearAllPoints()
		self.MaximizeMinimizeFrame:SetPoint("RIGHT", CommunitiesFrameCloseButton, "LEFT", 10, 0)

		self.MaximizeMinimizeFrame.MaximizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Up")
		self.MaximizeMinimizeFrame.MaximizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Down")
		self.MaximizeMinimizeFrame.MaximizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Disabled")
		self.MaximizeMinimizeFrame.MaximizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

		self.MaximizeMinimizeFrame.MinimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Up")
		self.MaximizeMinimizeFrame.MinimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Down")
		self.MaximizeMinimizeFrame.MinimizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Disabled")
		self.MaximizeMinimizeFrame.MinimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

		if (self.ButtonFrameEdge == nil) then
			self.ButtonFrameEdge = self.MaximizeMinimizeFrame:CreateTexture(nil, "OVERLAY")
			self.ButtonFrameEdge:SetAtlas("UI-OuterBorderButtonPatch", true)
			self.ButtonFrameEdge:ClearAllPoints()
			self.ButtonFrameEdge:SetPoint("CENTER", self.MaximizeMinimizeFrame, "LEFT", 6, 0)
		end

		ApplyTitleBgNoPortrait(self)
		ApplyNineSliceNoPortrait(self)

		ApplyScrollBarArrow(self.Chat.ScrollBar)
		ApplyScrollBarTrack(self.Chat.ScrollBar.Track)
		ApplyScrollBarThumb(self.Chat.ScrollBar.Track.Thumb)
	else
		ApplyCloseButton(CommunitiesFrameCloseButton)

		CommunitiesGuildLogFrameCloseButton:SetSize(32, 32)
		CommunitiesGuildLogFrameCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		CommunitiesGuildLogFrameCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		CommunitiesGuildLogFrameCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		CommunitiesGuildLogFrameCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		CommunitiesGuildLogFrameCloseButton:ClearAllPoints()
		CommunitiesGuildLogFrameCloseButton:SetPoint("TOPRIGHT", -2, -2)

		GuildControlUICloseButton:SetSize(32, 32)
		GuildControlUICloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		GuildControlUICloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		GuildControlUICloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		GuildControlUICloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		GuildControlUICloseButton:ClearAllPoints()
		GuildControlUICloseButton:SetPoint("TOPRIGHT", -2, -2)

		self.MaximizeMinimizeFrame:SetSize(32, 32)
		self.MaximizeMinimizeFrame:ClearAllPoints()
		self.MaximizeMinimizeFrame:SetPoint("RIGHT", CommunitiesFrameCloseButton, "LEFT", 10, 0)

		self.MaximizeMinimizeFrame.MaximizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Up")
		self.MaximizeMinimizeFrame.MaximizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Down")
		self.MaximizeMinimizeFrame.MaximizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Disabled")
		self.MaximizeMinimizeFrame.MaximizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

		self.MaximizeMinimizeFrame.MinimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Up")
		self.MaximizeMinimizeFrame.MinimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Down")
		self.MaximizeMinimizeFrame.MinimizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Disabled")
		self.MaximizeMinimizeFrame.MinimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

		if (self.ButtonFrameEdge == nil) then
			self.ButtonFrameEdge = self.MaximizeMinimizeFrame:CreateTexture(nil, "OVERLAY")
			self.ButtonFrameEdge:SetAtlas("UI-OuterBorderButtonPatch", true)
			self.ButtonFrameEdge:ClearAllPoints()
			self.ButtonFrameEdge:SetPoint("CENTER", self.MaximizeMinimizeFrame, "LEFT", 6, 0)
		end

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
		ApplyNineSlicePortrait(self)

		ApplyScrollBarArrow(CommunitiesFrameCommunitiesList.ScrollBar)
		ApplyScrollBarTrack(CommunitiesFrameCommunitiesList.ScrollBar.Track)
		ApplyScrollBarThumb(CommunitiesFrameCommunitiesList.ScrollBar.Track.Thumb)

		ApplyScrollBarArrow(self.Chat.ScrollBar)
		ApplyScrollBarTrack(self.Chat.ScrollBar.Track)
		ApplyScrollBarThumb(self.Chat.ScrollBar.Track.Thumb)

		ApplyScrollBarArrow(self.MemberList.ScrollBar)
		ApplyScrollBarTrack(self.MemberList.ScrollBar.Track)
		ApplyScrollBarThumb(self.MemberList.ScrollBar.Track.Thumb)

		ApplyScrollBarArrow(self.GuildBenefitsFrame.Rewards.ScrollBar)
		ApplyScrollBarTrack(self.GuildBenefitsFrame.Rewards.ScrollBar.Track)
		ApplyScrollBarThumb(self.GuildBenefitsFrame.Rewards.ScrollBar.Track.Thumb)

		ApplyScrollBarArrow(CommunitiesFrameGuildDetailsFrameNews.ScrollBar)
		ApplyScrollBarTrack(CommunitiesFrameGuildDetailsFrameNews.ScrollBar.Track)
		ApplyScrollBarThumb(CommunitiesFrameGuildDetailsFrameNews.ScrollBar.Track.Thumb)

		CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar.Track.Begin:Hide()
		CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar.Track.End:Hide()
		CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar)
		ApplyScrollBarThumb(CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar.Track.Thumb)

		ApplyScrollBarArrow(ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar)
		ApplyScrollBarTrack(ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar.Track)
		ApplyScrollBarThumb(ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar.Track.Thumb)

		CommunitiesGuildTextEditFrameCloseButton:SetSize(32, 32)
		CommunitiesGuildTextEditFrameCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		CommunitiesGuildTextEditFrameCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		CommunitiesGuildTextEditFrameCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		CommunitiesGuildTextEditFrameCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

		CommunitiesGuildTextEditFrame.Container.ScrollFrame.ScrollBar.Track.Begin:Hide()
		CommunitiesGuildTextEditFrame.Container.ScrollFrame.ScrollBar.Track.End:Hide()
		CommunitiesGuildTextEditFrame.Container.ScrollFrame.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(CommunitiesGuildTextEditFrame.Container.ScrollFrame.ScrollBar)
		ApplyScrollBarThumb(CommunitiesGuildTextEditFrame.Container.ScrollFrame.ScrollBar.Track.Thumb)
	
		ClubFinderGuildFinderFrame.OptionsList.TankRoleFrame.Icon:SetAtlas("UI-Frame-TankIcon", true)
		ClubFinderGuildFinderFrame.OptionsList.HealerRoleFrame.Icon:SetAtlas("UI-Frame-HealerIcon", true)
		ClubFinderGuildFinderFrame.OptionsList.DpsRoleFrame.Icon:SetAtlas("UI-Frame-DpsIcon", true)
		
		ClubFinderCommunityAndGuildFinderFrame.OptionsList.TankRoleFrame.Icon:SetAtlas("UI-Frame-TankIcon", true)
		ClubFinderCommunityAndGuildFinderFrame.OptionsList.HealerRoleFrame.Icon:SetAtlas("UI-Frame-HealerIcon", true)
		ClubFinderCommunityAndGuildFinderFrame.OptionsList.DpsRoleFrame.Icon:SetAtlas("UI-Frame-DpsIcon", true)
		
		self.GuildMemberDetailFrame.CloseButton:SetSize(32, 32)
		self.GuildMemberDetailFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		self.GuildMemberDetailFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		self.GuildMemberDetailFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		self.GuildMemberDetailFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

		ApplyDialogBorder(self.GuildMemberDetailFrame.Border)
		ApplyDialogBorder(self.RecruitmentDialog.BG)
		ApplyDialogBorder(self.ClubFinderInvitationFrame.RequestToJoinFrame.BG)
		ApplyDialogBorder(self.ClubFinderInvitationFrame.WarningDialog.BG)
		ApplyDialogBorder(ClubFinderGuildFinderFrame.RequestToJoinFrame.BG)
		ApplyDialogBorder(ClubFinderCommunityAndGuildFinderFrame.RequestToJoinFrame.BG)

		CommunitiesGuildNewsFiltersFrame.CloseButton:SetSize(32, 32)
		CommunitiesGuildNewsFiltersFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		CommunitiesGuildNewsFiltersFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		CommunitiesGuildNewsFiltersFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		CommunitiesGuildNewsFiltersFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
	end
end)

CommunitiesFrame.NotificationSettingsDialog.ScrollFrame.ScrollBar.Track.Begin:Hide()
CommunitiesFrame.NotificationSettingsDialog.ScrollFrame.ScrollBar.Track.End:Hide()
CommunitiesFrame.NotificationSettingsDialog.ScrollFrame.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(CommunitiesFrame.NotificationSettingsDialog.ScrollFrame.ScrollBar)
ApplyScrollBarThumb(CommunitiesFrame.NotificationSettingsDialog.ScrollFrame.ScrollBar.Track.Thumb)

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