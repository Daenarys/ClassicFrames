if _G.MailFrame then
	ApplyCloseButton(MailFrameCloseButton)

	MailFramePortrait:SetSize(58, 58)
	MailFramePortrait:ClearAllPoints()
	MailFramePortrait:SetPoint("TOPLEFT", -5, 7)

	MailFrame.TitleContainer:ClearAllPoints()
	MailFrame.TitleContainer:SetPoint("TOPLEFT", MailFrame, "TOPLEFT", 58, 0)
	MailFrame.TitleContainer:SetPoint("TOPRIGHT", MailFrame, "TOPRIGHT", -13, 0)

	ApplyTitleBg(MailFrame)
	ApplyNineSlicePortrait(MailFrame)

	MailFrameTab2:ClearAllPoints()
	MailFrameTab2:SetPoint("LEFT", MailFrameTab1, "RIGHT", -8, 0)

	for i = 1, 2 do
		ApplyBottomTab(_G['MailFrameTab'..i])

		_G["MailFrameTab"..i]:HookScript("OnShow", function()
			MailFrameTab1:SetWidth(45 + MailFrameTab1:GetFontString():GetStringWidth())
			MailFrameTab2:SetWidth(40 + MailFrameTab2:GetFontString():GetStringWidth())
		end)
	end

	ApplyScrollBarArrow(SendMailScrollFrame.ScrollBar)
	ApplyScrollBarTrack(SendMailScrollFrame.ScrollBar.Track)
	ApplyScrollBarThumb(SendMailScrollFrame.ScrollBar.Track.Thumb)
end

if _G.OpenMailFrame then
	ApplyCloseButton(OpenMailFrameCloseButton)

	OpenMailFramePortrait:SetSize(61, 61)
	OpenMailFramePortrait:ClearAllPoints()
	OpenMailFramePortrait:SetPoint("TOPLEFT", -6, 8)

	OpenMailFrame.TitleContainer:ClearAllPoints()
	OpenMailFrame.TitleContainer:SetPoint("TOPLEFT", OpenMailFrame, "TOPLEFT", 58, 0)
	OpenMailFrame.TitleContainer:SetPoint("TOPRIGHT", OpenMailFrame, "TOPRIGHT", -24, 0)

	ApplyTitleBg(OpenMailFrame)
	ApplyNineSlicePortrait(OpenMailFrame)

	ApplyScrollBarArrow(OpenMailScrollFrame.ScrollBar)
	ApplyScrollBarTrack(OpenMailScrollFrame.ScrollBar.Track)
	ApplyScrollBarThumb(OpenMailScrollFrame.ScrollBar.Track.Thumb)
end