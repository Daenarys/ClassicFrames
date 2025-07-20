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

		PlayerTalentFrame.TitleContainer:ClearAllPoints()
		PlayerTalentFrame.TitleContainer:SetPoint("TOPLEFT", PlayerTalentFrame, "TOPLEFT", 58, 0)
		PlayerTalentFrame.TitleContainer:SetPoint("TOPRIGHT", PlayerTalentFrame, "TOPRIGHT", -58, 0)
	end
end)