if not _G.ObjectiveTrackerFrame then return end

local function SetCollapsed(self, collapsed)
	self.MinimizeButton:SetNormalTexture("Interface\\Buttons\\QuestTrackerButtons")
	self.MinimizeButton:SetPushedTexture("Interface\\Buttons\\QuestTrackerButtons")
	if collapsed then
		self.MinimizeButton:GetNormalTexture():SetTexCoord(0.273438, 0.390625, 0.765625, 0.984375)
		self.MinimizeButton:GetPushedTexture():SetTexCoord(0.273438, 0.390625, 0.515625, 0.734375)
	else
		self.MinimizeButton:GetNormalTexture():SetTexCoord(0.140625, 0.257812, 0.546875, 0.765625)
		self.MinimizeButton:GetPushedTexture():SetTexCoord(0.0078125, 0.125, 0.546875, 0.765625)
	end
end

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
	local function ObjectiveTracker_Collapse()
		ObjectiveTrackerFrame.collapsed = true
		for i = 1, #trackers do
			local tracker = trackers[i]
			if tracker then
				tracker.ContentsFrame:Hide()
				tracker.Header.Background:Hide()
				tracker.Header.Text:Hide()
			end
		end
		tracker.Header.CfTitle:Show()
	end

	local function ObjectiveTracker_Expand()
		ObjectiveTrackerFrame.collapsed = nil
		for i = 1, #trackers do
			local tracker = trackers[i]
			if tracker then
				tracker.ContentsFrame:Show()
				tracker.Header.Background:Show()
				tracker.Header.Text:Show()
			end
		end
		tracker.Header.CfTitle:Hide()
	end

	local function ObjectiveTracker_MinimizeButton_OnClick(self)
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON);
		if ( ObjectiveTrackerFrame.collapsed ) then
			ObjectiveTracker_Expand()
		else
			ObjectiveTracker_Collapse()
		end
	end

	tracker.ContentsFrame:SetPoint("RIGHT", -8, 0)
	tracker.Header.Background:SetAtlas("Objective-Header", true)
	tracker.Header.Background:SetPoint("TOPLEFT", -19, 14)
	tracker.Header.Text:SetPoint("LEFT", 14, 0)
	tracker.Header.MinimizeButton:SetSize(15, 14)
	tracker.Header.MinimizeButton:SetPoint("RIGHT", -6, 1)
	tracker.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Red-Highlight", "ADD")
	tracker.Header.MinimizeButton:HookScript("OnClick", ObjectiveTracker_MinimizeButton_OnClick)
	SetCollapsed(tracker.Header, _G.ObjectiveTrackerFrame.isCollapsed)
	hooksecurefunc(tracker.Header, 'SetCollapsed', SetCollapsed)

	local CfTitle = tracker.Header:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	tracker.Header.CfTitle = CfTitle
	CfTitle:SetText(OBJECTIVES_TRACKER_LABEL)
	CfTitle:SetPoint("RIGHT", tracker.Header.MinimizeButton, "LEFT", -3, 1)
	CfTitle:Hide()
end

hooksecurefunc(ObjectiveTrackerContainerMixin, "Update", function(self)
	if self.Header then
		self.Header:Hide()
	end

	local prevModule = nil
	for i, module in ipairs(self.modules) do
		local heightUsed = module:GetContentsHeight()
		if heightUsed > 0 then
			if prevModule then
				module:SetPoint("TOP", prevModule, "BOTTOM", 0, -self.moduleSpacing)
				module.Header.MinimizeButton:Hide()
			else
				module:SetPoint("TOP")
				module.Header.MinimizeButton:Show()
			end
			prevModule = module
		end
	end
end)

hooksecurefunc(ScenarioObjectiveTracker.StageBlock, "UpdateStageBlock", function(block, _, _, _, _, flags)
	if (block.NormalBG:GetAtlas() == "evergreen-scenario-trackerheader") then
		block.NormalBG:SetAtlas("ScenarioTrackerToast", true)
	elseif (block.NormalBG:GetAtlas() == "thewarwithin-scenario-trackerheader") then
		block.NormalBG:SetAtlas("dragonflight-scenario-TrackerHeader", true)
	elseif (block.NormalBG:GetAtlas() == "delves-scenario-TrackerHeader") then
		block.NormalBG:SetAtlas("dragonflight-scenario-TrackerHeader", true)
	end
	block.NormalBG:SetPoint("TOPLEFT", 0, -1)
	block.FinalBG:SetAtlas("ScenarioTrackerToast-FinalFiligree", true)
	block.FinalBG:ClearAllPoints()
	block.FinalBG:SetPoint("TOPLEFT", 4, -5)
	block.Stage:SetFontObject("QuestTitleFont")
	if bit.band(flags, SCENARIO_FLAG_SUPRESS_STAGE_TEXT) == SCENARIO_FLAG_SUPRESS_STAGE_TEXT then
		block.Stage:SetSize(172, 36)
		block.Stage:SetPoint("TOPLEFT", 14, -19)
	else
		block.Stage:SetSize(172, 18)
		if block.Name:GetStringWidth() > block.Name:GetWrappedWidth() then
			block.Stage:SetPoint("TOPLEFT", 14, -11)
		else
			block.Stage:SetPoint("TOPLEFT", 14, -19)
		end
	end
end)

hooksecurefunc(ScenarioObjectiveTracker.StageBlock, "UpdateWidgetRegistration", function(block)
	if block.WidgetContainer.widgetFrames then
		for _, widgetFrame in pairs(block.WidgetContainer.widgetFrames) do
			if widgetFrame.Frame then
				if (widgetFrame.Frame:GetAtlas() == "evergreen-scenario-frame") then
					block.WidgetContainer:SetPoint("TOPLEFT", -2, 0)
				elseif (widgetFrame.Frame:GetAtlas() == "thewarwithin-scenario-frame") then
					block.WidgetContainer:SetPoint("TOPLEFT", -7, 2)
				elseif (widgetFrame.Frame:GetAtlas() == "delves-scenario-frame") then
					block.WidgetContainer:SetPoint("TOPLEFT", -7, 2)
				else
					block.WidgetContainer:SetPoint("TOPLEFT", 0, -1)
				end
			end
		end
	end
end)