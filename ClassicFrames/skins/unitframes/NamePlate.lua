hooksecurefunc(NamePlateClassificationFrameMixin, "UpdateClassificationIndicator", function(frame)
    if (frame.classificationIndicator) then
        local classification = frame:GetClassification()
        if (classification == "rare") then
            frame.classificationIndicator:SetAtlas("nameplates-icon-elite-silver")
        end
    end
end)

local function SkinCastbar(self)
    if self:IsForbidden() then return end

    if self.Background then
        self.Background:SetColorTexture(0.2, 0.2, 0.2, 0.85)
    end

    if self.Text then
        self.Text:SetHeight(16)
        self.Text:SetFontObject(SystemFont_Shadow_Small2_Outline)
        self.Text:ClearAllPoints()
        self.Text:SetPoint("CENTER")
    end

    hooksecurefunc(self, 'UpdateShownState', function()
        self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
        self.Spark:SetTexture("Interface\\CastingBar\\UI-CastingBar-Spark")
        self.Spark:SetSize(16, 16)
        self.Spark:SetBlendMode("ADD")
        if self.channeling then
            self.Spark:Hide()
        end
    end)

    hooksecurefunc(self, 'PlayInterruptAnims', function()
        self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
        self.Spark:Hide()
    end)

    hooksecurefunc(self, 'PlayFinishAnim', function()
        self:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
        self.Flash:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
        self.Flash:SetVertexColor(self:GetStatusBarColor())
        self.Flash:ClearAllPoints()
        self.Flash:SetAllPoints()
        if not self.NewFlash then
            self.NewFlash = self.Flash:CreateAnimationGroup()
            self.NewFlash:SetToFinalAlpha(true)
            local FlashAnim = self.NewFlash:CreateAnimation("Alpha") 
            FlashAnim:SetDuration(0.2)
            FlashAnim:SetFromAlpha(1)
            FlashAnim:SetToAlpha(0)
        end
        self.NewFlash:Play()
    end)

    hooksecurefunc(self, 'GetTypeInfo', function(barType)
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

    hooksecurefunc(self, 'SetIsHighlightedCastTarget', function()
        if self.CastTargetIndicator then
            self.CastTargetIndicator:Hide()
        end
    end)
end

local function GetSafeNameplate(unit)
    local nameplate = C_NamePlate.GetNamePlateForUnit(unit, issecure())
    -- If there's no nameplate or the nameplate doesn't have a UnitFrame, return nils.
    if not nameplate or not nameplate.UnitFrame then return nil, nil end

    local frame = nameplate.UnitFrame
    -- If none of the above conditions are met, return both the nameplate and the frame.
    return nameplate, frame
end

local function HandleNamePlateAdded(unit)
    local nameplate, frame = GetSafeNameplate(unit)
    if not frame then return end

    if not frame.castBar.skinned then
        SkinCastbar(frame.castBar)
        frame.castBar.skinned = true
    end

    if not frame.name.skinned then
        frame.name:SetFontObject("SystemFont_LargeNamePlate")
        frame.name.skinned = true
    end

    hooksecurefunc(frame, "UpdateAnchors", function()
        frame.castBar:SetHeight(12)
        frame.castBar:ClearAllPoints()
        frame.castBar:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 24, 0)
        frame.castBar:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -24, 0)
        frame.castBar.Icon:SetSize(14, 14)
        frame.castBar.Icon:ClearAllPoints()
        frame.castBar.Icon:SetPoint("CENTER", frame.castBar, "LEFT")

        frame.name:ClearAllPoints()
        frame.name:SetPoint("BOTTOM", frame.HealthBarsContainer, "TOP", 0, 4)
        frame.name:SetJustifyH("CENTER")
    end)
end

local frameAdded = CreateFrame("Frame")
frameAdded:RegisterEvent("NAME_PLATE_UNIT_ADDED")
frameAdded:SetScript("OnEvent", function(self, event, unit)
    HandleNamePlateAdded(unit)
end)