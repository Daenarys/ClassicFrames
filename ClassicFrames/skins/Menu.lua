local function SkinMenu(manager, _, menuDescription)
	local menu = manager:GetOpenMenu()
	if not menu then return end

	select(1, menu:GetRegions()):SetAlpha(0)
	if (backdrop == nil) then
		backdrop = CreateFrame("Frame", nil, menu, "TooltipBackdropTemplate")
		backdrop:SetPoint("TOPLEFT", -5, 3)
		backdrop:SetPoint("BOTTOMRIGHT", 1, 4)
	end
	backdrop:SetFrameLevel(0)

	menuDescription:AddMenuAcquiredCallback(function(self)
		select(1, self:GetRegions()):SetAlpha(0)
		if (backdrop2 == nil) then
			backdrop2 = CreateFrame("Frame", nil, self, "TooltipBackdropTemplate")
			backdrop2:SetPoint("TOPLEFT", 0, 3)
			backdrop2:SetPoint("BOTTOMRIGHT", 0, 4)
		end
		backdrop2:SetFrameLevel(0)
	end)
end

local manager = _G.Menu.GetManager()
if manager then
	hooksecurefunc(manager, "OpenMenu", SkinMenu)
	hooksecurefunc(manager, "OpenContextMenu", SkinMenu)
end

hooksecurefunc(CompositorMixin, "AttachFontString", function(parent)
	for _, r in pairs(parent.attachments) do
		if r:GetObjectType() == "FontString" then
			r:SetFontObject(GameFontHighlightSmallLeft)
		elseif r:GetObjectType() == "Texture" then
			if r:GetAtlas() == "common-dropdown-ticksquare" then
				r:SetSize(16, 16)
				r:SetTexture("Interface\\Common\\UI-DropDownRadioChecks")
				r:SetTexCoord(0.5, 1, 0, 0.5)
			elseif r:GetAtlas() == "common-dropdown-icon-checkmark-yellow" then
				r:SetSize(16, 16)
				r:SetTexture("Interface\\Common\\UI-DropDownRadioChecks")
				r:SetTexCoord(0, 0.5, 0, 0.5)
			elseif r:GetAtlas() == "common-dropdown-tickradial" then
				r:SetSize(16, 16)
				r:SetTexture("Interface\\Common\\UI-DropDownRadioChecks")
				r:SetTexCoord(0.5, 1, 0.5, 1)
			elseif r:GetAtlas() == "common-dropdown-icon-radialtick-yellow" then
				r:SetSize(16, 16)
				r:SetTexture("Interface\\Common\\UI-DropDownRadioChecks")
				r:SetTexCoord(0, 0.5, 0.5, 1)
			end
		end
	end
end)