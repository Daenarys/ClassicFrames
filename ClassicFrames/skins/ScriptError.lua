if not _G.ScriptErrorsFrame then return end

ScriptErrorsFrameClose:SetSize(32, 32)
ScriptErrorsFrameClose:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
ScriptErrorsFrameClose:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
ScriptErrorsFrameClose:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
ScriptErrorsFrameClose:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
ScriptErrorsFrameClose:ClearAllPoints()
ScriptErrorsFrameClose:SetPoint("TOPRIGHT", 2, 1)

ScriptErrorsFrame.ScrollFrame.ScrollBar.Track.Begin:Hide()
ScriptErrorsFrame.ScrollFrame.ScrollBar.Track.End:Hide()
ScriptErrorsFrame.ScrollFrame.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(ScriptErrorsFrame.ScrollFrame.ScrollBar, true)
ApplyScrollBarThumb(ScriptErrorsFrame.ScrollFrame.ScrollBar.Track.Thumb)