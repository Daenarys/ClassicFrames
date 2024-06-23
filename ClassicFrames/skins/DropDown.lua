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
	end
end)