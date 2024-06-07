if not _G.ObjectiveTrackerFrame then return end

hooksecurefunc(ObjectiveTrackerFrame, "Update", function(self)
	self.Header:Hide()

	if AchievementObjectiveTracker then
		AchievementObjectiveTracker.Header.Background:SetSize(300, 32)
		AchievementObjectiveTracker.Header.Background:SetAtlas("UI-QuestTracker-Primary-Objective-Header")
		AchievementObjectiveTracker.Header.Background:ClearAllPoints()
		AchievementObjectiveTracker.Header.Background:SetPoint("CENTER", 0, 1)

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
		AdventureObjectiveTracker.Header.Background:SetSize(300, 32)
		AdventureObjectiveTracker.Header.Background:SetAtlas("UI-QuestTracker-Primary-Objective-Header")
		AdventureObjectiveTracker.Header.Background:ClearAllPoints()
		AdventureObjectiveTracker.Header.Background:SetPoint("CENTER", 0, 1)

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
		BonusObjectiveTracker.Header.Background:SetSize(300, 32)
		BonusObjectiveTracker.Header.Background:SetAtlas("UI-QuestTracker-Primary-Objective-Header")
		BonusObjectiveTracker.Header.Background:ClearAllPoints()
		BonusObjectiveTracker.Header.Background:SetPoint("CENTER", 0, 1)

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
		CampaignQuestObjectiveTracker.Header.Background:SetSize(300, 32)
		CampaignQuestObjectiveTracker.Header.Background:SetAtlas("UI-QuestTracker-Primary-Objective-Header")
		CampaignQuestObjectiveTracker.Header.Background:ClearAllPoints()
		CampaignQuestObjectiveTracker.Header.Background:SetPoint("CENTER", 0, 1)

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
		MonthlyActivitiesObjectiveTracker.Header.Background:SetSize(300, 32)
		MonthlyActivitiesObjectiveTracker.Header.Background:SetAtlas("UI-QuestTracker-Primary-Objective-Header")
		MonthlyActivitiesObjectiveTracker.Header.Background:ClearAllPoints()
		MonthlyActivitiesObjectiveTracker.Header.Background:SetPoint("CENTER", 0, 1)

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
		ProfessionsRecipeTracker.Header.Background:SetSize(300, 32)
		ProfessionsRecipeTracker.Header.Background:SetAtlas("UI-QuestTracker-Primary-Objective-Header")
		ProfessionsRecipeTracker.Header.Background:ClearAllPoints()
		ProfessionsRecipeTracker.Header.Background:SetPoint("CENTER", 0, 1)

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
		QuestObjectiveTracker.Header.Background:SetSize(300, 32)
		QuestObjectiveTracker.Header.Background:SetAtlas("UI-QuestTracker-Primary-Objective-Header")
		QuestObjectiveTracker.Header.Background:ClearAllPoints()
		QuestObjectiveTracker.Header.Background:SetPoint("CENTER", 0, 1)

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
		ScenarioObjectiveTracker.Header.Background:SetSize(300, 32)
		ScenarioObjectiveTracker.Header.Background:SetAtlas("UI-QuestTracker-Primary-Objective-Header")
		ScenarioObjectiveTracker.Header.Background:ClearAllPoints()
		ScenarioObjectiveTracker.Header.Background:SetPoint("CENTER", 0, 1)

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
		WorldQuestObjectiveTracker.Header.Background:SetSize(300, 32)
		WorldQuestObjectiveTracker.Header.Background:SetAtlas("UI-QuestTracker-Primary-Objective-Header")
		WorldQuestObjectiveTracker.Header.Background:ClearAllPoints()
		WorldQuestObjectiveTracker.Header.Background:SetPoint("CENTER", 0, 1)

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