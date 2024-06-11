if not _G.TargetFrame then return end

TargetFrame.textureFrame.HealthBarText:SetFontObject(SystemFont_Outline_Small)
TargetFrame.textureFrame.HealthBarTextLeft:SetFontObject(SystemFont_Outline_Small)
TargetFrame.textureFrame.HealthBarTextRight:SetFontObject(SystemFont_Outline_Small)

TargetFrame.textureFrame.HealthBarText:SetTextColor(1, 1, 1)
TargetFrame.textureFrame.HealthBarTextLeft:SetTextColor(1, 1, 1)
TargetFrame.textureFrame.HealthBarTextRight:SetTextColor(1, 1, 1)

TargetFrame.textureFrame.HealthBarTextLeft:ClearAllPoints()
TargetFrame.textureFrame.HealthBarTextLeft:SetPoint("LEFT", 7, 3)

TargetFrame.textureFrame.ManaBarText:SetFontObject(SystemFont_Outline_Small)
TargetFrame.textureFrame.ManaBarTextLeft:SetFontObject(SystemFont_Outline_Small)
TargetFrame.textureFrame.ManaBarTextRight:SetFontObject(SystemFont_Outline_Small)

TargetFrame.textureFrame.ManaBarText:SetTextColor(1, 1, 1)
TargetFrame.textureFrame.ManaBarTextLeft:SetTextColor(1, 1, 1)
TargetFrame.textureFrame.ManaBarTextRight:SetTextColor(1, 1, 1)

TargetFrame.textureFrame.ManaBarTextLeft:ClearAllPoints()
TargetFrame.textureFrame.ManaBarTextLeft:SetPoint("LEFT", 7, -8)