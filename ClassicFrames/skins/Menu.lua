local function OpenMenu(manager)
	local Menu = manager:GetOpenMenu()
	if Menu then
		for i = 1, Menu:GetNumChildren() do
			local child = select(i, Menu:GetChildren())
			if child.MinLevel then
				ApplySearchBox(child.MinLevel)
			end
			if child.MaxLevel then
				ApplySearchBox(child.MaxLevel)
			end
		end
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