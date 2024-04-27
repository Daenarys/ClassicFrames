if not _G.PlayerFrame then return end

PlayerFrameHealthBarText:SetFontObject(SystemFont_Outline_Small)
PlayerFrameHealthBarTextLeft:SetFontObject(SystemFont_Outline_Small)
PlayerFrameHealthBarTextRight:SetFontObject(SystemFont_Outline_Small)

PlayerFrameHealthBarText:SetTextColor(1, 1, 1)
PlayerFrameHealthBarTextLeft:SetTextColor(1, 1, 1)
PlayerFrameHealthBarTextRight:SetTextColor(1, 1, 1)

PlayerFrameManaBarText:SetFontObject(SystemFont_Outline_Small)
PlayerFrameManaBarTextLeft:SetFontObject(SystemFont_Outline_Small)
PlayerFrameManaBarTextRight:SetFontObject(SystemFont_Outline_Small)

PlayerFrameManaBarText:SetTextColor(1, 1, 1)
PlayerFrameManaBarTextLeft:SetTextColor(1, 1, 1)
PlayerFrameManaBarTextRight:SetTextColor(1, 1, 1)

PlayerFrameHealthBar.breakUpLargeNumbers = true
PlayerFrameManaBar.breakUpLargeNumbers = true