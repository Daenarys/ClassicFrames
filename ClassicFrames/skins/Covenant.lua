local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_CovenantPreviewUI" then
		if _G.CovenantPreviewFrame then
			ApplyCloseButton(CovenantPreviewFrame.CloseButton, true)
		end
	elseif name == "Blizzard_CovenantRenown" then
		if _G.CovenantRenownFrame then
			ApplyCloseButton(CovenantRenownFrame.CloseButton, true)
		end
	elseif name == "Blizzard_CovenantSanctum" then
		if _G.CovenantSanctumFrame then
			ApplyCloseButton(CovenantSanctumFrame.CloseButton, true)
		end
	elseif name == "Blizzard_Soulbinds" then
		if _G.SoulbindViewer then
			ApplyCloseButton(SoulbindViewer.CloseButton, true)
		end
	end
end)