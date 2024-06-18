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
		tracker.Header.MinimizeButton:SetSize(16, 16)
		tracker.Header.MinimizeButton:ClearAllPoints()
		tracker.Header.MinimizeButton:SetPoint("RIGHT", 10, 1)
		tracker.Header.MinimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-QuestHideButton")
		tracker.Header.MinimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-QuestHideButton")
		tracker.Header.MinimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight", "ADD")
		if tracker:IsCollapsed() then
			tracker.Header.MinimizeButton:GetNormalTexture():SetTexCoord(0, 0.5, 0, 0.5)
			tracker.Header.MinimizeButton:GetPushedTexture():SetTexCoord(0.5, 1, 0, 0.5)
		else
			tracker.Header.MinimizeButton:GetNormalTexture():SetTexCoord(0, 0.5, 0.5, 1)
			tracker.Header.MinimizeButton:GetPushedTexture():SetTexCoord(0.5, 1, 0.5, 1)
		end
	end
end)