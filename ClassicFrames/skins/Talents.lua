local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TalentUI" then
		PlayerTalentFrame.PortraitContainer.CircleMask:Hide()

		PlayerTalentFramePortrait:SetSize(61, 61)
		PlayerTalentFramePortrait:ClearAllPoints()
		PlayerTalentFramePortrait:SetPoint("TOPLEFT", -6, 8)

		PlayerTalentFramePortraitFrame:SetParent(PlayerTalentFrame.PortraitContainer)
		PlayerTalentFramePortraitFrame:SetDrawLayer("OVERLAY", 1)
	end
end)