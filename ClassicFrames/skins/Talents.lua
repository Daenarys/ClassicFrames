local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_PlayerSpells" then
		ApplyCloseButton(PlayerSpellsFrameCloseButton)

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

		ApplyMaxMinButton(PlayerSpellsFrame.MaximizeMinimizeButton)

		ApplyTitleBg(PlayerSpellsFrame)
		ApplyNineSlicePortrait(PlayerSpellsFrame)

		PlayerSpellsFrame.SpellBookFrame:HookScript("OnShow", function()
			ApplyNineSlicePortraitMinimizable(PlayerSpellsFrame)
		end)

		PlayerSpellsFrame.SpellBookFrame:HookScript("OnHide", function()
			ApplyNineSlicePortrait(PlayerSpellsFrame)
		end)
	end
end)