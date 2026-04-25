if _G.CinematicFrame then
	ApplyDialogBorder(CinematicFrame.closeDialog.Border)
end

if _G.MovieFrame then
	MovieFrame.CloseDialog.BackgroundTile:SetAlpha(0)
	ApplyDialogBorder(MovieFrame.CloseDialog.Border)
end