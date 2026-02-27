local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ScrappingMachineUI" then
		ApplyCloseButton(ScrappingMachineFrameCloseButton)

		ScrappingMachineFramePortrait:SetSize(61, 61)
		ScrappingMachineFramePortrait:ClearAllPoints()
		ScrappingMachineFramePortrait:SetPoint("TOPLEFT", -6, 8)

		ScrappingMachineFrame.TitleContainer:ClearAllPoints()
		ScrappingMachineFrame.TitleContainer:SetPoint("TOPLEFT", ScrappingMachineFrame, "TOPLEFT", 58, 0)
		ScrappingMachineFrame.TitleContainer:SetPoint("TOPRIGHT", ScrappingMachineFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(ScrappingMachineFrame)
		ApplyNineSlicePortrait(ScrappingMachineFrame)
	end
end)