if not _G.ObjectiveTrackerFrame then return end

ObjectiveTrackerFrame:SetWidth(235)
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
	tracker:SetWidth(235)
	tracker.ContentsFrame:SetPoint("LEFT", -10, 0)
	tracker.ContentsFrame:SetPoint("RIGHT", 10, 0)
	tracker.Header:SetSize(235, 25)
	tracker.Header.Background:SetAtlas("Objective-Header", true)
	tracker.Header.Background:ClearAllPoints()
	tracker.Header.Background:SetPoint("TOPLEFT", -29, 14)
	tracker.Header.Text:ClearAllPoints()
	tracker.Header.Text:SetPoint("LEFT", 4, -1)

	hooksecurefunc(tracker, "GetProgressBar", function(self, key)
		local progressBar = self.usedProgressBars[key]
		local bar = progressBar and progressBar.Bar

		if self == ScenarioObjectiveTracker then
			if bar and not bar.BorderMid then
				bar:ClearAllPoints()
				bar:SetPoint("LEFT", -1, 1)
			end
		elseif self == WorldQuestObjectiveTracker then
			if bar and not bar.BorderMid then
				bar:ClearAllPoints()
				bar:SetPoint("LEFT", -10, 5)
			end
		end
	end)
end

if ScenarioObjectiveTracker.MawBuffsBlock.Container then
	ScenarioObjectiveTracker.MawBuffsBlock.Container:SetPoint("TOPRIGHT", -12, 1)
end

hooksecurefunc(ObjectiveTrackerFrame, "AnchorSelectionFrame", function(self)
	self.Selection:SetPoint("TOPLEFT", -17, -38)
end)

hooksecurefunc(ObjectiveTrackerFrame, "Update", function(self)
	if not self.modules then
		return
	end

	for i, module in ipairs(self.modules) do
		module.Header.MinimizeButton:SetSize(15, 14)
		module.Header.MinimizeButton:SetPoint("RIGHT")
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

hooksecurefunc(ObjectiveTrackerUIWidgetContainer, "AttachToBlockAndShow", function(self)
	self:SetPoint("TOP", -12, 0)
end)

hooksecurefunc(ScenarioObjectiveTracker, "LayoutBlock", function(block)
	for _, child in next, { block.ContentsFrame:GetChildren() } do
		if child == block.ChallengeModeBlock then
			child:SetPoint("TOP", 0, -2)
			child:SetPoint("RIGHT", -10, 0)
		else
			child:SetPoint("LEFT", 31, 0)
		end
	end
end)

hooksecurefunc(ScenarioObjectiveTracker.StageBlock, "UpdateStageBlock", function(block)
	if (block.NormalBG:GetAtlas() == "evergreen-scenario-trackerheader") then
		block.NormalBG:SetAtlas("ScenarioTrackerToast", true)
		block.NormalBG:ClearAllPoints()
		block.NormalBG:SetPoint("TOPLEFT", -11, -2)
	elseif (block.NormalBG:GetAtlas() == "thewarwithin-scenario-trackerheader") then
		block.NormalBG:SetWidth(257)
		block.NormalBG:ClearAllPoints()
		block.NormalBG:SetPoint("TOPLEFT", -18, 1)
	elseif (block.NormalBG:GetAtlas() == "delves-scenario-TrackerHeader") then
		block.NormalBG:SetWidth(258)
		block.NormalBG:ClearAllPoints()
		block.NormalBG:SetPoint("TOPLEFT", -18, 1)
	else
		block.NormalBG:ClearAllPoints()
		block.NormalBG:SetPoint("TOPLEFT", -11, -2)
	end
	block.FinalBG:SetAtlas("ScenarioTrackerToast-FinalFiligree", true)
	block.FinalBG:ClearAllPoints()
	block.FinalBG:SetPoint("TOPLEFT", -7, -6)
	block.Stage:ClearAllPoints()
	block.Stage:SetPoint("TOPLEFT", 4, -19)
end)

hooksecurefunc(ScenarioObjectiveTracker.StageBlock, "UpdateWidgetRegistration", function(block)
	if block.WidgetContainer.widgetFrames then
		for _, widgetFrame in pairs(block.WidgetContainer.widgetFrames) do
			if widgetFrame.Frame then
				if (widgetFrame.Frame:GetAtlas() == "evergreen-scenario-frame") then
					block.WidgetContainer:ClearAllPoints()
					block.WidgetContainer:SetPoint("TOPLEFT", -18, 1)
				elseif (widgetFrame.Frame:GetAtlas() == "thewarwithin-scenario-frame") then
					block.WidgetContainer:ClearAllPoints()
					block.WidgetContainer:SetPoint("TOPLEFT", -18, 1)
				elseif (widgetFrame.Frame:GetAtlas() == "delves-scenario-frame") then
					block.WidgetContainer:ClearAllPoints()
					block.WidgetContainer:SetPoint("TOPLEFT", -18, 1)
				else
					block.WidgetContainer:ClearAllPoints()
					block.WidgetContainer:SetPoint("TOPLEFT", -11, -2)
				end
			end
		end
	end
end)

ScenarioObjectiveTracker.StageBlock:HookScript("OnEnter", function(self)
	GameTooltip:SetPoint("RIGHT", self, "LEFT", -11, -2)
end)
