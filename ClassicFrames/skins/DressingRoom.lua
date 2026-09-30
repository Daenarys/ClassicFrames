if not _G.DressUpFrame then return end

ApplyCloseButton(DressUpFrameCloseButton)

DressUpFrame.MaximizeMinimizeFrame:SetSize(32, 32)
DressUpFrame.MaximizeMinimizeFrame:ClearAllPoints()
DressUpFrame.MaximizeMinimizeFrame:SetPoint("RIGHT", DressUpFrameCloseButton, "LEFT", 8.5, 0)
DressUpFrame.MaximizeMinimizeFrame:SetFrameLevel(2)

ApplyMaxMinButton(DressUpFrame.MaximizeMinimizeFrame)

DressUpFramePortrait:SetSize(61, 61)
DressUpFramePortrait:ClearAllPoints()
DressUpFramePortrait:SetPoint("TOPLEFT", -6, 8)

DressUpFrame.TitleContainer:ClearAllPoints()
DressUpFrame.TitleContainer:SetPoint("TOPLEFT", DressUpFrame, "TOPLEFT", 58, 0)
DressUpFrame.TitleContainer:SetPoint("TOPRIGHT", DressUpFrame, "TOPRIGHT", -58, 0)

ApplyTitleBg(DressUpFrame)
ApplyNineSlicePortraitMinimizable(DressUpFrame)

DressUpFrame.SetSelectionPanel.ScrollBar.Track.Begin:Hide()
DressUpFrame.SetSelectionPanel.ScrollBar.Track.End:Hide()
DressUpFrame.SetSelectionPanel.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(DressUpFrame.SetSelectionPanel.ScrollBar, true)
ApplyScrollBarThumb(DressUpFrame.SetSelectionPanel.ScrollBar.Track.Thumb)

ApplyDropDown(DressUpFrameCustomSetDropdown)

ApplyCloseButton(SideDressUpFrameCloseButton, true)