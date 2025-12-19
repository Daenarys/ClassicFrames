if _G.GuildRegistrarFrame then
	ApplyCloseButton(GuildRegistrarFrameCloseButton)

	GuildRegistrarFramePortrait:SetSize(61, 61)
	GuildRegistrarFramePortrait:ClearAllPoints()
	GuildRegistrarFramePortrait:SetPoint("TOPLEFT", -6, 8)

	GuildRegistrarFrame.TitleContainer:ClearAllPoints()
	GuildRegistrarFrame.TitleContainer:SetPoint("TOPLEFT", GuildRegistrarFrame, "TOPLEFT", 58, 0)
	GuildRegistrarFrame.TitleContainer:SetPoint("TOPRIGHT", GuildRegistrarFrame, "TOPRIGHT", -58, 0)

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

	PetitionFramePortrait:SetSize(61, 61)
	PetitionFramePortrait:ClearAllPoints()
	PetitionFramePortrait:SetPoint("TOPLEFT", -6, 8)

	PetitionFrame.TitleContainer:ClearAllPoints()
	PetitionFrame.TitleContainer:SetPoint("TOPLEFT", PetitionFrame, "TOPLEFT", 58, 0)
	PetitionFrame.TitleContainer:SetPoint("TOPRIGHT", PetitionFrame, "TOPRIGHT", -58, 0)

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