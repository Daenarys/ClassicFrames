-- hide default buttons
TextToSpeechButtonFrame:Hide()

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