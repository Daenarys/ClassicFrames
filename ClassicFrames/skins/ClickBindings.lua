local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ClickBindingUI" then
		ApplyCloseButton(ClickBindingFrameCloseButton)

		ClickBindingFramePortrait:SetSize(61, 61)
		ClickBindingFramePortrait:ClearAllPoints()
		ClickBindingFramePortrait:SetPoint("TOPLEFT", -6, 8)

		ClickBindingFrame.TitleContainer:ClearAllPoints()
		ClickBindingFrame.TitleContainer:SetPoint("TOPLEFT", ClickBindingFrame, "TOPLEFT", 60, 0)
		ClickBindingFrame.TitleContainer:SetPoint("TOPRIGHT", ClickBindingFrame, "TOPRIGHT", -60, 0)

		ClickBindingFrame.TutorialButton.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

		ApplyTitleBg(ClickBindingFrame)
		ApplyNineSlicePortrait(ClickBindingFrame)

		ApplyScrollBarArrow(ClickBindingFrame.ScrollBar)
		ApplyScrollBarTrack(ClickBindingFrame.ScrollBar.Track)
		ApplyScrollBarThumb(ClickBindingFrame.ScrollBar.Track.Thumb)

		ApplyCloseButton(ClickBindingFrame.TutorialFrame.CloseButton)
		ApplyTitleBgNoPortrait(ClickBindingFrame.TutorialFrame)
		ApplyNineSliceNoPortrait(ClickBindingFrame.TutorialFrame)
	end
end)