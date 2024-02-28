local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_OrderHallUI" then
		hooksecurefunc(OrderHallTalentFrame, 'RefreshAllData', function(frame)
			ApplyCloseButton(OrderHallTalentFrameCloseButton)

			OrderHallTalentFrame.PortraitContainer.CircleMask:Hide()

			OrderHallTalentFramePortrait:SetSize(61, 61)
			OrderHallTalentFramePortrait:ClearAllPoints()
			OrderHallTalentFramePortrait:SetPoint("TOPLEFT", -6, 8)

			OrderHallTalentFrame.TitleContainer:ClearAllPoints()
			OrderHallTalentFrame.TitleContainer:SetPoint("TOPLEFT", OrderHallTalentFrame, "TOPLEFT", 58, 0)
			OrderHallTalentFrame.TitleContainer:SetPoint("TOPRIGHT", OrderHallTalentFrame, "TOPRIGHT", -58, 0)

			ApplyTitleBg(OrderHallTalentFrame)
			ApplyNineSlicePortrait(OrderHallTalentFrame)

			OrderHallTalentFrameBg:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-Background-Rock", true, true)
		end)
	end
end)