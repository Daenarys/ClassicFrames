if not _G.GroupLootHistoryFrame then return end

ApplyCloseButton(GroupLootHistoryFrame.ClosePanelButton)

GroupLootHistoryFrame.TitleContainer:ClearAllPoints()
GroupLootHistoryFrame.TitleContainer:SetPoint("TOPLEFT", GroupLootHistoryFrame, "TOPLEFT", 60, -1)
GroupLootHistoryFrame.TitleContainer:SetPoint("TOPRIGHT", GroupLootHistoryFrame, "TOPRIGHT", -60, 1)

GroupLootHistoryFrameBg:SetAlpha(0)

if (GroupLootHistoryFrame.BG == nil) then
	GroupLootHistoryFrame.BG = GroupLootHistoryFrame:CreateTexture(nil, "BACKGROUND")
	GroupLootHistoryFrame.BG:SetTexture("Interface\\FrameGeneral\\UI-Background-Rock", true, true)
	GroupLootHistoryFrame.BG:ClearAllPoints()
	GroupLootHistoryFrame.BG:SetPoint("TOPLEFT", 2, -21)
	GroupLootHistoryFrame.BG:SetPoint("BOTTOMRIGHT", -2, 2)
end

if (GroupLootHistoryFrame.TopTileStreaks == nil) then
	GroupLootHistoryFrame.TopTileStreaks = GroupLootHistoryFrame:CreateTexture(nil, "BACKGROUND")
	GroupLootHistoryFrame.TopTileStreaks:SetSize(256, 37)
	GroupLootHistoryFrame.TopTileStreaks:SetAtlas("_UI-Frame-TopTileStreaks")
	GroupLootHistoryFrame.TopTileStreaks:SetHorizTile(true)
	GroupLootHistoryFrame.TopTileStreaks:ClearAllPoints()
	GroupLootHistoryFrame.TopTileStreaks:SetPoint("TOPLEFT", GroupLootHistoryFrame, "TOPLEFT", 0, -21)
	GroupLootHistoryFrame.TopTileStreaks:SetPoint("TOPRIGHT", GroupLootHistoryFrame, "TOPRIGHT", -2, -21)
end

ApplyTitleBg(GroupLootHistoryFrame)
ApplyNineSliceNoPortrait(GroupLootHistoryFrame)

GroupLootHistoryFrame.ScrollBar:SetSize(25, 560)
GroupLootHistoryFrame.ScrollBar:ClearAllPoints()
GroupLootHistoryFrame.ScrollBar:SetPoint("TOPLEFT", GroupLootHistoryFrame.ScrollBox, "TOPRIGHT", -6, 3)
GroupLootHistoryFrame.ScrollBar:SetPoint("BOTTOMLEFT", GroupLootHistoryFrame.ScrollBox, "BOTTOMRIGHT", -3, -1)

if (GroupLootHistoryFrame.ScrollBar.BG == nil) then
	GroupLootHistoryFrame.ScrollBar.BG = GroupLootHistoryFrame.ScrollBar:CreateTexture(nil, "BACKGROUND");
	GroupLootHistoryFrame.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
	GroupLootHistoryFrame.ScrollBar.BG:SetAllPoints()
end

ApplyScrollBarArrow(GroupLootHistoryFrame.ScrollBar)
ApplyScrollBarTrack(GroupLootHistoryFrame.ScrollBar.Track)
ApplyScrollBarThumb(GroupLootHistoryFrame.ScrollBar.Track.Thumb)

GroupLootHistoryFrame.ScrollBox:ClearAllPoints()
GroupLootHistoryFrame.ScrollBox:SetPoint("TOPLEFT", 0, -82)
GroupLootHistoryFrame.ScrollBox:SetPoint("BOTTOMRIGHT", GroupLootHistoryFrame, "BOTTOMLEFT", 237, 4)