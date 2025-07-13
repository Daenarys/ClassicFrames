-- hide default buttons
ChatFrameChannelButton:Hide()

hooksecurefunc("FCF_FadeOutChatFrame", function(chatFrame)
    local frameName = chatFrame:GetName()
    for index, value in pairs(CHAT_FRAME_TEXTURES) do
        local object = _G[frameName..value]
        if ( object:IsShown() ) then
            UIFrameFadeOut(object, CHAT_FRAME_FADE_OUT_TIME, max(object:GetAlpha(), chatFrame.oldAlpha), 0.15)
        end
    end
end)

hooksecurefunc("FCFTab_UpdateAlpha", function(chatFrame)
    local chatTab = _G[chatFrame:GetName().."Tab"]
    if ( not chatFrame.isDocked or chatFrame == FCFDock_GetSelectedWindow(GENERAL_CHAT_DOCK) ) then
        chatTab.mouseOverAlpha = CHAT_FRAME_TAB_SELECTED_MOUSEOVER_ALPHA
        chatTab.noMouseAlpha = 0.4
    else
        if ( chatTab.alerting ) then
            chatTab.mouseOverAlpha = CHAT_FRAME_TAB_ALERTING_MOUSEOVER_ALPHA
            chatTab.noMouseAlpha = CHAT_FRAME_TAB_ALERTING_NOMOUSE_ALPHA
        else
            chatTab.mouseOverAlpha = CHAT_FRAME_TAB_NORMAL_MOUSEOVER_ALPHA
            chatTab.noMouseAlpha = 0.2
        end
    end

    if ( chatFrame.hasBeenFaded ) then
        chatTab:SetAlpha(chatTab.mouseOverAlpha)
    else
        chatTab:SetAlpha(chatTab.noMouseAlpha)
    end

    local frameName = chatFrame:GetName()
    for index, value in pairs(CHAT_FRAME_TEXTURES) do
        local object = _G[frameName..value]
        if ( object:IsShown() ) then
            UIFrameFadeOut(object, CHAT_FRAME_FADE_OUT_TIME, max(object:GetAlpha(), 0), 0.15)
        end
    end
end)

_G.FriendsMicroButton:HookScript("OnUpdate", function(self)
    self:SetPoint("TOP")
end)