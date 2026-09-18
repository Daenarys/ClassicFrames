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

ReputationFrame.ScrollBar:SetSize(25, 560)
ReputationFrame.ScrollBar:ClearAllPoints()
ReputationFrame.ScrollBar:SetPoint("TOPLEFT", ReputationFrame.ScrollBox, "TOPRIGHT", -4, 0)
ReputationFrame.ScrollBar:SetPoint("BOTTOMLEFT", ReputationFrame.ScrollBox, "BOTTOMRIGHT", 4, -3)

ApplyScrollBarArrow(ReputationFrame.ScrollBar)
ApplyScrollBarTrack(ReputationFrame.ScrollBar.Track)
ApplyScrollBarThumb(ReputationFrame.ScrollBar.Track.Thumb)

SkillsFrame.ScrollBar:SetSize(25, 560)
SkillsFrame.ScrollBar:ClearAllPoints()
SkillsFrame.ScrollBar:SetPoint("TOPLEFT", SkillsFrame.ScrollBox, "TOPRIGHT", -4, 0)
SkillsFrame.ScrollBar:SetPoint("BOTTOMLEFT", SkillsFrame.ScrollBox, "BOTTOMRIGHT", 4, -3)

ApplyScrollBarArrow(SkillsFrame.ScrollBar)
ApplyScrollBarTrack(SkillsFrame.ScrollBar.Track)
ApplyScrollBarThumb(SkillsFrame.ScrollBar.Track.Thumb)

TokenFrame.ScrollBar:SetSize(25, 560)
TokenFrame.ScrollBar:ClearAllPoints()
TokenFrame.ScrollBar:SetPoint("TOPLEFT", TokenFrame.ScrollBox, "TOPRIGHT", -4, 0)
TokenFrame.ScrollBar:SetPoint("BOTTOMLEFT", TokenFrame.ScrollBox, "BOTTOMRIGHT", 4, -3)

ApplyScrollBarArrow(TokenFrame.ScrollBar)
ApplyScrollBarTrack(TokenFrame.ScrollBar.Track)
ApplyScrollBarThumb(TokenFrame.ScrollBar.Track.Thumb)

StatisticsFrame.ScrollBar:SetSize(25, 560)
StatisticsFrame.ScrollBar:ClearAllPoints()
StatisticsFrame.ScrollBar:SetPoint("TOPLEFT", StatisticsFrame.ScrollBox, "TOPRIGHT", -4, 0)
StatisticsFrame.ScrollBar:SetPoint("BOTTOMLEFT", StatisticsFrame.ScrollBox, "BOTTOMRIGHT", 4, -3)

ApplyScrollBarArrow(StatisticsFrame.ScrollBar)
ApplyScrollBarTrack(StatisticsFrame.ScrollBar.Track)
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

ApplyScrollBarHybrid(CharacterStatsPaneScrollBox.ScrollBar, true)
ApplyScrollBarThumb(CharacterStatsPaneScrollBox.ScrollBar.Track.Thumb)

ApplyDropDown(GearManagerPopupFrame.BorderBox.IconTypeDropdown)
GearManagerPopupFrame.BorderBox.IconTypeDropdown.Text:SetJustifyH("RIGHT")

CharacterModelScene.ControlFrame:HookScript("OnShow", function(self)
	self:SetPoint("TOP")
end)

PaperDollFrame:HookScript("OnShow", function()
	CharacterModelScene.ControlFrame:Hide()
end)