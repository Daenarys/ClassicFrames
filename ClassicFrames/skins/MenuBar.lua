if not _G.MicroMenu then return end

-- hide the housing button
for _, button in ipairs { MicroMenu:GetChildren() } do
    if button == HousingMicroButton then
        button:Hide()
    end
end

-- skin the professions microbutton
local buttons = {
    {button = ProfessionMicroButton, name = "SpellbookAbilities"}
}

local function replaceAtlases(self, name)
    local prefix = "UI-HUD-MicroMenu-"
    self:SetNormalAtlas(prefix..name.."-Up")
    self:SetPushedAtlas(prefix..name.."-Down")
    self:SetDisabledAtlas(prefix..name.."-Disabled")

    self:HookScript("OnUpdate", function()
        if(self:GetButtonState() == "NORMAL") then 
            self:SetHighlightAtlas(prefix..name.."-Mouseover", "BLEND")
        else 
            self:SetHighlightAtlas(prefix..name.."-Down", "ADD")
        end 
    end)
end

local function replaceAllAtlases()
    for _, data in pairs(buttons) do
        replaceAtlases(data.button, data.name)
    end
end
replaceAllAtlases()