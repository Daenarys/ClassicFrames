if not _G.ItemTextFrame then return end

ItemTextTitleText:ClearAllPoints()
ItemTextTitleText:SetPoint("TOP", 0, -4)
ItemTextTitleText:SetPoint("LEFT", 60, 0)
ItemTextTitleText:SetPoint("RIGHT", -60, 0)

InboxFrameBg:SetSize(512, 543)
InboxFrameBg:SetTexture("Interface\\QuestFrame\\QuestBG")