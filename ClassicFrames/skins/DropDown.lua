local MenuManagerProxy = Menu.GetManager()

hooksecurefunc(MenuManagerProxy, 'OpenMenu', function()
	local MenuFrame = MenuManagerProxy:GetOpenMenu()
	if MenuFrame then
		for i = 1, MenuFrame:GetNumChildren() do
			local child = select(i, MenuFrame:GetChildren())
			if child.MinLevel then
				ApplySearchBox(child.MinLevel)
			end
			if child.MaxLevel then
				ApplySearchBox(child.MaxLevel)
			end
		end
		if MenuFrame.ScrollBar then
			MenuFrame.ScrollBar.Track.Begin:Hide()
			MenuFrame.ScrollBar.Track.End:Hide()
			MenuFrame.ScrollBar.Track.Middle:Hide()

			ApplyScrollBarThumb(MenuFrame.ScrollBar.Track.Thumb)

			MenuFrame.ScrollBar.Back:SetSize(18, 16)
			MenuFrame.ScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
			MenuFrame.ScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
			MenuFrame.ScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
			MenuFrame.ScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

			MenuFrame.ScrollBar.Forward:SetSize(18, 16)
			MenuFrame.ScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
			MenuFrame.ScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
			MenuFrame.ScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
			MenuFrame.ScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")
		end
	end
end)