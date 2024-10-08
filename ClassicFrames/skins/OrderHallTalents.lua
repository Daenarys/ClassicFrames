local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_OrderHallUI" then
		hooksecurefunc(OrderHallTalentFrame, 'SetUseThemedTextures', function(frame, isThemed)
			if isThemed then
				OrderHallTalentFrameCloseButton:SetSize(32, 32)
				OrderHallTalentFrameCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
				OrderHallTalentFrameCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
				OrderHallTalentFrameCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
				OrderHallTalentFrameCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
			else
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
			end
		end)
	end
end)