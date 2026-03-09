if not _G.ObjectiveTrackerFrame then return end

local function SetCollapsed(self, collapsed)
	self.MinimizeButton:SetNormalTexture("Interface\\Buttons\\QuestTrackerButtons")
	self.MinimizeButton:SetPushedTexture("Interface\\Buttons\\QuestTrackerButtons")
	if collapsed then
		self.Title:Show()
		self.MinimizeButton:GetNormalTexture():SetTexCoord(0.273438, 0.390625, 0.765625, 0.984375)
		self.MinimizeButton:GetPushedTexture():SetTexCoord(0.273438, 0.390625, 0.515625, 0.734375)
	else
		self.Title:Hide()
		self.MinimizeButton:GetNormalTexture():SetTexCoord(0.140625, 0.257812, 0.546875, 0.765625)
		self.MinimizeButton:GetPushedTexture():SetTexCoord(0.0078125, 0.125, 0.546875, 0.765625)
	end
end

if ObjectiveTrackerFrame.Header then
	ObjectiveTrackerFrame.Header.Background:Hide()
	ObjectiveTrackerFrame.Header.Text:Hide()
	ObjectiveTrackerFrame.Header.MinimizeButton:SetSize(15, 14)
	ObjectiveTrackerFrame.Header.MinimizeButton:SetPoint("RIGHT", -6, 4)
	ObjectiveTrackerFrame.Header.MinimizeButton:SetHighlightAtlas("UI-QuestTrackerButton-Red-Highlight", "ADD")

	local title = ObjectiveTrackerFrame.Header:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ObjectiveTrackerFrame.Header.Title = title
	title:SetText(OBJECTIVES_TRACKER_LABEL)
	title:SetPoint("RIGHT", ObjectiveTrackerFrame.Header.MinimizeButton, "LEFT", -2, 1)

	SetCollapsed(ObjectiveTrackerFrame.Header, _G.ObjectiveTrackerFrame.isCollapsed)
	hooksecurefunc(ObjectiveTrackerFrame.Header, 'SetCollapsed', SetCollapsed)
end

local function HandleQuestIcons(_, block)
	if not block.ItemButton then return end

	if not block.ItemButton.IsSkinned then
		block.ItemButton:SetNormalTexture("Interface\\Buttons\\UI-Quickslot2")
		block.ItemButton:SetPushedTexture("Interface\\Buttons\\UI-Quickslot-Depress")
		block.ItemButton:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")

		if block.ItemButton.Cooldown then
			block.ItemButton.Cooldown:SetHideCountdownNumbers(true)
		end

		if block.ItemButton.GlowAnim then
			hooksecurefunc(block.ItemButton.GlowAnim, "BeginPlaying", function(self)
				self.region:Hide()
				self:SetLooping("NONE")
			end)
		end

		block.ItemButton.IsSkinned = true
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
	tracker.ContentsFrame:SetPoint("RIGHT", -8, 0)
	tracker.Header.Background:SetAtlas("Objective-Header", true)
	tracker.Header.Background:SetPoint("TOPLEFT", -19, 14)
	tracker.Header.Text:SetPoint("LEFT", 14, 0)
	hooksecurefunc(tracker, 'AddBlock', HandleQuestIcons)
end

hooksecurefunc(ObjectiveTrackerContainerMixin, "Update", function(self)
	local prevModule = nil
	for i, module in ipairs(self.modules) do
		local heightUsed = module:GetContentsHeight()
		if heightUsed > 0 then
			if prevModule then
				module:SetPoint("TOP", prevModule, "BOTTOM", 0, -self.moduleSpacing)
			else
				module:SetPoint("TOP")
			end
			prevModule = module
		end
		if module.Header.MinimizeButton then
			module.Header.MinimizeButton:Hide()
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
	elseif (block.NormalBG:GetAtlas() == "midnight-scenario-trackerheader") then
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
				elseif (widgetFrame.Frame:GetAtlas() == "midnight-scenario-frame") then
					block.WidgetContainer:SetPoint("TOPLEFT", 0, -2)
				elseif (widgetFrame.Frame:GetAtlas() == "delves-scenario-frame") then
					block.WidgetContainer:SetPoint("TOPLEFT", -7, 2)
				else
					block.WidgetContainer:SetPoint("TOPLEFT", 0, -1)
				end
			end
		end
	end
end)