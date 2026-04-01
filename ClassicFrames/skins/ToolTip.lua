if not _G.TooltipComparisonManager then return end

hooksecurefunc(TooltipComparisonManager, "SetItemTooltip", function(self, isPrimaryTooltip)
	local tooltip
	if isPrimaryTooltip then
		tooltip = self.tooltip.shoppingTooltips[1]
	else
		tooltip = self.tooltip.shoppingTooltips[2]
	end
	if tooltip.CompareHeader then
		tooltip.CompareHeader:SetAlpha(0)
	end
end)

TooltipDataProcessor.AddTooltipPreCall(Enum.TooltipDataType.Item, function(tooltip, data)
	if tooltip == ShoppingTooltip1 or tooltip == ShoppingTooltip2 then
		local isPrimaryTooltip = (tooltip == ShoppingTooltip1)
		local isPairedItem = (ShoppingTooltip2 and ShoppingTooltip2:IsShown())

		local header = CURRENTLY_EQUIPPED
		if not isPrimaryTooltip and isPairedItem then
			header = IF_EQUIPPED_TOGETHER
		end
		GameTooltip_AddDisabledLine(tooltip, header, false)

		local line = _G[tooltip:GetName().."TextLeft"..tooltip:NumLines()]
		if line then
			line:SetFontObject("GameFontDisableSmall")
		end
	end
end)