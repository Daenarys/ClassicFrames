for i = 1, NUM_CHAT_WINDOWS do
    _G["ChatFrame"..i].ScrollBar.Back:Hide()
    _G["ChatFrame"..i].ScrollBar.Forward:Hide()
    _G["ChatFrame"..i].ScrollBar.Track.Begin:Hide()
    _G["ChatFrame"..i].ScrollBar.Track.End:Hide()
    _G["ChatFrame"..i].ScrollBar.Track.Middle:Hide()

    _G["ChatFrame"..i].ScrollToBottomButton:SetSize(24, 24)
    _G["ChatFrame"..i].ScrollToBottomButton:ClearAllPoints()
    _G["ChatFrame"..i].ScrollToBottomButton:SetPoint("BOTTOMRIGHT", _G['ChatFrame'..i..'ResizeButton'], "TOPRIGHT", 0, -2)

    _G["ChatFrame"..i].ScrollToBottomButton.Flash:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-BlinkHilight")
     _G["ChatFrame"..i].ScrollToBottomButton.Flash:SetDrawLayer("OVERLAY")

    _G["ChatFrame"..i].ScrollToBottomButton:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Up")
    _G["ChatFrame"..i].ScrollToBottomButton:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Down")
    _G["ChatFrame"..i].ScrollToBottomButton:SetDisabledTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Disabled")
    _G["ChatFrame"..i].ScrollToBottomButton:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")

     _G['ChatFrame'..i..'EditBox']:ClearAllPoints()
     _G['ChatFrame'..i..'EditBox']:SetPoint("TOPLEFT", _G["ChatFrame"..i], "BOTTOMLEFT", -5, -2)
     _G['ChatFrame'..i..'EditBox']:SetPoint("RIGHT", _G["ChatFrame"..i].ScrollBar, "RIGHT", 10, 0)

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

hooksecurefunc("FCF_UpdateScrollbarAnchors", function(chatFrame)
    if chatFrame.ScrollBar then
        chatFrame.ScrollBar:ClearAllPoints()
        chatFrame.ScrollBar:SetPoint("TOPLEFT", chatFrame, "TOPRIGHT", -2, 0)

        if chatFrame.ScrollToBottomButton:IsShown() then
            chatFrame.ScrollBar:SetPoint("BOTTOM", chatFrame.ScrollToBottomButton, "TOP", 0, -15)
        elseif chatFrame.ResizeButton:IsShown() then
            chatFrame.ScrollBar:SetPoint("BOTTOM", chatFrame.ResizeButton, "TOP", 0, 0)
        else
            chatFrame.ScrollBar:SetPoint("BOTTOMLEFT", chatFrame, "BOTTOMRIGHT", 0, 0)
        end
    end
end)

hooksecurefunc("FCF_FadeInScrollbar", function(chatFrame)
    if chatFrame.ScrollBar and chatFrame.ScrollBar:IsShown() then
        if chatFrame.ScrollToBottomButton then
            UIFrameFadeIn(chatFrame.ScrollToBottomButton, .1, chatFrame.ScrollToBottomButton:GetAlpha(), 1)
        end
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

QuickJoinToastButton:HookScript("OnUpdate", function(self)
    self:ClearAllPoints()
    self:SetPoint("BOTTOMLEFT", ChatAlertFrame, "BOTTOMLEFT")
end)

ApplyDialogBorder(ChatConfigFrame.Border)
ApplyDialogHeader(ChatConfigFrame.Header)

ChatConfigFrame:HookScript("OnShow", function(self)
    self:ClearAllPoints()
    self:SetPoint("CENTER")
end)