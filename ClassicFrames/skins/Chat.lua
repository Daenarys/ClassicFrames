for i = 1, NUM_CHAT_WINDOWS do
    _G["ChatFrame"..i].ScrollBar.Back:Hide()
    _G["ChatFrame"..i].ScrollBar.Forward:Hide()

    _G["ChatFrame"..i].ScrollToBottomButton:SetSize(24, 24)
    _G["ChatFrame"..i].ScrollToBottomButton:ClearAllPoints()
    _G["ChatFrame"..i].ScrollToBottomButton:SetPoint("BOTTOMRIGHT", _G['ChatFrame'..i..'ResizeButton'], "TOPRIGHT", 0, -2)
    _G["ChatFrame"..i].ScrollToBottomButton.Flash:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-BlinkHilight")

    _G["ChatFrame"..i].ScrollToBottomButton:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Up")
    _G["ChatFrame"..i].ScrollToBottomButton:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Down")
    _G["ChatFrame"..i].ScrollToBottomButton:SetDisabledTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Disabled")
    _G["ChatFrame"..i].ScrollToBottomButton:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")

    -- fix blizz 10.1 bug
    hooksecurefunc("FloatingChatFrame_UpdateBackgroundAnchors", function()
        _G["ChatFrame"..i].Background:SetPoint("TOPLEFT", -2, 3)
        _G["ChatFrame"..i].Background:SetPoint("TOPRIGHT", 13, 3)
        _G["ChatFrame"..i].Background:SetPoint("BOTTOMLEFT", -2, -6)
        _G["ChatFrame"..i].Background:SetPoint("BOTTOMRIGHT", 13, -6)
    end)

    local tab = _G['ChatFrame'..i..'Tab']
    if tab then
        tab.Text:SetPoint("CENTER", 0, -6)
    end
end

hooksecurefunc("FloatingChatFrame_SetupScrolling", function()
    ChatFrame1:SetOnScrollChangedCallback(function(messageFrame, offset)
        messageFrame.CfScrollBar:SetValue(messageFrame:GetNumMessages() - offset)
    end)
end)

hooksecurefunc("FloatingChatFrame_UpdateScroll", function()
    local numMessages = ChatFrame1:GetNumMessages()
    local isShown = numMessages > 1;
    ChatFrame1.ScrollBar:SetFrameLevel(0)
    ChatFrame1.ScrollBar.Track:Hide()
    ChatFrame1.CfScrollBar:SetShown(isShown)
    if isShown then
        ChatFrame1.CfScrollBar:SetMinMaxValues(1, numMessages)
        ChatFrame1.CfScrollBar:SetValue(numMessages - ChatFrame1:GetScrollOffset())
    end
end)

hooksecurefunc("FCF_UpdateScrollbarAnchors", function(chatFrame)
    if chatFrame.CfScrollBar then
        chatFrame.CfScrollBar:ClearAllPoints()
        chatFrame.CfScrollBar:SetPoint("TOPLEFT", chatFrame, "TOPRIGHT", -11, 0)
        chatFrame.CfScrollBar:SetPoint("BOTTOM", chatFrame.ScrollToBottomButton, "TOP")
    end
end)

hooksecurefunc("FCF_FadeInScrollbar", function(chatFrame)
    if chatFrame.CfScrollBar and chatFrame.CfScrollBar:IsShown() then
        UIFrameFadeIn(chatFrame.CfScrollBar, CHAT_FRAME_FADE_TIME, chatFrame.CfScrollBar:GetAlpha(), .6)
    end
end)

hooksecurefunc("FCF_FadeOutScrollbar", function(chatFrame)
    if chatFrame.CfScrollBar and chatFrame.CfScrollBar:IsShown() then
        UIFrameFadeOut(chatFrame.CfScrollBar, CHAT_FRAME_FADE_OUT_TIME, chatFrame.CfScrollBar:GetAlpha(), 0)
    end
end)

hooksecurefunc("FCFDock_UpdateTabs", function(dock)
    local scrollChild = dock.scrollFrame:GetScrollChild()
    local lastDockedStaticTab = nil;
    local lastDockedDynamicTab = nil;
    local numDynFrames = 0;

    for index, chatFrame in ipairs(dock.DOCKED_CHAT_FRAMES) do
        local chatTab = _G[chatFrame:GetName().."Tab"];
        if ( chatFrame.isStaticDocked ) then
            PanelTemplates_TabResize(chatTab, chatTab.sizePadding or 8)
            if ( lastDockedStaticTab ) then
                chatTab:SetPoint("LEFT", lastDockedStaticTab, "RIGHT", 4, 0)
            else
                chatTab:SetPoint("LEFT", dock, "LEFT", 2, 0)
            end
            lastDockedStaticTab = chatTab;
        else
            numDynFrames = numDynFrames + 1;
            if ( lastDockedDynamicTab ) then
                chatTab:SetPoint("LEFT", lastDockedDynamicTab, "RIGHT", 4, 0)
            else
                chatTab:SetPoint("LEFT", scrollChild, "LEFT", 4, -2)
            end
            lastDockedDynamicTab = chatTab;
        end
    end
end)

if TextToSpeechButtonFrame then
    TextToSpeechButtonFrame:Hide()
end

QuickJoinToastButton:HookScript("OnUpdate", function(self)
    self:ClearAllPoints()
    self:SetPoint("BOTTOMLEFT", ChatAlertFrame, "BOTTOMLEFT")
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