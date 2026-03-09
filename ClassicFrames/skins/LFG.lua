if not _G.PVEFrame then return end

ApplyDropDown(LFDQueueFrameTypeDropdown)
ApplyDropDown(RaidFinderQueueFrameSelectionDropdown)
ApplyDropDown(LFGListEntryCreationGroupDropdown)
ApplyDropDown(LFGListEntryCreationActivityDropdown)
ApplyDropDown(LFGListEntryCreationPlayStyleDropdown)
ApplyFilterDropDown(LFGListFrame.SearchPanel.FilterButton)

LFDQueueFrameTypeDropdown:SetWidth(195)
LFDQueueFrameTypeDropdown:SetPoint("BOTTOMLEFT", 135, 291)
LFDQueueFrameTypeDropdown.Text:SetJustifyH("RIGHT")
LFDQueueFrameTypeDropdown.Text:SetPoint("TOPLEFT", 9, -7)
LFDQueueFrameTypeDropdownName:SetPoint("RIGHT", LFDQueueFrameTypeDropdown, "LEFT", -18, 0)

RaidFinderQueueFrameSelectionDropdown:SetWidth(195)
RaidFinderQueueFrameSelectionDropdown:SetPoint("BOTTOMLEFT", 135, 293)
RaidFinderQueueFrameSelectionDropdown.Text:SetJustifyH("RIGHT")
RaidFinderQueueFrameSelectionDropdown.Text:SetPoint("TOPLEFT", 9, -6)
RaidFinderQueueFrameSelectionDropdownName:SetPoint("RIGHT", RaidFinderQueueFrameSelectionDropdown, "LEFT", -18, 0)

hooksecurefunc("GroupFinderFrame_EvaluateButtonVisibility", function(self)
	if not PlayerIsTimerunning() then
		self.groupButton1:SetPoint("TOPLEFT", self, "TOPLEFT", 10, -70)
		self.groupButton2:SetPoint("TOP", self.groupButton1, "BOTTOM", 0, -23)
		self.groupButton3:SetPoint("TOP", self.groupButton2, "BOTTOM", 0, -23)
	end
end)

hooksecurefunc('LFGDungeonReadyPopup_Update', function()
	local proposalExists, id, typeID, subtypeID, name, backgroundTexture, role, hasResponded, totalEncounters, completedEncounters, numMembers, isLeader, _, _, isSilent = GetLFGProposal()
	
	if ( subtypeID == LFG_SUBTYPEID_SCENARIO ) then
		LFGDungeonReadyDialog.background:SetDrawLayer("BACKGROUND")
		if ( LFG_IsHeroicScenario(id) ) then
			LFGDungeonReadyDialog.background:SetTexture("Interface\\LFGFrame\\UI-LFG-BACKGROUND-HeroicScenario")
		else
			LFGDungeonReadyDialog.background:SetTexture("Interface\\LFGFrame\\UI-LFG-BACKGROUND-RandomScenario")
		end
	end
end)

hooksecurefunc("LFGRewardsFrame_UpdateFrame", function(parentFrame, dungeonID)
	if (dungeonID == 2634 or dungeonID == 744 or dungeonID == 995 or dungeonID == 1146 or dungeonID == 1453 or dungeonID == 1971 or dungeonID == 2274 or dungeonID == 2874 or dungeonID == 3076) then
		parentFrame.title:SetText(LFG_TYPE_RANDOM_TIMEWALKER_DUNGEON)
		parentFrame.description:SetText(LFD_TIMEWALKER_RANDOM_EXPLANATION)
	end

	parentFrame.title:ClearAllPoints()
	parentFrame.title:SetPoint("TOPLEFT", 10, -8)
end)