if not _G.QuestScrollFrame then return end

QuestScrollFrame.SearchBox:Hide()
QuestScrollFrame.BorderFrame.Shadow:SetAlpha(0)
QuestScrollFrame.BorderFrame.TopDetail:SetAlpha(0)
QuestMapFrame.CampaignOverview.BorderFrame.TopDetail:SetAlpha(0)
QuestMapFrame.DetailsFrame.BorderFrame.TopDetail:SetAlpha(0)
QuestMapFrame.SettingsDropdown:Hide()

QuestScrollFrame:SetPoint("TOPLEFT")
QuestScrollFrame.Background:SetPoint("BOTTOMRIGHT", 25, 0)
QuestScrollFrame.BorderFrame:SetPoint("TOPLEFT", -3, 3)
QuestMapFrame.CampaignOverview.BorderFrame:SetPoint("TOPLEFT", -3, 3)

ApplySearchBox(QuestScrollFrame.SearchBox)

hooksecurefunc(QuestScrollFrame, 'UpdateBackground', function(self)
	if (self.Background:GetAtlas() == "QuestLog-main-background") then
		self.Background:SetAtlas("QuestLogBackground")
	elseif (self.Background:GetAtlas() == "QuestLog-empty-quest-background") then
		self.Background:SetAtlas("NoQuestsBackground")
	end
end)