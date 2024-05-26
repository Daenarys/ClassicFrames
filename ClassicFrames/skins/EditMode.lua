if not _G.EditModeManagerFrame then return end

ApplyCloseButton(EditModeManagerFrame.CloseButton)
ApplyCloseButton(EditModeSystemSettingsDialog.CloseButton)
EditModeSystemSettingsDialog.CloseButton:SetFrameLevel(510)

EditModeManagerFrame.CloseButton:ClearAllPoints()
EditModeManagerFrame.CloseButton:SetPoint("TOPRIGHT", -5 , -6)

EditModeSystemSettingsDialog.CloseButton:ClearAllPoints()
EditModeSystemSettingsDialog.CloseButton:SetPoint("TOPRIGHT", -5 , -6)

ApplyDialogBorder(EditModeManagerFrame.Border)
ApplyDialogBorder(EditModeSystemSettingsDialog.Border)
ApplyDialogBorder(EditModeNewLayoutDialog.Border)
ApplyDialogBorder(EditModeImportLayoutDialog.Border)

EditModeManagerFrame.Tutorial.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")