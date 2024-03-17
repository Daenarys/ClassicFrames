local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Collections" then
		ApplyCloseButton(CollectionsJournalCloseButton)

		CollectionsJournal.PortraitContainer.CircleMask:Hide()

		CollectionsJournalPortrait:SetSize(61, 61)
		CollectionsJournalPortrait:ClearAllPoints()
		CollectionsJournalPortrait:SetPoint("TOPLEFT", -6, 8)

		CollectionsJournal.TitleContainer:ClearAllPoints()
		CollectionsJournal.TitleContainer:SetPoint("TOPLEFT", CollectionsJournal, "TOPLEFT", 58, 0)
		CollectionsJournal.TitleContainer:SetPoint("TOPRIGHT", CollectionsJournal, "TOPRIGHT", -58, 0)

		PetJournalTutorialButton.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")
		WardrobeCollectionFrame.InfoButton.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

		ApplyTitleBg(CollectionsJournal)
		ApplyNineSlicePortrait(CollectionsJournal)

		CollectionsJournalTab2:ClearAllPoints()
		CollectionsJournalTab2:SetPoint("LEFT", CollectionsJournalTab1, "RIGHT", -16, 0)
		CollectionsJournalTab3:ClearAllPoints()
		CollectionsJournalTab3:SetPoint("LEFT", CollectionsJournalTab2, "RIGHT", -16, 0)
		CollectionsJournalTab4:ClearAllPoints()
		CollectionsJournalTab4:SetPoint("LEFT", CollectionsJournalTab3, "RIGHT", -16, 0)
		CollectionsJournalTab5:ClearAllPoints()
		CollectionsJournalTab5:SetPoint("LEFT", CollectionsJournalTab4, "RIGHT", -16, 0)

		for i = 1,5 do
			ApplyBottomTab(_G['CollectionsJournalTab'..i])

			_G["CollectionsJournalTab"..i]:HookScript("OnShow", function(self)
				self:SetWidth(40 + self:GetFontString():GetStringWidth())
			end)
		end

		WardrobeCollectionFrameTab2:ClearAllPoints()
		WardrobeCollectionFrameTab2:SetPoint("LEFT", WardrobeCollectionFrameTab1, "RIGHT")

		for i = 1, 2 do
			ApplyTopTab(_G['WardrobeCollectionFrameTab'..i])

			_G["WardrobeCollectionFrameTab"..i]:HookScript("OnShow", function(self)
				if _G["WardrobeCollectionFrameTab"..i] == WardrobeCollectionFrameTab1 then
					self:SetWidth(58 + self:GetFontString():GetStringWidth())
				elseif _G["WardrobeCollectionFrameTab"..i] == WardrobeCollectionFrameTab2 then
					self:SetWidth(66 + self:GetFontString():GetStringWidth())
				end
			end)
		end

		MountJournal.ScrollBar:SetSize(25, 560)
		MountJournal.ScrollBar:ClearAllPoints()
		MountJournal.ScrollBar:SetPoint("TOPLEFT", MountJournal.ScrollBox, "TOPRIGHT", 1, 36)
		MountJournal.ScrollBar:SetPoint("BOTTOMLEFT", MountJournal.ScrollBox, "BOTTOMRIGHT", 4, -4)

		if (MountJournal.ScrollBar.BG == nil) then
			MountJournal.ScrollBar.BG = MountJournal.ScrollBar:CreateTexture(nil, "BACKGROUND");
			MountJournal.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			MountJournal.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(MountJournal.ScrollBar)
		ApplyScrollBarTrack(MountJournal.ScrollBar.Track)
		ApplyScrollBarThumb(MountJournal.ScrollBar.Track.Thumb)

		PetJournal.ScrollBar:SetSize(25, 560)
		PetJournal.ScrollBar:ClearAllPoints()
		PetJournal.ScrollBar:SetPoint("TOPLEFT", PetJournal.ScrollBox, "TOPRIGHT", 1, 36)
		PetJournal.ScrollBar:SetPoint("BOTTOMLEFT", PetJournal.ScrollBox, "BOTTOMRIGHT", 4, -4)

		if (PetJournal.ScrollBar.BG == nil) then
			PetJournal.ScrollBar.BG = PetJournal.ScrollBar:CreateTexture(nil, "BACKGROUND");
			PetJournal.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			PetJournal.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(PetJournal.ScrollBar)
		ApplyScrollBarTrack(PetJournal.ScrollBar.Track)
		ApplyScrollBarThumb(PetJournal.ScrollBar.Track.Thumb)

		WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar:SetSize(25, 560)
		WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar:ClearAllPoints()
		WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar:SetPoint("TOPLEFT", WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBox, "TOPRIGHT", 1, 36)
		WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar:SetPoint("BOTTOMLEFT", WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBox, "BOTTOMRIGHT", 4, -8)

		if (WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar.BG == nil) then
			WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar.BG = WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar:CreateTexture(nil, "BACKGROUND");
			WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar)
		ApplyScrollBarTrack(WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar.Track)
		ApplyScrollBarThumb(WardrobeCollectionFrame.SetsCollectionFrame.ListContainer.ScrollBar.Track.Thumb)

		MountJournal.MountDisplay.ModelScene.ControlFrame:HookScript("OnShow", function(self)
			self.rotateLeftButton:SetSize(35, 35)
			self.rotateLeftButton.NormalTexture:SetTexture("Interface\\Buttons\\UI-RotationLeft-Button-Up")
			self.rotateLeftButton.PushedTexture:SetTexture("Interface\\Buttons\\UI-RotationLeft-Button-Down")
			self.rotateLeftButton.HighlightTexture:SetTexture("Interface\\Buttons\\ButtonHilight-Round")
			self.rotateLeftButton.HighlightTexture:ClearAllPoints()
			self.rotateLeftButton.HighlightTexture:SetPoint("TOPLEFT", self.rotateLeftButton, "TOPLEFT")
			self.rotateLeftButton.HighlightTexture:SetPoint("BOTTOMRIGHT", self.rotateLeftButton, "BOTTOMRIGHT")
			self.rotateLeftButton.HighlightTexture:SetAlpha(1)
			self.rotateLeftButton:ClearAllPoints()
			self.rotateLeftButton:SetPoint("TOPRIGHT", MountJournal.MountDisplay.ModelScene, "BOTTOM", -5, 50)
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
			self.rotateRightButton:SetPoint("TOPLEFT", MountJournal.MountDisplay.ModelScene, "BOTTOM", 5, 50)
			self.rotateRightButton.Icon:Hide()
			self.rotateRightButton:SetHitRectInsets(0, 0, 0, 0)

			self.zoomInButton:Hide()
			self.zoomOutButton:Hide()
			self.resetButton:Hide()
		end)
	end
end)