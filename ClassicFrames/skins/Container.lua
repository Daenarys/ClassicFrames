for i = 1, _G.NUM_CONTAINER_FRAMES do
	hooksecurefunc(_G['ContainerFrame'..i], "UpdateItemLayout", function(self)
		for i, itemButton in self:EnumerateValidItems() do
			itemButton.Cooldown:SetHideCountdownNumbers(true)
		end
	end)
end