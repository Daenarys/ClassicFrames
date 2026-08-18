if _G.CinematicFrame then
	CinematicFrameCloseDialogConfirmButton:SetSize(119, 21)
	CinematicFrameCloseDialogResumeButton:SetSize(119, 21)

	ApplyRedButton(CinematicFrameCloseDialogConfirmButton)
	ApplyRedButton(CinematicFrameCloseDialogResumeButton)

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

	ApplyRedButton(MovieFrame.CloseDialog.Buttons.ConfirmButton)
	ApplyRedButton(MovieFrame.CloseDialog.Buttons.ResumeButton)

	ApplyDialogBorder(MovieFrame.CloseDialog.Border)

	hooksecurefunc(MovieFrame, "ShowCloseDialog", function(self)
		self.CloseDialog.Buttons:ClearAllPoints()
		self.CloseDialog.Buttons:SetPoint("BOTTOM", 0, 16)
		self.CloseDialog.Buttons.ConfirmButton:SetPoint("LEFT", 2, 0)
		self.CloseDialog.Buttons.ResumeButton:SetPoint("LEFT", 134, 0)
	end)
end