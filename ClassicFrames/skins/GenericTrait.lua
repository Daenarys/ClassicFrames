local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_GenericTraitUI" then
		hooksecurefunc(GenericTraitFrame, "ApplyLayout", function(self, layoutInfo)
			if self:GetTalentTreeID() == 672 then
				GenericTraitFrame.Background:SetPoint("TOPLEFT", 2, -20)
				GenericTraitFrame.NineSlice:SetPoint("TOPLEFT", -4, 0)
				GenericTraitFrame.NineSlice:SetPoint("BOTTOMRIGHT", 4, -6)

				ApplyCloseButton(GenericTraitFrame.CloseButton)
				ApplyTitleBg(GenericTraitFrame, true)
				ApplyNineSliceNoPortrait(GenericTraitFrame)
			end
		end)
	end
end)