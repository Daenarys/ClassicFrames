if not _G.QuestScrollFrame then return end

QuestScrollFrame:SetPoint("TOPLEFT")
QuestScrollFrame.Background:SetPoint("BOTTOMRIGHT", 25, 0)
QuestScrollFrame.BorderFrame:SetPoint("TOPLEFT", -3, 3)
QuestScrollFrame.BorderFrame.Shadow:SetAlpha(0)
QuestScrollFrame.BorderFrame.TopDetail:SetAlpha(0)
QuestScrollFrame.SearchBox:Hide()
QuestScrollFrame.SettingsDropdown:Hide()

QuestMapFrame.DetailsFrame.BorderFrame.TopDetail:SetAlpha(0)
QuestMapFrame.QuestsFrame.CampaignOverview.BorderFrame:SetPoint("TOPLEFT", -3, 3)
QuestMapFrame.QuestsFrame.CampaignOverview.BorderFrame.TopDetail:SetAlpha(0)

ApplySearchBox(QuestScrollFrame.SearchBox)

hooksecurefunc('QuestLogQuests_Update', function()
	for button in _G.QuestScrollFrame.titleFramePool:EnumerateActive() do
		if not button.IsSkinned then
			if button.Checkbox then
				button.Checkbox.CheckMark:SetSize(26, 26)
				button.Checkbox.CheckMark:SetTexture("Interface\\Buttons\\UI-CheckBox-Check")
			end
			button.IsSkinned = true
		end
	end
end)

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