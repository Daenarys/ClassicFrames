if not _G.TooltipDataProcessor then return end

TooltipDataProcessor.AddTooltipPreCall(Enum.TooltipDataType.Item, function(self)
	if self == ShoppingTooltip1 or self == ShoppingTooltip2 then
		local isPrimaryTooltip = (self == ShoppingTooltip1)
		local isPairedItem = (ShoppingTooltip2 and ShoppingTooltip2:IsShown())

		local header = CURRENTLY_EQUIPPED
		if not isPrimaryTooltip and isPairedItem then
			header = IF_EQUIPPED_TOGETHER
		end
		GameTooltip_AddDisabledLine(self, header, false)

		local line = _G[self:GetName().."TextLeft"..self:NumLines()]
		if line then
			line:SetFontObject(GameFontDisableSmall)
		end
	end
end)

hooksecurefunc(TooltipComparisonManager, "CompareItem", function(self)
	for _, tooltip in pairs(self.tooltip.shoppingTooltips) do
		if tooltip.CompareHeader then
			tooltip.CompareHeader:SetAlpha(0)
		end
	end
end)