if not _G.ItemRefTooltip then return end

ApplyCloseButton(ItemRefTooltip.CloseButton, true)
ItemRefTooltip.CloseButton:ClearAllPoints()
ItemRefTooltip.CloseButton:SetPoint("TOPRIGHT", 1, 0)

ApplyCloseButton(FloatingBattlePetTooltip.CloseButton, true)
FloatingBattlePetTooltip.CloseButton:ClearAllPoints()
FloatingBattlePetTooltip.CloseButton:SetPoint("TOPRIGHT", 1, 0)