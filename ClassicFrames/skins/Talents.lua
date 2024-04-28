local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TalentUI" then
		PlayerTalentFramePortrait:SetSize(60, 60)
		PlayerTalentFramePortrait:ClearAllPoints()
		PlayerTalentFramePortrait:SetPoint("TOPLEFT", -6, 7)
	end
end)