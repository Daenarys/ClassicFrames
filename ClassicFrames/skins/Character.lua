if not _G.CharacterFrame then return end

ApplyCloseButton(CharacterFrameCloseButton)

CharacterFramePortrait:SetSize(61, 61)
CharacterFramePortrait:ClearAllPoints()
CharacterFramePortrait:SetPoint("TOPLEFT", -6, 8)

CharacterFrame.TitleContainer:ClearAllPoints()
CharacterFrame.TitleContainer:SetPoint("TOPLEFT", CharacterFrame, "TOPLEFT", 58, 1)
CharacterFrame.TitleContainer:SetPoint("TOPRIGHT", CharacterFrame, "TOPRIGHT", -58, 1)

ApplyTitleBg(CharacterFrame)
ApplyNineSlicePortrait(CharacterFrame)

ApplyScrollBarHybrid(CharacterStatsPaneScrollBox.ScrollBar, true)
ApplyScrollBarThumb(CharacterStatsPaneScrollBox.ScrollBar.Track.Thumb)

ApplyScrollBarHybrid(ReputationFrame.ScrollBar, true)
ApplyScrollBarThumb(ReputationFrame.ScrollBar.Track.Thumb)

ApplyScrollBarHybrid(SkillsFrame.ScrollBar, true)
ApplyScrollBarThumb(SkillsFrame.ScrollBar.Track.Thumb)

ApplyScrollBarHybrid(TokenFrame.ScrollBar, true)
ApplyScrollBarThumb(TokenFrame.ScrollBar.Track.Thumb)

ApplyScrollBarHybrid(StatisticsFrame.ScrollBar, true)
ApplyScrollBarThumb(StatisticsFrame.ScrollBar.Track.Thumb)

ApplyScrollBarHybrid(PaperDollFrame.TitleManagerPane.ScrollBar, true)
ApplyScrollBarThumb(PaperDollFrame.TitleManagerPane.ScrollBar.Track.Thumb)

ApplyScrollBarHybrid(PaperDollFrame.EquipmentManagerPane.ScrollBar, true)
ApplyScrollBarThumb(PaperDollFrame.EquipmentManagerPane.ScrollBar.Track.Thumb)

GearManagerPopupFrame.IconSelector.ScrollBar:SetSize(25, 560)
GearManagerPopupFrame.IconSelector.ScrollBar:ClearAllPoints()
GearManagerPopupFrame.IconSelector.ScrollBar:SetPoint("TOPRIGHT", -3, 30)
GearManagerPopupFrame.IconSelector.ScrollBar:SetPoint("BOTTOMRIGHT", -3, -2)

ApplyScrollBarArrow(GearManagerPopupFrame.IconSelector.ScrollBar)
ApplyScrollBarTrack(GearManagerPopupFrame.IconSelector.ScrollBar.Track)
ApplyScrollBarThumb(GearManagerPopupFrame.IconSelector.ScrollBar.Track.Thumb)

ApplyDropDown(GearManagerPopupFrame.BorderBox.IconTypeDropdown)
GearManagerPopupFrame.BorderBox.IconTypeDropdown.Text:SetJustifyH("RIGHT")

PaperDollFrame:HookScript("OnShow", function()
	CharacterModelScene.ControlFrame:Hide()
end)