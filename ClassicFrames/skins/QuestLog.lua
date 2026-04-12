if not _G.QuestScrollFrame then return end

QuestScrollFrame:SetPoint("TOPLEFT")
QuestScrollFrame.BorderFrame:SetAlpha(0)
QuestScrollFrame.SearchBox:Hide()
QuestScrollFrame.SettingsDropdown:Hide()

QuestScrollFrame.Background:ClearAllPoints()
QuestScrollFrame.Background:SetPoint("TOPLEFT")
QuestScrollFrame.Background:SetPoint("BOTTOMRIGHT", 22, 0)

QuestMapFrame.VerticalSeparator:SetAlpha(1)
QuestMapFrame.VerticalSeparator:Show()

hooksecurefunc('QuestLogQuests_Update', function()
	for button in _G.QuestScrollFrame.headerFramePool:EnumerateActive() do
		if not button.IsSkinned then
			button:GetNormalTexture():SetAlpha(0)
			button:GetHighlightTexture():SetAlpha(0)
			if button.ButtonText then
				button.ButtonText:ClearAllPoints()
				button.ButtonText:SetPoint("LEFT", button.CollapseButton, "RIGHT", 5, 0)
			end
			if button.CollapseButton then
				button.CollapseButton:ClearAllPoints()
				button.CollapseButton:SetPoint("LEFT", -4, 0)
				hooksecurefunc(button.CollapseButton, "UpdateCollapsedState", function(self, collapsed)
					local atlas = collapsed and "Campaign_HeaderIcon_Closed" or "Campaign_HeaderIcon_Open"
					self.Icon:SetSize(20, 20)
					self.Icon:SetAtlas(atlas)
					self:SetHighlightTexture("Interface\\Buttons\\UI-PlusButton-Hilight", "ADD")
				end)
			end
			button.IsSkinned = true
		end
	end

	for button in _G.QuestScrollFrame.titleFramePool:EnumerateActive() do
		if not button.IsSkinned then
			if button.Checkbox then
				button.Checkbox:Hide()
			end
			if button.HighlightTexture then
				button.HighlightTexture:SetAlpha(0)
			end
			button.IsSkinned = true
		end
	end
end)

hooksecurefunc(QuestMapFrame, "ValidateTabs", function(self)
	self.QuestsTab:Hide()
	self.EventsTab:Hide()
	self.MapLegendTab:Hide()
end)

hooksecurefunc("QuestMapFrame_UpdateQuestSessionState", function(self)
	if self.QuestSessionManagement:IsShown() then
		self.ContentsAnchor:SetPoint("BOTTOM", self.QuestSessionManagement, "TOP", 0, 5)
	else
		self.ContentsAnchor:SetPoint("BOTTOM", self, "BOTTOM")
	end
end)

hooksecurefunc(QuestScrollFrame, "UpdateBackground", function(self)
	if (self.Background:GetAtlas() == "QuestLog-main-background") then
		self.Background:SetAtlas("QuestLogBackground")
	elseif (self.Background:GetAtlas() == "QuestLog-empty-quest-background") then
		self.Background:SetAtlas("NoQuestsBackground")
	end
end)