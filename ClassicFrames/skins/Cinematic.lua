if _G.CinematicFrame then
	CinematicFrameCloseDialogConfirmButton:SetSize(119, 21)
	CinematicFrameCloseDialogResumeButton:SetSize(119, 21)

	ApplyDialogBorder(CinematicFrame.closeDialog.Border)
end

if _G.MovieFrame then
	MovieFrame.CloseDialog.topPadding = 17
	MovieFrame.CloseDialog.leftPadding = 15
	MovieFrame.CloseDialog.rightPadding = 15
	MovieFrame.CloseDialog.bottomPadding = 18

	MovieFrame.CloseDialog.BackgroundTile:SetAlpha(0)

	MovieFrame.CloseDialog.Buttons.ConfirmButton:SetSize(119, 21)
	MovieFrame.CloseDialog.Buttons.ResumeButton:SetSize(119, 21)
	
	ApplyDialogBorder(MovieFrame.CloseDialog.Border)
end