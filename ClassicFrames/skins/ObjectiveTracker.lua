if not _G.ObjectiveTrackerFrame then return end

ObjectiveTrackerFrame.Header:Hide()

local trackers = {
	_G.AchievementObjectiveTracker,
	_G.AdventureObjectiveTracker,
	_G.BonusObjectiveTracker,
	_G.CampaignQuestObjectiveTracker,
	_G.MonthlyActivitiesObjectiveTracker,
	_G.ProfessionsRecipeTracker,
	_G.QuestObjectiveTracker,
	_G.ScenarioObjectiveTracker,
	_G.UIWidgetObjectiveTracker,
	_G.WorldQuestObjectiveTracker
}

for _, tracker in pairs(trackers) do
	tracker.Header.Background:SetAtlas("Objective-Header", true)
	tracker.Header.Background:SetPoint("TOPLEFT", -19, 14)
	tracker.Header.Text:SetPoint("LEFT", 14, 0)
end

hooksecurefunc(ObjectiveTrackerFrame, "Update", function(self)
	if not self.modules then
		return
	end

	for i, module in ipairs(self.modules) do
		module.Header.MinimizeButton:SetSize(15, 14)
		module.Header.MinimizeButton:SetPoint("RIGHT", -15, 0)
		module.Header.MinimizeButton:SetNormalTexture("Interface\\Buttons\\QuestTrackerButtons")
		module.Header.MinimizeButton:SetPushedTexture("Interface\\Buttons\\QuestTrackerButtons")
		module.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")
		if module:IsCollapsed() then
			module.Header.MinimizeButton:GetNormalTexture():SetTexCoord(0.273438, 0.390625, 0.765625, 0.984375)
			module.Header.MinimizeButton:GetPushedTexture():SetTexCoord(0.273438, 0.390625, 0.515625, 0.734375)
		else
			module.Header.MinimizeButton:GetNormalTexture():SetTexCoord(0.140625, 0.257812, 0.546875, 0.765625)
			module.Header.MinimizeButton:GetPushedTexture():SetTexCoord(0.0078125, 0.125, 0.546875, 0.765625)
		end
	end
end)