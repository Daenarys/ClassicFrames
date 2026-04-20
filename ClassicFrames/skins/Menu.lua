local TooltipSkin = CreateFrame("Frame", nil, UIParent, "TooltipBackdropTemplate")
TooltipSkin:Hide()

local SubTooltipSkin = CreateFrame("Frame", nil, UIParent, "TooltipBackdropTemplate")
SubTooltipSkin:Hide()

local function SkinMenu(manager, owner, menuDescription)
    local menu = manager:GetOpenMenu()
    if not menu then return end

    if select(1, menu:GetRegions()):GetAtlas() == "common-dropdown-c-bg" then
        TooltipSkin:Hide()
        SubTooltipSkin:Hide()
        return
    end

    select(1, menu:GetRegions()):SetAlpha(0)
    TooltipSkin:SetParent(menu)
    TooltipSkin:ClearAllPoints()
    TooltipSkin:SetPoint("TOPLEFT", menu, "TOPLEFT", -3, -1)
    TooltipSkin:SetPoint("BOTTOMRIGHT", menu, "BOTTOMRIGHT", 3, 7)
    TooltipSkin:SetFrameLevel(menu:GetFrameLevel())
    TooltipSkin:Show()

    menuDescription:AddMenuAcquiredCallback(function(self)
        select(1, self:GetRegions()):SetAlpha(0)
        SubTooltipSkin:SetParent(self)
        SubTooltipSkin:ClearAllPoints()
        SubTooltipSkin:SetPoint("TOPLEFT", self, "TOPLEFT", -3, -1)
        SubTooltipSkin:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 3, 7)
        SubTooltipSkin:SetFrameLevel(self:GetFrameLevel())
        SubTooltipSkin:Show()
    end)
end

local manager = _G.Menu.GetManager()
if manager then
    hooksecurefunc(manager, "OpenMenu", SkinMenu)
    hooksecurefunc(manager, "OpenContextMenu", SkinMenu)
end