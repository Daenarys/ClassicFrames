if not _G.BuffFrame then return end

hooksecurefunc(BuffFrame.CollapseAndExpandButton, "UpdateOrientation", function(self)
	self:Hide()
end)