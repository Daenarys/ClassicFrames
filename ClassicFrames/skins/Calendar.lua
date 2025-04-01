local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Calendar" then
		ApplyDialogBorder(CalendarViewHolidayFrame.Border)
		ApplyDialogHeader(CalendarViewHolidayFrame.Header)
		ApplyDialogBorder(CalendarViewRaidFrame.Border)
		ApplyDialogHeader(CalendarViewRaidFrame.Header)
		ApplyDialogBorder(CalendarEventPickerFrame.Border)
		ApplyDialogHeader(CalendarEventPickerFrame.Header)
		ApplyDialogBorder(CalendarCreateEventFrame.Border)
		ApplyDialogHeader(CalendarCreateEventFrame.Header)

		ApplyDropDown(CalendarCreateEventFrame.EventTypeDropdown)
		ApplyDropDown(CalendarCreateEventFrame.HourDropdown)
		ApplyDropDown(CalendarCreateEventFrame.MinuteDropdown)
		ApplyDropDown(CalendarCreateEventFrame.AMPMDropdown)

		ApplyFilterDropDown(CalendarFrame.FilterButton)
	end
end)