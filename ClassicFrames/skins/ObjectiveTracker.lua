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
	self.Header:Hide()

	for _, tracker in pairs(trackers) do
		local background = tracker.Header.Background
		if background then
			background:SetSize(300, 32)
			background:SetAtlas("UI-QuestTracker-Primary-Objective-Header")
			background:ClearAllPoints()
			background:SetPoint("CENTER", 0, 1)
		end

		local button = tracker.Header.MinimizeButton
		if button then
			button:ClearAllPoints()
			button:SetPoint("RIGHT", -6, 1)
			button:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")

			if tracker:IsCollapsed() then
				button:SetNormalAtlas("UI-QuestTrackerButton-Expand-All")
				button:SetPushedAtlas("UI-QuestTrackerButton-Expand-All-Pressed")
			else
				button:SetNormalAtlas("UI-QuestTrackerButton-Collapse-All")
				button:SetPushedAtlas("UI-QuestTrackerButton-Collapse-All-Pressed")
			end
		end
	end
end)