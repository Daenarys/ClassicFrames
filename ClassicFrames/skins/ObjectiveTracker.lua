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
		tracker.Header.MinimizeButton:SetSize(16, 17)
		tracker.Header.MinimizeButton:ClearAllPoints()
		tracker.Header.MinimizeButton:SetPoint("RIGHT")
		tracker.Header.MinimizeButton:SetNormalTexture("Interface/QuestFrame/QuestTracker")
		tracker.Header.MinimizeButton:SetPushedTexture("Interface/QuestFrame/QuestTracker")
		tracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")
		if tracker:IsCollapsed() then
			tracker.Header.MinimizeButton:GetNormalTexture():SetTexCoord(0.933594, 0.96875, 0.242188, 0.316406)
			tracker.Header.MinimizeButton:GetPushedTexture():SetTexCoord(0.894531, 0.929688, 0.324219, 0.398438)
		else
			tracker.Header.MinimizeButton:GetNormalTexture():SetTexCoord(0.9375, 0.972656, 0.121094, 0.195312)
			tracker.Header.MinimizeButton:GetPushedTexture():SetTexCoord(0.894531, 0.929688, 0.242188, 0.316406)
		end
	end
end)