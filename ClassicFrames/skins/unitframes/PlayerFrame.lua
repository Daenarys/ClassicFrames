if not _G.PlayerFrame then return end

hooksecurefunc("PlayerFrame_ToPlayerArt", function()
	PlayerName:ClearAllPoints()
	PlayerName:SetPoint("CENTER", 51, 18)
end)


hooksecurefunc("PlayerFrame_UpdateLevelTextAnchor", function()
	PlayerLevelText:ClearAllPoints()
	PlayerLevelText:SetPoint("CENTER", -62, -17)
end)