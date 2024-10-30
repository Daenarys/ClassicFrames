local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TimeManager" then
		TimeManagerFrame:SetWidth(190)
		TimeManagerAlarmMessageEditBox:SetWidth(160)
		TimeManagerMilitaryTimeCheck:ClearAllPoints()
		TimeManagerMilitaryTimeCheck:SetPoint("TOPLEFT", 155, -190)
	end
end)