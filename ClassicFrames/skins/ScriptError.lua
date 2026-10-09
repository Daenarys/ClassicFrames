if not _G.ScriptErrorsFrame then return end

ApplyCloseButton(ScriptErrorsFrameClose, true)
ScriptErrorsFrameClose:ClearAllPoints()
ScriptErrorsFrameClose:SetPoint("TOPRIGHT", 2, 1)

ScriptErrorsFrame.ScrollFrame.ScrollBar:ClearAllPoints()
ScriptErrorsFrame.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", ScriptErrorsFrame.ScrollFrame, "TOPRIGHT", 10, 0)
ScriptErrorsFrame.ScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", ScriptErrorsFrame.ScrollFrame, "BOTTOMRIGHT", 10, 0)

ScriptErrorsFrame.ScrollFrame.ScrollBar.Track.Begin:Hide()
ScriptErrorsFrame.ScrollFrame.ScrollBar.Track.End:Hide()
ScriptErrorsFrame.ScrollFrame.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(ScriptErrorsFrame.ScrollFrame.ScrollBar, true)
ApplyScrollBarThumb(ScriptErrorsFrame.ScrollFrame.ScrollBar.Track.Thumb)