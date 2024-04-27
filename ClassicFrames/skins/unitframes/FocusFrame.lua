if not _G.FocusFrame then return end

FocusFrame.textureFrame.Name:ClearAllPoints()
FocusFrame.textureFrame.Name:SetPoint("CENTER", -49, 18)

FocusFrame.textureFrame.HealthBarText:SetFontObject(SystemFont_Outline_Small)
FocusFrame.textureFrame.HealthBarTextLeft:SetFontObject(SystemFont_Outline_Small)
FocusFrame.textureFrame.HealthBarTextRight:SetFontObject(SystemFont_Outline_Small)

FocusFrame.textureFrame.HealthBarText:SetTextColor(1, 1, 1)
FocusFrame.textureFrame.HealthBarTextLeft:SetTextColor(1, 1, 1)
FocusFrame.textureFrame.HealthBarTextRight:SetTextColor(1, 1, 1)

FocusFrame.textureFrame.HealthBarTextLeft:ClearAllPoints()
FocusFrame.textureFrame.HealthBarTextLeft:SetPoint("LEFT", 8, 3)

FocusFrame.textureFrame.ManaBarText:SetFontObject(SystemFont_Outline_Small)
FocusFrame.textureFrame.ManaBarTextLeft:SetFontObject(SystemFont_Outline_Small)
FocusFrame.textureFrame.ManaBarTextRight:SetFontObject(SystemFont_Outline_Small)

FocusFrame.textureFrame.ManaBarText:SetTextColor(1, 1, 1)
FocusFrame.textureFrame.ManaBarTextLeft:SetTextColor(1, 1, 1)
FocusFrame.textureFrame.ManaBarTextRight:SetTextColor(1, 1, 1)

FocusFrame.textureFrame.ManaBarTextLeft:ClearAllPoints()
FocusFrame.textureFrame.ManaBarTextLeft:SetPoint("LEFT", 8, -9)

FocusFrameHealthBar.breakUpLargeNumbers = true
FocusFrameManaBar.breakUpLargeNumbers = true