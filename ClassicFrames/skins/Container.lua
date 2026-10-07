for i = 1, _G.NUM_CONTAINER_FRAMES do
	hooksecurefunc(_G['ContainerFrame'..i], "UpdateItemLayout", function(self)
		for i, itemButton in self:EnumerateValidItems() do
			itemButton.Cooldown:SetBlingTexture("Interface\\Cooldown\\star4", 0.3, 0.6, 1, 0.8)
			itemButton.Cooldown:SetSwipeColor(0, 0, 0, 0.8)
			itemButton.Cooldown:SetHideCountdownNumbers(true)
		end
	end)
end