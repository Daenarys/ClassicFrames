if _G.CinematicFrame then
	ApplyCinematicButton(CinematicFrameCloseDialogConfirmButton)
	ApplyCinematicButton(CinematicFrameCloseDialogResumeButton)

	ApplyDialogBorder(CinematicFrame.closeDialog.Border)
end

if _G.MovieFrame then
	MovieFrame.CloseDialog.topPadding = 17
	MovieFrame.CloseDialog.leftPadding = 15
	MovieFrame.CloseDialog.rightPadding = 15
	MovieFrame.CloseDialog.bottomPadding = 18

	MovieFrame.CloseDialog.BackgroundTile:SetAlpha(0)

	ApplyCinematicButton(MovieFrame.CloseDialog.Buttons.ConfirmButton)
	ApplyCinematicButton(MovieFrame.CloseDialog.Buttons.ResumeButton)

	MovieFrame.CloseDialog:HookScript("OnShow", function(self)
		self.Buttons:ClearAllPoints()
		self.Buttons:SetPoint("BOTTOM", 0, 16)
		self.Buttons.ConfirmButton:SetPoint("LEFT", 2, 0)
		self.Buttons.ResumeButton:SetPoint("LEFT", 134, 0)
	end)
	
	ApplyDialogBorder(MovieFrame.CloseDialog.Border)
end