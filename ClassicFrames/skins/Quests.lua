if not _G.QuestFrame then return end

ApplyCloseButton(QuestFrameCloseButton)

QuestFrame.PortraitContainer.CircleMask:Hide()

QuestFramePortrait:SetSize(61, 61)
QuestFramePortrait:ClearAllPoints()
QuestFramePortrait:SetPoint("TOPLEFT", -6, 8)

QuestFrame.TitleContainer:ClearAllPoints()
QuestFrame.TitleContainer:SetPoint("TOPLEFT", QuestFrame, "TOPLEFT", 73, -1)
QuestFrame.TitleContainer:SetPoint("TOPRIGHT", QuestFrame, "TOPRIGHT", -47, 1)

QuestFrameTitleText:SetTextColor(255, 255, 255, 1)

ApplyTitleBg(QuestFrame)
ApplyNineSlicePortrait(QuestFrame)

QuestScrollFrame.ScrollBar:SetSize(25, 560)
QuestScrollFrame.ScrollBar:ClearAllPoints()
QuestScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestScrollFrame, "TOPRIGHT", 2, 2)
QuestScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestScrollFrame, "BOTTOMRIGHT", 2, -2)

ApplyScrollBarArrow(QuestScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestScrollFrame.ScrollBar.Track.Thumb)

QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar:SetSize(25, 560)
QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar:ClearAllPoints()
QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestScrollFrame, "TOPRIGHT", 2, 2)
QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestScrollFrame, "BOTTOMRIGHT", 5, -2)

ApplyScrollBarArrow(QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar.Track.Thumb)

QuestDetailScrollFrame.ScrollBar:SetSize(25, 560)
QuestDetailScrollFrame.ScrollBar:ClearAllPoints()
QuestDetailScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestDetailScrollFrame, "TOPRIGHT", 2, 3)
QuestDetailScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestDetailScrollFrame, "BOTTOMRIGHT", 5, -1)

ApplyScrollBarArrow(QuestDetailScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestDetailScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestDetailScrollFrame.ScrollBar.Track.Thumb)

QuestGreetingScrollFrame.ScrollBar:SetSize(25, 560)
QuestGreetingScrollFrame.ScrollBar:ClearAllPoints()
QuestGreetingScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestGreetingScrollFrame, "TOPRIGHT", 2, 3)
QuestGreetingScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestGreetingScrollFrame, "BOTTOMRIGHT", 5, -1)

ApplyScrollBarArrow(QuestGreetingScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestGreetingScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestGreetingScrollFrame.ScrollBar.Track.Thumb)

QuestMapDetailsScrollFrame.ScrollBar:SetWidth(20)
QuestMapDetailsScrollFrame.ScrollBar:ClearAllPoints()
QuestMapDetailsScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestMapDetailsScrollFrame, "TOPRIGHT", 0, 0)
QuestMapDetailsScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestMapDetailsScrollFrame, "BOTTOMRIGHT", 0, 0)

if (QuestMapDetailsScrollFrame.ScrollBar.BG == nil) then
	QuestMapDetailsScrollFrame.ScrollBar.BG = QuestMapDetailsScrollFrame.ScrollBar:CreateTexture(nil, "BACKGROUND")
	QuestMapDetailsScrollFrame.ScrollBar.BG:SetColorTexture(0, 0, 0, .5)
	QuestMapDetailsScrollFrame.ScrollBar.BG:SetAllPoints()
end

QuestMapDetailsScrollFrame.ScrollBar.Track.Begin:Hide()
QuestMapDetailsScrollFrame.ScrollBar.Track.End:Hide()
QuestMapDetailsScrollFrame.ScrollBar.Track.Middle:Hide()

ApplyScrollBarThumb(QuestMapDetailsScrollFrame.ScrollBar.Track.Thumb)

QuestMapDetailsScrollFrame.ScrollBar.Back:SetSize(18, 16)
QuestMapDetailsScrollFrame.ScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
QuestMapDetailsScrollFrame.ScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
QuestMapDetailsScrollFrame.ScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
QuestMapDetailsScrollFrame.ScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

QuestMapDetailsScrollFrame.ScrollBar.Forward:SetSize(18, 16)
QuestMapDetailsScrollFrame.ScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
QuestMapDetailsScrollFrame.ScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
QuestMapDetailsScrollFrame.ScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
QuestMapDetailsScrollFrame.ScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")

QuestProgressScrollFrame.ScrollBar:SetSize(25, 560)
QuestProgressScrollFrame.ScrollBar:ClearAllPoints()
QuestProgressScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestProgressScrollFrame, "TOPRIGHT", 2, 3)
QuestProgressScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestProgressScrollFrame, "BOTTOMRIGHT", 5, -1)

ApplyScrollBarArrow(QuestProgressScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestProgressScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestProgressScrollFrame.ScrollBar.Track.Thumb)

