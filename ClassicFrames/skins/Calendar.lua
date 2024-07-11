local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Calendar" then
		CalendarCloseButton:SetSize(32, 32)
		CalendarCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		CalendarCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		CalendarCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		CalendarCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		CalendarCloseButton:ClearAllPoints()
		CalendarCloseButton:SetPoint("TOPRIGHT", 5, -14)

		CalendarViewHolidayCloseButton:SetSize(32, 32)
		CalendarViewHolidayCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		CalendarViewHolidayCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		CalendarViewHolidayCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		CalendarViewHolidayCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		CalendarViewHolidayCloseButton:ClearAllPoints()
		CalendarViewHolidayCloseButton:SetPoint("TOPRIGHT", -3, -3)

		if (CalendarViewHolidayCloseButton.Corner == nil) then
			CalendarViewHolidayCloseButton.Corner = CalendarViewHolidayCloseButton:CreateTexture(nil, "BACKGROUND")
			CalendarViewHolidayCloseButton.Corner:SetSize(32, 32)
			CalendarViewHolidayCloseButton.Corner:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Corner")
			CalendarViewHolidayCloseButton.Corner:SetPoint("TOPRIGHT", -4, -4)
		end
		
		ApplyDialogBorder(CalendarViewHolidayFrame.Border)
		ApplyDialogHeader(CalendarViewHolidayFrame)

		CalendarViewRaidCloseButton:SetSize(32, 32)
		CalendarViewRaidCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		CalendarViewRaidCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		CalendarViewRaidCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		CalendarViewRaidCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		CalendarViewRaidCloseButton:ClearAllPoints()
		CalendarViewRaidCloseButton:SetPoint("TOPRIGHT", -3, -3)

		if (CalendarViewRaidCloseButton.Corner == nil) then
			CalendarViewRaidCloseButton.Corner = CalendarViewRaidCloseButton:CreateTexture(nil, "BACKGROUND")
			CalendarViewRaidCloseButton.Corner:SetSize(32, 32)
			CalendarViewRaidCloseButton.Corner:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Corner")
			CalendarViewRaidCloseButton.Corner:SetPoint("TOPRIGHT", -4, -4)
		end

		ApplyDialogBorder(CalendarViewRaidFrame.Border)
		ApplyDialogHeader(CalendarViewRaidFrame)

		CalendarEventPickerFrame.ScrollBar:SetSize(25, 560)
		CalendarEventPickerFrame.ScrollBar:ClearAllPoints()
		CalendarEventPickerFrame.ScrollBar:SetPoint("TOPLEFT", CalendarEventPickerFrame.ScrollBox, "TOPRIGHT", -1, 15)
		CalendarEventPickerFrame.ScrollBar:SetPoint("BOTTOMLEFT", CalendarEventPickerFrame.ScrollBox, "BOTTOMRIGHT", 2, -3)

		ApplyScrollBarArrow(CalendarEventPickerFrame.ScrollBar)
		ApplyScrollBarTrack(CalendarEventPickerFrame.ScrollBar.Track)
		ApplyScrollBarThumb(CalendarEventPickerFrame.ScrollBar.Track.Thumb)

		ApplyDialogBorder(CalendarEventPickerFrame.Border)
		ApplyDialogHeader(CalendarEventPickerFrame)

		CalendarCreateEventCloseButton:SetSize(32, 32)
		CalendarCreateEventCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		CalendarCreateEventCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		CalendarCreateEventCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		CalendarCreateEventCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		CalendarCreateEventCloseButton:ClearAllPoints()
		CalendarCreateEventCloseButton:SetPoint("TOPRIGHT", -3, -3)

		if (CalendarCreateEventCloseButton.Corner == nil) then
			CalendarCreateEventCloseButton.Corner = CalendarCreateEventCloseButton:CreateTexture(nil, "BACKGROUND")
			CalendarCreateEventCloseButton.Corner:SetSize(32, 32)
			CalendarCreateEventCloseButton.Corner:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Corner")
			CalendarCreateEventCloseButton.Corner:SetPoint("TOPRIGHT", -4, -4)
		end

		ApplyDialogBorder(CalendarCreateEventFrame.Border)
		ApplyDialogHeader(CalendarCreateEventFrame)

		ApplySearchBox(CalendarCreateEventInviteEdit)
		ApplySearchBox(CalendarCreateEventTitleEdit)

		ApplyDropDown(CalendarCreateEventFrame.EventTypeDropdown)
		ApplyDropDown(CalendarCreateEventFrame.HourDropdown)
		ApplyDropDown(CalendarCreateEventFrame.MinuteDropdown)

		ApplyFilterDropDown(CalendarFrame.FilterButton)
	end
end)