if not _G.WorldMapFrame then return end

hooksecurefunc(WorldMapFrame, "SynchronizeDisplayState", function(self)
	if self:IsMaximized() then
		self:SetScale(1)
	else
		self:SetScale(0.85)
	end
end)