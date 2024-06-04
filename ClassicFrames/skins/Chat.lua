local CHAT_FRAME_FADE_TIME = 0.15
local CHAT_FRAME_FADE_OUT_TIME = 2.0

for i = 1, NUM_CHAT_WINDOWS do
    if (_G['ChatFrame'..i].CfScrollBar == nil) then
        _G['ChatFrame'..i].CfScrollBar = CreateFrame("Slider", nil, _G['ChatFrame'..i], "CfScrollBarTemplate")
    end

    _G['ChatFrame'..i].ScrollToBottomButton:SetSize(24, 24)
    _G['ChatFrame'..i].ScrollToBottomButton:ClearAllPoints()
    _G['ChatFrame'..i].ScrollToBottomButton:SetPoint("BOTTOMRIGHT", _G['ChatFrame'..i..'ResizeButton'], "TOPRIGHT", 0, -2)
    _G['ChatFrame'..i].ScrollToBottomButton:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Up")
    _G['ChatFrame'..i].ScrollToBottomButton:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Down")
    _G['ChatFrame'..i].ScrollToBottomButton:SetDisabledTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Disabled")
    _G['ChatFrame'..i].ScrollToBottomButton:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")

    _G['ChatFrame'..i].ScrollToBottomButton.Flash:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-BlinkHilight")
    _G['ChatFrame'..i].ScrollToBottomButton.Flash:SetBlendMode("BLEND")

    _G['ChatFrame'..i..'EditBox']:ClearAllPoints()
    _G['ChatFrame'..i..'EditBox']:SetPoint("TOPLEFT", _G['ChatFrame'..i], "BOTTOMLEFT", -5, -2)
    _G['ChatFrame'..i..'EditBox']:SetPoint("RIGHT", _G['ChatFrame'..i].ScrollBar, "RIGHT", 19, 0)

    _G['ChatFrame'..i..'Tab'].Text:ClearAllPoints()
    _G['ChatFrame'..i..'Tab'].Text:SetPoint("CENTER", 0, -5)

    hooksecurefunc("FloatingChatFrame_UpdateBackgroundAnchors", function()
        _G['ChatFrame'..i].Background:SetPoint("TOPLEFT", -2, 3)
        _G['ChatFrame'..i].Background:SetPoint("TOPRIGHT", 24, 3)
        _G['ChatFrame'..i].Background:SetPoint("BOTTOMLEFT", -2, -6)
        _G['ChatFrame'..i].Background:SetPoint("BOTTOMRIGHT", 24, -6)

        ChatFrame2.Background:SetPoint("TOPLEFT", -2, 27)
        ChatFrame2.Background:SetPoint("TOPRIGHT", 24, 27)
        ChatFrame2.Background:SetPoint("BOTTOMLEFT", -2, -6)
        ChatFrame2.Background:SetPoint("BOTTOMRIGHT", 24, -6)
    end)

    hooksecurefunc("FloatingChatFrame_UpdateScroll", function()
        local numMessages = _G['ChatFrame'..i]:GetNumMessages()
        local isShown = numMessages > 1
        _G['ChatFrame'..i].ScrollBar:Hide()
        _G['ChatFrame'..i].CfScrollBar:SetShown(isShown)
        if isShown then
            _G['ChatFrame'..i].CfScrollBar:SetMinMaxValues(1, numMessages)
            _G['ChatFrame'..i].CfScrollBar:SetValue(numMessages - _G['ChatFrame'..i]:GetScrollOffset())
        end
    end)

    hooksecurefunc("FloatingChatFrame_SetupScrolling", function()
        _G['ChatFrame'..i]:SetOnScrollChangedCallback(function(messageFrame, offset)
            messageFrame.CfScrollBar:SetValue(messageFrame:GetNumMessages() - offset)
        end)
    end)
end

hooksecurefunc("FCF_UpdateScrollbarAnchors", function(chatFrame)
    if chatFrame.CfScrollBar then
        chatFrame.CfScrollBar:ClearAllPoints()
        chatFrame.CfScrollBar:SetPoint("TOPLEFT", chatFrame, "TOPRIGHT")
        chatFrame.CfScrollBar:SetPoint("BOTTOM", chatFrame.ScrollToBottomButton, "TOP")
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