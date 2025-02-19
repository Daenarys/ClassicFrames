if not _G.CharacterFrame then return end

CharacterFrameTitleText:ClearAllPoints()
CharacterFrameTitleText:SetPoint("TOP", 0, -4)
CharacterFrameTitleText:SetPoint("LEFT", 60, 0)
CharacterFrameTitleText:SetPoint("RIGHT", -60, 0)

CharacterFramePortrait:SetSize(60, 60)
CharacterFramePortrait:ClearAllPoints()
CharacterFramePortrait:SetPoint("TOPLEFT", -6, 7)

ApplyDialogBorder(ReputationDetailFrame.Border)
ApplyDialogBorder(TokenFramePopup.Border)

CharacterStatsPane.ScrollBox:ClearAllPoints()
CharacterStatsPane.ScrollBox:SetPoint("TOPLEFT", 1, -1)

CharacterStatsPane.ScrollBar:SetSize(25, 560)
CharacterStatsPane.ScrollBar:ClearAllPoints()
CharacterStatsPane.ScrollBar:SetPoint("TOPLEFT", CharacterStatsPane.ScrollBox, "TOPRIGHT", 0, 1)
CharacterStatsPane.ScrollBar:SetPoint("BOTTOMLEFT", CharacterStatsPane.ScrollBox, "BOTTOMRIGHT", 3, -5)

ApplyScrollBarArrow(CharacterStatsPane.ScrollBar)
ApplyScrollBarTrack(CharacterStatsPane.ScrollBar.Track)
ApplyScrollBarThumb(CharacterStatsPane.ScrollBar.Track.Thumb)

PaperDollFrame.TitleManagerPane.ScrollBar:SetSize(25, 560)
PaperDollFrame.TitleManagerPane.ScrollBar:ClearAllPoints()
PaperDollFrame.TitleManagerPane.ScrollBar:SetPoint("TOPLEFT", PaperDollFrame.TitleManagerPane.ScrollBox, "TOPRIGHT", 1, 1)
PaperDollFrame.TitleManagerPane.ScrollBar:SetPoint("BOTTOMLEFT", PaperDollFrame.TitleManagerPane.ScrollBox, "BOTTOMRIGHT", 4, -1)

ApplyScrollBarArrow(PaperDollFrame.TitleManagerPane.ScrollBar)
ApplyScrollBarTrack(PaperDollFrame.TitleManagerPane.ScrollBar.Track)
ApplyScrollBarThumb(PaperDollFrame.TitleManagerPane.ScrollBar.Track.Thumb)

PaperDollFrame.EquipmentManagerPane.ScrollBar:SetSize(25, 560)
PaperDollFrame.EquipmentManagerPane.ScrollBar:ClearAllPoints()
PaperDollFrame.EquipmentManagerPane.ScrollBar:SetPoint("TOPLEFT", PaperDollFrame.EquipmentManagerPane.ScrollBox, "TOPRIGHT", 1, 24)
PaperDollFrame.EquipmentManagerPane.ScrollBar:SetPoint("BOTTOMLEFT", PaperDollFrame.EquipmentManagerPane.ScrollBox, "BOTTOMRIGHT", 4, -1)

ApplyScrollBarArrow(PaperDollFrame.EquipmentManagerPane.ScrollBar)
ApplyScrollBarTrack(PaperDollFrame.EquipmentManagerPane.ScrollBar.Track)
ApplyScrollBarThumb(PaperDollFrame.EquipmentManagerPane.ScrollBar.Track.Thumb)

hooksecurefunc(CharacterFrame, "UpdateSize", function(self)
	if ReputationFrame:IsShown() then
		self:SetWidth(338)
	end
end)

hooksecurefunc(CharacterFrame, "UpdateTitle", function(self)
	CharacterFrameTitleText:SetText(UnitPVPName("player"))
	CharacterFrameTitleText:SetTextColor(HIGHLIGHT_FONT_COLOR.r, HIGHLIGHT_FONT_COLOR.g, HIGHLIGHT_FONT_COLOR.b)
end)

CharacterModelScene.ControlFrame:HookScript("OnShow", function(self)
	ApplyControlFrame(self)
end)

PaperDollFrame:HookScript("OnShow", function()
	CharacterModelScene.ControlFrame:Hide()
end)

hooksecurefunc("PaperDollFrame_SetLevel", function()
	CharacterLevelText:ClearAllPoints()
	CharacterLevelText:SetPoint("TOP", 0, -30)
	CharacterLevelText:SetFontObject("GameFontNormalSmall")
end)

ReputationFrame:HookScript("OnShow", function(self)
	if not ReputationListScrollFrame:IsShown() then
		ReputationBar1:SetPoint("TOPRIGHT", ReputationFrame, "TOPRIGHT", -26, -68)
	end
end)