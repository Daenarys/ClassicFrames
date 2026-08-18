if not _G.SplashFrame then return end

ApplyCloseButton(SplashFrame.TopCloseButton, true)
SplashFrame.TopCloseButton:ClearAllPoints()
SplashFrame.TopCloseButton:SetPoint("TOPRIGHT", -14, -10)