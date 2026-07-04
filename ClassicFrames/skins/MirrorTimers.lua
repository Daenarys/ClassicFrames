if not _G.MirrorTimerContainer then return end

local MirrorTimerColors = {
	EXHAUSTION = { r = 1.00, g = 0.90, b = 0.00 },
	BREATH = { r = 0.00, g = 0.50, b = 1.00 },
	DEATH = { r = 1.00, g = 0.70, b = 0.00 },
	FEIGNDEATH = { r = 1.00, g = 0.70, b = 0.00 },
}

local function SetupTimer(container, timer)
	local bar = container:GetAvailableTimer(timer)
	if not bar then return end

	bar:SetSize(206, 26)

	select(2, bar:GetRegions()):SetColorTexture(0, 0, 0, 0.5)

	bar.Border:SetSize(256, 64)
	bar.Border:SetTexture("Interface\\CastingBar\\UI-CastingBar-Border")
	bar.Border:ClearAllPoints()
	bar.Border:SetPoint("TOP", 0, 25)

	local color = MirrorTimerColors[timer]
	bar.StatusBar:SetSize(195, 13)
	bar.StatusBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
	bar.StatusBar:SetStatusBarColor(color.r, color.g, color.b)
	bar.StatusBar:ClearAllPoints()
	bar.StatusBar:SetPoint("TOP", 0, -2)

	bar.Text:SetFont(GameFontHighlight:GetFont())
	bar.Text:ClearAllPoints()
	bar.Text:SetPoint("TOP")

	bar.TextBorder:SetAlpha(0)
end

hooksecurefunc(_G.MirrorTimerContainer, "SetupTimer", SetupTimer)