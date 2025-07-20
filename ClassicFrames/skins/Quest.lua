if not _G.QuestFrame then return end

QuestFrame.PortraitContainer.CircleMask:Hide()

QuestFramePortrait:SetSize(61, 61)
QuestFramePortrait:ClearAllPoints()
QuestFramePortrait:SetPoint("TOPLEFT", -6, 8)

QuestFramePortraitFrame:SetParent(QuestFrame.PortraitContainer)
QuestFramePortraitFrame:SetDrawLayer("OVERLAY", 1)