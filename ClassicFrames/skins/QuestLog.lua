if not _G.QuestScrollFrame then return end

QuestScrollFrame:SetPoint("TOPLEFT")
QuestScrollFrame.BorderFrame:SetPoint("TOPLEFT", -3, 3)
QuestScrollFrame.BorderFrame.Shadow:SetAlpha(0)
QuestScrollFrame.BorderFrame.TopDetail:SetAlpha(0)
QuestScrollFrame.SearchBox:Hide()
QuestScrollFrame.SettingsDropdown:Hide()

QuestMapFrame.DetailsFrame.BorderFrame.TopDetail:SetAlpha(0)
QuestMapFrame.QuestsFrame.CampaignOverview.BorderFrame:SetPoint("TOPLEFT", -3, 3)
QuestMapFrame.QuestsFrame.CampaignOverview.BorderFrame.TopDetail:SetAlpha(0)

QuestScrollFrame.ScrollBar:ClearAllPoints()
QuestScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestScrollFrame, "TOPRIGHT", 8, -4)
QuestScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestScrollFrame, "BOTTOMRIGHT", 8, -4)

QuestMapDetailsScrollFrame.ScrollBar:ClearAllPoints()
QuestMapDetailsScrollFrame.ScrollBar:SetPoint("TOPLEFT", QuestMapDetailsScrollFrame, "TOPRIGHT", 13, 40)
QuestMapDetailsScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", QuestMapDetailsScrollFrame, "BOTTOMRIGHT", 13, -27)

hooksecurefunc(QuestMapFrame, 'ValidateTabs', function(self)
	self.QuestsTab:Hide()
	self.EventsTab:Hide()
	self.MapLegendTab:Hide()
end)

hooksecurefunc(QuestScrollFrame, 'UpdateBackground', function(self)
	if (self.Background:GetAtlas() == "QuestLog-main-background") then
		self.Background:SetAtlas("QuestLogBackground")
	elseif (self.Background:GetAtlas() == "QuestLog-empty-quest-background") then
		self.Background:SetAtlas("NoQuestsBackground")
	end
end)