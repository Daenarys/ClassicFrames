local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TimeManager" then
		ApplyCloseButton(TimeManagerFrameCloseButton)

		TimeManagerFrame.PortraitContainer.CircleMask:Hide()

		TimeManagerFramePortrait:SetSize(61, 61)
		TimeManagerFramePortrait:ClearAllPoints()
		TimeManagerFramePortrait:SetPoint("TOPLEFT", -6, 8)

		ApplyTitleBg(TimeManagerFrame)
		ApplyNineSlicePortrait(TimeManagerFrame)
	
		StopwatchCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		StopwatchCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		StopwatchCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		StopwatchCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

		ApplyDropDown(TimeManagerAlarmTimeFrame.HourDropdown)
		ApplyDropDown(TimeManagerAlarmTimeFrame.MinuteDropdown)
		ApplyDropDown(TimeManagerAlarmTimeFrame.AMPMDropdown)
	end
end)