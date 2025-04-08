local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_GlyphUI" then
		ApplyDropDown(GlyphFrame.FilterDropdown)
	end
end)