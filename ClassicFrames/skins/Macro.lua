local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_MacroUI" then
		ApplyCloseButton(MacroFrameCloseButton)

		MacroFramePortrait:SetSize(61, 61)

		MacroFrame.TitleContainer:ClearAllPoints()
		MacroFrame.TitleContainer:SetPoint("TOPLEFT", MacroFrame, "TOPLEFT", 58, 0)
		MacroFrame.TitleContainer:SetPoint("TOPRIGHT", MacroFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(MacroFrame)
		ApplyNineSlicePortrait(MacroFrame)

		MacroFrameTab2:ClearAllPoints()
		MacroFrameTab2:SetPoint("LEFT", MacroFrameTab1, "RIGHT")

		for i = 1, 2 do
			ApplyTopTab(_G['MacroFrameTab'..i])

			_G["MacroFrameTab"..i]:HookScript("OnShow", function(self)
				MacroFrameTab1:SetWidth(17 + MacroFrameTab1:GetFontString():GetStringWidth())
				MacroFrameTab2:SetWidth(21 + MacroFrameTab2:GetFontString():GetStringWidth())
				MacroFrameTab2.Text:SetWidth(0)
			end)
		end

		MacroFrame.MacroSelector.ScrollBar:SetSize(25, 560)
		MacroFrame.MacroSelector.ScrollBar:ClearAllPoints()
		MacroFrame.MacroSelector.ScrollBar:SetPoint("TOPLEFT", MacroFrame.MacroSelector, "TOPRIGHT", -24, 5)
		MacroFrame.MacroSelector.ScrollBar:SetPoint("BOTTOMLEFT", MacroFrame.MacroSelector, "BOTTOMRIGHT", 24, -3)

		ApplyScrollBarArrow(MacroFrame.MacroSelector.ScrollBar)
		ApplyScrollBarTrack(MacroFrame.MacroSelector.ScrollBar.Track)
		ApplyScrollBarThumb(MacroFrame.MacroSelector.ScrollBar.Track.Thumb)

		MacroFrameScrollFrame.ScrollBar.Track.Begin:Hide()
		MacroFrameScrollFrame.ScrollBar.Track.End:Hide()
		MacroFrameScrollFrame.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarArrow(MacroFrameScrollFrame.ScrollBar, true)
		ApplyScrollBarThumb(MacroFrameScrollFrame.ScrollBar.Track.Thumb)

		MacroPopupFrame.IconSelector.ScrollBar:SetSize(25, 560)
		MacroPopupFrame.IconSelector.ScrollBar:ClearAllPoints()
		MacroPopupFrame.IconSelector.ScrollBar:SetPoint("TOPLEFT", MacroPopupFrame.IconSelector, "TOPRIGHT", -28, 30)
		MacroPopupFrame.IconSelector.ScrollBar:SetPoint("BOTTOMLEFT", MacroPopupFrame.IconSelector, "BOTTOMRIGHT", 28, -3)

		ApplyScrollBarArrow(MacroPopupFrame.IconSelector.ScrollBar)
		ApplyScrollBarTrack(MacroPopupFrame.IconSelector.ScrollBar.Track)
		ApplyScrollBarThumb(MacroPopupFrame.IconSelector.ScrollBar.Track.Thumb)

		ApplyDropDown(MacroPopupFrame.BorderBox.IconTypeDropdown)
	end
end)