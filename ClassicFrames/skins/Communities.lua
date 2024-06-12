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
		self.MaximizeMinimizeFrame:SetPoint("RIGHT", CommunitiesFrameCloseButton, "LEFT", 8.5, 0)
		self.MaximizeMinimizeFrame:SetFrameLevel(2)

		self.MaximizeMinimizeFrame.MaximizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Up")
		self.MaximizeMinimizeFrame.MaximizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Down")
		self.MaximizeMinimizeFrame.MaximizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Disabled")
		self.MaximizeMinimizeFrame.MaximizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

		self.MaximizeMinimizeFrame.MinimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Up")
		self.MaximizeMinimizeFrame.MinimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Down")
		self.MaximizeMinimizeFrame.MinimizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Disabled")
		self.MaximizeMinimizeFrame.MinimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

		ApplyTitleBg(self)
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
		self.MaximizeMinimizeFrame:SetPoint("RIGHT", CommunitiesFrameCloseButton, "LEFT", 8.5, 0)
		self.MaximizeMinimizeFrame:SetFrameLevel(2)

		self.MaximizeMinimizeFrame.MaximizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Up")
		self.MaximizeMinimizeFrame.MaximizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Down")
		self.MaximizeMinimizeFrame.MaximizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Disabled")
		self.MaximizeMinimizeFrame.MaximizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

		self.MaximizeMinimizeFrame.MinimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Up")
		self.MaximizeMinimizeFrame.MinimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Down")
		self.MaximizeMinimizeFrame.MinimizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Disabled")
		self.MaximizeMinimizeFrame.MinimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

		self.PortraitContainer.CircleMask:Hide()

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
		
		CommunitiesFrameCommunitiesList.ScrollBar:SetSize(25, 560)
		CommunitiesFrameCommunitiesList.ScrollBar:ClearAllPoints()
		CommunitiesFrameCommunitiesList.ScrollBar:SetPoint("TOPLEFT", CommunitiesFrameCommunitiesList.ScrollBox, "TOPRIGHT", -2, 0)
		CommunitiesFrameCommunitiesList.ScrollBar:SetPoint("BOTTOMLEFT", CommunitiesFrameCommunitiesList.ScrollBox, "BOTTOMRIGHT", 1, -5)

		if (CommunitiesFrameCommunitiesList.ScrollBar.BG == nil) then
			CommunitiesFrameCommunitiesList.ScrollBar.BG = CommunitiesFrameCommunitiesList.ScrollBar:CreateTexture(nil, "BACKGROUND")
			CommunitiesFrameCommunitiesList.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			CommunitiesFrameCommunitiesList.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(CommunitiesFrameCommunitiesList.ScrollBar)
		ApplyScrollBarTrack(CommunitiesFrameCommunitiesList.ScrollBar.Track)
		ApplyScrollBarThumb(CommunitiesFrameCommunitiesList.ScrollBar.Track.Thumb)

		self.Chat.ScrollBar:SetSize(25, 560)
		self.Chat.ScrollBar:ClearAllPoints()
		self.Chat.ScrollBar:SetPoint("TOPLEFT", self.Chat.MessageFrame, "TOPRIGHT", 8, 5)
		self.Chat.ScrollBar:SetPoint("BOTTOMLEFT", self.Chat.MessageFrame, "BOTTOMRIGHT", 8, -30)

		ApplyScrollBarArrow(self.Chat.ScrollBar)
		ApplyScrollBarTrack(self.Chat.ScrollBar.Track)
		ApplyScrollBarThumb(self.Chat.ScrollBar.Track.Thumb)

		self.MemberList.ScrollBar:SetSize(25, 560)
		self.MemberList.ScrollBar:ClearAllPoints()
		self.MemberList.ScrollBar:SetPoint("TOPLEFT", self.MemberList, "TOPRIGHT", -3, 3)
		self.MemberList.ScrollBar:SetPoint("BOTTOMLEFT", self.MemberList, "BOTTOMRIGHT", 0, -2)

		ApplyScrollBarArrow(self.MemberList.ScrollBar)
		ApplyScrollBarTrack(self.MemberList.ScrollBar.Track)
		ApplyScrollBarThumb(self.MemberList.ScrollBar.Track.Thumb)

		self.GuildBenefitsFrame.Rewards.ScrollBar:SetSize(25, 560)
		self.GuildBenefitsFrame.Rewards.ScrollBar:ClearAllPoints()
		self.GuildBenefitsFrame.Rewards.ScrollBar:SetPoint("TOPLEFT", self.GuildBenefitsFrame.Rewards, "TOPRIGHT", -2, 3)
		self.GuildBenefitsFrame.Rewards.ScrollBar:SetPoint("BOTTOMLEFT", self.GuildBenefitsFrame.Rewards, "BOTTOMRIGHT", 1, -4)

		ApplyScrollBarArrow(self.GuildBenefitsFrame.Rewards.ScrollBar)
		ApplyScrollBarTrack(self.GuildBenefitsFrame.Rewards.ScrollBar.Track)
		ApplyScrollBarThumb(self.GuildBenefitsFrame.Rewards.ScrollBar.Track.Thumb)

		CommunitiesFrameGuildDetailsFrameNews.ScrollBar:SetSize(25, 560)
		CommunitiesFrameGuildDetailsFrameNews.ScrollBar:ClearAllPoints()
		CommunitiesFrameGuildDetailsFrameNews.ScrollBar:SetPoint("TOPLEFT", CommunitiesFrameGuildDetailsFrameNews, "TOPRIGHT", -13, 3)
		CommunitiesFrameGuildDetailsFrameNews.ScrollBar:SetPoint("BOTTOMLEFT", CommunitiesFrameGuildDetailsFrameNews, "BOTTOMRIGHT", -10, -4)

		ApplyScrollBarArrow(CommunitiesFrameGuildDetailsFrameNews.ScrollBar)
		ApplyScrollBarTrack(CommunitiesFrameGuildDetailsFrameNews.ScrollBar.Track)
		ApplyScrollBarThumb(CommunitiesFrameGuildDetailsFrameNews.ScrollBar.Track.Thumb)

		CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar:SetSize(25, 560)
		CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar:ClearAllPoints()
		CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", CommunitiesGuildLogFrame.Container.ScrollFrame, "TOPRIGHT", -1, 2)
		CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", CommunitiesGuildLogFrame.Container.ScrollFrame, "BOTTOMRIGHT", 2, -4)

		CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar.Track:ClearAllPoints()
		CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar.Track:SetPoint("TOPLEFT", 4, -22)
		CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar.Track:SetPoint("BOTTOMRIGHT", -4, 22)

		CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar.Track.Begin:Hide()
		CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar.Track.End:Hide()
		CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar)
		ApplyScrollBarThumb(CommunitiesGuildLogFrame.Container.ScrollFrame.ScrollBar.Track.Thumb)

		ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar:SetSize(25, 560)
		ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar:ClearAllPoints()
		ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar:SetPoint("TOPLEFT", ClubFinderCommunityAndGuildFinderFrame.CommunityCards, "TOPRIGHT", -20, 3)
		ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar:SetPoint("BOTTOMLEFT", ClubFinderCommunityAndGuildFinderFrame.CommunityCards, "BOTTOMRIGHT", -17, -3)

		ApplyScrollBarArrow(ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar)
		ApplyScrollBarTrack(ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar.Track)
		ApplyScrollBarThumb(ClubFinderCommunityAndGuildFinderFrame.CommunityCards.ScrollBar.Track.Thumb)

		CommunitiesGuildTextEditFrameCloseButton:SetSize(32, 32)
		CommunitiesGuildTextEditFrameCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		CommunitiesGuildTextEditFrameCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		CommunitiesGuildTextEditFrameCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		CommunitiesGuildTextEditFrameCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

		CommunitiesGuildTextEditFrame.Container.ScrollFrame.ScrollBar:SetSize(25, 560)
		CommunitiesGuildTextEditFrame.Container.ScrollFrame.ScrollBar:ClearAllPoints()
		CommunitiesGuildTextEditFrame.Container.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", CommunitiesGuildTextEditFrame.Container.ScrollFrame, "TOPRIGHT", -1, 2)
		CommunitiesGuildTextEditFrame.Container.ScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", CommunitiesGuildTextEditFrame.Container.ScrollFrame, "BOTTOMRIGHT", 2, -4)

		CommunitiesGuildTextEditFrame.Container.ScrollFrame.ScrollBar.Track:ClearAllPoints()
		CommunitiesGuildTextEditFrame.Container.ScrollFrame.ScrollBar.Track:SetPoint("TOPLEFT", 4, -22)
		CommunitiesGuildTextEditFrame.Container.ScrollFrame.ScrollBar.Track:SetPoint("BOTTOMRIGHT", -4, 22)

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

ApplySearchBox(ClubFinderGuildFinderFrame.OptionsList.SearchBox)
ApplySearchBox(ClubFinderCommunityAndGuildFinderFrame.OptionsList.SearchBox)
ApplySearchBox(CommunitiesFrame.RecruitmentDialog.MinIlvlOnly.EditBox)

ApplyDropDown(ClubFinderGuildFinderFrame.OptionsList.ClubFilterDropdown)
ApplyDropDown(ClubFinderGuildFinderFrame.OptionsList.ClubSizeDropdown)
ApplyDropDown(ClubFinderCommunityAndGuildFinderFrame.OptionsList.ClubFilterDropdown)
ApplyDropDown(ClubFinderCommunityAndGuildFinderFrame.OptionsList.SortByDropdown)