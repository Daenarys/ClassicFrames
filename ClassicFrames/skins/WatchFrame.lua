if not _G.WatchFrame then return end

hooksecurefunc("WatchFrame_DisplayTrackedQuests", function()
	local numQuestWatches = GetNumQuestWatches()

	-- if supertracked quest is not in the quest log anymore, stop supertracking it
	if ( GetQuestLogIndexByID(GetSuperTrackedQuestID()) == 0 ) then
		SetSuperTrackedQuestID(0)
	end

	for i = 1, numQuestWatches do
		local questIndex = GetQuestIndexForWatch(i)
		local title, level, questTag, isHeader, isCollapsed, isComplete, frequency, questID, startEvent, displayQuestID, isOnMap, hasLocalPOI, isTask, isBounty, isStory, isHidden, isScaling = GetQuestLogTitle(questIndex)

		if (GetSuperTrackedQuestID() == 0) then
			SetSuperTrackedQuestID(questID)
		end
	end

	local trackedQuestID = GetSuperTrackedQuestID()
	if ( trackedQuestID ) then
		QuestPOI_SelectButtonByQuestId(WatchFrameLines, trackedQuestID)
	end
end)

hooksecurefunc("QuestPOI_UpdateButtonStyle", function(poiButton)
	local isSuperTracked = poiButton.questID == GetSuperTrackedQuestID()

	if isSuperTracked then
		poiButton.selected = true
	else
		poiButton.selected = nil
	end
end)

hooksecurefunc("QuestPOIButton_OnClick", function(self)
	SetSuperTrackedQuestID(self.questID)
end)