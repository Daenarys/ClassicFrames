if not _G.ScriptErrorsFrame then return end

ScriptErrorsFrameClose:ClearAllPoints()
ScriptErrorsFrameClose:SetPoint("TOPRIGHT", 2, 1)

ScriptErrorsFrame.ScrollFrame.ScrollBar:SetSize(25, 560)
ScriptErrorsFrame.ScrollFrame.ScrollBar:ClearAllPoints()
ScriptErrorsFrame.ScrollFrame.ScrollBar:SetPoint("TOPLEFT", ScriptErrorsFrame.ScrollFrame, "TOPRIGHT", 0, 4)
ScriptErrorsFrame.ScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", ScriptErrorsFrame.ScrollFrame, "BOTTOMRIGHT", 0, -4)

ScriptErrorsFrame.ScrollFrame.ScrollBar.Track:ClearAllPoints()
ScriptErrorsFrame.ScrollFrame.ScrollBar.Track:SetPoint("TOPLEFT", 4, -22)
ScriptErrorsFrame.ScrollFrame.ScrollBar.Track:SetPoint("BOTTOMRIGHT", -4, 22)

ScriptErrorsFrame.ScrollFrame.ScrollBar.Track.Begin:Hide()
ScriptErrorsFrame.ScrollFrame.ScrollBar.Track.End:Hide()
ScriptErrorsFrame.ScrollFrame.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(ScriptErrorsFrame.ScrollFrame.ScrollBar)
ApplyScrollBarThumb(ScriptErrorsFrame.ScrollFrame.ScrollBar.Track.Thumb)