if QuestMapFrame.CampaignOverview.Header.BackButton then
	QuestMapFrame.CampaignOverview.Header.BackButton:ClearAllPoints()
	QuestMapFrame.CampaignOverview.Header.BackButton:SetPoint("RIGHT", QuestMapFrame.CampaignOverview.Header.Background, "RIGHT", -10, 7)
end

QuestScrollFrame.BorderFrame.TopDetail:SetAlpha(0)
QuestMapFrame.DetailsFrame.BorderFrame.TopDetail:SetAlpha(0)
QuestMapFrame.SettingsDropdown:Hide()

ApplySearchBox(QuestScrollFrame.SearchBox)

hooksecurefunc(QuestScrollFrame, 'UpdateBackground', function(self)
	self.Background:SetAtlas("QuestLogBackground")
end)

hooksecurefunc('QuestLogQuests_Update', function()
	for button in _G.QuestScrollFrame.campaignHeaderFramePool:EnumerateActive() do
		if not button.IsSkinned then
			if button.Text then
				button.Text:ClearAllPoints()
				button.Text:SetPoint("BOTTOMLEFT", button.Background, "LEFT", 33, 5)
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
				hooksecurefunc(button.CollapseButton, "UpdateCollapsedState", function(self, collapsed)
					local atlas = collapsed and "Campaign_HeaderIcon_Closed" or "Campaign_HeaderIcon_Open"
					self.Icon:SetAtlas(atlas, true)
					self:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight", "ADD")
				end)
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
				button.CollapseButton:SetPoint("LEFT", -1, 0)
				hooksecurefunc(button.CollapseButton, "UpdateCollapsedState", function(self, collapsed)
					local atlas = collapsed and "Campaign_HeaderIcon_Closed" or "Campaign_HeaderIcon_Open"
					self.Icon:SetAtlas(atlas, true)
					self:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight", "ADD")
				end)
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
				button.CollapseButton:SetPoint("LEFT", button.Background, -1, 0)
				hooksecurefunc(button.CollapseButton, "UpdateCollapsedState", function(self, collapsed)
					local atlas = collapsed and "Campaign_HeaderIcon_Closed" or "Campaign_HeaderIcon_Open"
					self.Icon:SetAtlas(atlas, true)
					self:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight", "ADD")
				end)
			end
			button.IsSkinned = true
		end
	end
end)