local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_GenericTraitUI" then
		hooksecurefunc(GenericTraitFrame, "ApplyLayout", function(self, layoutInfo)
			if self:GetTalentTreeID() == 672 then
				GenericTraitFrame.Background:SetPoint("TOPLEFT", 8, -20)
				GenericTraitFrame.Background:SetPoint("BOTTOMRIGHT", -2, 2)
				GenericTraitFrame.NineSlice:SetPoint("TOPLEFT")
				GenericTraitFrame.NineSlice:SetPoint("BOTTOMRIGHT")

				GenericTraitFrame.CloseButton:SetPoint("TOPRIGHT", 4, 5)
				ApplyCloseButton(GenericTraitFrame.CloseButton)
				ApplyTitleBgNoPortrait(GenericTraitFrame)
				ApplyNineSliceNoPortrait(GenericTraitFrame)
			end
		end)
	end
end)