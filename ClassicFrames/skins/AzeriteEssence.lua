local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AzeriteEssenceUI" then
		ApplyCloseButton(AzeriteEssenceUICloseButton)

		AzeriteEssenceUIPortrait:SetSize(61, 61)
		AzeriteEssenceUIPortrait:ClearAllPoints()
		AzeriteEssenceUIPortrait:SetPoint("TOPLEFT", -6, 8)

		AzeriteEssenceUI.TitleContainer:ClearAllPoints()
		AzeriteEssenceUI.TitleContainer:SetPoint("TOPLEFT", AzeriteEssenceUI, "TOPLEFT", 58, 0)
		AzeriteEssenceUI.TitleContainer:SetPoint("TOPRIGHT", AzeriteEssenceUI, "TOPRIGHT", -58, 0)

		AzeriteEssenceUI.PowerLevelBadgeFrame.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

		ApplyTitleBg(AzeriteEssenceUI)
		ApplyNineSlicePortrait(AzeriteEssenceUI)

		AzeriteEssenceUI.EssenceList.ScrollBar:SetSize(25, 560)
		AzeriteEssenceUI.EssenceList.ScrollBar:ClearAllPoints()
		AzeriteEssenceUI.EssenceList.ScrollBar:SetPoint("TOPLEFT", AzeriteEssenceUI.EssenceList.ScrollBox, "TOPRIGHT", -2, 5)
		AzeriteEssenceUI.EssenceList.ScrollBar:SetPoint("BOTTOMLEFT", AzeriteEssenceUI.EssenceList.ScrollBox, "BOTTOMRIGHT", 1, -2)

		ApplyScrollBarArrow(AzeriteEssenceUI.EssenceList.ScrollBar)
		ApplyScrollBarTrack(AzeriteEssenceUI.EssenceList.ScrollBar.Track)
		ApplyScrollBarThumb(AzeriteEssenceUI.EssenceList.ScrollBar.Track.Thumb)
	end
end)