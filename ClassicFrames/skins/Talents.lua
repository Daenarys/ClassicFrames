local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_PlayerSpells" then
		ApplyCloseButton(PlayerSpellsFrameCloseButton)

		PlayerSpellsFrame.PortraitContainer.CircleMask:Hide()

		PlayerSpellsFramePortrait:SetSize(61, 61)
		PlayerSpellsFramePortrait:ClearAllPoints()
		PlayerSpellsFramePortrait:SetPoint("TOPLEFT", -6, 8)

		PlayerSpellsFrame.TitleContainer:ClearAllPoints()
		PlayerSpellsFrame.TitleContainer:SetPoint("TOPLEFT", PlayerSpellsFrame, "TOPLEFT", 58, 0)
		PlayerSpellsFrame.TitleContainer:SetPoint("TOPRIGHT", PlayerSpellsFrame, "TOPRIGHT", -58, 0)

		PlayerSpellsFrame.MaximizeMinimizeButton:SetSize(32, 32)
		PlayerSpellsFrame.MaximizeMinimizeButton:ClearAllPoints()
		PlayerSpellsFrame.MaximizeMinimizeButton:SetPoint("RIGHT", PlayerSpellsFrameCloseButton, "LEFT", 8.5, 0)
		PlayerSpellsFrame.MaximizeMinimizeButton:SetFrameLevel(2)

		PlayerSpellsFrame.MaximizeMinimizeButton.MaximizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Up")
		PlayerSpellsFrame.MaximizeMinimizeButton.MaximizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Down")
		PlayerSpellsFrame.MaximizeMinimizeButton.MaximizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Disabled")
		PlayerSpellsFrame.MaximizeMinimizeButton.MaximizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

		PlayerSpellsFrame.MaximizeMinimizeButton.MinimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Up")
		PlayerSpellsFrame.MaximizeMinimizeButton.MinimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Down")
		PlayerSpellsFrame.MaximizeMinimizeButton.MinimizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Disabled")
		PlayerSpellsFrame.MaximizeMinimizeButton.MinimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

		ApplyTitleBg(PlayerSpellsFrame)
		ApplyNineSlicePortrait(PlayerSpellsFrame)

		for i = 1, PlayerSpellsFrame.TabSystem:GetNumChildren() do
			local tab = select(i, PlayerSpellsFrame.TabSystem:GetChildren())

			ApplyBottomTab(tab)
		end

		hooksecurefunc(PlayerSpellsFrame.TabSystem, 'Layout', function(self)
			self.tabs[1]:SetWidth(45 + self.tabs[1]:GetFontString():GetStringWidth())
			self.tabs[2]:ClearAllPoints()
			self.tabs[2]:SetPoint("LEFT", self.tabs[1], "RIGHT", -15, 0)
			self.tabs[3]:ClearAllPoints()
			self.tabs[3]:SetPoint("LEFT", self.tabs[2], "RIGHT", -15, 0)
        end)

        hooksecurefunc(PlayerSpellsFrame.SpecFrame, 'UpdateSpecFrame', function(frame)
			for specContentFrame in frame.SpecContentFramePool:EnumerateActive() do
				local role = GetSpecializationRole(specContentFrame.specIndex, false, false)

				specContentFrame.RoleIcon:SetTexCoord(GetTexCoordsForRole(role))
				specContentFrame.RoleIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
			end
		end)

    	PlayerSpellsFrame.SpellBookFrame:HookScript("OnShow", function()
			ApplyNineSlicePortraitMinimizable(PlayerSpellsFrame)
        end)

        PlayerSpellsFrame.SpellBookFrame:HookScript("OnHide", function()
			ApplyNineSlicePortrait(PlayerSpellsFrame)
        end)

		ApplyDialogBorder(ClassTalentLoadoutCreateDialog.Border)
		ApplyDialogBorder(ClassTalentLoadoutImportDialog.Border)

		ApplySearchBox(PlayerSpellsFrame.TalentsFrame.SearchBox)
		ApplySearchBox(PlayerSpellsFrame.SpellBookFrame.SearchBox)
		ApplySearchBox(ClassTalentLoadoutCreateDialog.NameControl.EditBox)
		ApplySearchBox(ClassTalentLoadoutImportDialog.NameControl.EditBox)

		ApplyDropDown(PlayerSpellsFrame.TalentsFrame.LoadSystem.Dropdown)

		ApplyCloseButton(HeroTalentsSelectionDialog.CloseButton)
		ApplyTitleBgNoPortrait(HeroTalentsSelectionDialog)
		ApplyNineSliceNoPortrait(HeroTalentsSelectionDialog)

		HeroTalentsSelectionDialog:HookScript("OnShow", function(self)
			self:ClearAllPoints()
			self:SetPoint("TOP", 0, -65)
		end)
	end
end)