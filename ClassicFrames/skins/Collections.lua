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

		CollectionsJournalBg:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-Background-Rock", true, true)

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

		PetJournal.ScrollBar.Track.Thumb:SetWidth(18)
		PetJournal.ScrollBar.Track.Thumb.Begin:SetAtlas("UI-ScrollBar-Knob-EndCap-Top", true)
		PetJournal.ScrollBar.Track.Thumb.End:SetAtlas("UI-ScrollBar-Knob-EndCap-Bottom", true)
		PetJournal.ScrollBar.Track.Thumb.Middle:SetAtlas("UI-ScrollBar-Knob-Center", true)
		PetJournal.ScrollBar.Track.Thumb.upBeginTexture = "UI-ScrollBar-Knob-EndCap-Top"
		PetJournal.ScrollBar.Track.Thumb.upMiddleTexture = "UI-ScrollBar-Knob-Center"
		PetJournal.ScrollBar.Track.Thumb.upEndTexture = "UI-ScrollBar-Knob-EndCap-Bottom"
		PetJournal.ScrollBar.Track.Thumb.overBeginTexture = "UI-ScrollBar-Knob-MouseOver-EndCap-Top"
		PetJournal.ScrollBar.Track.Thumb.overMiddleTexture = "UI-ScrollBar-Knob-MouseOver-Center"
		PetJournal.ScrollBar.Track.Thumb.overEndTexture = "UI-ScrollBar-Knob-MouseOver-EndCap-Bottom"
		PetJournal.ScrollBar.Track.Thumb.downBeginTexture = "UI-ScrollBar-Knob-EndCap-Top-Disabled"
		PetJournal.ScrollBar.Track.Thumb.downMiddleTexture = "UI-ScrollBar-Knob-Center-Disabled"
		PetJournal.ScrollBar.Track.Thumb.downEndTexture = "UI-ScrollBar-Knob-EndCap-Bottom-Disabled"
		PetJournal.ScrollBar.Track.Thumb.Middle:ClearAllPoints()
		PetJournal.ScrollBar.Track.Thumb.Middle:SetPoint("TOPLEFT", 0, -5)
		PetJournal.ScrollBar.Track.Thumb.Middle:SetPoint("BOTTOMRIGHT", 0, 5)

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
	end
end)