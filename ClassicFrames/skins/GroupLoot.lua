if not _G.GroupLootHistoryFrame then return end

ApplyCloseButton(GroupLootHistoryFrame.ClosePanelButton)

GroupLootHistoryFrame.TitleContainer:ClearAllPoints()
GroupLootHistoryFrame.TitleContainer:SetPoint("TOPLEFT", GroupLootHistoryFrame, "TOPLEFT", 60, -1)
GroupLootHistoryFrame.TitleContainer:SetPoint("TOPRIGHT", GroupLootHistoryFrame, "TOPRIGHT", -60, 1)

ApplyTitleBgNoPortrait(GroupLootHistoryFrame)
ApplyNineSliceNoPortrait(GroupLootHistoryFrame)

ApplyScrollBarArrow(GroupLootHistoryFrame.ScrollBar)
ApplyScrollBarTrack(GroupLootHistoryFrame.ScrollBar.Track)
ApplyScrollBarThumb(GroupLootHistoryFrame.ScrollBar.Track.Thumb)

ApplyDropDown(GroupLootHistoryFrame.EncounterDropdown)
GroupLootHistoryFrame.EncounterDropdown.Text:SetJustifyH("RIGHT")