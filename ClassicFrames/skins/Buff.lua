if not _G.BuffFrame then return end

hooksecurefunc("BuffFrame_Update", function()
	BuffFrame:ClearAllPoints()
	BuffFrame:SetPoint("TOPRIGHT", -205, -13)
end)