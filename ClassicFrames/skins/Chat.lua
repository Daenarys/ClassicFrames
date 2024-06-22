local CHAT_FRAME_FADE_TIME = 0.15
local CHAT_FRAME_FADE_OUT_TIME = 2.0

ChatFrame1EditBox:ClearAllPoints()
ChatFrame1EditBox:SetPoint("TOPLEFT", ChatFrame1, "BOTTOMLEFT", -5, -2)
ChatFrame1EditBox:SetPoint("RIGHT", ChatFrame1.ScrollBar, "RIGHT", 19, 0)

ChatFrame1.ScrollToBottomButton:SetSize(24, 24)
ChatFrame1.ScrollToBottomButton:ClearAllPoints()
ChatFrame1.ScrollToBottomButton:SetPoint("BOTTOMRIGHT", ChatFrame1ResizeButton, "TOPRIGHT", 0, -2)
ChatFrame1.ScrollToBottomButton:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Up")
ChatFrame1.ScrollToBottomButton:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Down")
ChatFrame1.ScrollToBottomButton:SetDisabledTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Disabled")
ChatFrame1.ScrollToBottomButton:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
ChatFrame1.ScrollToBottomButton.Flash:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-BlinkHilight")
ChatFrame1.ScrollToBottomButton.Flash:SetBlendMode("BLEND")

if TextToSpeechButtonFrame then
    TextToSpeechButtonFrame:Hide()
end

QuickJoinToastButton:HookScript("OnUpdate", function(self)
    self:ClearAllPoints()
    self:SetPoint("BOTTOMLEFT", ChatAlertFrame, "BOTTOMLEFT")
end)

for i = 1, NUM_CHAT_WINDOWS do
    _G['ChatFrame'..i..'Tab'].Text:ClearAllPoints()
    _G['ChatFrame'..i..'Tab'].Text:SetPoint("CENTER", 0, -6)
end

hooksecurefunc("FloatingChatFrame_SetupScrolling", function()
    ChatFrame1:SetOnScrollChangedCallback(function(messageFrame, offset)
        messageFrame.CfScrollBar:SetValue(messageFrame:GetNumMessages() - offset)
    end)
end)

hooksecurefunc("FloatingChatFrame_UpdateBackgroundAnchors", function()
    ChatFrame1.Background:SetPoint("TOPLEFT", -2, 3)
    ChatFrame1.Background:SetPoint("TOPRIGHT", 24, 3)
    ChatFrame1.Background:SetPoint("BOTTOMLEFT", -2, -6)
    ChatFrame1.Background:SetPoint("BOTTOMRIGHT", 24, -6)
end)

hooksecurefunc("FloatingChatFrame_UpdateScroll", function()
    local numMessages = ChatFrame1:GetNumMessages()
    local isShown = numMessages > 1
    ChatFrame1.ScrollBar:Hide()
    ChatFrame1.CfScrollBar:SetShown(isShown)
    if isShown then
        ChatFrame1.CfScrollBar:SetMinMaxValues(1, numMessages)
        ChatFrame1.CfScrollBar:SetValue(numMessages - ChatFrame1:GetScrollOffset())
    end
end)

hooksecurefunc("FCF_FadeInScrollbar", function(chatFrame)
    if chatFrame.CfScrollBar and chatFrame.CfScrollBar:IsShown() then
        UIFrameFadeIn(chatFrame.CfScrollBar, CHAT_FRAME_FADE_TIME, chatFrame.CfScrollBar:GetAlpha(), .6)
        if chatFrame.ScrollToBottomButton then
            UIFrameFadeIn(chatFrame.ScrollToBottomButton, .1, chatFrame.ScrollToBottomButton:GetAlpha(), 1)
        end
    end
end)

hooksecurefunc("FCF_FadeOutScrollbar", function(chatFrame)
    if chatFrame.CfScrollBar and chatFrame.CfScrollBar:IsShown() then
        UIFrameFadeOut(chatFrame.CfScrollBar, CHAT_FRAME_FADE_OUT_TIME, chatFrame.CfScrollBar:GetAlpha(), 0)
        if chatFrame.ScrollToBottomButton then
            if UIFrameIsFlashing(chatFrame.ScrollToBottomButton.Flash) then
                UIFrameFadeRemoveFrame(chatFrame.ScrollToBottomButton)
                chatFrame.ScrollToBottomButton:SetAlpha(1)
            else
                UIFrameFadeOut(chatFrame.ScrollToBottomButton, CHAT_FRAME_FADE_OUT_TIME, chatFrame.ScrollToBottomButton:GetAlpha(), 0)
            end
        end
    end
end)

hooksecurefunc("FCF_UpdateScrollbarAnchors", function(chatFrame)
    if chatFrame.CfScrollBar then
        chatFrame.CfScrollBar:ClearAllPoints()
        chatFrame.CfScrollBar:SetPoint("TOPLEFT", chatFrame, "TOPRIGHT")
        chatFrame.CfScrollBar:SetPoint("BOTTOM", chatFrame.ScrollToBottomButton, "TOP")
    end
end)

hooksecurefunc("FCFDock_UpdateTabs", function(dock)
    local scrollChild = dock.scrollFrame:GetScrollChild()
    local lastDockedStaticTab = nil
    local lastDockedDynamicTab = nil

    for index, chatFrame in ipairs(dock.DOCKED_CHAT_FRAMES) do
        local chatTab = _G[chatFrame:GetName().."Tab"]
        if ( chatFrame.isStaticDocked ) then
            PanelTemplates_TabResize(chatTab, chatTab.sizePadding or 8)
            if ( lastDockedStaticTab ) then
                chatTab:SetPoint("LEFT", lastDockedStaticTab, "RIGHT", 4, 0)
            else
                chatTab:SetPoint("LEFT", dock, "LEFT", 2, 0)
            end
            lastDockedStaticTab = chatTab
        else
            if ( lastDockedDynamicTab ) then
                chatTab:SetPoint("LEFT", lastDockedDynamicTab, "RIGHT", 4, 0)
            else
                chatTab:SetPoint("LEFT", scrollChild, "LEFT", 4, -2)
            end
            lastDockedDynamicTab = chatTab
        end
    end
end)

ChatConfigCombatSettingsFilters.ScrollBar:SetSize(25, 560)
ChatConfigCombatSettingsFilters.ScrollBar:ClearAllPoints()
ChatConfigCombatSettingsFilters.ScrollBar:SetPoint("TOPLEFT", ChatConfigCombatSettingsFilters.ScrollBox, "TOPRIGHT", -1, 0)
ChatConfigCombatSettingsFilters.ScrollBar:SetPoint("BOTTOMLEFT", ChatConfigCombatSettingsFilters.ScrollBox, "BOTTOMRIGHT", 0, -1)

ApplyScrollBarArrow(ChatConfigCombatSettingsFilters.ScrollBar)
ApplyScrollBarTrack(ChatConfigCombatSettingsFilters.ScrollBar.Track)
ApplyScrollBarThumb(ChatConfigCombatSettingsFilters.ScrollBar.Track.Thumb)

ApplyDialogBorder(ChatConfigFrame.Border)
ApplyDialogHeader(ChatConfigFrame.Header)

ChatConfigFrame:HookScript("OnShow", function(self)
    self:ClearAllPoints()
    self:SetPoint("CENTER")
end)