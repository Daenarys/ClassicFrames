if not _G.ObjectiveTrackerFrame then return end

ObjectiveTrackerFrame:SetWidth(235)
ObjectiveTrackerFrame.Header:Hide()

local trackers = {
	_G.AchievementObjectiveTracker,
	_G.AdventureObjectiveTracker,
	_G.BonusObjectiveTracker,
	_G.CampaignQuestObjectiveTracker,
	_G.MonthlyActivitiesObjectiveTracker,
	_G.UIWidgetObjectiveTracker,
	_G.ProfessionsRecipeTracker,
	_G.QuestObjectiveTracker,
	_G.ScenarioObjectiveTracker,
	_G.WorldQuestObjectiveTracker
}

for _, tracker in pairs(trackers) do
	tracker:SetWidth(235)
	tracker.ContentsFrame:SetPoint("LEFT", -10, 0)
	tracker.ContentsFrame:SetPoint("RIGHT", 10, 0)
	tracker.Header:SetSize(235, 25)
	tracker.Header.Background:SetAtlas("Objective-Header", true)
	tracker.Header.Background:ClearAllPoints()
	tracker.Header.Background:SetPoint("TOPLEFT", -29, 14)
	tracker.Header.Text:ClearAllPoints()
	tracker.Header.Text:SetPoint("LEFT", 4, -1)

	hooksecurefunc(tracker, 'AddBlock', function()
		for _, child in next, { tracker.ContentsFrame:GetChildren() } do
			if child and child.AddPOIButton then
				hooksecurefunc(child, "AddPOIButton", function(self)
					if child.poiButton then
						child.poiButton:SetScale(0.88)
						child.poiButton:ClearAllPoints()
						child.poiButton:SetPoint("TOPRIGHT", self.HeaderText, "TOPLEFT", -6, 2)
					end
				end)
			end
		end
	end)

	hooksecurefunc(tracker, "GetProgressBar", function(self, key)
		local progressBar = self.usedProgressBars[key]
		local bar = progressBar and progressBar.Bar

		if not bar.BorderMid then
			bar:ClearAllPoints()
			bar:SetPoint("LEFT", -1, 0)
		end
	end)
end

hooksecurefunc(ObjectiveTrackerFrame, "AnchorSelectionFrame", function(self)
	self.Selection:SetPoint("TOPLEFT", -17, -38)
end)

hooksecurefunc(ObjectiveTrackerFrame, "Update", function()
	for _, tracker in pairs(trackers) do
		tracker.Header.MinimizeButton:SetSize(15, 14)
		tracker.Header.MinimizeButton:ClearAllPoints()
		tracker.Header.MinimizeButton:SetPoint("RIGHT")
		tracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")
		if tracker:IsCollapsed() then
			tracker.Header.MinimizeButton:SetNormalTexture("Interface\\Buttons\\QuestTrackerButtons")
			tracker.Header.MinimizeButton:GetNormalTexture():SetTexCoord(0.273438, 0.390625, 0.765625, 0.984375)
			tracker.Header.MinimizeButton:SetPushedTexture("Interface\\Buttons\\QuestTrackerButtons")
			tracker.Header.MinimizeButton:GetPushedTexture():SetTexCoord(0.273438, 0.390625, 0.515625, 0.734375)
		else
			tracker.Header.MinimizeButton:SetNormalTexture("Interface\\Buttons\\QuestTrackerButtons")
			tracker.Header.MinimizeButton:GetNormalTexture():SetTexCoord(0.140625, 0.257812, 0.546875, 0.765625)
			tracker.Header.MinimizeButton:SetPushedTexture("Interface\\Buttons\\QuestTrackerButtons")
			tracker.Header.MinimizeButton:GetPushedTexture():SetTexCoord(0.0078125, 0.125, 0.546875, 0.765625)
		end
	end

	for _, child in next, { ScenarioObjectiveTracker.ContentsFrame:GetChildren() } do
		child:SetPoint("LEFT", 31, 0)
	end
end)

hooksecurefunc(ScenarioObjectiveTracker.StageBlock, "UpdateStageBlock", function(block)
	block.NormalBG:ClearAllPoints()
	block.NormalBG:SetPoint("TOPLEFT", -18, 1)
	block.FinalBG:SetAtlas("ScenarioTrackerToast-FinalFiligree", true)
	block.FinalBG:ClearAllPoints()
	block.FinalBG:SetPoint("TOPLEFT", -7, -6)
	block.Stage:ClearAllPoints()
	block.Stage:SetPoint("TOPLEFT", 4, -19)
end)

hooksecurefunc(ScenarioObjectiveTracker.StageBlock, "UpdateWidgetRegistration", function(self)
	self.WidgetContainer:ClearAllPoints()
	self.WidgetContainer:SetPoint("TOPLEFT", -18, 1)
	if self.WidgetContainer.widgetFrames then
		for _, widgetFrame in pairs(self.WidgetContainer.widgetFrames) do
			if widgetFrame.Frame then
				widgetFrame:SetWidth(258)
				widgetFrame.Frame:SetWidth(258)
			end
		end
	end
end)