if not _G.DressUpFrame then return end

ApplyCloseButton(DressUpFrameCloseButton)

DressUpFrame.MaximizeMinimizeFrame:SetSize(32, 32)
DressUpFrame.MaximizeMinimizeFrame:ClearAllPoints()
DressUpFrame.MaximizeMinimizeFrame:SetPoint("RIGHT", DressUpFrameCloseButton, "LEFT", 8.5, 0)
DressUpFrame.MaximizeMinimizeFrame:SetFrameLevel(2)

DressUpFrame.MaximizeMinimizeFrame.MaximizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Up")
DressUpFrame.MaximizeMinimizeFrame.MaximizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Down")
DressUpFrame.MaximizeMinimizeFrame.MaximizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Disabled")
DressUpFrame.MaximizeMinimizeFrame.MaximizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

DressUpFrame.MaximizeMinimizeFrame.MinimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Up")
DressUpFrame.MaximizeMinimizeFrame.MinimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Down")
DressUpFrame.MaximizeMinimizeFrame.MinimizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Disabled")
DressUpFrame.MaximizeMinimizeFrame.MinimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

DressUpFrame.PortraitContainer.CircleMask:Hide()

DressUpFramePortrait:SetSize(61, 61)
DressUpFramePortrait:ClearAllPoints()
DressUpFramePortrait:SetPoint("TOPLEFT", -6, 8)

DressUpFrame.TitleContainer:ClearAllPoints()
DressUpFrame.TitleContainer:SetPoint("TOPLEFT", DressUpFrame, "TOPLEFT", 58, 0)
DressUpFrame.TitleContainer:SetPoint("TOPRIGHT", DressUpFrame, "TOPRIGHT", -58, 0)

ApplyTitleBg(DressUpFrame)
ApplyNineSlicePortraitMinimizable(DressUpFrame)

DressUpFrame.SetSelectionPanel.ScrollBar:SetSize(25, 560)
DressUpFrame.SetSelectionPanel.ScrollBar:ClearAllPoints()
DressUpFrame.SetSelectionPanel.ScrollBar:SetPoint("TOPLEFT", DressUpFrame.SetSelectionPanel.ScrollBox, "TOPRIGHT")
DressUpFrame.SetSelectionPanel.ScrollBar:SetPoint("BOTTOMLEFT", DressUpFrame.SetSelectionPanel.ScrollBox, "BOTTOMRIGHT")

DressUpFrame.SetSelectionPanel.ScrollBar.Track:ClearAllPoints()
DressUpFrame.SetSelectionPanel.ScrollBar.Track:SetPoint("TOPLEFT", 4, -22)
DressUpFrame.SetSelectionPanel.ScrollBar.Track:SetPoint("BOTTOMRIGHT", -4, 22)

DressUpFrame.SetSelectionPanel.ScrollBar.Track.Begin:Hide()
DressUpFrame.SetSelectionPanel.ScrollBar.Track.End:Hide()
DressUpFrame.SetSelectionPanel.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(DressUpFrame.SetSelectionPanel.ScrollBar)
ApplyScrollBarThumb(DressUpFrame.SetSelectionPanel.ScrollBar.Track.Thumb)

SideDressUpFrameCloseButton:SetSize(32, 32)
SideDressUpFrameCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
SideDressUpFrameCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
SideDressUpFrameCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
SideDressUpFrameCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

ApplyDropDown(DressUpFrameOutfitDropdown)

DressUpFrame.ModelScene.ControlFrame:HookScript("OnShow", function(self)
	self:SetPoint("TOP")
end)