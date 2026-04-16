if not _G.ReportFrame then return end

ApplyCloseButton(ReportFrame.CloseButton, true)
ReportFrame.CloseButton:ClearAllPoints()
ReportFrame.CloseButton:SetPoint("TOPRIGHT", -4, -4)

ApplyDialogBorder(ReportFrame.Border)
ApplyDropDown(ReportFrame.ReportingMajorCategoryDropdown)