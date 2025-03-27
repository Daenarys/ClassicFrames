local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Calendar" then
		ApplyDropDown(CalendarCreateEventFrame.EventTypeDropdown)
		ApplyDropDown(CalendarCreateEventFrame.HourDropdown)
		ApplyDropDown(CalendarCreateEventFrame.MinuteDropdown)
		ApplyDropDown(CalendarCreateEventFrame.AMPMDropdown)

		ApplyFilterDropDown(CalendarFrame.FilterButton)
	end
end)