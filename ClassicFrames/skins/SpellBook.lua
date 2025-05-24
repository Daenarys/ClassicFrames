if not _G.SpellBookFrame then return end

SpellBookFrameTabButton1:ClearAllPoints()
SpellBookFrameTabButton1:SetPoint("TOPLEFT", SpellBookFrame, "BOTTOMLEFT", 0, 1)

SpellBookSkillLineTab5:ClearAllPoints()
SpellBookSkillLineTab5:SetPoint("TOPLEFT", SpellBookSkillLineTab1, "BOTTOMLEFT", 0, -17)
SpellBookSkillLineTab2:ClearAllPoints()
SpellBookSkillLineTab2:SetPoint("TOPLEFT", SpellBookSkillLineTab5, "BOTTOMLEFT", 0, -17)
SpellBookSkillLineTab3:ClearAllPoints()
SpellBookSkillLineTab3:SetPoint("TOPLEFT", SpellBookSkillLineTab2, "BOTTOMLEFT", 0, -17)
SpellBookSkillLineTab4:ClearAllPoints()
SpellBookSkillLineTab4:SetPoint("TOPLEFT", SpellBookSkillLineTab3, "BOTTOMLEFT", 0, -17)