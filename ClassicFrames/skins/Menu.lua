local function SkinMenu(manager, _, menuDescription)
	local menu = manager:GetOpenMenu()
	if not menu then return end

	select(1, menu:GetRegions()):SetAlpha(0)
	if (backdrop == nil) then
		backdrop = CreateFrame("Frame", nil, menu, "TooltipBackdropTemplate")
		backdrop:SetPoint("TOPLEFT")
		backdrop:SetPoint("BOTTOMRIGHT", 0, 6)
	end
	backdrop:SetFrameLevel(0)

	menuDescription:AddMenuAcquiredCallback(function(self)
		select(1, self:GetRegions()):SetAlpha(0)
		if (backdrop2 == nil) then
			backdrop2 = CreateFrame("Frame", nil, self, "TooltipBackdropTemplate")
			backdrop2:SetPoint("TOPLEFT")
			backdrop2:SetPoint("BOTTOMRIGHT", 0, 6)
		end
		backdrop2:SetFrameLevel(0)
	end)
end

local manager = _G.Menu.GetManager()
if manager then
	hooksecurefunc(manager, 'OpenMenu', SkinMenu)
	hooksecurefunc(manager, 'OpenContextMenu', SkinMenu)
end