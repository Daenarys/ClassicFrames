local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Collections" or name == "Blizzard_Wardrobe" then
		ApplyCloseButton(WardrobeFrameCloseButton)

		WardrobeFrame.PortraitContainer.CircleMask:Hide()

		WardrobeFramePortrait:SetSize(61, 61)
		WardrobeFramePortrait:ClearAllPoints()
		WardrobeFramePortrait:SetPoint("TOPLEFT", -6, 8)

		WardrobeFrame.TitleContainer:ClearAllPoints()
		WardrobeFrame.TitleContainer:SetPoint("TOPLEFT", WardrobeFrame, "TOPLEFT", 58, 0)
		WardrobeFrame.TitleContainer:SetPoint("TOPRIGHT", WardrobeFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(WardrobeFrame)
		ApplyNineSlicePortrait(WardrobeFrame)
		ApplyDialogBorder(WardrobeOutfitFrame.Border)

		WardrobeTransmogFrame.ModelScene.ControlFrame:HookScript("OnShow", function(self)
			ApplyControlFrame(self)
		end)
	end
end)

ApplyDialogBorder(WardrobeOutfitFrame.Border)
ApplyDialogBorder(WardrobeOutfitEditFrame.Border)