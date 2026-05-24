local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Calendar" then
		ApplyCloseButton(CalendarCloseButton, true)
		CalendarCloseButton:ClearAllPoints()
		CalendarCloseButton:SetPoint("TOPRIGHT", 5, -14)

		ApplyCloseButton(CalendarViewHolidayCloseButton, true)
		CalendarViewHolidayCloseButton:ClearAllPoints()
		CalendarViewHolidayCloseButton:SetPoint("TOPRIGHT", -3, -3)

		if (CalendarViewHolidayCloseButton.Corner == nil) then
			CalendarViewHolidayCloseButton.Corner = CalendarViewHolidayCloseButton:CreateTexture(nil, "BACKGROUND")
			CalendarViewHolidayCloseButton.Corner:SetSize(32, 32)
			CalendarViewHolidayCloseButton.Corner:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Corner")
			CalendarViewHolidayCloseButton.Corner:SetPoint("TOPRIGHT", -4, -4)
		end
		
		ApplyDialogBorder(CalendarViewHolidayFrame.Border)
		ApplyDialogHeader(CalendarViewHolidayFrame.Header)

		ApplyCloseButton(CalendarViewRaidCloseButton, true)
		CalendarViewRaidCloseButton:ClearAllPoints()
		CalendarViewRaidCloseButton:SetPoint("TOPRIGHT", -3, -3)

		if (CalendarViewRaidCloseButton.Corner == nil) then
			CalendarViewRaidCloseButton.Corner = CalendarViewRaidCloseButton:CreateTexture(nil, "BACKGROUND")
			CalendarViewRaidCloseButton.Corner:SetSize(32, 32)
			CalendarViewRaidCloseButton.Corner:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Corner")
			CalendarViewRaidCloseButton.Corner:SetPoint("TOPRIGHT", -4, -4)
		end

		ApplyDialogBorder(CalendarViewRaidFrame.Border)
		ApplyDialogHeader(CalendarViewRaidFrame.Header)

		ApplyScrollBarHybrid(CalendarEventPickerFrame.ScrollBar)
		ApplyScrollBarThumb(CalendarEventPickerFrame.ScrollBar.Track.Thumb)

		ApplyDialogBorder(CalendarEventPickerFrame.Border)
		ApplyDialogHeader(CalendarEventPickerFrame.Header)

		ApplyCloseButton(CalendarCreateEventCloseButton, true)
		CalendarCreateEventCloseButton:ClearAllPoints()
		CalendarCreateEventCloseButton:SetPoint("TOPRIGHT", -3, -3)

		if (CalendarCreateEventCloseButton.Corner == nil) then
			CalendarCreateEventCloseButton.Corner = CalendarCreateEventCloseButton:CreateTexture(nil, "BACKGROUND")
			CalendarCreateEventCloseButton.Corner:SetSize(32, 32)
			CalendarCreateEventCloseButton.Corner:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Corner")
			CalendarCreateEventCloseButton.Corner:SetPoint("TOPRIGHT", -4, -4)
		end

		ApplyDialogBorder(CalendarCreateEventFrame.Border)
		ApplyDialogHeader(CalendarCreateEventFrame.Header)

		ApplyDropDown(CalendarCreateEventFrame.EventTypeDropdown)
		ApplyDropDown(CalendarCreateEventFrame.HourDropdown)
		ApplyDropDown(CalendarCreateEventFrame.MinuteDropdown)
		ApplyDropDown(CalendarCreateEventFrame.AMPMDropdown)

		ApplyFilterDropDown(CalendarFrame.FilterButton)
	end
end)