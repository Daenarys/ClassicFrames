local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ItemInteractionUI" then
		ApplyCloseButton(ItemInteractionFrameCloseButton)

		ItemInteractionFrame.PortraitContainer.CircleMask:Hide()

		ItemInteractionFramePortrait:SetSize(61, 61)
		ItemInteractionFramePortrait:ClearAllPoints()
		ItemInteractionFramePortrait:SetPoint("TOPLEFT", -6, 8)

		ItemInteractionFrame.TitleContainer:ClearAllPoints()
		ItemInteractionFrame.TitleContainer:SetPoint("TOPLEFT", ItemInteractionFrame, "TOPLEFT", 58, 0)
		ItemInteractionFrame.TitleContainer:SetPoint("TOPRIGHT", ItemInteractionFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(ItemInteractionFrame)
		ApplyNineSlicePortrait(ItemInteractionFrame)

		hooksecurefunc(ItemInteractionFrame, "Show", function()
			if ContainerFrame1MoneyFrame then
				ContainerFrame1MoneyFrame:ClearAllPoints()
				ContainerFrame1MoneyFrame:SetPoint("TOPRIGHT", ContainerFrame1, "TOPRIGHT", -2, -272)
			end
		end)
	end
end)