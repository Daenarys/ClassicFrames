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
QuestScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestScrollFrame, "TOPRIGHT", -2, 32)
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
QuestMapFrame.CampaignOverview.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestScrollFrame, "TOPRIGHT", -2, 3)
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

if QuestMapFrame.CampaignOverview.Header.BackButton then
	QuestMapFrame.CampaignOverview.Header.BackButton:ClearAllPoints()
	QuestMapFrame.CampaignOverview.Header.BackButton:SetPoint("RIGHT", QuestMapFrame.CampaignOverview.Header.Background, "RIGHT", -10, 7)
end
QuestMapFrame.SettingsDropdown:Hide()
ApplySearchBox(QuestScrollFrame.SearchBox)

hooksecurefunc('QuestLogQuests_Update', function()
	for button in _G.QuestScrollFrame.campaignHeaderFramePool:EnumerateActive() do
		if not button.IsSkinned then
			if button.Text then
				button.Text:ClearAllPoints()
				button.Text:SetPoint("BOTTOMLEFT", button.Background, "LEFT", 35, 5)
			end
			if button.Progress then
				button.Progress:ClearAllPoints()
				button.Progress:SetPoint("TOPLEFT", button.Text, "BOTTOMLEFT", 0, -4)
			end
			if button.NextObjective.Text then
				button.NextObjective.Text:ClearAllPoints()
				button.NextObjective.Text:SetPoint("TOP", button.NextObjective, "TOP")
			end
			if button.LoreButton then
				button.LoreButton:ClearAllPoints()
				button.LoreButton:SetPoint("RIGHT", button.Background, "RIGHT", -10, 7)
			end
			if button.CollapseButton then
				button.CollapseButton:ClearAllPoints()
				button.CollapseButton:SetPoint("LEFT", button.Background, "LEFT", 8, 6)
			end
			button.IsSkinned = true
		end
	end

	for button in _G.QuestScrollFrame.headerFramePool:EnumerateActive() do
		if not button.IsSkinned then
			button:GetNormalTexture():SetAlpha(0)
			button:GetHighlightTexture():SetAlpha(0)
			if button.ButtonText then
				button.ButtonText:ClearAllPoints()
				button.ButtonText:SetPoint("LEFT", 24, 1)
			end
			if button.CollapseButton then
				button.CollapseButton:ClearAllPoints()
				button.CollapseButton:SetPoint("LEFT", -1, 1)
			end
			button.IsSkinned = true
		end
	end

	for button in _G.QuestScrollFrame.titleFramePool:EnumerateActive() do
		if not button.IsSkinned then
			if button.Checkbox then
				button.Checkbox:Hide()
			end
			if button.TagTexture then
				button.TagTexture:ClearAllPoints()
				button.TagTexture:SetPoint("RIGHT", 8, 0)
			end
			button.IsSkinned = true
		end
	end

	for button in _G.QuestScrollFrame.campaignHeaderMinimalFramePool:EnumerateActive() do
		if not button.IsSkinned then
			if button.Background then
				button.Background:SetAlpha(0)
			end
			if button.Highlight then
				button.Highlight:SetAlpha(0)
			end
			if button.Text then
				button.Text:ClearAllPoints()
				button.Text:SetPoint("LEFT", button.Background, "LEFT", 24, 1)
			end
			if button.CollapseButton then
				button.CollapseButton:ClearAllPoints()
				button.CollapseButton:SetPoint("LEFT", button.Background, -1, 1)
			end
			button.IsSkinned = true
		end
	end
end)