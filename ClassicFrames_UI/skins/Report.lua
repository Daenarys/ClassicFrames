if not _G.ReportFrame then return end

ReportFrame.CloseButton:SetSize(32, 32)
ReportFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
ReportFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
ReportFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
ReportFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
ReportFrame.CloseButton:ClearAllPoints()
ReportFrame.CloseButton:SetPoint("TOPRIGHT", -4, -4)

ApplyDialogBorder(ReportFrame.Border)
ApplyDropDown(ReportFrame.ReportingMajorCategoryDropdown)