if not _G.EditModeManagerFrame then return end

ApplyCloseButton(EditModeManagerFrame.CloseButton)
ApplyCloseButton(EditModeSystemSettingsDialog.CloseButton)

EditModeManagerFrame.CloseButton:ClearAllPoints()
EditModeManagerFrame.CloseButton:SetPoint("TOPRIGHT", -5 , -6)

EditModeSystemSettingsDialog.CloseButton:ClearAllPoints()
EditModeSystemSettingsDialog.CloseButton:SetPoint("TOPRIGHT", -5 , -6)
EditModeSystemSettingsDialog.CloseButton:SetFrameLevel(510)

EditModeManagerFrame.Tutorial.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar:SetWidth(20)
EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar:ClearAllPoints()
EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar:SetPoint("TOPLEFT", EditModeManagerFrame.AccountSettings.SettingsContainer, "TOPRIGHT", -20, -1)
EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar:SetPoint("BOTTOMLEFT", EditModeManagerFrame.AccountSettings.SettingsContainer, "BOTTOMRIGHT", 20, 1)

EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar.Track.Begin:Hide()
EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar.Track.End:Hide()
EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar.Track.Middle:Hide()

ApplyScrollBarThumb(EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar.Track.Thumb)

EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar.Back:SetSize(18, 16)
EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar.Forward:SetSize(18, 16)
EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
EditModeManagerFrame.AccountSettings.SettingsContainer.ScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")

EditModeImportLayoutDialog.ImportBox.ScrollBar:SetWidth(20)
EditModeImportLayoutDialog.ImportBox.ScrollBar:ClearAllPoints()
EditModeImportLayoutDialog.ImportBox.ScrollBar:SetPoint("TOPLEFT", EditModeImportLayoutDialog.ImportBox, "TOPRIGHT", -16, 1)
EditModeImportLayoutDialog.ImportBox.ScrollBar:SetPoint("BOTTOMLEFT", EditModeImportLayoutDialog.ImportBox, "BOTTOMRIGHT", -16, -2)

EditModeImportLayoutDialog.ImportBox.ScrollBar.Track.Begin:Hide()
EditModeImportLayoutDialog.ImportBox.ScrollBar.Track.End:Hide()
EditModeImportLayoutDialog.ImportBox.ScrollBar.Track.Middle:Hide()

ApplyScrollBarThumb(EditModeImportLayoutDialog.ImportBox.ScrollBar.Track.Thumb)

EditModeImportLayoutDialog.ImportBox.ScrollBar.Back:SetSize(18, 16)
EditModeImportLayoutDialog.ImportBox.ScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
EditModeImportLayoutDialog.ImportBox.ScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
EditModeImportLayoutDialog.ImportBox.ScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
EditModeImportLayoutDialog.ImportBox.ScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

EditModeImportLayoutDialog.ImportBox.ScrollBar.Forward:SetSize(18, 16)
EditModeImportLayoutDialog.ImportBox.ScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
EditModeImportLayoutDialog.ImportBox.ScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
EditModeImportLayoutDialog.ImportBox.ScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
EditModeImportLayoutDialog.ImportBox.ScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")

ApplyDialogBorder(EditModeManagerFrame.Border)
ApplyDialogBorder(EditModeSystemSettingsDialog.Border)
ApplyDialogBorder(EditModeNewLayoutDialog.Border)
ApplyDialogBorder(EditModeImportLayoutDialog.Border)
ApplyDialogBorder(EditModeUnsavedChangesDialog.Border)
ApplySearchBox(EditModeImportLayoutDialog.LayoutNameEditBox)
ApplySearchBox(EditModeNewLayoutDialog.LayoutNameEditBox)
ApplyDropDown(EditModeManagerFrame.LayoutDropdown)

EditModeSystemSettingsDialog:HookScript("OnShow", function(self)
	for _, frame in next, { self.Settings:GetChildren() } do
		if frame.Dropdown then
			ApplyDropDown(frame.Dropdown)
		end
	end
end)