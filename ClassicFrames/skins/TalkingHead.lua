if not _G.TalkingHeadFrame then return end

TalkingHeadFrame.MainFrame.CloseButton:SetSize(32, 32)
TalkingHeadFrame.MainFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
TalkingHeadFrame.MainFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
TalkingHeadFrame.MainFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
TalkingHeadFrame.MainFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")