QuestRewardScrollFrame.ScrollBar:SetSize(25, 560)
QuestRewardScrollFrame.ScrollBar:ClearAllPoints()
QuestRewardScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestRewardScrollFrame, "TOPRIGHT", 2, 3)
QuestRewardScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestRewardScrollFrame, "BOTTOMRIGHT", 5, -1)

ApplyScrollBarArrow(QuestRewardScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestRewardScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestRewardScrollFrame.ScrollBar.Track.Thumb)

hooksecurefunc(_G.QuestSessionManager, 'NotifyDialogShow', function(_, dialog)
	if dialog.isSkinned then return end

	ApplyDialogBorder(dialog.Border)

	dialog.isSkinned = true
end)

QuestMapFrame:SetWidth(286)
QuestMapFrame.SettingsButton:Hide()

QuestMapFrame.VerticalSeparator:Show()
QuestMapFrame.VerticalSeparator:SetAlpha(1)

QuestScrollFrame.BorderFrame:ClearAllPoints()
QuestScrollFrame.BorderFrame:SetPoint("TOPLEFT")
QuestScrollFrame.BorderFrame:SetPoint("BOTTOMRIGHT")

QuestScrollFrame.BorderFrame.TopDetail:SetAtlas("QuestLog_TopDetail", true)
QuestScrollFrame.BorderFrame.TopDetail:ClearAllPoints()
QuestScrollFrame.BorderFrame.TopDetail:SetPoint("TOP", 0, 9)

QuestScrollFrame.BorderFrame.Border:SetAtlas("QuestLog_BottomDetail", true)
QuestScrollFrame.BorderFrame.Border:ClearAllPoints()
QuestScrollFrame.BorderFrame.Border:SetPoint("BOTTOM")

QuestScrollFrame.Background:ClearAllPoints()
QuestScrollFrame.Background:SetPoint("TOPLEFT", 0, 5)

QuestScrollFrame.Edge:SetAlpha(1)

QuestScrollFrame.SearchBox:Hide()
QuestScrollFrame.BorderFrame.Shadow:Hide()

local function QuestLogQuests_IsDisplayEmpty(displayState)
	return not displayState.hasShownAnyHeader and QuestScrollFrame.titleFramePool:GetNumActive() == 0;
end

hooksecurefunc(QuestScrollFrame, 'UpdateBackground', function(self, displayState)
	local atlas = QuestLogQuests_IsDisplayEmpty(displayState) and "NoQuestsBackground" or "QuestLogBackground";
	self.Background:SetAtlas(atlas, true)

	self:ClearAllPoints()
	self:SetPoint("TOPLEFT")
	self:SetPoint("BOTTOMRIGHT", -27, 0)
end)

hooksecurefunc('QuestLogQuests_Update', function(self)
	QuestScrollFrame.Contents:SetWidth(260)
	for _, child in next, { QuestScrollFrame.Contents:GetChildren() } do
		child.leftPadding = 0
		child:SetWidth(260)
		if child.Background then
			child.Background:SetSize(260, 58)
			child.Background:ClearAllPoints()
			child.Background:SetPoint("TOP")
		end
		if child.Text then
			child.Text:SetSize(175, 15)
			child.Text:SetFont(GameFontHighlightMedium:GetFont(), 12)
			child.Text:ClearAllPoints()
			child.Text:SetPoint("BOTTOMLEFT", child.Background, "LEFT", 42, 6)
		end
		if child.Progress then
			child.Progress:SetFontObject(GameFontNormalSmall)
			child.Progress:ClearAllPoints()
			child.Progress:SetPoint("TOPLEFT", child.Text, "BOTTOMLEFT", 0, -4)
		end
		if child.SelectedHighlight then
			child.SelectedHighlight:SetAtlas("CampaignHeader_SelectedGlow", true)
			child.SelectedHighlight:ClearAllPoints()
			child.SelectedHighlight:SetPoint("TOP", 0, -1)
		end
		if child.CollapseButton then
			child.CollapseButton:ClearAllPoints()
			child.CollapseButton:SetPoint("LEFT", child.Background, "LEFT", 18, 6)

			hooksecurefunc(child.CollapseButton, "UpdateCollapsedState", function(self, collapsed)
				self.Icon:Hide()
				self:SetNormalAtlas(collapsed and "Campaign_HeaderIcon_Closed" or "Campaign_HeaderIcon_Open")
				self:SetPushedAtlas(collapsed and "Campaign_HeaderIcon_ClosedPressed" or "Campaign_HeaderIcon_OpenPressed")
				self:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight", "ADD")
			end)
		end
		if child.NextObjective then
			child.NextObjective.Text:SetWidth(220)
			child.NextObjective.Text:ClearAllPoints()
			child.NextObjective.Text:SetPoint("TOP")
		end
	end
end)