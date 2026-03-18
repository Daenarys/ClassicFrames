if not _G.SplashFrame then return end

SplashFrame.TopCloseButton:SetSize(32, 32)
SplashFrame.TopCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
SplashFrame.TopCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
SplashFrame.TopCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
SplashFrame.TopCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
SplashFrame.TopCloseButton:ClearAllPoints()
SplashFrame.TopCloseButton:SetPoint("TOPRIGHT", -14, -10)