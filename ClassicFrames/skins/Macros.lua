local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_MacroUI" then
		ApplyCloseButton(MacroFrameCloseButton)

		MacroFrame.PortraitContainer.CircleMask:Hide()

		MacroFramePortrait:SetSize(61, 61)
		MacroFramePortrait:ClearAllPoints()
		MacroFramePortrait:SetPoint("TOPLEFT", -6, 8)

		MacroFrame.TitleContainer:ClearAllPoints()
		MacroFrame.TitleContainer:SetPoint("TOPLEFT", MacroFrame, "TOPLEFT", 58, 0)
		MacroFrame.TitleContainer:SetPoint("TOPRIGHT", MacroFrame, "TOPRIGHT", -58, 0)

		MacroFrameTitleText:SetText(CREATE_MACROS)

		ApplyTitleBg(MacroFrame)
		ApplyNineSlicePortrait(MacroFrame)

		MacroFrameBg:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-Background-Rock", true, true)

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
		MacroFrame.MacroSelector.ScrollBar:SetPoint("TOPLEFT", MacroFrame.MacroSelector, "TOPRIGHT", -24, 3)
		MacroFrame.MacroSelector.ScrollBar:SetPoint("BOTTOMLEFT", MacroFrame.MacroSelector, "BOTTOMRIGHT", -21, -3)

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

		MacroPopupFrame.IconSelector.ScrollBar:SetSize(25, 560)
		MacroPopupFrame.IconSelector.ScrollBar:ClearAllPoints()
		MacroPopupFrame.IconSelector.ScrollBar:SetPoint("TOPLEFT", MacroPopupFrame.IconSelector, "TOPRIGHT", -26, 19)
		MacroPopupFrame.IconSelector.ScrollBar:SetPoint("BOTTOMLEFT", MacroPopupFrame.IconSelector, "BOTTOMRIGHT", -23, -3)

		ApplyScrollBarArrow(MacroPopupFrame.IconSelector.ScrollBar)
		ApplyScrollBarTrack(MacroPopupFrame.IconSelector.ScrollBar.Track)
		ApplyScrollBarThumb(MacroPopupFrame.IconSelector.ScrollBar.Track.Thumb)
	end
end)