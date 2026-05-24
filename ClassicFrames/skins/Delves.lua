local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_DelvesDifficultyPicker" then
		ApplyCloseButton(DelvesDifficultyPickerFrame.CloseButton, true)
		DelvesDifficultyPickerFrame.CloseButton:ClearAllPoints()
		DelvesDifficultyPickerFrame.CloseButton:SetPoint("TOPRIGHT", 4, 3)

		ApplyDialogBorder(DelvesDifficultyPickerFrame.Border)
		ApplyDropDown(DelvesDifficultyPickerFrame.Dropdown)
	end
end)

if DelvesCompanionAbilityListFrame then
	ApplyCloseButton(DelvesCompanionAbilityListFrameCloseButton)

	DelvesCompanionAbilityListFramePortrait:SetSize(61, 61)
	DelvesCompanionAbilityListFramePortrait:ClearAllPoints()
	DelvesCompanionAbilityListFramePortrait:SetPoint("TOPLEFT", -6, 8)

	DelvesCompanionAbilityListFrame.TitleContainer:ClearAllPoints()
	DelvesCompanionAbilityListFrame.TitleContainer:SetPoint("TOPLEFT", DelvesCompanionAbilityListFrame, "TOPLEFT", 58, 0)
	DelvesCompanionAbilityListFrame.TitleContainer:SetPoint("TOPRIGHT", DelvesCompanionAbilityListFrame, "TOPRIGHT", -58, 0)

	ApplyTitleBg(DelvesCompanionAbilityListFrame)
	ApplyNineSlicePortrait(DelvesCompanionAbilityListFrame)

	ApplyDropDown(DelvesCompanionAbilityListFrame.DelvesCompanionRoleDropdown)
	DelvesCompanionAbilityListFrame.DelvesCompanionRoleDropdown.Text:SetJustifyH("RIGHT")
end

if DelvesCompanionConfigurationFrame then
	ApplyCloseButton(DelvesCompanionConfigurationFrame.CloseButton, true)
	DelvesCompanionConfigurationFrame.CloseButton:ClearAllPoints()
	DelvesCompanionConfigurationFrame.CloseButton:SetPoint("TOPRIGHT", 4, 3)

	ApplyDialogBorder(DelvesCompanionConfigurationFrame.Border)
end