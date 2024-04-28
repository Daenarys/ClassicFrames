-- hide default buttons
ChatFrameChannelButton:Hide()

hooksecurefunc("FCFTab_UpdateAlpha", function(chatFrame)
    local chatTab = _G[chatFrame:GetName().."Tab"]
    if ( not chatFrame.isDocked or chatFrame == FCFDock_GetSelectedWindow(GENERAL_CHAT_DOCK) ) then
        chatTab.noMouseAlpha = 0.4
    else
        if not ( chatTab.alerting ) then
            chatTab.noMouseAlpha = 0.2
        end
    end

    if ( chatFrame.hasBeenFaded ) then
        chatTab:SetAlpha(chatTab.mouseOverAlpha)
    else
        chatTab:SetAlpha(0.4)
    end

    local frameName = chatFrame:GetName();
    chatFrame.hasBeenFaded = nil;
    for index, value in pairs(CHAT_FRAME_TEXTURES) do
        -- Fade out chat frame
        local object = _G[frameName..value];
        if ( object:IsShown() ) then
            UIFrameFadeOut(object, CHAT_FRAME_FADE_OUT_TIME, max(object:GetAlpha(), 0), 0.15);
        end
    end
end)

hooksecurefunc("FCF_FadeOutChatFrame", function(chatFrame)
    local frameName = chatFrame:GetName();
    chatFrame.hasBeenFaded = nil;
    for index, value in pairs(CHAT_FRAME_TEXTURES) do
        -- Fade out chat frame
        local object = _G[frameName..value];
        if ( object:IsShown() ) then
            UIFrameFadeOut(object, CHAT_FRAME_FADE_OUT_TIME, max(object:GetAlpha(), 0), 0.15);
        end
    end
end)

_G.FriendsMicroButton:HookScript("OnUpdate", function(self)
    self:ClearAllPoints()
    self:SetPoint("LEFT", GeneralDockManager, "LEFT", -35, -1)
end)