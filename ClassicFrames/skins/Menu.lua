local function OpenMenu(manager, region, menuDescription)
	local Menu = manager:GetOpenMenu()
	if Menu then
		select(1, Menu:GetRegions()):SetAlpha(0)
		if (Backdrop == nil) then
			Backdrop = CreateFrame("Frame", nil, Menu, "TooltipBackdropTemplate")
			Backdrop:SetPoint("TOPLEFT")
			Backdrop:SetPoint("BOTTOMRIGHT")
			Backdrop:SetFrameLevel(Menu:GetFrameLevel() - 1)
		end
		menuDescription:AddMenuAcquiredCallback(function(self)
			select(1, self:GetRegions()):SetAlpha(0)
			if (Backdrop2 == nil) then
				Backdrop2 = CreateFrame("Frame", nil, self, "TooltipBackdropTemplate")
				Backdrop2:SetPoint("TOPLEFT")
				Backdrop2:SetPoint("BOTTOMRIGHT")
			end
		end)
		if Menu.ScrollBar then
			Menu.ScrollBar.Track.Begin:Hide()
			Menu.ScrollBar.Track.End:Hide()
			Menu.ScrollBar.Track.Middle:Hide()

			ApplyScrollBarThumb(Menu.ScrollBar.Track.Thumb)

			Menu.ScrollBar.Back:SetSize(18, 16)
			Menu.ScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
			Menu.ScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
			Menu.ScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
			Menu.ScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

			Menu.ScrollBar.Forward:SetSize(18, 16)
			Menu.ScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
			Menu.ScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
			Menu.ScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
			Menu.ScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")
		end
	end
end

local Manager = _G.Menu.GetManager()
if Manager then
	hooksecurefunc(Manager, 'OpenMenu', OpenMenu)
	hooksecurefunc(Manager, 'OpenContextMenu', OpenMenu)
end