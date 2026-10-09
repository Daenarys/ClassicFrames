if not _G.TabardFrame then return end

ApplyCloseButton(TabardFrameCloseButton)

TabardFramePortrait:SetSize(61, 61)
TabardFramePortrait:ClearAllPoints()
TabardFramePortrait:SetPoint("TOPLEFT", -6, 8)

TabardFrame.TitleContainer:ClearAllPoints()
TabardFrame.TitleContainer:SetPoint("TOPLEFT", TabardFrame, "TOPLEFT", 58, 0)
TabardFrame.TitleContainer:SetPoint("TOPRIGHT", TabardFrame, "TOPRIGHT", -58, 0)

ApplyTitleBg(TabardFrame)
ApplyNineSlicePortrait(TabardFrame)