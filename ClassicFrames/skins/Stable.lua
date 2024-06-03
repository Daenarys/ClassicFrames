if not _G.StableFrame then return end

ApplyCloseButton(StableFrameCloseButton)

StableFrame.PortraitContainer.CircleMask:Hide()

StableFramePortrait:SetSize(61, 61)
StableFramePortrait:ClearAllPoints()
StableFramePortrait:SetPoint("TOPLEFT", -6, 8)

StableFrame.TitleContainer:ClearAllPoints()
StableFrame.TitleContainer:SetPoint("TOPLEFT", StableFrame, "TOPLEFT", 58, 0)
StableFrame.TitleContainer:SetPoint("TOPRIGHT", StableFrame, "TOPRIGHT", -58, 0)

StableFrame.MainHelpButton.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

ApplyTitleBg(StableFrame)
ApplyNineSlicePortrait(StableFrame)

StableFrame.StabledPetList.ScrollBar:SetSize(25, 560)
StableFrame.StabledPetList.ScrollBar:ClearAllPoints()
StableFrame.StabledPetList.ScrollBar:SetPoint("TOPLEFT", StableFrame.StabledPetList.ScrollBox, "TOPRIGHT", -7, 6)
StableFrame.StabledPetList.ScrollBar:SetPoint("BOTTOMLEFT", StableFrame.StabledPetList.ScrollBox, "BOTTOMRIGHT", -7, -1)

ApplyScrollBarArrow(StableFrame.StabledPetList.ScrollBar)
ApplyScrollBarTrack(StableFrame.StabledPetList.ScrollBar.Track)
ApplyScrollBarThumb(StableFrame.StabledPetList.ScrollBar.Track.Thumb)

if (StableFrame.StabledPetList.ScrollBar.BG == nil) then
	StableFrame.StabledPetList.ScrollBar.BG = StableFrame.StabledPetList.ScrollBar:CreateTexture(nil, "BACKGROUND")
	StableFrame.StabledPetList.ScrollBar.BG:SetColorTexture(0, 0, 0, 0.75)
	StableFrame.StabledPetList.ScrollBar.BG:SetAllPoints()
end

ApplySearchBox(StableFrame.StabledPetList.FilterBar.SearchBox)

StableFrame.PetModelScene.ControlFrame:HookScript("OnShow", function(self)
	self.rotateLeftButton:SetSize(35, 35)
	self.rotateLeftButton.NormalTexture:SetTexture("Interface\\Buttons\\UI-RotationLeft-Button-Up")
	self.rotateLeftButton.PushedTexture:SetTexture("Interface\\Buttons\\UI-RotationLeft-Button-Down")
	self.rotateLeftButton.HighlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Round")
	self.rotateLeftButton.HighlightTexture:ClearAllPoints()
	self.rotateLeftButton.HighlightTexture:SetPoint("TOPLEFT", self.rotateLeftButton, "TOPLEFT")
	self.rotateLeftButton.HighlightTexture:SetPoint("BOTTOMRIGHT", self.rotateLeftButton, "BOTTOMRIGHT")
	self.rotateLeftButton.HighlightTexture:SetAlpha(1)
	self.rotateLeftButton:ClearAllPoints()
	self.rotateLeftButton:SetPoint("LEFT", 25, 0)
	self.rotateLeftButton.Icon:Hide()
	self.rotateLeftButton:SetHitRectInsets(0, 0, 0, 0)

	self.rotateRightButton:SetSize(35, 35)
	self.rotateRightButton.NormalTexture:SetTexture("Interface\\Buttons\\UI-RotationRight-Button-Up")
	self.rotateRightButton.PushedTexture:SetTexture("Interface\\Buttons\\UI-RotationRight-Button-Down")
	self.rotateRightButton.HighlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Round")
	self.rotateRightButton.HighlightTexture:ClearAllPoints()
	self.rotateRightButton.HighlightTexture:SetPoint("TOPLEFT", self.rotateRightButton, "TOPLEFT")
	self.rotateRightButton.HighlightTexture:SetPoint("BOTTOMRIGHT", self.rotateRightButton, "BOTTOMRIGHT")
	self.rotateRightButton.HighlightTexture:SetAlpha(1)
	self.rotateRightButton:ClearAllPoints()
	self.rotateRightButton:SetPoint("RIGHT", self.rotateLeftButton, "RIGHT", 50, 0)
	self.rotateRightButton.Icon:Hide()
	self.rotateRightButton:SetHitRectInsets(0, 0, 0, 0)

	self.zoomInButton:Hide()
	self.zoomOutButton:Hide()
	self.resetButton:Hide()
end)