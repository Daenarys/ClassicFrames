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
		tracker.ContentsFrame:SetPoint("LEFT", -10, 0)
		tracker.ContentsFrame:SetPoint("RIGHT", 10, 0)
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

for _, tracker in pairs(trackers) do
	hooksecurefunc(tracker, 'AddBlock', function(self)
		for _, child in next, { tracker.ContentsFrame:GetChildren() } do
			hooksecurefunc(child, "AddPOIButton", function(self)
				if child.poiButton then
					child.poiButton:SetScale(0.9)
					child.poiButton:ClearAllPoints()
					child.poiButton:SetPoint("TOPRIGHT", self.HeaderText, "TOPLEFT", -6, 2)
				end
			end)
		end
	end)
end