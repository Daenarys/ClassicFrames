if not _G.TradeFrame then return end

ApplyCloseButton(TradeFrameCloseButton)

TradeFrame.PortraitContainer.CircleMask:Hide()

TradeFramePortrait:SetSize(61, 61)
TradeFramePortrait:ClearAllPoints()
TradeFramePortrait:SetPoint("TOPLEFT", -6, 8)

TradeFrameTitleText:ClearAllPoints()
TradeFrameTitleText:SetPoint("CENTER", -17, 1)

ApplyTitleBg(TradeFrame)
ApplyNineSlicePortrait(TradeFrame)

TradeFrame.RecipientOverlay.portraitFrame:SetSize(78, 78)
TradeFrame.RecipientOverlay.portraitFrame:SetAtlas("UI-Frame-Portrait")
TradeFrame.RecipientOverlay.portraitFrame:ClearAllPoints()
TradeFrame.RecipientOverlay.portraitFrame:SetPoint("TOPLEFT", -6, 4)

TradePlayerInputMoneyFrameGold.texture:SetTexture("Interface\\MoneyFrame\\UI-MoneyIcons")
TradePlayerInputMoneyFrameGold.texture:SetTexCoord(0, 0.25, 0, 1)
TradePlayerInputMoneyFrameSilver.texture:SetTexture("Interface\\MoneyFrame\\UI-MoneyIcons")
TradePlayerInputMoneyFrameSilver.texture:SetTexCoord(0.25, 0.5, 0, 1)
TradePlayerInputMoneyFrameCopper.texture:SetTexture("Interface\\MoneyFrame\\UI-MoneyIcons")
TradePlayerInputMoneyFrameCopper.texture:SetTexCoord(0.5, 0.75, 0, 1)