if not _G.QuestScrollFrame then return end

if QuestMapFrame.CampaignOverview.Header.BackButton then
	QuestMapFrame.CampaignOverview.Header.BackButton:ClearAllPoints()
	QuestMapFrame.CampaignOverview.Header.BackButton:SetPoint("RIGHT", QuestMapFrame.CampaignOverview.Header.Background, "RIGHT", -10, 7)
end

QuestScrollFrame.SearchBox:Hide()
QuestScrollFrame.BorderFrame.Shadow:SetAlpha(0)
QuestScrollFrame.BorderFrame.TopDetail:SetAlpha(0)
QuestMapFrame.CampaignOverview.BorderFrame.TopDetail:SetAlpha(0)
QuestMapFrame.DetailsFrame.BorderFrame.TopDetail:SetAlpha(0)
QuestMapFrame.SettingsDropdown:Hide()

QuestScrollFrame:SetPoint("TOPLEFT")
QuestScrollFrame.BorderFrame:SetPoint("TOPLEFT", -3, 3)
QuestMapFrame.CampaignOverview.BorderFrame:SetPoint("TOPLEFT", -3, 3)

ApplySearchBox(QuestScrollFrame.SearchBox)

hooksecurefunc('QuestLogQuests_Update', function()
	for button in _G.QuestScrollFrame.campaignHeaderFramePool:EnumerateActive() do
		if not button.IsSkinned then
			if button.Text then
				button.Text:ClearAllPoints()
				if button.CollapseButton:IsShown() then
					button.Text:SetPoint("BOTTOMLEFT", button.Background, "LEFT", 30, 5)
				else
					button.Text:SetPoint("BOTTOMLEFT", button.Background, "LEFT", 16, 5)
				end
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
				button.CollapseButton:SetPoint("LEFT", button.Background, "LEFT", 5, 7)
				hooksecurefunc(button.CollapseButton, "UpdateCollapsedState", function(self, collapsed)
					local atlas = collapsed and "Campaign_HeaderIcon_Closed" or "Campaign_HeaderIcon_Open"
					self.Icon:SetSize(20, 20)
					self.Icon:SetAtlas(atlas)
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
				button.ButtonText:SetPoint("LEFT", 21, 1)
			end
			if button.CollapseButton then
				button.CollapseButton:ClearAllPoints()
				button.CollapseButton:SetPoint("LEFT", -4, 1)
				hooksecurefunc(button.CollapseButton, "UpdateCollapsedState", function(self, collapsed)
					local atlas = collapsed and "Campaign_HeaderIcon_Closed" or "Campaign_HeaderIcon_Open"
					self.Icon:SetSize(20, 20)
					self.Icon:SetAtlas(atlas)
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
				button.CollapseButton:SetPoint("LEFT", button.Background, -4, 1)
				hooksecurefunc(button.CollapseButton, "UpdateCollapsedState", function(self, collapsed)
					local atlas = collapsed and "Campaign_HeaderIcon_Closed" or "Campaign_HeaderIcon_Open"
					self.Icon:SetSize(20, 20)
					self.Icon:SetAtlas(atlas)
					self:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight", "ADD")
				end)
			end
			button.IsSkinned = true
		end
	end
end)

hooksecurefunc(QuestScrollFrame, 'UpdateBackground', function(self)
	if (self.Background:GetAtlas() == "QuestLog-main-background") then
		self.Background:SetAtlas("QuestLogBackground")
	elseif (self.Background:GetAtlas() == "QuestLog-empty-quest-background") then
		self.Background:SetAtlas("NoQuestsBackground")
	end
end)