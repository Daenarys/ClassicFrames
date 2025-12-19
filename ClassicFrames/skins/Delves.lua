local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_DelvesDashboardUI" then
		DelvesDashboardFrame.DashboardBackground:SetDrawLayer("BACKGROUND", -1)
	elseif name == "Blizzard_DelvesDifficultyPicker" then
		ApplyDialogBorder(DelvesDifficultyPickerFrame.Border)

		DelvesDifficultyPickerFrame.CloseButton:SetSize(32, 32)
		DelvesDifficultyPickerFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		DelvesDifficultyPickerFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		DelvesDifficultyPickerFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		DelvesDifficultyPickerFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		DelvesDifficultyPickerFrame.CloseButton:ClearAllPoints()
		DelvesDifficultyPickerFrame.CloseButton:SetPoint("TOPRIGHT", 4, 3)

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
end

if DelvesCompanionConfigurationFrame then
	DelvesCompanionConfigurationFrame.CloseButton:SetSize(32, 32)
	DelvesCompanionConfigurationFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
	DelvesCompanionConfigurationFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
	DelvesCompanionConfigurationFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
	DelvesCompanionConfigurationFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
	DelvesCompanionConfigurationFrame.CloseButton:ClearAllPoints()
	DelvesCompanionConfigurationFrame.CloseButton:SetPoint("TOPRIGHT", 4, 3)

	if DelvesCompanionConfigurationFrame.Border then
		ApplyDialogBorder(DelvesCompanionConfigurationFrame.Border)
	end
end