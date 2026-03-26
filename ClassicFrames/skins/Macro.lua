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

		ApplyScrollBarArrow(MacroFrame.MacroSelector.ScrollBar)
		ApplyScrollBarTrack(MacroFrame.MacroSelector.ScrollBar.Track)
		ApplyScrollBarThumb(MacroFrame.MacroSelector.ScrollBar.Track.Thumb)

		MacroFrameScrollFrame.ScrollBar:ClearAllPoints()
		MacroFrameScrollFrame.ScrollBar:SetPoint("TOPLEFT", MacroFrameScrollFrame, "TOPRIGHT", 8, 0)
		MacroFrameScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", MacroFrameScrollFrame, "BOTTOMRIGHT", 8, 0)

		ApplyScrollBarThumb(MacroFrameScrollFrame.ScrollBar.Track.Thumb)

		MacroFrameScrollFrame.ScrollBar.Track.Begin:Hide()
		MacroFrameScrollFrame.ScrollBar.Track.End:Hide()
		MacroFrameScrollFrame.ScrollBar.Track.Middle:Hide()

		MacroFrameScrollFrame.ScrollBar.Back:SetSize(18, 16)
		MacroFrameScrollFrame.ScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
		MacroFrameScrollFrame.ScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
		MacroFrameScrollFrame.ScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
		MacroFrameScrollFrame.ScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

		MacroFrameScrollFrame.ScrollBar.Forward:SetSize(18, 16)
		MacroFrameScrollFrame.ScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
		MacroFrameScrollFrame.ScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
		MacroFrameScrollFrame.ScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
		MacroFrameScrollFrame.ScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")

		ApplyScrollBarArrow(MacroPopupFrame.IconSelector.ScrollBar)
		ApplyScrollBarTrack(MacroPopupFrame.IconSelector.ScrollBar.Track)
		ApplyScrollBarThumb(MacroPopupFrame.IconSelector.ScrollBar.Track.Thumb)

		ApplyDropDown(MacroPopupFrame.BorderBox.IconTypeDropdown)
	end
end)