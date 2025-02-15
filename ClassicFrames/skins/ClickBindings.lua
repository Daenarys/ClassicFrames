local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ClickBindingUI" then
		ApplyCloseButton(ClickBindingFrameCloseButton)

		ClickBindingFrame.PortraitContainer.CircleMask:Hide()

		ClickBindingFramePortrait:SetSize(61, 61)
		ClickBindingFramePortrait:ClearAllPoints()
		ClickBindingFramePortrait:SetPoint("TOPLEFT", -6, 8)

		ClickBindingFrame.TitleContainer:ClearAllPoints()
		ClickBindingFrame.TitleContainer:SetPoint("TOPLEFT", ClickBindingFrame, "TOPLEFT", 60, 0)
		ClickBindingFrame.TitleContainer:SetPoint("TOPRIGHT", ClickBindingFrame, "TOPRIGHT", -60, 0)

		ClickBindingFrame.TutorialButton.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

		ApplyTitleBg(ClickBindingFrame)
		ApplyNineSlicePortrait(ClickBindingFrame)

		ClickBindingFrame.ScrollBar:SetSize(25, 560)
		ClickBindingFrame.ScrollBar:ClearAllPoints()
		ClickBindingFrame.ScrollBar:SetPoint("TOPLEFT", ClickBindingFrame.ScrollBox, "TOPRIGHT", 5, 4)
		ClickBindingFrame.ScrollBar:SetPoint("BOTTOMLEFT", ClickBindingFrame.ScrollBox, "BOTTOMRIGHT", 8, -4)

		if (ClickBindingFrame.ScrollBar.BG == nil) then
			ClickBindingFrame.ScrollBar.BG = ClickBindingFrame.ScrollBar:CreateTexture(nil, "BACKGROUND")
			ClickBindingFrame.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			ClickBindingFrame.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(ClickBindingFrame.ScrollBar)
		ApplyScrollBarTrack(ClickBindingFrame.ScrollBar.Track)
		ApplyScrollBarThumb(ClickBindingFrame.ScrollBar.Track.Thumb)

		ApplyCloseButton(ClickBindingFrame.TutorialFrame.CloseButton)
		ClickBindingFrame.TutorialFrame.CloseButton:SetFrameLevel(3)
		ApplyTitleBgNoPortrait(ClickBindingFrame.TutorialFrame)
		ApplyNineSliceNoPortrait(ClickBindingFrame.TutorialFrame)
	end
end)