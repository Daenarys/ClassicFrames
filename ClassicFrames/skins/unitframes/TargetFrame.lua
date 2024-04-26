if not _G.TargetFrame then return end

TargetFrame.textureFrame.Name:ClearAllPoints()
TargetFrame.textureFrame.Name:SetPoint("CENTER", -49, 18)

hooksecurefunc("TargetFrame_UpdateLevelTextAnchor", function(self)
	self.levelText:ClearAllPoints()
	self.levelText:SetPoint("CENTER", 63, -17)
end)