local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_PerksProgram" then
		PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar.Track.Begin:Hide()
		PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar.Track.End:Hide()
		PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrowNoPos(PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar)
		ApplyScrollBarThumb(PerksProgramFrame.ProductsFrame.ProductsScrollBoxContainer.ScrollBar.Track.Thumb)

		PerksProgramFrame.ProductsFrame.PerksProgramProductDetailsContainerFrame.SetDetailsScrollBoxContainer.ScrollBar.Track.Begin:Hide()
		PerksProgramFrame.ProductsFrame.PerksProgramProductDetailsContainerFrame.SetDetailsScrollBoxContainer.ScrollBar.Track.End:Hide()
		PerksProgramFrame.ProductsFrame.PerksProgramProductDetailsContainerFrame.SetDetailsScrollBoxContainer.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrowNoPos(PerksProgramFrame.ProductsFrame.PerksProgramProductDetailsContainerFrame.SetDetailsScrollBoxContainer.ScrollBar)
		ApplyScrollBarThumb(PerksProgramFrame.ProductsFrame.PerksProgramProductDetailsContainerFrame.SetDetailsScrollBoxContainer.ScrollBar.Track.Thumb)
	end
end)