local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_PlayerChoice" then
		ApplyCloseButton(PlayerChoiceFrame.CloseButton, true)
	end
end)