if not _G.ObjectiveTrackerFrame then return end

hooksecurefunc(ObjectiveTrackerFrame, "Update", function(self)
	self.Header:Hide()

	if AchievementObjectiveTracker then
		AchievementObjectiveTracker.Header.MinimizeButton:ClearAllPoints()
		AchievementObjectiveTracker.Header.MinimizeButton:SetPoint("RIGHT", -5, 0)
		AchievementObjectiveTracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")

		if AchievementObjectiveTracker:IsCollapsed() then
			AchievementObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Expand-All", true)
			AchievementObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Expand-All-Pressed", true)
		else
			AchievementObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Collapse-All", true)
			AchievementObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Collapse-All-Pressed", true)
		end
	end

	if AdventureObjectiveTracker then
		AdventureObjectiveTracker.Header.MinimizeButton:ClearAllPoints()
		AdventureObjectiveTracker.Header.MinimizeButton:SetPoint("RIGHT", -5, 0)
		AdventureObjectiveTracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")

		if AdventureObjectiveTracker:IsCollapsed() then
			AdventureObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Expand-All", true)
			AdventureObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Expand-All-Pressed", true)
		else
			AdventureObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Collapse-All", true)
			AdventureObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Collapse-All-Pressed", true)
		end
	end

	if BonusObjectiveTracker then
		BonusObjectiveTracker.Header.MinimizeButton:ClearAllPoints()
		BonusObjectiveTracker.Header.MinimizeButton:SetPoint("RIGHT", -5, 0)
		BonusObjectiveTracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")

		if BonusObjectiveTracker:IsCollapsed() then
			BonusObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Expand-All", true)
			BonusObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Expand-All-Pressed", true)
		else
			BonusObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Collapse-All", true)
			BonusObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Collapse-All-Pressed", true)
		end
	end

	if CampaignQuestObjectiveTracker then
		CampaignQuestObjectiveTracker.Header.MinimizeButton:ClearAllPoints()
		CampaignQuestObjectiveTracker.Header.MinimizeButton:SetPoint("RIGHT", -5, 0)
		CampaignQuestObjectiveTracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")

		if CampaignQuestObjectiveTracker:IsCollapsed() then
			CampaignQuestObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Expand-All", true)
			CampaignQuestObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Expand-All-Pressed", true)
		else
			CampaignQuestObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Collapse-All", true)
			CampaignQuestObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Collapse-All-Pressed", true)
		end
	end

	if MonthlyActivitiesObjectiveTracker then
		MonthlyActivitiesObjectiveTracker.Header.MinimizeButton:ClearAllPoints()
		MonthlyActivitiesObjectiveTracker.Header.MinimizeButton:SetPoint("RIGHT", -5, 0)
		MonthlyActivitiesObjectiveTracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")

		if MonthlyActivitiesObjectiveTracker:IsCollapsed() then
			MonthlyActivitiesObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Expand-All", true)
			MonthlyActivitiesObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Expand-All-Pressed", true)
		else
			MonthlyActivitiesObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Collapse-All", true)
			MonthlyActivitiesObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Collapse-All-Pressed", true)
		end
	end

	if ProfessionsRecipeTracker then
		ProfessionsRecipeTracker.Header.MinimizeButton:ClearAllPoints()
		ProfessionsRecipeTracker.Header.MinimizeButton:SetPoint("RIGHT", -5, 0)
		ProfessionsRecipeTracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")

		if ProfessionsRecipeTracker:IsCollapsed() then
			ProfessionsRecipeTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Expand-All", true)
			ProfessionsRecipeTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Expand-All-Pressed", true)
		else
			ProfessionsRecipeTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Collapse-All", true)
			ProfessionsRecipeTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Collapse-All-Pressed", true)
		end
	end

	if QuestObjectiveTracker then
		QuestObjectiveTracker.Header.MinimizeButton:ClearAllPoints()
		QuestObjectiveTracker.Header.MinimizeButton:SetPoint("RIGHT", -5, 0)
		QuestObjectiveTracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")

		if QuestObjectiveTracker:IsCollapsed() then
			QuestObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Expand-All", true)
			QuestObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Expand-All-Pressed", true)
		else
			QuestObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Collapse-All", true)
			QuestObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Collapse-All-Pressed", true)
		end
	end

	if ScenarioObjectiveTracker then
		ScenarioObjectiveTracker.Header.MinimizeButton:ClearAllPoints()
		ScenarioObjectiveTracker.Header.MinimizeButton:SetPoint("RIGHT", -5, 0)
		ScenarioObjectiveTracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")

		if ScenarioObjectiveTracker:IsCollapsed() then
			ScenarioObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Expand-All", true)
			ScenarioObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Expand-All-Pressed", true)
		else
			ScenarioObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Collapse-All", true)
			ScenarioObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Collapse-All-Pressed", true)
		end
	end

	if WorldQuestObjectiveTracker then
		WorldQuestObjectiveTracker.Header.MinimizeButton:ClearAllPoints()
		WorldQuestObjectiveTracker.Header.MinimizeButton:SetPoint("RIGHT", -5, 0)
		WorldQuestObjectiveTracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")

		if WorldQuestObjectiveTracker:IsCollapsed() then
			WorldQuestObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Expand-All", true)
			WorldQuestObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Expand-All-Pressed", true)
		else
			WorldQuestObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Collapse-All", true)
			WorldQuestObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Collapse-All-Pressed", true)
		end
	end
end)