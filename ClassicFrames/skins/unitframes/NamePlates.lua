hooksecurefunc(NamePlateAurasMixin, "RefreshList", function(self)
    if self:IsForbidden() then return end

    if self.BuffListFrame then
        self.BuffListFrame:SetAlpha(0)
    end

    for auraItemFrame in self.auraItemFramePool:EnumerateActive() do
        if not auraItemFrame.Border then
            auraItemFrame.Border = auraItemFrame:CreateTexture(nil, "BACKGROUND")
            auraItemFrame.Border:SetAllPoints(auraItemFrame)
            auraItemFrame.Border:SetColorTexture(0, 0, 0, 1)
        end
        if auraItemFrame.Cooldown then
            auraItemFrame.Cooldown:SetHideCountdownNumbers(true)
        end
    end
end)

local function SkinCastbar(self)
    if self:IsForbidden() then return end

    if self.Text then
        self.Text:ClearAllPoints()
        self.Text:SetPoint("TOPLEFT", 0, -1)
        self.Text:SetPoint("BOTTOMRIGHT")
    end

    hooksecurefunc(self, 'HandleInterruptOrSpellFailed', function(_, event)
        if ( self.Text ) then
            if ( event == "UNIT_SPELLCAST_FAILED" ) then
                self.Text:SetText(FAILED)
            else
                self.Text:SetText(INTERRUPTED)
            end
        end
    end)

    hooksecurefunc(self, 'SetIsHighlightedCastTarget', function()
        if self.CastTargetIndicator then
            self.CastTargetIndicator:Hide()
        end
    end)

    hooksecurefunc(self, 'SetIsHighlightedImportantCast', function()
        if self.ImportantCastIndicator then
            self.ImportantCastIndicator:Hide()
        end

        if self.ImportantCastFlashAnim then
            self.ImportantCastFlashAnim:SetPlaying(false)
        end
    end)
end

local function SkinHealthBar(frame)
    local isTarget = frame.healthBar:IsTarget()

    frame.healthBar.barTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-BarFill")
    frame.healthBar.bgTexture:SetAlpha(0)
    frame.healthBar.selectedBorder:SetAlpha(0)
    frame.healthBar.deselectedOverlay:SetAlpha(0)

    if not frame.background then
        frame.background = frame:CreateTexture(nil, "BACKGROUND")
        frame.background:SetAllPoints(frame)
        frame.background:SetColorTexture(0.2, 0.2, 0.2, 0.85)
    end

    if not frame.cpBorder then
        frame.cpBorder = CreateFrame("Frame", nil, frame, "CpBorderTemplate")

        PixelUtil.SetWidth(frame.cpBorder.Left, 1, 2)
        PixelUtil.SetPoint(frame.cpBorder.Left, "TOPRIGHT", frame.cpBorder, "TOPLEFT", 0, 1, 0, 2)
        PixelUtil.SetPoint(frame.cpBorder.Left, "BOTTOMRIGHT", frame.cpBorder, "BOTTOMLEFT", 0, -1, 0, 2)

        PixelUtil.SetWidth(frame.cpBorder.Right, 1, 2)
        PixelUtil.SetPoint(frame.cpBorder.Right, "TOPLEFT", frame.cpBorder, "TOPRIGHT", 0, 1, 0, 2)
        PixelUtil.SetPoint(frame.cpBorder.Right, "BOTTOMLEFT", frame.cpBorder, "BOTTOMRIGHT", 0, -1, 0, 2)

        PixelUtil.SetHeight(frame.cpBorder.Bottom, 1, 2)
        PixelUtil.SetPoint(frame.cpBorder.Bottom, "TOPLEFT", frame.cpBorder, "BOTTOMLEFT", 0, 0)
        PixelUtil.SetPoint(frame.cpBorder.Bottom, "TOPRIGHT", frame.cpBorder, "BOTTOMRIGHT", 0, 0)

        PixelUtil.SetHeight(frame.cpBorder.Top, 1, 2)
        PixelUtil.SetPoint(frame.cpBorder.Top, "BOTTOMLEFT", frame.cpBorder, "TOPLEFT", 0, 0)
        PixelUtil.SetPoint(frame.cpBorder.Top, "BOTTOMRIGHT", frame.cpBorder, "TOPRIGHT", 0, 0)
    end

    for i, texture in ipairs(frame.cpBorder.Textures) do
        if isTarget then
            texture:SetColorTexture(1, 1, 1, 0.9)
        else
            texture:SetColorTexture(0, 0, 0, 1)
        end
    end

    hooksecurefunc(frame.healthBar, "UpdateSelectionBorder", function()
        local isTarget = frame.healthBar:IsTarget()

        for i, texture in ipairs(frame.cpBorder.Textures) do
            if isTarget then
                texture:SetColorTexture(1, 1, 1, 0.9)
            else
                texture:SetColorTexture(0, 0, 0, 1)
            end
        end
    end)
