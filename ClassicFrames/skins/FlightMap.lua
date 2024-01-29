local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_FlightMap" then
		ApplyCloseButton(FlightMapFrameCloseButton)

		FlightMapFrame.BorderFrame.PortraitContainer.CircleMask:Hide()

		FlightMapFramePortrait:SetSize(61, 61)
		FlightMapFramePortrait:ClearAllPoints()
		FlightMapFramePortrait:SetPoint("TOPLEFT", -6, 8)

		FlightMapFrame.BorderFrame.TitleContainer:ClearAllPoints()
		FlightMapFrame.BorderFrame.TitleContainer:SetPoint("TOPLEFT", FlightMapFrame, "TOPLEFT", 58, 0)
		FlightMapFrame.BorderFrame.TitleContainer:SetPoint("TOPRIGHT", FlightMapFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(FlightMapFrame)
		ApplyNineSlicePortrait(FlightMapFrame.BorderFrame)
		
		_G.FlightMapFrame:HookScript("OnShow", function(self)
			self:ClearAllPoints()
			self:SetPoint("CENTER")
		end)
	end
end)