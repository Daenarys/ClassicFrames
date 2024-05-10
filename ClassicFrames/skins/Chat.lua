for i = 1, NUM_CHAT_WINDOWS do
    _G["ChatFrame"..i].ScrollBar.Back:Hide()
    _G["ChatFrame"..i].ScrollBar.Forward:Hide()

    _G["ChatFrame"..i].ScrollBar.Track.Begin:Hide()
    _G["ChatFrame"..i].ScrollBar.Track.End:Hide()
    _G["ChatFrame"..i].ScrollBar.Track.Middle:Hide()

    -- fix blizz 10.1 bug
    hooksecurefunc("FloatingChatFrame_Update", function()
        _G["ChatFrame"..i].Background:SetPoint("TOPLEFT", _G["ChatFrame"..i], "TOPLEFT", -2, 3)
        _G["ChatFrame"..i].Background:SetPoint("TOPRIGHT", _G["ChatFrame"..i], "TOPRIGHT", 13, 3)
        _G["ChatFrame"..i].Background:SetPoint("BOTTOMLEFT", _G["ChatFrame"..i], "BOTTOMLEFT", -2, -6)
        _G["ChatFrame"..i].Background:SetPoint("BOTTOMRIGHT", _G["ChatFrame"..i], "BOTTOMRIGHT", 13, -6)
    end)

    local tab = _G['ChatFrame'..i..'Tab']
    if tab then
        tab.Text:SetPoint("CENTER", 0, -6)
    end
end

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