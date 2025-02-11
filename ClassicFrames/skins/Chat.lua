-- hide default buttons
TextToSpeechButtonFrame:Hide()

for i = 1, NUM_CHAT_WINDOWS do
    _G['ChatFrame'..i].ScrollBar.Back:Hide()
    _G['ChatFrame'..i].ScrollBar.Forward:Hide()
    _G['ChatFrame'..i].ScrollBar.Track.Begin:Hide()
    _G['ChatFrame'..i].ScrollBar.Track.Middle:Hide()
    _G['ChatFrame'..i].ScrollBar.Track.End:Hide()

    _G['ChatFrame'..i].ScrollBar.Track:SetPoint("TOP", 0, -4)
    _G['ChatFrame'..i].ScrollBar.Track:SetPoint("BOTTOM")

    _G['ChatFrame'..i].ScrollToBottomButton:SetSize(24, 24)
    _G['ChatFrame'..i].ScrollToBottomButton:ClearAllPoints()
    _G['ChatFrame'..i].ScrollToBottomButton:SetPoint("BOTTOMRIGHT", _G['ChatFrame'..i..'ResizeButton'], "TOPRIGHT", 1, -2)
    _G['ChatFrame'..i].ScrollToBottomButton:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Up")
    _G['ChatFrame'..i].ScrollToBottomButton:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Down")
    _G['ChatFrame'..i].ScrollToBottomButton:SetDisabledTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Disabled")
    _G['ChatFrame'..i].ScrollToBottomButton:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
    _G['ChatFrame'..i].ScrollToBottomButton.Flash:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-BlinkHilight")
    _G['ChatFrame'..i].ScrollToBottomButton.Flash:SetBlendMode("BLEND")
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