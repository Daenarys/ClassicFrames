if not _G.ObjectiveTrackerFrame then return end

local trackers = {
	_G.AchievementObjectiveTracker,
	_G.AdventureObjectiveTracker,
	_G.BonusObjectiveTracker,
	_G.CampaignQuestObjectiveTracker,
	_G.MonthlyActivitiesObjectiveTracker,
	_G.ProfessionsRecipeTracker,
	_G.QuestObjectiveTracker,
	_G.ScenarioObjectiveTracker,
	_G.WorldQuestObjectiveTracker
}

hooksecurefunc(ObjectiveTrackerFrame, "AnchorSelectionFrame", function(self)
	self.Selection:SetPoint("TOPLEFT", -17, -38)
end)

hooksecurefunc(ObjectiveTrackerFrame, "Update", function(self)
	self:SetWidth(235)
	self.Header:Hide()
	for _, tracker in pairs(trackers) do
		tracker:SetWidth(235)
		tracker.Header:SetSize(235, 25)
		tracker.Header.Background:SetAtlas("Objective-Header", true)
		tracker.Header.Background:ClearAllPoints()
		tracker.Header.Background:SetPoint("TOPLEFT", -29, 14)
		tracker.Header.Text:ClearAllPoints()
		tracker.Header.Text:SetPoint("LEFT", 4, -1)
		tracker.Header.MinimizeButton:SetSize(15, 14)
		tracker.Header.MinimizeButton:ClearAllPoints()
		tracker.Header.MinimizeButton:SetPoint("RIGHT")
		tracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")
		if tracker:IsCollapsed() then
			tracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Expand-All")
			tracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Expand-All-Pressed")
		else
			tracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Collapse-All")
			tracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Collapse-All-Pressed")
		end
	end
end)

hooksecurefunc(ScenarioObjectiveTracker.StageBlock, "UpdateStageBlock", function(block, _, _, _, textureKit)
	if textureKit then
		block.NormalBG:SetAtlas(textureKit.."-TrackerHeader", true)
	elseif (scenarioType == LE_SCENARIO_TYPE_LEGION_INVASION) then
		block.NormalBG:SetAtlas("legioninvasion-ScenarioTrackerToast", true)
	else
		block.NormalBG:SetAtlas("ScenarioTrackerToast", true)
	end
	block.NormalBG:ClearAllPoints()
	block.NormalBG:SetPoint("TOPLEFT", -11, -2)
	block.Stage:ClearAllPoints()
	block.Stage:SetPoint("TOPLEFT", 4, -19)
end)

for _, tracker in pairs(trackers) do
	hooksecurefunc(tracker, 'AddBlock', function(self)
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

		bar:ClearAllPoints()
		bar:SetPoint("LEFT", -8, 4)
	end)
end

AchievementObjectiveTracker.ContentsFrame:SetPoint("LEFT", -10, 0)
AchievementObjectiveTracker.ContentsFrame:SetPoint("RIGHT", 10, 0)
AdventureObjectiveTracker.ContentsFrame:SetPoint("LEFT", -10, 0)
AdventureObjectiveTracker.ContentsFrame:SetPoint("RIGHT", 10, 0)
BonusObjectiveTracker.ContentsFrame:SetPoint("LEFT", -10, 0)
BonusObjectiveTracker.ContentsFrame:SetPoint("RIGHT", 10, 0)
CampaignQuestObjectiveTracker.ContentsFrame:SetPoint("LEFT", -10, 0)
CampaignQuestObjectiveTracker.ContentsFrame:SetPoint("RIGHT", 10, 0)
MonthlyActivitiesObjectiveTracker.ContentsFrame:SetPoint("LEFT", -10, 0)
MonthlyActivitiesObjectiveTracker.ContentsFrame:SetPoint("RIGHT", 10, 0)
ProfessionsRecipeTracker.ContentsFrame:SetPoint("LEFT", -10, 0)
ProfessionsRecipeTracker.ContentsFrame:SetPoint("RIGHT", 10, 0)
QuestObjectiveTracker.ContentsFrame:SetPoint("LEFT", -10, 0)
QuestObjectiveTracker.ContentsFrame:SetPoint("RIGHT", 10, 0)
ScenarioObjectiveTracker.ContentsFrame:SetPoint("LEFT", 1, 0)
WorldQuestObjectiveTracker.ContentsFrame:SetPoint("LEFT", -10, 0)
WorldQuestObjectiveTracker.ContentsFrame:SetPoint("RIGHT", 10, 0)