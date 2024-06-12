local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_VoidStorageUI" then
		ApplyCloseButton(VoidStorageBorderFrame.CloseButton)
		ApplySearchBox(VoidItemSearchBox)
	end
end)