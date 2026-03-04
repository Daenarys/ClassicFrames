if not _G.MainActionBar then return end

local function SkinActionButton(button)
    if button.TextOverlayContainer then
        button.TextOverlayContainer:SetFrameLevel(button:GetFrameLevel())
        button.TextOverlayContainer.Count:SetDrawLayer("ARTWORK")
        button.TextOverlayContainer.HotKey:SetDrawLayer("ARTWORK")
    end
end

local function UpdateActionButtons()
    for _, actionBar in ipairs(ActionButtonUtil.ActionBarButtonNames) do
        for i = 1, NUM_ACTIONBAR_BUTTONS do
            SkinActionButton(_G[actionBar..i])
        end
    end
end

local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
    UpdateActionButtons()
end)