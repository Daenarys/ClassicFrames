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

local function ReskinQuestIcon(button)
	if not button then return end

	if not button.IsSkinned then
		button:SetNormalTexture("Interface\\Buttons\\UI-Quickslot2")
		button:SetPushedTexture("Interface\\Buttons\\UI-Quickslot-Depress")
		if button.Cooldown then
			button.Cooldown:SetHideCountdownNumbers(true)
		end
		button.IsSkinned = true
	end
end

local function HandleQuestIcons(_, block)
	ReskinQuestIcon(block.ItemButton)
	ReskinQuestIcon(block.itemButton)
end

local trackers = {
	_G.AchievementObjectiveTracker,
	_G.AdventureObjectiveTracker,
	_G.BonusObjectiveTracker,
	_G.CampaignQuestObjectiveTracker,
	_G.InitiativeTasksObjectiveTracker,
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

hooksecurefunc(QuestObjectiveItemButtonMixin, "UpdateInsideBlob", function(self, questID, inside)
	if questID == self:GetAttribute("questID") then
		if inside then
			self.Glow:Hide()
			self.GlowAnim:Stop()
		end
	end
end)