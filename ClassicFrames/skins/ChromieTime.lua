local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ChromieTimeUI" then
		ApplyCloseButton(ChromieTimeFrame.CloseButton, true)
		ChromieTimeFrame.CloseButton:ClearAllPoints()
		ChromieTimeFrame.CloseButton:SetPoint("TOPRIGHT", 3, 2)
	end
end)