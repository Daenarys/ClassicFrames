if not _G.ColorPickerFrame then return end

ApplyDialogBorder(ColorPickerFrame.Border)

ColorPickerFrame.Header:Hide()

if (ColorPickerFrameHeader == nil) then
	ColorPickerFrameHeader = ColorPickerFrame:CreateTexture(nil, "ARTWORK")
	ColorPickerFrameHeader:SetSize(256, 64)
	ColorPickerFrameHeader:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-DialogBox-Header")
	ColorPickerFrameHeader:SetPoint("TOP", 0, 12)
end

if (ColorPickerFrameHeaderText == nil) then
	ColorPickerFrameHeaderText = ColorPickerFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	ColorPickerFrameHeaderText:SetText(COLOR_PICKER)
	ColorPickerFrameHeaderText:SetPoint("TOP", ColorPickerFrameHeader, "TOP", 0, -14)
end

ApplySearchBox(ColorPickerFrame.Content.HexBox)