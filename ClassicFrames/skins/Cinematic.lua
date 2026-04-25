if _G.CinematicFrame then
	ApplyDialogBorder(CinematicFrame.closeDialog.Border)
end

if _G.MovieFrame then
	MovieFrame.CloseDialog.topPadding = 15
	MovieFrame.CloseDialog.leftPadding = 15
	MovieFrame.CloseDialog.rightPadding = 15
	MovieFrame.CloseDialog.bottomPadding = 15
	MovieFrame.CloseDialog.BackgroundTile:SetAlpha(0)
	ApplyDialogBorder(MovieFrame.CloseDialog.Border)
end