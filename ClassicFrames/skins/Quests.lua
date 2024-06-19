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
QuestScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestScrollFrame, "TOPRIGHT", -2, 29)
QuestScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestScrollFrame, "BOTTOMRIGHT", -2, -11)

if (QuestScrollFrame.ScrollBar.BG == nil) then
	QuestScrollFrame.ScrollBar.BG = QuestScrollFrame.ScrollBar:CreateTexture(nil, "BACKGROUND")
	QuestScrollFrame.ScrollBar.BG:SetColorTexture(0, 0, 0, 0.75)
	QuestScrollFrame.ScrollBar.BG:SetAllPoints()
end

ApplyScrollBarArrow(QuestScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestScrollFrame.ScrollBar.Track.Thumb)

QuestMapDetailsScrollFrame.ScrollBar:SetSize(25, 560)
QuestMapDetailsScrollFrame.ScrollBar:ClearAllPoints()
QuestMapDetailsScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestMapDetailsScrollFrame, "TOPRIGHT", 3, 47)
QuestMapDetailsScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestMapDetailsScrollFrame, "BOTTOMRIGHT", 3, -34)

if (QuestMapDetailsScrollFrame.ScrollBar.BG == nil) then
	QuestMapDetailsScrollFrame.ScrollBar.BG = QuestMapDetailsScrollFrame.ScrollBar:CreateTexture(nil, "BACKGROUND")
	QuestMapDetailsScrollFrame.ScrollBar.BG:SetColorTexture(0, 0, 0, 0.75)
	QuestMapDetailsScrollFrame.ScrollBar.BG:SetAllPoints()
end

ApplyScrollBarArrow(QuestMapDetailsScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestMapDetailsScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestMapDetailsScrollFrame.ScrollBar.Track.Thumb)

QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar:SetSize(25, 560)
QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar:ClearAllPoints()
QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestScrollFrame, "TOPRIGHT", -2, 29)
QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestScrollFrame, "BOTTOMRIGHT", -2, -11)

if (QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar.BG == nil) then
	QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar.BG = QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar:CreateTexture(nil, "BACKGROUND")
	QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar.BG:SetColorTexture(0, 0, 0, 0.75)
	QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar.BG:SetAllPoints()
end

ApplyScrollBarArrow(QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar.Track.Thumb)

QuestDetailScrollFrame.ScrollBar:SetSize(25, 560)
QuestDetailScrollFrame.ScrollBar:ClearAllPoints()
QuestDetailScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestDetailScrollFrame, "TOPRIGHT", 2, 3)
QuestDetailScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestDetailScrollFrame, "BOTTOMRIGHT", 2, -2)

ApplyScrollBarArrow(QuestDetailScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestDetailScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestDetailScrollFrame.ScrollBar.Track.Thumb)

QuestGreetingScrollFrame.ScrollBar:SetSize(25, 560)
QuestGreetingScrollFrame.ScrollBar:ClearAllPoints()
QuestGreetingScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestGreetingScrollFrame, "TOPRIGHT", 2, 3)
QuestGreetingScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestGreetingScrollFrame, "BOTTOMRIGHT", 2, -2)

ApplyScrollBarArrow(QuestGreetingScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestGreetingScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestGreetingScrollFrame.ScrollBar.Track.Thumb)

QuestProgressScrollFrame.ScrollBar:SetSize(25, 560)
QuestProgressScrollFrame.ScrollBar:ClearAllPoints()
QuestProgressScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestProgressScrollFrame, "TOPRIGHT", 2, 3)
QuestProgressScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestProgressScrollFrame, "BOTTOMRIGHT", 2, -2)

ApplyScrollBarArrow(QuestProgressScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestProgressScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestProgressScrollFrame.ScrollBar.Track.Thumb)

QuestRewardScrollFrame.ScrollBar:SetSize(25, 560)
QuestRewardScrollFrame.ScrollBar:ClearAllPoints()
QuestRewardScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestRewardScrollFrame, "TOPRIGHT", 2, 3)
QuestRewardScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestRewardScrollFrame, "BOTTOMRIGHT", 2, -2)

ApplyScrollBarArrow(QuestRewardScrollFrame.ScrollBar)
ApplyScrollBarTrack(QuestRewardScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(QuestRewardScrollFrame.ScrollBar.Track.Thumb)

ApplySearchBox(QuestScrollFrame.SearchBox)

hooksecurefunc('QuestLogQuests_Update', function(self)
	for child in _G.QuestScrollFrame.campaignHeaderFramePool:EnumerateActive() do
		if child.Text then
			child.Text:ClearAllPoints()
			child.Text:SetPoint("BOTTOMLEFT", child.Background, "LEFT", 40, 5)
		end
		if child.Progress then
			child.Progress:ClearAllPoints()
			child.Progress:SetPoint("TOPLEFT", child.Text, "BOTTOMLEFT", 0, -4)
		end
		if child.NextObjective.Text then
			child.NextObjective.Text:ClearAllPoints()
			child.NextObjective.Text:SetPoint("TOP", child.NextObjective, "TOP")
		end
		if child.CollapseButton then
			child.CollapseButton:ClearAllPoints()
			child.CollapseButton:SetPoint("LEFT", child.Background, "LEFT", 10, 6)
			hooksecurefunc(child.CollapseButton, "UpdateCollapsedState", function(self, collapsed)
				self.Icon:SetAlpha(0)
				self:SetNormalAtlas(collapsed and "Campaign_HeaderIcon_Closed" or "Campaign_HeaderIcon_Open")
				self:SetPushedAtlas(collapsed and "Campaign_HeaderIcon_ClosedPressed" or "Campaign_HeaderIcon_OpenPressed")
				self:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight", "ADD")
			end)
		end
		if child.LoreButton then
			child.LoreButton:ClearAllPoints()
			child.LoreButton:SetPoint("RIGHT", child.Background, "RIGHT", -10, 7)
		end
	end
	for _, child in next, { _G.QuestMapFrame.QuestsFrame.Contents:GetChildren() } do
		if child.ButtonText and not child.questID then
			if child.CollapseButton then
				hooksecurefunc(child.CollapseButton, "UpdateCollapsedState", function(self, collapsed)
					self.Icon:SetAlpha(0)
					self:SetNormalAtlas(collapsed and "Campaign_HeaderIcon_Closed" or "Campaign_HeaderIcon_Open")
					self:SetPushedAtlas(collapsed and "Campaign_HeaderIcon_ClosedPressed" or "Campaign_HeaderIcon_OpenPressed")
					self:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight", "ADD")
				end)
			end
		end
	end
end)