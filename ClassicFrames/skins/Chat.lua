-- hide default buttons
ChatFrameChannelButton:Hide()
TextToSpeechButtonFrame:Hide()

for i = 1, NUM_CHAT_WINDOWS do
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
        MessageFrameScrollButtonMixin.OnLoad(ChatFrameButtonFrameUpButton)
        ChatFrameButtonFrameUpButton:SetScript("OnClick", function(self)
            if (self:GetButtonState() == "PUSHED") then
                self.clickDelay = MessageFrameScrollButtonConstants.InitialScrollDelay
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
        MessageFrameScrollButtonMixin.OnLoad(ChatFrameButtonFrameDownButton)
        ChatFrameButtonFrameDownButton:SetScript("OnClick", function(self)
            if (self:GetButtonState() == "PUSHED") then
                self.clickDelay = MessageFrameScrollButtonConstants.InitialScrollDelay
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
        MessageFrameScrollButtonMixin.OnLoad(ChatFrameButtonFrameBottomButton)
        ChatFrameButtonFrameBottomButton:SetScript("OnClick", function(self)
            if not (self:GetButtonState() == "PUSHED") then
                PlaySound(SOUNDKIT.IG_CHAT_BOTTOM)
                self:GetParent():GetParent():ScrollToBottom()
            end
        end)
       
        ChatFrameButtonFrameBottomButton.OnUpdate = function(self, elapsedSec) 
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

    ChatFrameButtonFrameUpButton:ClearAllPoints()
    ChatFrameButtonFrameUpButton:SetPoint("BOTTOM", ChatFrameButtonFrameDownButton, "TOP")
    ChatFrameButtonFrameDownButton:ClearAllPoints()
    ChatFrameButtonFrameDownButton:SetPoint("BOTTOM", ChatFrameButtonFrameBottomButton, "TOP", 0, -2)
    ChatFrameButtonFrameBottomButton:ClearAllPoints()
    ChatFrameButtonFrameBottomButton:SetPoint("BOTTOM", _G["ChatFrame"..i.."ButtonFrame"], "BOTTOM", 0, -7)
    ChatFrameMenuButton:SetPoint("BOTTOM", 0, 87)

    hooksecurefunc(_G["ChatFrame"..i].editBox, "UpdateNewcomerEditBoxHint", function(self)
        self.NewcomerHint:SetShown(false)
        self:SetAlpha(0.25)
    end)

    _G["ChatFrame"..i]:HookScript("OnUpdate", ChatFrameButtonFrameBottomButton.OnUpdate)
end

QuickJoinToastButton:HookScript("OnUpdate", function(self)
    self:ClearAllPoints()
    self:SetPoint("BOTTOMLEFT", ChatAlertFrame, "BOTTOMLEFT")
end)

ChatConfigCombatSettingsFilters.ScrollBar.Track.Begin:Hide()
ChatConfigCombatSettingsFilters.ScrollBar.Track.End:Hide()
ChatConfigCombatSettingsFilters.ScrollBar.Track.Middle:Hide()

ApplyScrollBarThumb(ChatConfigCombatSettingsFilters.ScrollBar.Track.Thumb)

ChatConfigCombatSettingsFilters.ScrollBar.Back:SetSize(18, 16)
ChatConfigCombatSettingsFilters.ScrollBar.Back:SetNormalTexture("Interface\\Buttons\\UI-ScrollBar-ScrollUpButton-Up")
ChatConfigCombatSettingsFilters.ScrollBar.Back:GetNormalTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)
ChatConfigCombatSettingsFilters.ScrollBar.Back:SetPushedTexture("Interface\\Buttons\\UI-ScrollBar-ScrollUpButton-Down")
ChatConfigCombatSettingsFilters.ScrollBar.Back:GetPushedTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)
ChatConfigCombatSettingsFilters.ScrollBar.Back:SetDisabledTexture("Interface\\Buttons\\UI-ScrollBar-ScrollUpButton-Disabled")
ChatConfigCombatSettingsFilters.ScrollBar.Back:GetDisabledTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)
ChatConfigCombatSettingsFilters.ScrollBar.Back:SetHighlightTexture("Interface\\Buttons\\UI-ScrollBar-ScrollUpButton-Highlight", "ADD")
ChatConfigCombatSettingsFilters.ScrollBar.Back:GetHighlightTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)

ChatConfigCombatSettingsFilters.ScrollBar.Forward:SetSize(18, 16)
ChatConfigCombatSettingsFilters.ScrollBar.Forward:SetNormalTexture("Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Up")
ChatConfigCombatSettingsFilters.ScrollBar.Forward:GetNormalTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)
ChatConfigCombatSettingsFilters.ScrollBar.Forward:SetPushedTexture("Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Down")
ChatConfigCombatSettingsFilters.ScrollBar.Forward:GetPushedTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)
ChatConfigCombatSettingsFilters.ScrollBar.Forward:SetDisabledTexture("Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Disabled")
ChatConfigCombatSettingsFilters.ScrollBar.Forward:GetDisabledTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)
ChatConfigCombatSettingsFilters.ScrollBar.Forward:SetHighlightTexture("Interface\\Buttons\\UI-ScrollBar-ScrollDownButton-Highlight", "ADD")
ChatConfigCombatSettingsFilters.ScrollBar.Forward:GetHighlightTexture():SetTexCoord(0.2, 0.8, 0.25, 0.75)

ApplyDialogBorder(ChatConfigFrame.Border)
ApplyDialogHeader(ChatConfigFrame.Header)