local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_IslandsQueueUI" then
		ApplyCloseButton(IslandsQueueFrameCloseButton)

		IslandsQueueFramePortrait:SetSize(61, 61)
		IslandsQueueFramePortrait:ClearAllPoints()
		IslandsQueueFramePortrait:SetPoint("TOPLEFT", -6, 8)

		ApplyNineSlicePortrait(IslandsQueueFrame)

		IslandsQueueFrame.HelpButton.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

		ApplyCloseButton(IslandsQueueFrame.TutorialFrame.CloseButton, true)
	end
end)