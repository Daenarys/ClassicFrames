if not _G.GroupLootHistoryFrame then return end

ApplyCloseButton(GroupLootHistoryFrame.ClosePanelButton)

GroupLootHistoryFrame.TitleContainer:ClearAllPoints()
GroupLootHistoryFrame.TitleContainer:SetPoint("TOPLEFT", GroupLootHistoryFrame, "TOPLEFT", 58, -1)
GroupLootHistoryFrame.TitleContainer:SetPoint("TOPRIGHT", GroupLootHistoryFrame, "TOPRIGHT", -58, 1)

ApplyTitleBg(GroupLootHistoryFrame, true)
ApplyNineSliceNoPortrait(GroupLootHistoryFrame)

ApplyScrollBarHybrid(GroupLootHistoryFrame.ScrollBar, true)
ApplyScrollBarThumb(GroupLootHistoryFrame.ScrollBar.Track.Thumb)

ApplyDropDown(GroupLootHistoryFrame.EncounterDropdown)
GroupLootHistoryFrame.EncounterDropdown.Text:SetJustifyH("RIGHT")