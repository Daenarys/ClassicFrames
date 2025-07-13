local CF_EJ_TIER_DATA =
{
	[1] = { backgroundTexture = "Interface\\EncounterJournal\\UI-EJ-Classic"},
	[2] = { backgroundTexture = "Interface\\EncounterJournal\\UI-EJ-BurningCrusade"},
	[3] = { backgroundTexture = "Interface\\EncounterJournal\\UI-EJ-WrathoftheLichKing"},
	[4] = { backgroundTexture = "Interface\\EncounterJournal\\UI-EJ-Cataclysm"},
	[5] = { backgroundTexture = "Interface\\EncounterJournal\\UI-EJ-MistsofPandaria"},
}

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_EncounterJournal" then
		EncounterJournal:HookScript("OnShow", function()
			local tierData = CF_EJ_TIER_DATA[EJ_GetCurrentTier()]
			EncounterJournal.instanceSelect.bg:SetTexture(tierData.backgroundTexture)
		end)

		hooksecurefunc("EncounterJournal_SetupExpansionDropdown", function()
			local tierData = CF_EJ_TIER_DATA[EJ_GetCurrentTier()]
			EncounterJournal.instanceSelect.bg:SetTexture(tierData.backgroundTexture)
		end)

		EncounterJournalInstanceSelect.ScrollBox:ClearAllPoints()
		EncounterJournalInstanceSelect.ScrollBox:SetPoint("TOPLEFT", 17, -58)

		EncounterJournalInstanceSelect.ScrollBar:ClearAllPoints()
		EncounterJournalInstanceSelect.ScrollBar:SetPoint("TOPLEFT", EncounterJournalInstanceSelect.ScrollBox, "TOPRIGHT", 11, 4)
		EncounterJournalInstanceSelect.ScrollBar:SetPoint("BOTTOMLEFT", EncounterJournalInstanceSelect.ScrollBox, "BOTTOMRIGHT", 11, -1)

		EncounterJournalInstanceSelect.ScrollBar.Track.Begin:Hide()
		EncounterJournalInstanceSelect.ScrollBar.Track.End:Hide()
		EncounterJournalInstanceSelect.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarThumb(EncounterJournalInstanceSelect.ScrollBar.Track.Thumb)

		EncounterJournalInstanceSelect.ScrollBar.Back:SetSize(18, 16)
		EncounterJournalInstanceSelect.ScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
		EncounterJournalInstanceSelect.ScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
		EncounterJournalInstanceSelect.ScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
		EncounterJournalInstanceSelect.ScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

		EncounterJournalInstanceSelect.ScrollBar.Forward:SetSize(18, 16)
		EncounterJournalInstanceSelect.ScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
		EncounterJournalInstanceSelect.ScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
		EncounterJournalInstanceSelect.ScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
		EncounterJournalInstanceSelect.ScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")

		EncounterJournalEncounterFrameInfo.BossesScrollBar:SetWidth(20)
		EncounterJournalEncounterFrameInfo.BossesScrollBar:ClearAllPoints()
		EncounterJournalEncounterFrameInfo.BossesScrollBar:SetPoint("TOPLEFT", EncounterJournalEncounterFrameInfo.BossesScrollBox, "TOPRIGHT", 4, -2)
		EncounterJournalEncounterFrameInfo.BossesScrollBar:SetPoint("BOTTOMLEFT", EncounterJournalEncounterFrameInfo.BossesScrollBox, "BOTTOMRIGHT", 4, 2)

		if (EncounterJournalEncounterFrameInfo.BossesScrollBar.BG == nil) then
			EncounterJournalEncounterFrameInfo.BossesScrollBar.BG = EncounterJournalEncounterFrameInfo.BossesScrollBar:CreateTexture(nil, "BACKGROUND")
			EncounterJournalEncounterFrameInfo.BossesScrollBar.BG:SetColorTexture(0, 0, 0, .25)
			EncounterJournalEncounterFrameInfo.BossesScrollBar.BG:SetAllPoints()
		end

		EncounterJournalEncounterFrameInfo.BossesScrollBar.Track.Begin:Hide()
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Track.End:Hide()
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Track.Middle:Hide()

		ApplyScrollBarThumb(EncounterJournalEncounterFrameInfo.BossesScrollBar.Track.Thumb)

		EncounterJournalEncounterFrameInfo.BossesScrollBar.Back:SetSize(18, 16)
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

		EncounterJournalEncounterFrameInfo.BossesScrollBar.Forward:SetSize(18, 16)
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
		EncounterJournalEncounterFrameInfo.BossesScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")

		EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar.Back:SetSize(18, 16)
		EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
		EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
		EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
		EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

		EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar.Forward:SetSize(18, 16)
		EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
		EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
		EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
		EncounterJournalEncounterFrameInstanceFrame.LoreScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")

		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar:SetWidth(20)
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar:ClearAllPoints()
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar:SetPoint("TOPLEFT", EncounterJournalEncounterFrameInfo.LootContainer.ScrollBox, "TOPRIGHT", -1, -5)
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar:SetPoint("BOTTOMLEFT", EncounterJournalEncounterFrameInfo.LootContainer.ScrollBox, "BOTTOMRIGHT", -1, 2)

		if (EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.BG == nil) then
			EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.BG = EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar:CreateTexture(nil, "BACKGROUND")
			EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.BG:SetColorTexture(0, 0, 0, .25)
			EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.BG:SetAllPoints()
		end

		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Track.Begin:Hide()
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Track.End:Hide()
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarThumb(EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Track.Thumb)

		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Back:SetSize(18, 16)
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Forward:SetSize(18, 16)
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
		EncounterJournalEncounterFrameInfo.LootContainer.ScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")

		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar:ClearAllPoints()
		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar:SetPoint("TOPLEFT", EncounterJournalEncounterFrameInfoDetailsScrollFrame, "TOPRIGHT", -25, -2)
		EncounterJournalEncounterFrameInfoDetailsScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", EncounterJournalEncounterFrameInfoDetailsScrollFrame, "BOTTOMRIGHT", -25, -2)

		EncounterJournalInstanceSelect.Title:SetFontObject("QuestFont_Super_Huge")
		EncounterJournalInstanceSelect.Title:SetVertexColor(0.961, 0.824, 0.412)

		ApplyDropDown(EncounterJournalInstanceSelect.ExpansionDropdown)
		ApplyDropDown(EncounterJournalEncounterFrameInfo.LootContainer.filter)
		ApplyDropDown(EncounterJournalEncounterFrameInfo.LootContainer.slotFilter)
		ApplyDropDown(EncounterJournalEncounterFrameInfoDifficulty)
	end
end)