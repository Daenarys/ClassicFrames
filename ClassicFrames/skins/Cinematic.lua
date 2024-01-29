if CinematicFrame and CinematicFrameCloseDialog then
	ApplyDialogBorder(CinematicFrameCloseDialog.Border)
end

hooksecurefunc('MovieFrame_PlayMovie', function(self)
	if self and self.CloseDialog then
		ApplyDialogBorder(self.CloseDialog.Border)
	end
end)