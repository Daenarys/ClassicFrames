if not _G.GameMenuFrame then return end

hooksecurefunc("GameMenuFrame_UpdateVisibleButtons", function(self)
	self:SetHeight(270)
end)