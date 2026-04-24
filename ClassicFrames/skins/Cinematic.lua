hooksecurefunc("CinematicFrame_UpdateLettboxForAspectRatio", function(self)
	if self.closeDialog then
		ApplyDialogBorder(self.closeDialog.Border)
	end
end)

hooksecurefunc(MovieFrame, "PlayMovie", function(self)
	if self.CloseDialog then
		ApplyDialogBorder(self.CloseDialog.Border)
	end
end)