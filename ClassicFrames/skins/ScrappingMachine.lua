local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ScrappingMachineUI" then
		ApplyCloseButton(ScrappingMachineFrameCloseButton)

		ScrappingMachineFrame.PortraitContainer.CircleMask:Hide()

		ScrappingMachineFramePortrait:SetSize(61, 61)
		ScrappingMachineFramePortrait:ClearAllPoints()
		ScrappingMachineFramePortrait:SetPoint("TOPLEFT", -6, 8)

		ScrappingMachineFrame.TitleContainer:ClearAllPoints()
		ScrappingMachineFrame.TitleContainer:SetPoint("TOPLEFT", ScrappingMachineFrame, "TOPLEFT", 58, 0)
		ScrappingMachineFrame.TitleContainer:SetPoint("TOPRIGHT", ScrappingMachineFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(ScrappingMachineFrame)
		ApplyNineSlicePortrait(ScrappingMachineFrame)

		ScrappingMachineFrameBg:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-Background-Rock", true, true)
		
		hooksecurefunc(ScrappingMachineFrame, "Show", function()
			if _G.ContainerFrame1MoneyFrame then
				_G.ContainerFrame1MoneyFrame:ClearAllPoints()
				_G.ContainerFrame1MoneyFrame:SetPoint("TOPRIGHT", _G.ContainerFrame1, "TOPRIGHT", -2, -272)
			end
		end)
	end
end)