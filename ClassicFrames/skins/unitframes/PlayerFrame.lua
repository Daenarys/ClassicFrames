if not _G.PlayerFrame then return end

PlayerFrameHealthBarText:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
PlayerFrameHealthBarTextLeft:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
PlayerFrameHealthBarTextRight:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")

PlayerFrameHealthBarText:SetTextColor(1, 1, 1)
PlayerFrameHealthBarTextLeft:SetTextColor(1, 1, 1)
PlayerFrameHealthBarTextRight:SetTextColor(1, 1, 1)

PlayerFrameHealthBarTextLeft:ClearAllPoints()
PlayerFrameHealthBarTextLeft:SetPoint("LEFT", 111, 3)

PlayerFrameManaBarText:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
PlayerFrameManaBarTextLeft:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
PlayerFrameManaBarTextRight:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")

PlayerFrameManaBarText:SetTextColor(1, 1, 1)
PlayerFrameManaBarTextLeft:SetTextColor(1, 1, 1)
PlayerFrameManaBarTextRight:SetTextColor(1, 1, 1)

PlayerFrameManaBarTextLeft:ClearAllPoints()
PlayerFrameManaBarTextLeft:SetPoint("LEFT", 111, -9)

hooksecurefunc("PlayerFrame_ToPlayerArt", function()
	PlayerName:ClearAllPoints()
	PlayerName:SetPoint("CENTER", 51, 18)
end)

hooksecurefunc("PlayerFrame_UpdateLevelTextAnchor", function()
	PlayerLevelText:ClearAllPoints()
	PlayerLevelText:SetPoint("CENTER", -62, -17)
end)