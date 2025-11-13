local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_TimeManager" then
		TimeManagerFrame:SetWidth(190)

		ApplyCloseButton(TimeManagerFrameCloseButton)

		TimeManagerFrame.PortraitContainer.CircleMask:Hide()

		TimeManagerFramePortrait:SetSize(61, 61)
		TimeManagerFramePortrait:ClearAllPoints()
		TimeManagerFramePortrait:SetPoint("TOPLEFT", -6, 8)

		ApplyTitleBg(TimeManagerFrame)
		ApplyNineSlicePortrait(TimeManagerFrame)

		TimeManagerAlarmMessageEditBox:SetWidth(160)

		TimeManagerMilitaryTimeCheck:ClearAllPoints()
		TimeManagerMilitaryTimeCheck:SetPoint("TOPLEFT", 155, -190)
	
		StopwatchCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		StopwatchCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		StopwatchCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		StopwatchCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

		ApplyDropDown(TimeManagerAlarmTimeFrame.HourDropdown)
		ApplyDropDown(TimeManagerAlarmTimeFrame.MinuteDropdown)
		ApplyDropDown(TimeManagerAlarmTimeFrame.AMPMDropdown)
	end
end)