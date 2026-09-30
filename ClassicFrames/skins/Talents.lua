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
		PlayerSpellsFrame.MaximizeMinimizeButton:SetPoint("RIGHT", PlayerSpellsFrameCloseButton, "LEFT", 10, 0)

		ApplyMaxMinButton(PlayerSpellsFrame.MaximizeMinimizeButton)

		if (PlayerSpellsFrame.ButtonFrameEdge == nil) then
			PlayerSpellsFrame.ButtonFrameEdge = PlayerSpellsFrame.MaximizeMinimizeButton:CreateTexture(nil, "OVERLAY")
			PlayerSpellsFrame.ButtonFrameEdge:SetAtlas("UI-OuterBorderButtonPatch", true)
			PlayerSpellsFrame.ButtonFrameEdge:ClearAllPoints()
			PlayerSpellsFrame.ButtonFrameEdge:SetPoint("CENTER", PlayerSpellsFrame.MaximizeMinimizeButton, "LEFT", 6, 0)
		end

		ApplyTitleBg(PlayerSpellsFrame.NineSlice, false, true)
		ApplyNineSlicePortrait(PlayerSpellsFrame)
	end
end)