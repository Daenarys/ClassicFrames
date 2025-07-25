if not _G.WatchFrame then return end

hooksecurefunc("QuestPOI_UpdateButtonStyle", function(poiButton)
	if ( WorldMapFrame and WorldMapFrame:IsShown() ) then
		return
	end

	local isSuperTracked = poiButton.questID == GetSuperTrackedQuestID()
	if isSuperTracked then
		poiButton:GetNormalTexture():SetTexCoord(0.500, 0.625, 0.375, 0.5)
		poiButton:GetPushedTexture():SetTexCoord(0.375, 0.500, 0.375, 0.5)
		if poiButton.style == "numeric" then
			poiButton.Display.Icon:SetTexCoord(QuestPOI_CalculateNumericTexCoords(poiButton.index, QUEST_POI_COLOR_BLACK))
		end
		poiButton.Glow:Show()
	else
		if poiButton.style == "numeric" then
			poiButton:GetNormalTexture():SetTexCoord(0.875, 1.00, 0.375, 0.5)
			poiButton:GetPushedTexture():SetTexCoord(0.750, 0.875, 0.375, 0.5)
			poiButton.Display.Icon:SetTexCoord(QuestPOI_CalculateNumericTexCoords(poiButton.index, QUEST_POI_COLOR_YELLOW))
		else
			poiButton:GetNormalTexture():SetTexCoord(0.500, 0.625, 0.875, 1)
			poiButton:GetPushedTexture():SetTexCoord(0.500, 0.625, 0.875, 1)
		end
	end

	if poiButton.Glow then
		poiButton.Glow:SetShown(isSuperTracked)
	end
end)

hooksecurefunc("QuestPOIButton_OnClick", function(self)
	SetSuperTrackedQuestID(self.questID)
end)