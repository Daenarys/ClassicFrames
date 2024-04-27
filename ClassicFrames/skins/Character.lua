if not _G.CharacterFrame then return end

ApplyDialogBorder(ReputationDetailFrame.Border)
ApplyDialogBorder(TokenFramePopup.Border)

CharacterStatsPane.ScrollBox:ClearAllPoints()
CharacterStatsPane.ScrollBox:SetPoint("TOPLEFT", 2, -1)

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

CharacterFrame:HookScript("OnShow", function()
	if not ReputationFrame:IsShown() or TokenFrame:IsShown() then
		CharacterFrame:Expand()
	end
end)

PaperDollFrame:HookScript("OnShow", function()
	CharacterModelScene.ControlFrame:Hide()
end)

CharacterModelScene.ControlFrame:HookScript("OnShow", function(self)
	ApplyControlFrame(self)
end)

hooksecurefunc("PaperDollFrame_SetLevel", function()
	CharacterLevelText:ClearAllPoints()
	CharacterLevelText:SetPoint("TOP", 0, -30)
	CharacterLevelText:SetFontObject("GameFontNormalSmall")
end)

for i = 1, 2 do
	hooksecurefunc(_G['CharacterFrameTab'..i], "OnClick", function(self)
		local name = self:GetName()
		if ( name == "CharacterFrameTab1" ) then
			CharacterFrame:Expand()
		elseif ( name == "CharacterFrameTab2" ) then
			CharacterFrame:Expand()
		end
	end)
end