if not _G.ReadyCheckFrame then return end

ReadyCheckListenerFrame.Bg:Hide()
ReadyCheckListenerFrame.NineSlice:Hide()
ReadyCheckListenerFrame.TitleContainer:Hide()
ReadyCheckListenerFrame.PortraitContainer:SetFrameLevel(0)

ReadyCheckPortrait:SetSize(50, 50)
ReadyCheckPortrait:ClearAllPoints()
ReadyCheckPortrait:SetPoint("TOPLEFT", 7, -6)

ReadyCheckFrameText:ClearAllPoints()
ReadyCheckFrameText:SetPoint("CENTER", ReadyCheckListenerFrame, "TOP", 20, -35)

ReadyCheckFrameYesButton:ClearAllPoints()
ReadyCheckFrameYesButton:SetPoint("TOPRIGHT", ReadyCheckListenerFrame, "TOP", 13, -55)

ReadyCheckFrameNoButton:ClearAllPoints()
ReadyCheckFrameNoButton:SetPoint("TOPLEFT", ReadyCheckListenerFrame, "TOP", 17, -55)

if (ReadyCheckFrameTexture == nil) then
	ReadyCheckListenerFrame:CreateTexture("ReadyCheckFrameTexture", "ARTWORK")
	ReadyCheckFrameTexture:SetTexture("Interface\\RaidFrame\\UI-ReadyCheckFrame")
	ReadyCheckFrameTexture:SetTexCoord(0, 0.630859375, 0, 0.7578125)
	ReadyCheckFrameTexture:SetSize(323, 97)
	ReadyCheckFrameTexture:SetPoint("TOPLEFT")
end