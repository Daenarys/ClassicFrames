if not _G.TargetFrame then return end

TargetFrame.textureFrame.Name:ClearAllPoints()
TargetFrame.textureFrame.Name:SetPoint("CENTER", -49, 18)

TargetFrame.textureFrame.HealthBarText:SetFontObject(SystemFont_Outline_Small)
TargetFrame.textureFrame.HealthBarTextLeft:SetFontObject(SystemFont_Outline_Small)
TargetFrame.textureFrame.HealthBarTextRight:SetFontObject(SystemFont_Outline_Small)

TargetFrame.textureFrame.HealthBarText:SetTextColor(1, 1, 1)
TargetFrame.textureFrame.HealthBarTextLeft:SetTextColor(1, 1, 1)
TargetFrame.textureFrame.HealthBarTextRight:SetTextColor(1, 1, 1)

TargetFrame.textureFrame.HealthBarTextLeft:ClearAllPoints()
TargetFrame.textureFrame.HealthBarTextLeft:SetPoint("LEFT", 8, 3)

TargetFrame.textureFrame.ManaBarText:SetFontObject(SystemFont_Outline_Small)
TargetFrame.textureFrame.ManaBarTextLeft:SetFontObject(SystemFont_Outline_Small)
TargetFrame.textureFrame.ManaBarTextRight:SetFontObject(SystemFont_Outline_Small)

TargetFrame.textureFrame.ManaBarText:SetTextColor(1, 1, 1)
TargetFrame.textureFrame.ManaBarTextLeft:SetTextColor(1, 1, 1)
TargetFrame.textureFrame.ManaBarTextRight:SetTextColor(1, 1, 1)

TargetFrame.textureFrame.ManaBarTextLeft:ClearAllPoints()
TargetFrame.textureFrame.ManaBarTextLeft:SetPoint("LEFT", 8, -9)

hooksecurefunc("TargetFrame_UpdateLevelTextAnchor", function(self)
	self.levelText:ClearAllPoints()
	self.levelText:SetPoint("CENTER", 63, -17)
end)