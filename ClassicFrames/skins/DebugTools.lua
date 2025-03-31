local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_DebugTools" then
		TableAttributeDisplay.CloseButton:ClearAllPoints()
		TableAttributeDisplay.CloseButton:SetPoint("TOPRIGHT", 2, 1)

		TableAttributeDisplay.LinesScrollFrame.ScrollBar:SetPoint("TOPLEFT", TableAttributeDisplay.LinesScrollFrame, "TOPRIGHT", -6, -16)
		TableAttributeDisplay.LinesScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", TableAttributeDisplay.LinesScrollFrame, "BOTTOMRIGHT", 6, 2)
	end
end)