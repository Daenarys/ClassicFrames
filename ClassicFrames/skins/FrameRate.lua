if not _G.FramerateFrame then return end

hooksecurefunc(FramerateFrame, "UpdatePosition", function(self)
	self:ClearAllPoints()
	self:SetPoint("BOTTOM", UIParent, "BOTTOM", 0, 75)
end)