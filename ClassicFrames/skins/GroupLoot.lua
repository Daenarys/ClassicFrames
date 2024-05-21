if not _G.GroupLootHistoryFrame then return end

ApplyCloseButton(GroupLootHistoryFrame.ClosePanelButton)

GroupLootHistoryFrame.TitleContainer:ClearAllPoints()
GroupLootHistoryFrame.TitleContainer:SetPoint("TOPLEFT", GroupLootHistoryFrame, "TOPLEFT", 60, -1)
GroupLootHistoryFrame.TitleContainer:SetPoint("TOPRIGHT", GroupLootHistoryFrame, "TOPRIGHT", -60, 1)

ApplyTitleBgNoPortrait(GroupLootHistoryFrame)
ApplyNineSliceNoPortrait(GroupLootHistoryFrame)

GroupLootHistoryFrame.ScrollBox:ClearAllPoints()
GroupLootHistoryFrame.ScrollBox:SetPoint("TOPLEFT", 4, -82)
GroupLootHistoryFrame.ScrollBox:SetPoint("BOTTOMRIGHT", GroupLootHistoryFrame, "BOTTOMLEFT", 237, 4)

GroupLootHistoryFrame.ScrollBar:SetSize(25, 560)
GroupLootHistoryFrame.ScrollBar:ClearAllPoints()
GroupLootHistoryFrame.ScrollBar:SetPoint("TOPLEFT", GroupLootHistoryFrame.ScrollBox, "TOPRIGHT", -4, 1)
GroupLootHistoryFrame.ScrollBar:SetPoint("BOTTOMLEFT", GroupLootHistoryFrame.ScrollBox, "BOTTOMRIGHT", -3, -1)

if (GroupLootHistoryFrame.ScrollBar.BG == nil) then
	GroupLootHistoryFrame.ScrollBar.BG = GroupLootHistoryFrame.ScrollBar:CreateTexture(nil, "BACKGROUND");
	GroupLootHistoryFrame.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
	GroupLootHistoryFrame.ScrollBar.BG:SetAllPoints()
end

ApplyScrollBarArrow(GroupLootHistoryFrame.ScrollBar)
ApplyScrollBarTrack(GroupLootHistoryFrame.ScrollBar.Track)
ApplyScrollBarThumb(GroupLootHistoryFrame.ScrollBar.Track.Thumb)