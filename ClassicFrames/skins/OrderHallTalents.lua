local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_OrderHallUI" then
		hooksecurefunc(OrderHallTalentFrame, 'SetUseThemedTextures', function(frame, isThemed)
			if isThemed then
				ApplyCloseButton(OrderHallTalentFrameCloseButton)
				OrderHallTalentFrameCloseButton.Border:SetPoint("CENTER", 0, -1)
			else
				ApplyCloseButton(OrderHallTalentFrameCloseButton)

				OrderHallTalentFramePortrait:SetSize(61, 61)
				OrderHallTalentFramePortrait:ClearAllPoints()
				OrderHallTalentFramePortrait:SetPoint("TOPLEFT", -6, 8)

				OrderHallTalentFrame.TitleContainer:ClearAllPoints()
				OrderHallTalentFrame.TitleContainer:SetPoint("TOPLEFT", OrderHallTalentFrame, "TOPLEFT", 58, 0)
				OrderHallTalentFrame.TitleContainer:SetPoint("TOPRIGHT", OrderHallTalentFrame, "TOPRIGHT", -58, 0)

				ApplyTitleBg(OrderHallTalentFrame)
				ApplyNineSlicePortrait(OrderHallTalentFrame)
			end
		end)
	end
end)