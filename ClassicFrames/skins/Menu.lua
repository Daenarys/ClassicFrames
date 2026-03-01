local function SkinMenu(manager)
	local menu = manager:GetOpenMenu()
	if not menu then return end

	select(1, menu:GetRegions()):SetAlpha(0)

	if (backdrop == nil) then
		backdrop = CreateFrame("Frame", nil, menu, "TooltipBackdropTemplate")
		backdrop:SetPoint("TOPLEFT")
		backdrop:SetPoint("BOTTOMRIGHT", 0, 6)
	end
end

local manager = _G.Menu.GetManager()
if manager then
	hooksecurefunc(manager, 'OpenMenu', SkinMenu)
	hooksecurefunc(manager, 'OpenContextMenu', SkinMenu)
end