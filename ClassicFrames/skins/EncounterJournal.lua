local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_EncounterJournal" then
		local function ApplyTierTab(frame)
			frame.Left:SetAlpha(0)
			frame.Middle:SetAlpha(0)
			frame.Right:SetAlpha(0)

			frame.LeftActive:SetAlpha(0)
			frame.MiddleActive:SetAlpha(0)
			frame.RightActive:SetAlpha(0)

			frame.LeftHighlight:SetAlpha(0)
			frame.MiddleHighlight:SetAlpha(0)
			frame.RightHighlight:SetAlpha(0)

			frame.mid:SetTexCoord(0, 1, 0.67382813, 0.74414063)
			frame.left:SetTexCoord(0.81835938, 0.84179688, 0.02246094, 0.05761719)
			frame.right:SetTexCoord(0.84570313, 0.86914063, 0.05957031, 0.09472656)

			frame.midSelect:SetTexCoord(0, 1, 0.59960938, 0.66992188)
			frame.leftSelect:SetTexCoord(0.84570313, 0.86914063, 0.02246094, 0.05761719)
			frame.rightSelect:SetTexCoord(0.87304688, 0.89648438, 0.05957031, 0.09472656)

			frame.midHighlight:SetTexCoord(0, 1, 0.52539063, 0.59570313)
			frame.leftHighlight:SetTexCoord(0.81835938, 0.84179688, 0.05957031, 0.09472656)
			frame.rightHighlight:SetTexCoord(0.87304688, 0.89648438, 0.02246094, 0.05761719)

			frame.selectedGlow:SetTexCoord(0.52343750, 0.64843750, 0.00097656, 0.01562500)

			hooksecurefunc("PanelTemplates_SelectTab", function()
				frame:GetFontString():SetFontObject("GameFontNormalLarge")
			end)
		end

		ApplyTierTab(EncounterJournal.dungeonsTab)
		ApplyTierTab(EncounterJournal.raidsTab)

		EncounterJournal.PortraitContainer:SetFrameLevel(1)
		EncounterJournal.PortraitContainer.CircleMask:Hide()

		EncounterJournalPortrait:SetSize(60, 60)
		EncounterJournalPortrait:ClearAllPoints()
		EncounterJournalPortrait:SetPoint("TOPLEFT", -6, 7)

		EncounterJournal:HookScript("OnShow", function()
			EncounterJournal.raidsTab:ClearAllPoints()
			EncounterJournal.raidsTab:SetPoint("BOTTOMRIGHT", EncounterJournalInstanceSelect, "TOPRIGHT", -35, -45)
			EncounterJournal.dungeonsTab:ClearAllPoints()
			EncounterJournal.dungeonsTab:SetPoint("BOTTOMRIGHT", EncounterJournal.raidsTab, "BOTTOMLEFT", -35, 0)

			EncounterJournal.dungeonsTab:SetWidth(120)
			EncounterJournal.raidsTab:SetWidth(120)

			EncounterJournalInstanceSelect.Title:ClearAllPoints()
			EncounterJournalInstanceSelect.Title:SetPoint("TOPLEFT", 10, -15)

			if EncounterJournal.selectedTab == EncounterJournal.dungeonsTab:GetID() then
				PanelTemplates_SelectTab(EncounterJournal.dungeonsTab)
				EncounterJournal.dungeonsTab:GetFontString():SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
				EncounterJournal.dungeonsTab:SetHeight(36)
				EncounterJournal.dungeonsTab.selectedGlow:SetVertexColor(1, 0.4, 0)
				EncounterJournal.dungeonsTab.selectedGlow:Show()
				EncounterJournal.raidsTab:GetFontString():SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
				EncounterJournal.raidsTab:SetHeight(32)
				EncounterJournal.raidsTab.selectedGlow:Hide()
			elseif EncounterJournal.selectedTab == EncounterJournal.raidsTab:GetID() then
				PanelTemplates_SelectTab(EncounterJournal.raidsTab)
				EncounterJournal.dungeonsTab:GetFontString():SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
				EncounterJournal.dungeonsTab:SetHeight(32)
				EncounterJournal.dungeonsTab.selectedGlow:Hide()
				EncounterJournal.raidsTab:GetFontString():SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
				EncounterJournal.raidsTab:SetHeight(36)
				EncounterJournal.raidsTab.selectedGlow:SetVertexColor(1, 0.4, 0)
				EncounterJournal.raidsTab.selectedGlow:Show()
			end
		end)

		EncounterJournalEncounterFrame:HookScript("OnShow", function()
			EncounterJournal.dungeonsTab:Hide()
			EncounterJournal.raidsTab:Hide()
		end)

		EncounterJournalInstanceSelect:HookScript("OnShow", function()
			EncounterJournal.dungeonsTab:Show()
			EncounterJournal.raidsTab:Show()
		end)

		EncounterJournalInstanceSelect.ExpansionDropdown:Hide()

		EncounterJournalInstanceSelect.ScrollBox:ClearAllPoints()
		EncounterJournalInstanceSelect.ScrollBox:SetPoint("TOPLEFT", 17, -58)

		EncounterJournalInstanceSelect.ScrollBar:ClearAllPoints()
		EncounterJournalInstanceSelect.ScrollBar:SetPoint("TOPLEFT", EncounterJournalInstanceSelect.ScrollBox, "TOPRIGHT", 11, 6)
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

		EncounterJournalInstanceSelect.Title:SetText(EXPANSION_NAME3)
		EncounterJournalInstanceSelect.Title:SetFontObject("QuestFont_Super_Huge")
		EncounterJournalInstanceSelect.Title:SetVertexColor(0.961, 0.824, 0.412)

		hooksecurefunc("EJInstanceSelect_UpdateTitle", function()
			EncounterJournalInstanceSelect.Title:SetText(EXPANSION_NAME3)
			EncounterJournalInstanceSelect.Title:SetFontObject("QuestFont_Super_Huge")
			EncounterJournalInstanceSelect.Title:SetVertexColor(0.961, 0.824, 0.412)
			EncounterJournalInstanceSelect.Title:ClearAllPoints()
			EncounterJournalInstanceSelect.Title:SetPoint("TOPLEFT", 10, -15)

			EncounterJournal.dungeonsTab:SetWidth(120)
			EncounterJournal.raidsTab:SetWidth(120)
		end)

		hooksecurefunc("EJ_ContentTab_Select", function(id)
			if ( id == EncounterJournal.dungeonsTab:GetID() ) then
				EncounterJournal.dungeonsTab:GetFontString():SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
				EncounterJournal.dungeonsTab:SetHeight(36)
				EncounterJournal.dungeonsTab.selectedGlow:SetVertexColor(1, 0.4, 0)
				EncounterJournal.dungeonsTab.selectedGlow:Show()
				EncounterJournal.raidsTab:GetFontString():SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
				EncounterJournal.raidsTab:SetHeight(32)
				EncounterJournal.raidsTab.selectedGlow:Hide()
			elseif ( id == EncounterJournal.raidsTab:GetID() ) then
				EncounterJournal.dungeonsTab:GetFontString():SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
				EncounterJournal.dungeonsTab:SetHeight(32)
				EncounterJournal.dungeonsTab.selectedGlow:Hide()
				EncounterJournal.raidsTab:GetFontString():SetTextColor(NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b)
				EncounterJournal.raidsTab:SetHeight(36)
				EncounterJournal.raidsTab.selectedGlow:SetVertexColor(1, 0.4, 0)
				EncounterJournal.raidsTab.selectedGlow:Show()
			end
		end)

		ApplyDropDown(EncounterJournalInstanceSelect.ExpansionDropdown)
		ApplyDropDown(EncounterJournalEncounterFrameInfo.LootContainer.filter)
		ApplyDropDown(EncounterJournalEncounterFrameInfo.LootContainer.slotFilter)
		ApplyDropDown(EncounterJournalEncounterFrameInfoDifficulty)
	end
end)