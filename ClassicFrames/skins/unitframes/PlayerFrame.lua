if not _G.PlayerFrame then return end

PlayerFrameHealthBarText:SetFontObject(SystemFont_Outline_Small)
PlayerFrameHealthBarTextLeft:SetFontObject(SystemFont_Outline_Small)
PlayerFrameHealthBarTextRight:SetFontObject(SystemFont_Outline_Small)

PlayerFrameHealthBarText:SetTextColor(1, 1, 1)
PlayerFrameHealthBarTextLeft:SetTextColor(1, 1, 1)
PlayerFrameHealthBarTextRight:SetTextColor(1, 1, 1)

PlayerFrameHealthBarTextLeft:ClearAllPoints()
PlayerFrameHealthBarTextLeft:SetPoint("LEFT", 111, 3)

PlayerFrameManaBarText:SetFontObject(SystemFont_Outline_Small)
PlayerFrameManaBarTextLeft:SetFontObject(SystemFont_Outline_Small)
PlayerFrameManaBarTextRight:SetFontObject(SystemFont_Outline_Small)

PlayerFrameManaBarText:SetTextColor(1, 1, 1)
PlayerFrameManaBarTextLeft:SetTextColor(1, 1, 1)
PlayerFrameManaBarTextRight:SetTextColor(1, 1, 1)

PlayerFrameManaBarTextLeft:ClearAllPoints()
PlayerFrameManaBarTextLeft:SetPoint("LEFT", 111, -9)

PlayerFrameHealthBar.breakUpLargeNumbers = true
PlayerFrameManaBar.breakUpLargeNumbers = true

hooksecurefunc("PlayerFrame_ToPlayerArt", function()
	PlayerName:ClearAllPoints()
	PlayerName:SetPoint("CENTER", 51, 18)
end)

hooksecurefunc("PlayerFrame_UpdateLevelTextAnchor", function()
	PlayerLevelText:ClearAllPoints()
	PlayerLevelText:SetPoint("CENTER", -62, -17)
end)