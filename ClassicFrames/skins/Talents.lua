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
		PlayerSpellsFrame.MaximizeMinimizeButton:SetPoint("RIGHT", PlayerSpellsFrameCloseButton, "LEFT", 10, 0)

		PlayerSpellsFrame.MaximizeMinimizeButton.MaximizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Up")
		PlayerSpellsFrame.MaximizeMinimizeButton.MaximizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Down")
		PlayerSpellsFrame.MaximizeMinimizeButton.MaximizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Disabled")
		PlayerSpellsFrame.MaximizeMinimizeButton.MaximizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

		PlayerSpellsFrame.MaximizeMinimizeButton.MinimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Up")
		PlayerSpellsFrame.MaximizeMinimizeButton.MinimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Down")
		PlayerSpellsFrame.MaximizeMinimizeButton.MinimizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Disabled")
		PlayerSpellsFrame.MaximizeMinimizeButton.MinimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

		if (PlayerSpellsFrame.ButtonFrameEdge == nil) then
			PlayerSpellsFrame.ButtonFrameEdge = PlayerSpellsFrame.MaximizeMinimizeButton:CreateTexture(nil, "OVERLAY")
			PlayerSpellsFrame.ButtonFrameEdge:SetAtlas("UI-OuterBorderButtonPatch", true)
			PlayerSpellsFrame.ButtonFrameEdge:ClearAllPoints()
			PlayerSpellsFrame.ButtonFrameEdge:SetPoint("CENTER", PlayerSpellsFrame.MaximizeMinimizeButton, "LEFT", 6, 0)
		end

		ApplyTitleBg(PlayerSpellsFrame)
		ApplyNineSlicePortrait(PlayerSpellsFrame)

		PlayerSpellsFrame.SpellBookFrame.HelpPlateButton.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

		for i = 1, PlayerSpellsFrame.TabSystem:GetNumChildren() do
			local tab = select(i, PlayerSpellsFrame.TabSystem:GetChildren())

			ApplyBottomTab(tab)
		end

		hooksecurefunc(PlayerSpellsFrame.TabSystem, 'Layout', function(self)
			self.tabs[1]:SetWidth(45 + self.tabs[1]:GetFontString():GetStringWidth())
			self.tabs[2]:ClearAllPoints()
			self.tabs[2]:SetPoint("LEFT", self.tabs[1], "RIGHT", -15, 0)
			self.tabs[3]:ClearAllPoints()
			if not self.tabs[1]:IsShown() then
				self.tabs[3]:SetPoint("TOPLEFT", self, "TOPLEFT")
			elseif not self.tabs[2]:IsShown() then
				self.tabs[3]:SetPoint("LEFT", self.tabs[1], "RIGHT", -15, 0)
			else
				self.tabs[3]:SetPoint("LEFT", self.tabs[2], "RIGHT", -15, 0)
			end
		end)

		hooksecurefunc(PlayerSpellsFrame.SpecFrame, 'UpdateSpecFrame', function(frame)
			for specContentFrame in frame.SpecContentFramePool:EnumerateActive() do
				local role = GetSpecializationRole(specContentFrame.specIndex, false, false)

				specContentFrame.RoleIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
				specContentFrame.RoleIcon:SetTexCoord(GetTexCoordsForRole(role))
			end
		end)

		ApplyDialogBorder(ClassTalentLoadoutCreateDialog.Border)
		ApplyDialogBorder(ClassTalentLoadoutImportDialog.Border)

		ApplyDropDown(PlayerSpellsFrame.TalentsFrame.LoadSystem.Dropdown)

		ApplyCloseButton(HeroTalentsSelectionDialog.CloseButton)
		ApplyTitleBgNoPortrait(HeroTalentsSelectionDialog)
		ApplyNineSliceNoPortrait(HeroTalentsSelectionDialog)
	end
end)