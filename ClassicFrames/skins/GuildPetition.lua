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

	ApplyScrollBarArrow(PetitionFrame.ScrollBar)
	ApplyScrollBarTrack(PetitionFrame.ScrollBar.Track)
	ApplyScrollBarThumb(PetitionFrame.ScrollBar.Track.Thumb)
end