end

local function ShowBorder(frame)
    if frame.background then
        frame.background:Show()
    end
    if frame.cpBorder then
        frame.cpBorder:Show()
    end
end

local function HideBorder(frame)
    if frame.background then
        frame.background:Hide()
    end
    if frame.cpBorder then
        frame.cpBorder:Hide()
    end
end

local function GetSafeNameplate(unit)
    local nameplate = C_NamePlate.GetNamePlateForUnit(unit)
    if not nameplate or not nameplate.UnitFrame then return nil, nil end

    local frame = nameplate.UnitFrame
    return nameplate, frame
end

local function HandleNamePlateAdded(unit)
    local nameplate, frame = GetSafeNameplate(unit)
    if not frame then return end

    if not frame.castBar.skinned then
        SkinCastbar(frame.castBar)
        frame.castBar.skinned = true
    end

    if not frame.HealthBarsContainer.skinned then
        SkinHealthBar(frame.HealthBarsContainer)
        frame.HealthBarsContainer.skinned = true
    end

    if UnitNameplateShowsWidgetsOnly(unit) then
        HideBorder(frame.HealthBarsContainer)
    else
        ShowBorder(frame.HealthBarsContainer)
    end

    if frame.selectionHighlight then
        frame.selectionHighlight:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-BarFill")
        frame.selectionHighlight:SetAlpha(0.25)
        frame.selectionHighlight:SetBlendMode("ADD")
        frame.selectionHighlight:SetAllPoints(frame.HealthBarsContainer)
    end

    hooksecurefunc(frame, "UpdateAnchors", function()
        frame.castBar:SetHeight(20)
        frame.castBar:ClearAllPoints()
        frame.castBar:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT")
        frame.castBar:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT")
        frame.castBar.BorderShield:SetSize(16, 18)
        frame.castBar.Icon:SetSize(18, 18)
        frame.castBar.Icon:ClearAllPoints()
        frame.castBar.Icon:SetPoint("CENTER", frame.castBar, "LEFT")
        frame.castBar.Text:SetTextHeight(14)
        frame.ClassificationFrame:ClearAllPoints()
        frame.ClassificationFrame:SetPoint("RIGHT", frame.HealthBarsContainer, "LEFT", -4, 0)
        if (frame.ClassificationFrame.classificationIndicator) then
            frame.ClassificationFrame.classificationIndicator:SetScale(1.4)
        end
        frame.HealthBarsContainer:SetHeight(14)
        frame.HealthBarsContainer:ClearAllPoints()
        frame.HealthBarsContainer:SetPoint("BOTTOMLEFT", frame.castBar, "TOPLEFT", 0, 2.5)
        frame.HealthBarsContainer:SetPoint("BOTTOMRIGHT", frame.castBar, "TOPRIGHT", 0, 2.5)
        frame.name:SetFontObject("CpSystemFont_LargeNamePlate")
        frame.name:SetIgnoreParentScale(true)
        frame.name:SetJustifyH("CENTER")
        frame.name:ClearAllPoints()
        frame.name:SetPoint("BOTTOM", frame.HealthBarsContainer, "TOP", 0, 4)
        if frame.HealthBarsContainer.healthBar:IsTarget() or frame.name:IsShown() then
            frame.AurasFrame.DebuffListFrame:SetPoint("BOTTOM", frame.name, "TOP", 0, 10)
        else
            frame.AurasFrame.DebuffListFrame:SetPoint("BOTTOM", frame.name, "TOP", 0, -18)
        end
    end)
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:RegisterEvent("NAME_PLATE_UNIT_ADDED")
f:SetScript("OnEvent", function(self, event, unit)
    if event == "PLAYER_LOGIN" then
        if C_CVar.GetCVar("nameplateStyle") ~= "5" then
            C_CVar.SetCVar("nameplateStyle", Enum.NamePlateStyle.Legacy)
        end
    elseif event == "NAME_PLATE_UNIT_ADDED" then
        HandleNamePlateAdded(unit)
    end
end)