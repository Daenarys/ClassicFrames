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

		ApplyTitleBg(PlayerSpellsFrame)
		ApplyNineSlicePortrait(PlayerSpellsFrame)

		for i = 1, _G.PlayerSpellsFrame.TabSystem:GetNumChildren() do
			local tab = select(i, _G.PlayerSpellsFrame.TabSystem:GetChildren())

			ApplyBottomTab(tab)
		end

		hooksecurefunc(PlayerSpellsFrame.TabSystem, 'Layout', function(self)
			self.tabs[1]:SetWidth(45 + self.tabs[1]:GetFontString():GetStringWidth())
			self.tabs[2]:ClearAllPoints()
			self.tabs[2]:SetPoint("LEFT", self.tabs[1], "RIGHT", -15, 0)
			self.tabs[3]:ClearAllPoints()
			self.tabs[3]:SetPoint("LEFT", self.tabs[2], "RIGHT", -15, 0)
        end)

        ApplyDialogBorder(ClassTalentLoadoutCreateDialog.Border)
        ApplyDialogBorder(ClassTalentLoadoutImportDialog.Border)
	end
end)