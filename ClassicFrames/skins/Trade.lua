if not _G.TradeFrame then return end

ApplyCloseButton(TradeFrameCloseButton)

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