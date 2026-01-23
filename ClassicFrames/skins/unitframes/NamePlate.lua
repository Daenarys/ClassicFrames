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
        self.Text:SetTextHeight(12)
        self.Text:ClearAllPoints()
        self.Text:SetPoint("CENTER", 0, -1)
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

    hooksecurefunc(self, 'SetTargetNameTextShown', function()
        if self.CastTargetNameText then
            self.CastTargetNameText:Hide()
        end
    end)
end

local function CreateBorder(frame, r, g, b, a)
    local border
    if frame.CreateTexture then
        border = frame:CreateTexture(nil, "OVERLAY", nil, -1)
    else
        border = frame:GetParent():CreateTexture(nil, "OVERLAY", nil, -1)
    end
    border:SetColorTexture(r, g, b, a)
    border:SetIgnoreParentScale(true)
    return border
end

local function SkinBorder(frame, hpBar)
    if frame.border then
        frame.border:Hide()
    end
    if hpBar then
        frame.healthBar.barTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-BarFill")
        frame.healthBar.bgTexture:SetAlpha(0)
        frame.healthBar.selectedBorder:SetAlpha(0)
        frame.healthBar.deselectedOverlay:SetAlpha(0)
        if not frame.background then
            frame.background = frame:CreateTexture(nil, "BACKGROUND")
            frame.background:SetAllPoints(frame)
            frame.background:SetColorTexture(0.2, 0.2, 0.2, 0.85)
        end
    end
    if frame.newBorder then return end
    -- Create borders
    local borderTop = CreateBorder(frame, 0, 0, 0, 1)
    local borderBottom = CreateBorder(frame, 0, 0, 0, 1)
    local borderLeft = CreateBorder(frame, 0, 0, 0, 1)
    local borderRight = CreateBorder(frame, 0, 0, 0, 1)

    -- Store borders in a table
    frame["Textures"] = {borderTop, borderBottom, borderLeft, borderRight}

    -- Initial border thickness
    local borderThickness = 1.1
    local minPixels = 1

    -- Define the SizeBorders function to use PixelUtil
    local function SizeBorders(borderThickness)
        PixelUtil.SetHeight(borderTop, borderThickness, minPixels)
        PixelUtil.SetHeight(borderBottom, borderThickness, minPixels)
        PixelUtil.SetWidth(borderLeft, borderThickness, minPixels)
        PixelUtil.SetWidth(borderRight, borderThickness, minPixels)

        -- Adjust border positions to grow outward
        borderTop:ClearAllPoints()
        PixelUtil.SetPoint(borderTop, "BOTTOMLEFT", frame, "TOPLEFT", 0, 0)
        PixelUtil.SetPoint(borderTop, "BOTTOMRIGHT", frame, "TOPRIGHT", 0, 0)

        borderBottom:ClearAllPoints()
        PixelUtil.SetPoint(borderBottom, "TOPLEFT", frame, "BOTTOMLEFT", 0, 0)
        PixelUtil.SetPoint(borderBottom, "TOPRIGHT", frame, "BOTTOMRIGHT", 0, 0)

        borderLeft:ClearAllPoints()
        PixelUtil.SetPoint(borderLeft, "TOPLEFT", frame, "TOPLEFT", -borderThickness, borderThickness)
        PixelUtil.SetPoint(borderLeft, "BOTTOMLEFT", frame, "BOTTOMLEFT", -borderThickness, -borderThickness)

        borderRight:ClearAllPoints()
        PixelUtil.SetPoint(borderRight, "TOPRIGHT", frame, "TOPRIGHT", borderThickness, borderThickness)
        PixelUtil.SetPoint(borderRight, "BOTTOMRIGHT", frame, "BOTTOMRIGHT", borderThickness, -borderThickness)
    end

    SizeBorders(borderThickness)

    hooksecurefunc(frame.healthBar, "UpdateSelectionBorder", function()
        local isTarget = frame.healthBar:IsTarget()
        local isFocus = frame.healthBar:IsFocus()

        for _, border in ipairs(frame.Textures) do
            if isTarget then
                border:SetColorTexture(1, 1, 1)
            elseif isFocus then
                border:SetColorTexture(1.0, 0.49, 0.039)
            else
                border:SetColorTexture(0, 0, 0)
            end
        end
    end)

    frame.newBorder = true
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

    SkinBorder(frame.HealthBarsContainer, true)
    SkinCastbar(frame.castBar)

    hooksecurefunc(frame, "UpdateAnchors", function()
        frame.castBar:SetHeight(12)
        frame.castBar:ClearAllPoints()
        frame.castBar:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 26, 0)
        frame.castBar:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -26, 0)
        frame.castBar.BorderShield:SetSize(10, 12)
        frame.castBar.Icon:SetSize(14, 14)
        frame.castBar.Icon:ClearAllPoints()
        frame.castBar.Icon:SetPoint("CENTER", frame.castBar, "LEFT")
        frame.HealthBarsContainer:SetHeight(6)
        frame.name:SetFontObject("SystemFont_LargeNamePlate")
        frame.name:ClearAllPoints()
        PixelUtil.SetPoint(frame.name, "BOTTOM", frame.HealthBarsContainer, "TOP", 0, 5)
        frame.name:SetJustifyH("CENTER")
        PixelUtil.SetPoint(frame.AurasFrame.DebuffListFrame, "BOTTOM", frame.name, "TOP", 0, 10)
    end)
end

local frameAdded = CreateFrame("Frame")
frameAdded:RegisterEvent("NAME_PLATE_UNIT_ADDED")
frameAdded:SetScript("OnEvent", function(self, event, unit)
    if C_CVar.GetCVar("nameplateStyle") == "5" then -- Legacy
        HandleNamePlateAdded(unit)
    end
end)