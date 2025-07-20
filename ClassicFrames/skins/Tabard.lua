if not _G.TabardFrame then return end

TabardFrame.PortraitContainer.CircleMask:Hide()

TabardFramePortrait:SetSize(61, 61)
TabardFramePortrait:ClearAllPoints()
TabardFramePortrait:SetPoint("TOPLEFT", -6, 8)

TabardFramePortraitFrame:SetParent(TabardFrame.PortraitContainer)
TabardFramePortraitFrame:SetDrawLayer("OVERLAY", 1)