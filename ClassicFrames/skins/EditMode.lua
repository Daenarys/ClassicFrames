if not _G.EditModeManagerFrame then return end

ApplyCloseButton(EditModeManagerFrame.CloseButton, true)
ApplyCloseButton(EditModeSystemSettingsDialog.CloseButton, true)

EditModeManagerFrame.CloseButton:ClearAllPoints()
EditModeManagerFrame.CloseButton:SetPoint("TOPRIGHT", -5, -6)

EditModeSystemSettingsDialog.CloseButton:ClearAllPoints()
EditModeSystemSettingsDialog.CloseButton:SetPoint("TOPRIGHT", -5, -6)

EditModeManagerFrame.Tutorial.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar.Track.Begin:Hide()
EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar.Track.End:Hide()
EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrowNoPos(EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar)
ApplyScrollBarThumb(EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar.Track.Thumb)

EditModeImportLayoutDialog.ImportBox.ScrollBar.Track.Begin:Hide()
EditModeImportLayoutDialog.ImportBox.ScrollBar.Track.End:Hide()
EditModeImportLayoutDialog.ImportBox.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrowNoPos(EditModeImportLayoutDialog.ImportBox.ScrollBar)
ApplyScrollBarThumb(EditModeImportLayoutDialog.ImportBox.ScrollBar.Track.Thumb)

ApplyDialogBorder(EditModeManagerFrame.Border)
ApplyDialogBorder(EditModeSystemSettingsDialog.Border)
ApplyDialogBorder(EditModeLayoutDialog.Border)
ApplyDialogBorder(EditModeImportLayoutDialog.Border)
ApplyDialogBorder(EditModeUnsavedChangesDialog.Border)
ApplyDropDown(EditModeManagerFrame.LayoutDropdown)

EditModeSystemSettingsDialog:HookScript("OnShow", function(self)
	for _, frame in next, { self.Settings:GetChildren() } do
		if frame.Dropdown then
			ApplyDropDown(frame.Dropdown)
		end
	end
end)