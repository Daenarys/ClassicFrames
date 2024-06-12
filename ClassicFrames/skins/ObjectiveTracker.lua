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

hooksecurefunc(ObjectiveTrackerFrame, "Update", function(self)
	self:SetWidth(235)
	self.Header:Hide()

	for _, tracker in pairs(trackers) do
		tracker:SetWidth(235)
		tracker.Header:SetSize(235, 25)
		tracker.Header.Background:SetAtlas("Objective-Header", true)
		tracker.Header.Background:ClearAllPoints()
		tracker.Header.Background:SetPoint("TOPLEFT", -29, 14)
		tracker.ContentsFrame:SetPoint("LEFT", -10, 0)
		tracker.ContentsFrame:SetPoint("RIGHT", 10, 0)
		tracker.Header.Text:ClearAllPoints()
		tracker.Header.Text:SetPoint("LEFT", 4, -1)
		tracker.Header.MinimizeButton:SetSize(15, 14)
		tracker.Header.MinimizeButton:ClearAllPoints()
		tracker.Header.MinimizeButton:SetPoint("RIGHT", 0, -1)
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