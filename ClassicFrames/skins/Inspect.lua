local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_InspectUI" then
		ApplyCloseButton(InspectFrameCloseButton)

		InspectFramePortrait:SetSize(61, 61)
		InspectFramePortrait:ClearAllPoints()
		InspectFramePortrait:SetPoint("TOPLEFT", -6, 8)

		InspectFrame.TitleContainer:ClearAllPoints()
		InspectFrame.TitleContainer:SetPoint("TOPLEFT", InspectFrame, "TOPLEFT", 58, 0)
		InspectFrame.TitleContainer:SetPoint("TOPRIGHT", InspectFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(InspectFrame)
		ApplyNineSlicePortrait(InspectFrame)

		InspectFrameTab2:ClearAllPoints()
		InspectFrameTab2:SetPoint("LEFT", InspectFrameTab1, "RIGHT", -16, 0)
		InspectFrameTab3:ClearAllPoints()
		InspectFrameTab3:SetPoint("LEFT", InspectFrameTab2, "RIGHT", -16, 0)

		for i = 1, 3 do
			ApplyBottomTab(_G['InspectFrameTab'..i])

			_G["InspectFrameTab"..i]:HookScript("OnShow", function()
				InspectFrameTab1:SetWidth(40 + InspectFrameTab1:GetFontString():GetStringWidth())
				InspectFrameTab2:SetWidth(56 + InspectFrameTab2:GetFontString():GetStringWidth())
				InspectFrameTab3:SetWidth(50 + InspectFrameTab3:GetFontString():GetStringWidth())
			end)
		end
	end
end)