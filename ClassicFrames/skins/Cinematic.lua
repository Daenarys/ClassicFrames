local function ApplyCinematicButton(frame)
	frame:SetSize(119, 21)

	frame.Left:SetAlpha(0)
	frame.Right:SetAlpha(0)
	frame.Center:SetAlpha(0)

	frame:SetPushedTextOffset(1.57, -1.57)

	frame:SetNormalTexture([[Interface\Buttons\UI-DialogBox-Button-Up]])
	frame:GetNormalTexture():SetTexCoord(0, 1, 0, 0.71875)
	frame:SetPushedTexture([[Interface\Buttons\UI-DialogBox-Button-Down]])
	frame:GetPushedTexture():SetTexCoord(0, 1, 0, 0.71875)
	frame:SetDisabledTexture([[Interface\Buttons\UI-DialogBox-Button-Disabled]])
	frame:GetDisabledTexture():SetTexCoord(0, 1, 0, 0.71875)
	frame:SetHighlightTexture([[Interface\Buttons\UI-DialogBox-Button-Highlight]], "ADD")
	frame:GetHighlightTexture():SetTexCoord(0, 1, 0, 0.71875)
end

if _G.CinematicFrame then
	ApplyCinematicButton(CinematicFrameCloseDialogConfirmButton)
	ApplyCinematicButton(CinematicFrameCloseDialogResumeButton)
end

if _G.MovieFrame then
	MovieFrame.CloseDialog.topPadding = 17
	MovieFrame.CloseDialog.leftPadding = 15
	MovieFrame.CloseDialog.rightPadding = 15
	MovieFrame.CloseDialog.bottomPadding = 18

	MovieFrame.CloseDialog.BackgroundTile:SetAlpha(0)

	ApplyCinematicButton(MovieFrame.CloseDialog.Buttons.ConfirmButton)
	ApplyCinematicButton(MovieFrame.CloseDialog.Buttons.ResumeButton)

	hooksecurefunc(MovieFrame, "ShowCloseDialog", function(self)
		self.CloseDialog.Buttons:ClearAllPoints()
		self.CloseDialog.Buttons:SetPoint("BOTTOM", 0, 16)
		self.CloseDialog.Buttons.ConfirmButton:SetPoint("LEFT", 2, 0)
		self.CloseDialog.Buttons.ResumeButton:SetPoint("LEFT", 134, 0)
	end)
end