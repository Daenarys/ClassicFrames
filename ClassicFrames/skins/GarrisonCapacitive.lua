local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_GarrisonUI" then
		ApplyCloseButton(GarrisonCapacitiveDisplayFrameCloseButton)

		GarrisonCapacitiveDisplayFrame.PortraitContainer.CircleMask:Hide()

		GarrisonCapacitiveDisplayFramePortrait:SetSize(61, 61)
		GarrisonCapacitiveDisplayFramePortrait:ClearAllPoints()
		GarrisonCapacitiveDisplayFramePortrait:SetPoint("TOPLEFT", -6, 8)

		GarrisonCapacitiveDisplayFrame.TitleContainer:ClearAllPoints()
		GarrisonCapacitiveDisplayFrame.TitleContainer:SetPoint("TOPLEFT", GarrisonCapacitiveDisplayFrame, "TOPLEFT", 58, 0)
		GarrisonCapacitiveDisplayFrame.TitleContainer:SetPoint("TOPRIGHT", GarrisonCapacitiveDisplayFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(GarrisonCapacitiveDisplayFrame)
		ApplyNineSlicePortrait(GarrisonCapacitiveDisplayFrame)

		GarrisonCapacitiveDisplayFrameBg:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-Background-Rock", true, true)
	end
end)