if not _G.ObjectiveTrackerFrame then return end

hooksecurefunc(ObjectiveTrackerFrame, "Update", function(self)
	self.Header:Hide()

	if AchievementObjectiveTracker then
		AchievementObjectiveTracker.Header.Background:SetSize(300, 32)
		AchievementObjectiveTracker.Header.Background:SetAtlas("UI-QuestTracker-Primary-Objective-Header")
		AchievementObjectiveTracker.Header.Background:ClearAllPoints()
		AchievementObjectiveTracker.Header.Background:SetPoint("CENTER", 0, 1)

		AchievementObjectiveTracker.Header.MinimizeButton:SetSize(14, 14)
		AchievementObjectiveTracker.Header.MinimizeButton:ClearAllPoints()
		AchievementObjectiveTracker.Header.MinimizeButton:SetPoint("RIGHT", -6, 1)
		AchievementObjectiveTracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")

		if AchievementObjectiveTracker:IsCollapsed() then
			AchievementObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Expand-All")
			AchievementObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Expand-All-Pressed")
		else
			AchievementObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Collapse-All")
			AchievementObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Collapse-All-Pressed")
		end
	end

	if AdventureObjectiveTracker then
		AdventureObjectiveTracker.Header.Background:SetSize(300, 32)
		AdventureObjectiveTracker.Header.Background:SetAtlas("UI-QuestTracker-Primary-Objective-Header")
		AdventureObjectiveTracker.Header.Background:ClearAllPoints()
		AdventureObjectiveTracker.Header.Background:SetPoint("CENTER", 0, 1)

		AdventureObjectiveTracker.Header.MinimizeButton:SetSize(14, 14)
		AdventureObjectiveTracker.Header.MinimizeButton:ClearAllPoints()
		AdventureObjectiveTracker.Header.MinimizeButton:SetPoint("RIGHT", -6, 1)
		AdventureObjectiveTracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")

		if AdventureObjectiveTracker:IsCollapsed() then
			AdventureObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Expand-All")
			AdventureObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Expand-All-Pressed")
		else
			AdventureObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Collapse-All")
			AdventureObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Collapse-All-Pressed")
		end
	end

	if BonusObjectiveTracker then
		BonusObjectiveTracker.Header.Background:SetSize(300, 32)
		BonusObjectiveTracker.Header.Background:SetAtlas("UI-QuestTracker-Primary-Objective-Header")
		BonusObjectiveTracker.Header.Background:ClearAllPoints()
		BonusObjectiveTracker.Header.Background:SetPoint("CENTER", 0, 1)

		BonusObjectiveTracker.Header.MinimizeButton:SetSize(14, 14)
		BonusObjectiveTracker.Header.MinimizeButton:ClearAllPoints()
		BonusObjectiveTracker.Header.MinimizeButton:SetPoint("RIGHT", -6, 1)
		BonusObjectiveTracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")

		if BonusObjectiveTracker:IsCollapsed() then
			BonusObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Expand-All")
			BonusObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Expand-All-Pressed")
		else
			BonusObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Collapse-All")
			BonusObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Collapse-All-Pressed")
		end
	end

	if CampaignQuestObjectiveTracker then
		CampaignQuestObjectiveTracker.Header.Background:SetSize(300, 32)
		CampaignQuestObjectiveTracker.Header.Background:SetAtlas("UI-QuestTracker-Primary-Objective-Header")
		CampaignQuestObjectiveTracker.Header.Background:ClearAllPoints()
		CampaignQuestObjectiveTracker.Header.Background:SetPoint("CENTER", 0, 1)

		CampaignQuestObjectiveTracker.Header.MinimizeButton:SetSize(14, 14)
		CampaignQuestObjectiveTracker.Header.MinimizeButton:ClearAllPoints()
		CampaignQuestObjectiveTracker.Header.MinimizeButton:SetPoint("RIGHT", -6, 1)
		CampaignQuestObjectiveTracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")

		if CampaignQuestObjectiveTracker:IsCollapsed() then
			CampaignQuestObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Expand-All")
			CampaignQuestObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Expand-All-Pressed")
		else
			CampaignQuestObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Collapse-All")
			CampaignQuestObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Collapse-All-Pressed")
		end
	end

	if MonthlyActivitiesObjectiveTracker then
		MonthlyActivitiesObjectiveTracker.Header.Background:SetSize(300, 32)
		MonthlyActivitiesObjectiveTracker.Header.Background:SetAtlas("UI-QuestTracker-Primary-Objective-Header")
		MonthlyActivitiesObjectiveTracker.Header.Background:ClearAllPoints()
		MonthlyActivitiesObjectiveTracker.Header.Background:SetPoint("CENTER", 0, 1)

		MonthlyActivitiesObjectiveTracker.Header.MinimizeButton:SetSize(14, 14)
		MonthlyActivitiesObjectiveTracker.Header.MinimizeButton:ClearAllPoints()
		MonthlyActivitiesObjectiveTracker.Header.MinimizeButton:SetPoint("RIGHT", -6, 1)
		MonthlyActivitiesObjectiveTracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")

		if MonthlyActivitiesObjectiveTracker:IsCollapsed() then
			MonthlyActivitiesObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Expand-All")
			MonthlyActivitiesObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Expand-All-Pressed")
		else
			MonthlyActivitiesObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Collapse-All")
			MonthlyActivitiesObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Collapse-All-Pressed")
		end
	end

	if ProfessionsRecipeTracker then
		ProfessionsRecipeTracker.Header.Background:SetSize(300, 32)
		ProfessionsRecipeTracker.Header.Background:SetAtlas("UI-QuestTracker-Primary-Objective-Header")
		ProfessionsRecipeTracker.Header.Background:ClearAllPoints()
		ProfessionsRecipeTracker.Header.Background:SetPoint("CENTER", 0, 1)

		ProfessionsRecipeTracker.Header.MinimizeButton:SetSize(14, 14)
		ProfessionsRecipeTracker.Header.MinimizeButton:ClearAllPoints()
		ProfessionsRecipeTracker.Header.MinimizeButton:SetPoint("RIGHT", -6, 1)
		ProfessionsRecipeTracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")

		if ProfessionsRecipeTracker:IsCollapsed() then
			ProfessionsRecipeTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Expand-All")
			ProfessionsRecipeTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Expand-All-Pressed")
		else
			ProfessionsRecipeTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Collapse-All")
			ProfessionsRecipeTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Collapse-All-Pressed")
		end
	end

	if QuestObjectiveTracker then
		QuestObjectiveTracker.Header.Background:SetSize(300, 32)
		QuestObjectiveTracker.Header.Background:SetAtlas("UI-QuestTracker-Primary-Objective-Header")
		QuestObjectiveTracker.Header.Background:ClearAllPoints()
		QuestObjectiveTracker.Header.Background:SetPoint("CENTER", 0, 1)

		QuestObjectiveTracker.Header.MinimizeButton:SetSize(14, 14)
		QuestObjectiveTracker.Header.MinimizeButton:ClearAllPoints()
		QuestObjectiveTracker.Header.MinimizeButton:SetPoint("RIGHT", -6, 1)
		QuestObjectiveTracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")

		if QuestObjectiveTracker:IsCollapsed() then
			QuestObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Expand-All")
			QuestObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Expand-All-Pressed")
		else
			QuestObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Collapse-All")
			QuestObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Collapse-All-Pressed")
		end
	end

	if ScenarioObjectiveTracker then
		ScenarioObjectiveTracker.Header.Background:SetSize(300, 32)
		ScenarioObjectiveTracker.Header.Background:SetAtlas("UI-QuestTracker-Primary-Objective-Header")
		ScenarioObjectiveTracker.Header.Background:ClearAllPoints()
		ScenarioObjectiveTracker.Header.Background:SetPoint("CENTER", 0, 1)

		ScenarioObjectiveTracker.Header.MinimizeButton:SetSize(14, 14)
		ScenarioObjectiveTracker.Header.MinimizeButton:ClearAllPoints()
		ScenarioObjectiveTracker.Header.MinimizeButton:SetPoint("RIGHT", -6, 1)
		ScenarioObjectiveTracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")

		if ScenarioObjectiveTracker:IsCollapsed() then
			ScenarioObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Expand-All")
			ScenarioObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Expand-All-Pressed")
		else
			ScenarioObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Collapse-All")
			ScenarioObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Collapse-All-Pressed")
		end
	end

	if WorldQuestObjectiveTracker then
		WorldQuestObjectiveTracker.Header.Background:SetSize(300, 32)
		WorldQuestObjectiveTracker.Header.Background:SetAtlas("UI-QuestTracker-Primary-Objective-Header")
		WorldQuestObjectiveTracker.Header.Background:ClearAllPoints()
		WorldQuestObjectiveTracker.Header.Background:SetPoint("CENTER", 0, 1)

		WorldQuestObjectiveTracker.Header.MinimizeButton:SetSize(14, 14)
		WorldQuestObjectiveTracker.Header.MinimizeButton:ClearAllPoints()
		WorldQuestObjectiveTracker.Header.MinimizeButton:SetPoint("RIGHT", -6, 1)
		WorldQuestObjectiveTracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Highlight", "ADD")

		if WorldQuestObjectiveTracker:IsCollapsed() then
			WorldQuestObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Expand-All")
			WorldQuestObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Expand-All-Pressed")
		else
			WorldQuestObjectiveTracker.Header.MinimizeButton:SetNormalAtlas("UI-QuestTrackerButton-Collapse-All")
			WorldQuestObjectiveTracker.Header.MinimizeButton:SetPushedAtlas("UI-QuestTrackerButton-Collapse-All-Pressed")
		end
	end
end)