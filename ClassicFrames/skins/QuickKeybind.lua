if not _G.QuickKeybindFrame then return end

QuickKeybindFrame.Header:Hide()

if not QuickKeybindFrameHeader then
	QuickKeybindFrame:CreateTexture("QuickKeybindFrameHeader", "ARTWORK")
	QuickKeybindFrameHeader:SetHeight(64)
	QuickKeybindFrameHeader:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-DialogBox-Header.png")
	QuickKeybindFrameHeader:SetPoint("TOP", 0, 12)
end

if not QuickKeybindFrameHeaderText then
	QuickKeybindFrameHeaderText = QuickKeybindFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
	QuickKeybindFrameHeaderText:SetText(QUICK_KEYBIND_MODE)
	QuickKeybindFrameHeaderText:SetPoint("TOP", QuickKeybindFrameHeader, 0, -14)
end

QuickKeybindFrameHeader:SetWidth(QuickKeybindFrameHeaderText:GetWidth()+200);

ApplyDialogBorder(QuickKeybindFrame.BG)