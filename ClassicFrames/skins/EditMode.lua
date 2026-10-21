if not _G.EditModeManagerFrame then return end

ApplyCloseButton(EditModeManagerFrame.CloseButton, true)
EditModeManagerFrame.CloseButton:ClearAllPoints()
EditModeManagerFrame.CloseButton:SetPoint("TOPRIGHT", -5, -6)

ApplyCloseButton(EditModeSystemSettingsDialog.CloseButton, true)
EditModeSystemSettingsDialog.CloseButton:ClearAllPoints()
EditModeSystemSettingsDialog.CloseButton:SetPoint("TOPRIGHT", -5, -6)

EditModeManagerFrame.Tutorial.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

EditModeImportLayoutDialog.ImportBox.ScrollBar.Track.Begin:Hide()
EditModeImportLayoutDialog.ImportBox.ScrollBar.Track.End:Hide()
EditModeImportLayoutDialog.ImportBox.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(EditModeImportLayoutDialog.ImportBox.ScrollBar, true)
ApplyScrollBarThumb(EditModeImportLayoutDialog.ImportBox.ScrollBar.Track.Thumb)

ApplyDialogBorder(EditModeManagerFrame.Border)
ApplyDialogBorder(EditModeSystemSettingsDialog.Border)
ApplyDialogBorder(EditModeLayoutDialog.Border)
ApplyDialogBorder(EditModeImportLayoutDialog.Border)
ApplyDialogBorder(EditModeUnsavedChangesDialog.Border)
ApplyDropDown(EditModeManagerFrame.LayoutDropdown)