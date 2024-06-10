if _G.GuildRegistrarFrame then
	ApplyCloseButton(GuildRegistrarFrameCloseButton)

	GuildRegistrarFrame.PortraitContainer.CircleMask:Hide()

	GuildRegistrarFramePortrait:SetSize(61, 61)
	GuildRegistrarFramePortrait:ClearAllPoints()
	GuildRegistrarFramePortrait:SetPoint("TOPLEFT", -6, 8)

	GuildRegistrarFrame.TitleContainer:ClearAllPoints()
	GuildRegistrarFrame.TitleContainer:SetPoint("TOPLEFT", GuildRegistrarFrame, "TOPLEFT", 66, -1)
	GuildRegistrarFrame.TitleContainer:SetPoint("TOPRIGHT", GuildRegistrarFrame, "TOPRIGHT", -60, 1)

	ApplyTitleBg(GuildRegistrarFrame)
	ApplyNineSlicePortrait(GuildRegistrarFrame)

	GuildRegistrarFrame.ScrollBar:SetSize(25, 560)
	GuildRegistrarFrame.ScrollBar:ClearAllPoints()
	GuildRegistrarFrame.ScrollBar:SetPoint("TOPLEFT", GuildRegistrarFrame, "TOPRIGHT", -30, -60)
	GuildRegistrarFrame.ScrollBar:SetPoint("BOTTOMLEFT", GuildRegistrarFrame, "BOTTOMRIGHT", -27, 24)

	ApplyScrollBarArrow(GuildRegistrarFrame.ScrollBar)
	ApplyScrollBarTrack(GuildRegistrarFrame.ScrollBar.Track)
	ApplyScrollBarThumb(GuildRegistrarFrame.ScrollBar.Track.Thumb)
end

if _G.PetitionFrame then
	ApplyCloseButton(PetitionFrameCloseButton)

	PetitionFrame.PortraitContainer.CircleMask:Hide()

	PetitionFramePortrait:SetSize(61, 61)
	PetitionFramePortrait:ClearAllPoints()
	PetitionFramePortrait:SetPoint("TOPLEFT", -6, 8)

	PetitionFrame.TitleContainer:ClearAllPoints()
	PetitionFrame.TitleContainer:SetPoint("TOPLEFT", PetitionFrame, "TOPLEFT", 66, -1)
	PetitionFrame.TitleContainer:SetPoint("TOPRIGHT", PetitionFrame, "TOPRIGHT", -60, 1)

	ApplyTitleBg(PetitionFrame)
	ApplyNineSlicePortrait(PetitionFrame)

	PetitionFrame.ScrollBar:SetSize(25, 560)
	PetitionFrame.ScrollBar:ClearAllPoints()
	PetitionFrame.ScrollBar:SetPoint("TOPLEFT", PetitionFrame, "TOPRIGHT", -30, -60)
	PetitionFrame.ScrollBar:SetPoint("BOTTOMLEFT", PetitionFrame, "BOTTOMRIGHT", -27, 24)

	ApplyScrollBarArrow(PetitionFrame.ScrollBar)
	ApplyScrollBarTrack(PetitionFrame.ScrollBar.Track)
	ApplyScrollBarThumb(PetitionFrame.ScrollBar.Track.Thumb)
end