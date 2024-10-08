local a = CreateFrame("Frame")
a:RegisterEvent("ADDON_LOADED")
a:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_DelvesDashboardUI" then
		DelvesDashboardFrame.DashboardBackground:SetDrawLayer("BACKGROUND", -1)

		DelvesDashboardFrame.ButtonPanelLayoutFrame.GreatVaultButtonPanel.GreatVaultButton:HookScript("OnShow", function(self)
			self:SetPoint("CENTER", 0, -20)
			if self.ChestTexture then
				self.ChestTexture:SetScale(1)
				if (self.ChestTexture:GetAtlas() == "gficon-chest-evergreen-greatvault-incomplete") then
					self.ChestTexture:SetAtlas("mythicplus-dragonflight-greatvault-incomplete", true)
					self.Highlight:SetAtlas("mythicplus-dragonflight-greatvault-incomplete", true)
				elseif (self.ChestTexture:GetAtlas() == "gficon-chest-evergreen-greatvault-complete") then
					self.ChestTexture:SetAtlas("mythicplus-dragonflight-greatvault-complete", true)
					self.Highlight:SetAtlas("mythicplus-dragonflight-greatvault-complete", true)
				elseif (self.ChestTexture:GetAtlas() == "gficon-chest-evergreen-greatvault-collect") then
					self.ChestTexture:SetAtlas("mythicplus-dragonflight-greatvault-collect", true)
					self.Highlight:SetAtlas("mythicplus-dragonflight-greatvault-collect", true)
				end
			end
		end)
	end
end)

local b = CreateFrame("Frame")
b:RegisterEvent("ADDON_LOADED")
b:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_DelvesDifficultyPicker" then
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

	DelvesCompanionAbilityListFrame.PortraitContainer.CircleMask:Hide()

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