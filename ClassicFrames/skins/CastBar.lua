-- Target & Boss
local function HookOnEvent(self, event, ...)
    local parentFrame = self:GetParent();
    local useSpellbarAnchor = (not parentFrame.buffsOnTop) and ((parentFrame.haveToT and parentFrame.auraRows > 2) or ((not parentFrame.haveToT) and parentFrame.auraRows > 0));
    local relativeKey = useSpellbarAnchor and parentFrame.spellbarAnchor or parentFrame;
    local pointX = useSpellbarAnchor and 20 or  (parentFrame.smallSize and 40 or 45);
    local pointY = useSpellbarAnchor and -15 or (parentFrame.smallSize and 3 or 5);

    if ((not useSpellbarAnchor) and parentFrame.haveToT) then
        pointY = parentFrame.smallSize and -30 or -28;
    end

    self:SetPoint("TOPLEFT", relativeKey, "BOTTOMLEFT", pointX, pointY);
end

TargetFrame.spellbar:HookScript("OnEvent", HookOnEvent)
FocusFrame.spellbar:HookScript("OnEvent", HookOnEvent)

local function SetLook(frame)
    frame.Background:SetColorTexture(0, 0, 0, 0.5)
    frame.Border:SetTexture("Interface\\CastingBar\\UI-CastingBar-Border-Small")
    frame.Border:SetWidth(0)
    frame.Border:SetHeight(49)
    frame.Border:ClearAllPoints()
    frame.Border:SetPoint("TOPLEFT", -23, 20)
    frame.Border:SetPoint("TOPRIGHT", 23, 20)
    frame.BorderShield:SetTexture("Interface\\CastingBar\\UI-CastingBar-Small-Shield")
    frame.BorderShield:SetWidth(0)
    frame.BorderShield:SetHeight(49)
    frame.BorderShield:ClearAllPoints()
    frame.BorderShield:SetPoint("TOPLEFT", -28, 20)
    frame.BorderShield:SetPoint("TOPRIGHT", 18, 20)
    frame.Text:SetWidth(0)
    frame.Text:SetHeight(16)
    frame.Text:ClearAllPoints()
    frame.Text:SetPoint("TOPLEFT", 0, 4)
    frame.Text:SetPoint("TOPRIGHT", 0, 4)
    frame.TextBorder:Hide()
    frame.Icon:ClearAllPoints()
    frame.Icon:SetPoint("TOPLEFT", -21, 3)
    frame.Icon:SetSize(16, 16)
end 

local function SkinTargetCastbar(frame)
    --Skin
    SetLook(frame)

    --Flash
    hooksecurefunc(frame.Flash, "SetAtlas", function(frame)
        local Castbar = frame:GetParent()
        local barType = Castbar.barType 

        if (frame.NewFlash == nil) then
            frame.NewFlash = frame:GetParent():CreateTexture(nil, "OVERLAY")
            frame.NewFlash:SetSize(0, 49)
            frame.NewFlash:SetTexture("Interface\\CastingBar\\UI-CastingBar-Flash-Small")
            frame.NewFlash:ClearAllPoints()
            frame.NewFlash:SetPoint("TOPLEFT", -23, 20)
            frame.NewFlash:SetPoint("TOPRIGHT", 23, 20)
            frame.NewFlash:SetBlendMode("ADD")
            frame.NewFlash:SetAlpha(0)
            frame.NewFlashAnim = frame.NewFlash:CreateAnimationGroup()
            frame.NewFlashAnim:SetToFinalAlpha(true)
            local anim = frame.NewFlashAnim:CreateAnimation("Alpha") 
            anim:SetDuration(0.2)
            anim:SetFromAlpha(1)
            anim:SetToAlpha(0)
        end
        frame.NewFlashAnim:Play()

        if (barType == "channel") then
            frame.NewFlash:SetVertexColor(0, 1, 0)
        elseif (barType == "uninterruptable") then
            frame.NewFlash:SetVertexColor(0.7, 0.7, 0.7)
        else
            frame.NewFlash:SetVertexColor(1, 0.7, 0)
        end
    end)

    --OnShow
    hooksecurefunc(frame, 'UpdateShownState', function(self)
        self:SetFrameStrata("HIGH")
        self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
        self.Spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
        self.Spark:SetSize(32, 32)
        self.Spark:ClearAllPoints()
        self.Spark:SetPoint("CENTER", 0, 0)
        self.Spark:SetBlendMode("ADD")
        if self.channeling then
            self.Spark:Hide()
        end
        local FadeOutAnim = self.FadeOutAnim:CreateAnimation("Alpha") 
        FadeOutAnim:SetDuration(0.2)
        FadeOutAnim:SetFromAlpha(1)
        FadeOutAnim:SetToAlpha(0)
    end)

    --Animation Interrupted
    hooksecurefunc(frame, 'PlayInterruptAnims', function(self)
        self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
        self.Spark:Hide()
    end)

    --Animation Finished
    hooksecurefunc(frame, 'PlayFinishAnim', function(self)
        self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
    end)

    --Color
    hooksecurefunc(frame, 'GetTypeInfo', function(self)
        self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
        if ( self.barType == "interrupted") then
            self:SetValue(100)
            self:SetStatusBarColor(1, 0, 0)
        elseif (self.barType == "channel") then
            self:SetStatusBarColor(0, 1, 0)
        elseif (self.barType == "uninterruptable") then
            self:SetStatusBarColor(0.7, 0.7, 0.7)
        else
            self:SetStatusBarColor(1, 0.7, 0)
        end
    end)

    if frame == TargetFrame or FocusFrame then
        hooksecurefunc(frame, "AdjustPosition", HookOnEvent)
    end
end

SkinTargetCastbar(TargetFrame.spellbar)
SkinTargetCastbar(FocusFrame.spellbar)

for _, frame in _G.pairs(_G.BossTargetFrameContainer.BossTargetFrames) do
    SkinTargetCastbar(frame.spellbar)
end