if not _G.TargetFrame then return end

TargetFrame.textureFrame.Name:ClearAllPoints()
TargetFrame.textureFrame.Name:SetPoint("CENTER", -49, 18)

TargetFrame.textureFrame.HealthBarText:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
TargetFrame.textureFrame.HealthBarTextLeft:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
TargetFrame.textureFrame.HealthBarTextRight:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")

TargetFrame.textureFrame.HealthBarText:SetTextColor(1, 1, 1)
TargetFrame.textureFrame.HealthBarTextLeft:SetTextColor(1, 1, 1)
TargetFrame.textureFrame.HealthBarTextRight:SetTextColor(1, 1, 1)

TargetFrame.textureFrame.HealthBarTextLeft:ClearAllPoints()
TargetFrame.textureFrame.HealthBarTextLeft:SetPoint("LEFT", 8, 3)

TargetFrame.textureFrame.ManaBarText:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
TargetFrame.textureFrame.ManaBarTextLeft:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
TargetFrame.textureFrame.ManaBarTextRight:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")

TargetFrame.textureFrame.ManaBarText:SetTextColor(1, 1, 1)
TargetFrame.textureFrame.ManaBarTextLeft:SetTextColor(1, 1, 1)
TargetFrame.textureFrame.ManaBarTextRight:SetTextColor(1, 1, 1)

TargetFrame.textureFrame.ManaBarTextLeft:ClearAllPoints()
TargetFrame.textureFrame.ManaBarTextLeft:SetPoint("LEFT", 8, -9)

hooksecurefunc("TargetFrame_UpdateLevelTextAnchor", function(self)
	self.levelText:ClearAllPoints()
	self.levelText:SetPoint("CENTER", 63, -17)
end)