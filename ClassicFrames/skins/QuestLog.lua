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

hooksecurefunc(QuestMapFrame, "ValidateTabs", function(self)
	self.QuestsTab:Hide()
	self.EventsTab:Hide()
	self.MapLegendTab:Hide()
end)

hooksecurefunc("QuestMapFrame_UpdateQuestSessionState", function(self)
	if self.QuestSessionManagement:IsShown() then
		self.ContentsAnchor:SetPoint("BOTTOM", self.QuestSessionManagement, "TOP", 0, 5);
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