if not _G.ItemRefTooltip then return end

ItemRefTooltip.CloseButton:SetSize(32, 32)
ItemRefTooltip.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
ItemRefTooltip.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
ItemRefTooltip.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
ItemRefTooltip.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
ItemRefTooltip.CloseButton:ClearAllPoints()
ItemRefTooltip.CloseButton:SetPoint("TOPRIGHT", 1, 0)

FloatingBattlePetTooltip.CloseButton:SetSize(32, 32)
FloatingBattlePetTooltip.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
FloatingBattlePetTooltip.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
FloatingBattlePetTooltip.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
FloatingBattlePetTooltip.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
FloatingBattlePetTooltip.CloseButton:ClearAllPoints()
FloatingBattlePetTooltip.CloseButton:SetPoint("TOPRIGHT", 1, 0)