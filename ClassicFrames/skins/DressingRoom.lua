if not _G.DressUpFrame then return end

ApplyCloseButton(DressUpFrameCloseButton)

DressUpFrame.MaximizeMinimizeFrame:SetSize(32, 32)
DressUpFrame.MaximizeMinimizeFrame:ClearAllPoints()
DressUpFrame.MaximizeMinimizeFrame:SetPoint("RIGHT", DressUpFrameCloseButton, "LEFT", 10, 0)

DressUpFrame.MaximizeMinimizeFrame.MaximizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Up")
DressUpFrame.MaximizeMinimizeFrame.MaximizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Down")
DressUpFrame.MaximizeMinimizeFrame.MaximizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Disabled")
DressUpFrame.MaximizeMinimizeFrame.MaximizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

DressUpFrame.MaximizeMinimizeFrame.MinimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Up")
DressUpFrame.MaximizeMinimizeFrame.MinimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Down")
DressUpFrame.MaximizeMinimizeFrame.MinimizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Disabled")
DressUpFrame.MaximizeMinimizeFrame.MinimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

if not DressUpFrame.ButtonFrameEdge then
	DressUpFrame.ButtonFrameEdge = DressUpFrame.MaximizeMinimizeFrame:CreateTexture(nil, "OVERLAY")
	DressUpFrame.ButtonFrameEdge:SetAtlas("UI-OuterBorderButtonPatch", true)
	DressUpFrame.ButtonFrameEdge:ClearAllPoints()
	DressUpFrame.ButtonFrameEdge:SetPoint("CENTER", DressUpFrame.MaximizeMinimizeFrame, "LEFT", 6, 0)
end

DressUpFrame.PortraitContainer.CircleMask:Hide()

DressUpFramePortrait:SetSize(61, 61)
DressUpFramePortrait:ClearAllPoints()
DressUpFramePortrait:SetPoint("TOPLEFT", -6, 8)

DressUpFrame.TitleContainer:ClearAllPoints()
DressUpFrame.TitleContainer:SetPoint("TOPLEFT", DressUpFrame, "TOPLEFT", 58, 0)
DressUpFrame.TitleContainer:SetPoint("TOPRIGHT", DressUpFrame, "TOPRIGHT", -58, 0)

ApplyTitleBg(DressUpFrame)
ApplyNineSlicePortrait(DressUpFrame)

SideDressUpFrameCloseButton:SetSize(32, 32)
SideDressUpFrameCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
SideDressUpFrameCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
SideDressUpFrameCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
SideDressUpFrameCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

DressUpFrame.ModelScene.ControlFrame:HookScript("OnShow", function(self)
	ApplyControlFrame(self)
end)