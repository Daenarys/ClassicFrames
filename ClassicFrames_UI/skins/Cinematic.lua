hooksecurefunc('CinematicFrame_UpdateLettboxForAspectRatio', function(self)
	if self and self.closeDialog then
		ApplyDialogBorder(self.closeDialog.Border)
	end
end)

hooksecurefunc('MovieFrame_PlayMovie', function(self)
	if self and self.CloseDialog then
		ApplyDialogBorder(self.CloseDialog.Border)
	end
end)