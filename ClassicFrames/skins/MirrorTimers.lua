if not _G.MirrorTimerContainer then return end

hooksecurefunc(MirrorTimerContainer, "SetupTimer", function(self, timer, value, maxvalue, scale, paused, label)
	local dialog
	for index = 1, #MirrorTimerContainer.mirrorTimers, 1 do
		local frame = self:GetAvailableTimer(timer)
		if ( frame:IsShown() and (frame.timer == timer) ) then
			dialog = frame;
			break;
		end
	end

	dialog:SetSize(206, 26)
	dialog.TextBorder:Hide()
	dialog.Text:ClearAllPoints()
	dialog.Text:SetPoint("CENTER", dialog, "CENTER", 0, 7)
	dialog.Text:SetFont(GameFontHighlight:GetFont())
	select(2,dialog:GetRegions()):SetColorTexture(0, 0, 0, 0.5)
	dialog.StatusBar:SetSize(195, 13)
	dialog.StatusBar:ClearAllPoints()
	dialog.StatusBar:SetPoint('TOP', 0, -2)
	dialog.StatusBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
	dialog.Border:SetTexture("Interface\\CastingBar\\UI-CastingBar-Border")
	dialog.Border:SetSize(256, 64)
	dialog.Border:ClearAllPoints()
	dialog.Border:SetPoint("TOP", 0, 25)
	if (timer == "EXHAUSTION") then
		dialog.StatusBar:SetStatusBarColor(1.00, 0.90, 0.00)
	elseif (timer == "BREATH") then
		dialog.StatusBar:SetStatusBarColor(0.00, 0.50, 1.00)
	elseif (timer == "DEATH") then
		dialog.StatusBar:SetStatusBarColor(1.00, 0.70, 0.00)
	elseif (timer == "FEIGNDEATH") then
		dialog.StatusBar:SetStatusBarColor(1.00, 0.70, 0.00)
	end
end)