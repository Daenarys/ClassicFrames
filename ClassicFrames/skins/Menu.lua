local TargetMenus = {
    ["LFDQueueFrameTypeDropdown"] = true,
    ["RaidFinderQueueFrameSelectionDropdown"] = true,
}

local DialogSkin = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
DialogSkin:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background-Dark",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tileSize = 32,
    edgeSize = 32,
    insets = { left = 11, right = 12, top = 12, bottom = 9 }
})
DialogSkin:Hide()

local TooltipSkin = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
TooltipSkin:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tileSize = 16,
    edgeSize = 16,
    insets = { left = 5, right = 5, top = 5, bottom = 4 }
})
TooltipSkin:SetBackdropBorderColor(TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b);
TooltipSkin:SetBackdropColor(TOOLTIP_DEFAULT_BACKGROUND_COLOR.r, TOOLTIP_DEFAULT_BACKGROUND_COLOR.g, TOOLTIP_DEFAULT_BACKGROUND_COLOR.b)
TooltipSkin:Hide()

local SubTooltipSkin = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
SubTooltipSkin:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tileSize = 16,
    edgeSize = 16,
    insets = { left = 5, right = 5, top = 5, bottom = 4 }
})
SubTooltipSkin:SetBackdropBorderColor(TOOLTIP_DEFAULT_COLOR.r, TOOLTIP_DEFAULT_COLOR.g, TOOLTIP_DEFAULT_COLOR.b);
SubTooltipSkin:SetBackdropColor(TOOLTIP_DEFAULT_BACKGROUND_COLOR.r, TOOLTIP_DEFAULT_BACKGROUND_COLOR.g, TOOLTIP_DEFAULT_BACKGROUND_COLOR.b)
SubTooltipSkin:Hide()

local function SkinMenu(manager, owner, menuDescription)
    local menu = manager:GetOpenMenu()
    if not menu then return end

    select(1, menu:GetRegions()):SetAlpha(0)

    local activeSkin
    local ownerName = owner and owner.GetName and owner:GetName()
    if ownerName and TargetMenus[ownerName] then
        activeSkin = DialogSkin
        TooltipSkin:Hide()
        SubTooltipSkin:Hide()
    else
        activeSkin = TooltipSkin
        DialogSkin:Hide()
        SubTooltipSkin:Hide()
    end

    activeSkin:SetParent(menu)
    activeSkin:ClearAllPoints()
    
    if activeSkin == DialogSkin then
        activeSkin:SetPoint("TOPLEFT", menu, "TOPLEFT", -8, 3)
        activeSkin:SetPoint("BOTTOMRIGHT", menu, "BOTTOMRIGHT", 8, 0)
    else
        activeSkin:SetPoint("TOPLEFT", menu, "TOPLEFT", -4, 1)
        activeSkin:SetPoint("BOTTOMRIGHT", menu, "BOTTOMRIGHT", 0, 3)
    end
    
    activeSkin:SetFrameLevel(menu:GetFrameLevel())
    activeSkin:Show()

    menuDescription:AddMenuAcquiredCallback(function(self)
        select(1, self:GetRegions()):SetAlpha(0)
        SubTooltipSkin:SetParent(self)
        SubTooltipSkin:ClearAllPoints()
        SubTooltipSkin:SetPoint("TOPLEFT", self, "TOPLEFT")
        SubTooltipSkin:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 4)
        SubTooltipSkin:SetFrameLevel(self:GetFrameLevel())
        SubTooltipSkin:Show()
    end)
end

local manager = _G.Menu.GetManager()
if manager then
    hooksecurefunc(manager, "OpenMenu", SkinMenu)
    hooksecurefunc(manager, "OpenContextMenu", SkinMenu)
end

local ATLAS_MAP = {
    ["common-dropdown-ticksquare"]             = {0.5,1,0,0.5},
    ["common-dropdown-icon-checkmark-yellow"]  = {0,0.5,0,0.5},
    ["common-dropdown-tickradial"]             = {0.5,1, 0.5,1},
    ["common-dropdown-icon-radialtick-yellow"] = {0,0.5,0.5,1},
}

hooksecurefunc(CompositorMixin, "AttachFontString", function(parent)
    if not parent.attachments then return end

    for _, widget in ipairs(parent.attachments) do
        local widgetType = widget:GetObjectType()
        if widgetType == "FontString" then
            widget:SetFontObject(GameFontHighlightSmallLeft)  
        elseif widgetType == "Texture" then
            local coords = ATLAS_MAP[widget:GetAtlas()]
            if coords then
                widget:SetSize(16, 16)
                widget:SetTexture([[Interface\Common\UI-DropDownRadioChecks]])
                widget:SetTexCoord(unpack(coords))
            end
        end
    end
end)