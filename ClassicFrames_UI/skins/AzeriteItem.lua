local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AzeriteUI" then
		ApplyCloseButton(AzeriteEmpoweredItemUICloseButton)

		AzeriteEmpoweredItemUIPortrait:SetSize(61, 61)
		AzeriteEmpoweredItemUIPortrait:ClearAllPoints()
		AzeriteEmpoweredItemUIPortrait:SetPoint("TOPLEFT", -6, 8)

		AzeriteEmpoweredItemUI.BorderFrame.TitleContainer:ClearAllPoints()
		AzeriteEmpoweredItemUI.BorderFrame.TitleContainer:SetPoint("TOPLEFT", AzeriteEmpoweredItemUI, "TOPLEFT", 58, 0)
		AzeriteEmpoweredItemUI.BorderFrame.TitleContainer:SetPoint("TOPRIGHT", AzeriteEmpoweredItemUI, "TOPRIGHT", -58, 0)

		ApplyTitleBg(AzeriteEmpoweredItemUI)
		ApplyNineSlicePortrait(AzeriteEmpoweredItemUI.BorderFrame)
	end
end)