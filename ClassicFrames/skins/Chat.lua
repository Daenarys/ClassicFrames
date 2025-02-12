for i = 1, NUM_CHAT_WINDOWS do
    -- hide default buttons
    ChatFrameChannelButton:Hide()
    ChatFrameMenuButton:Hide()
    TextToSpeechButtonFrame:Hide()

    -- hide chat window scrollbars
    local b = _G["ChatFrame"..i].ScrollBar b:UnregisterAllEvents() b:SetScript("OnShow", b.Hide) b:Hide()
    local c = _G["ChatFrame"..i].ScrollToBottomButton c:UnregisterAllEvents() c:SetScript("OnShow", c.Hide) c:Hide()
    
    local ChatFrameButtonFrameUpButton = _G["ChatFrame"..i.."ButtonFrameUpButton"]
    if (ChatFrameButtonFrameUpButton == nil) then
        ChatFrameButtonFrameUpButton = CreateFrame("Button", _G["ChatFrame"..i.."ButtonFrameUpButton"], _G["ChatFrame"..i.."ButtonFrame"])
        ChatFrameButtonFrameUpButton:SetSize(32, 32)
        ChatFrameButtonFrameUpButton:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollUp-Up")
        ChatFrameButtonFrameUpButton:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollUp-Down")
        ChatFrameButtonFrameUpButton:SetDisabledTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollUp-Disabled")
        ChatFrameButtonFrameUpButton:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
        MessageFrameScrollButton_OnLoad(ChatFrameButtonFrameUpButton)
        ChatFrameButtonFrameUpButton:SetScript("OnUpdate", MessageFrameScrollButton_OnUpdate)
        ChatFrameButtonFrameUpButton:SetScript("OnClick", function(self, button)
            if (self:GetButtonState() == "PUSHED") then
                self.clickDelay = MESSAGE_SCROLLBUTTON_INITIAL_DELAY
            else
                PlaySound(SOUNDKIT.IG_CHAT_SCROLL_UP)
                self:GetParent():GetParent():ScrollUp()
            end
        end)
    end

    local ChatFrameButtonFrameDownButton = _G["ChatFrame"..i.."ButtonFrameDownButton"]
    if (ChatFrameButtonFrameDownButton == nil) then
        ChatFrameButtonFrameDownButton = CreateFrame("Button", _G["ChatFrame"..i.."ButtonFrameDownButton"], _G["ChatFrame"..i.."ButtonFrame"])
        ChatFrameButtonFrameDownButton:SetSize(32, 32)
        ChatFrameButtonFrameDownButton:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Up")
        ChatFrameButtonFrameDownButton:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Down")
        ChatFrameButtonFrameDownButton:SetDisabledTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollDown-Disabled")
        ChatFrameButtonFrameDownButton:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
        MessageFrameScrollButton_OnLoad(ChatFrameButtonFrameDownButton)
        ChatFrameButtonFrameDownButton:SetScript("OnUpdate", MessageFrameScrollButton_OnUpdate)
        ChatFrameButtonFrameDownButton:SetScript("OnClick", function(self, button)
            if (self:GetButtonState() == "PUSHED") then
                self.clickDelay = MESSAGE_SCROLLBUTTON_INITIAL_DELAY
            else
                PlaySound(SOUNDKIT.IG_CHAT_SCROLL_DOWN)
                self:GetParent():GetParent():ScrollDown()
            end
        end)
    end

    local ChatFrameButtonFrameBottomButton = _G["ChatFrame"..i.."ButtonFrameBottomButton"]
    if (ChatFrameButtonFrameBottomButton == nil) then
        ChatFrameButtonFrameBottomButton = CreateFrame("Button", _G["ChatFrame"..i.."ButtonFrameBottomButton"], _G["ChatFrame"..i.."ButtonFrame"])
        ChatFrameButtonFrameBottomButton:SetSize(32, 32)
        ChatFrameButtonFrameBottomButton:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Up")
        ChatFrameButtonFrameBottomButton:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Down")
        ChatFrameButtonFrameBottomButton:SetDisabledTexture("Interface\\ChatFrame\\UI-ChatIcon-ScrollEnd-Disabled")
        ChatFrameButtonFrameBottomButton:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
        local ChatFrameButtonFrameBottomButtonFlash = ChatFrameButtonFrameBottomButton:CreateTexture(_G["ChatFrame"..i.."ButtonFrameBottomButtonFlash"], "OVERLAY")
        ChatFrameButtonFrameBottomButtonFlash:SetTexture("Interface\\ChatFrame\\UI-ChatIcon-BlinkHilight")
        ChatFrameButtonFrameBottomButtonFlash:SetAllPoints(ChatFrameButtonFrameBottomButton)
        ChatFrameButtonFrameBottomButtonFlash:Hide()
        MessageFrameScrollButton_OnLoad(ChatFrameButtonFrameBottomButton)
        ChatFrameButtonFrameBottomButton:SetScript("OnUpdate", MessageFrameScrollButton_OnUpdate)
        ChatFrameButtonFrameBottomButton:SetScript("OnClick", function(self, button)
            if (self:GetButtonState() == "PUSHED") then
            else
                PlaySound(SOUNDKIT.IG_CHAT_BOTTOM)
                self:GetParent():GetParent():ScrollToBottom()
            end
        end)
                
        ChatFrameButtonFrameBottomButton.func_ChatFrame_OnUpdate = function(self, elapsedSec) 
            local oldflash = ChatFrameButtonFrameBottomButtonFlash
            local flash = self.ScrollToBottomButton.Flash
            if oldflash and flash then
                if (self:AtBottom()) then
                    if (oldflash:IsShown()) then
                        oldflash:Hide()
                    end
                end
                if flash:IsShown() then
                    oldflash:SetAlpha(flash:GetAlpha())
                    if (not oldflash:IsShown()) then
                        oldflash:Show()
                    end
                elseif (oldflash:IsShown()) then
                    oldflash:Hide()
                end
            end
        end
    end

    local ChatFrameButtonFrameMenuButton = _G["ChatFrame"..i.."ButtonFrameMenuButton"]
    if (ChatFrameButtonFrameMenuButton == nil) then
        ChatFrameButtonFrameMenuButton = CreateFrame("Button", _G["ChatFrame"..i.."ButtonFrameMenuButton"], _G["ChatFrame"..i.."ButtonFrame"])
        ChatFrameButtonFrameMenuButton:SetSize(32, 32)
        ChatFrameButtonFrameMenuButton:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIcon-Chat-Up")
        ChatFrameButtonFrameMenuButton:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIcon-Chat-Down")
        ChatFrameButtonFrameMenuButton:SetDisabledTexture("Interface\\ChatFrame\\UI-ChatIcon-Chat-Disabled")
        ChatFrameButtonFrameMenuButton:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight", "ADD")
        ChatFrameButtonFrameMenuButton:SetScript("OnClick", function(self, button)
            PlaySound(SOUNDKIT.IG_CHAT_EMOTE_BUTTON)
            ChatFrame_ToggleMenu()

            if ChatMenu:IsShown() and HelpTip:IsShowingAny(self) then
                HelpTip:HideAll(self)
            end
        end)
    end

    ChatFrameButtonFrameUpButton:ClearAllPoints()
    ChatFrameButtonFrameUpButton:SetPoint("BOTTOM", ChatFrameButtonFrameDownButton, "TOP", 0, 0)
    ChatFrameButtonFrameDownButton:ClearAllPoints()
    ChatFrameButtonFrameDownButton:SetPoint("BOTTOM", ChatFrameButtonFrameBottomButton, "TOP", 0, -2)
    ChatFrameButtonFrameBottomButton:ClearAllPoints()
    ChatFrameButtonFrameBottomButton:SetPoint("BOTTOM", _G["ChatFrame"..i.."ButtonFrame"], "BOTTOM", 0, -7)
    ChatFrameButtonFrameMenuButton:ClearAllPoints()
    ChatFrameButtonFrameMenuButton:SetPoint("BOTTOM", ChatFrameButtonFrameUpButton, "TOP", 0, 0)

    hooksecurefunc("ChatFrame_OnUpdate", ChatFrameButtonFrameBottomButton.func_ChatFrame_OnUpdate)
end

QuickJoinToastButton:HookScript("OnUpdate", function(self)
    self:ClearAllPoints()
    self:SetPoint("BOTTOMLEFT", ChatAlertFrame, "BOTTOMLEFT", 0, -23)
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