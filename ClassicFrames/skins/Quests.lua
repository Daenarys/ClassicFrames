if not _G.QuestFrame then return end

QuestDetailScrollFrameTop:Hide()
QuestDetailScrollFrameMiddle:Hide()
QuestDetailScrollFrameBottom:Hide()

_G.QuestLogDetailFrame:HookScript("OnShow", function(self)
	self:ClearAllPoints()
	self:SetPoint("TOPLEFT", 0, -104)
end)