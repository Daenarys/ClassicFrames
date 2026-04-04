if not _G.TooltipDataProcessor then return end

TooltipDataProcessor.AddTooltipPreCall(Enum.TooltipDataType.Item, function(self)
	if self == _G.ShoppingTooltip1 or self == _G.ShoppingTooltip2 then
		local isPrimaryTooltip = (self == _G.ShoppingTooltip1)
		local isPairedItem = (_G.ShoppingTooltip2 and _G.ShoppingTooltip2:IsShown())

		local header = CURRENTLY_EQUIPPED
		if not isPrimaryTooltip and isPairedItem then
			header = IF_EQUIPPED_TOGETHER
		end
		GameTooltip_AddDisabledLine(self, header, false)

		local TextLeft1 = _G[self:GetName().."TextLeft1"]
		if TextLeft1 then
			TextLeft1:SetFontObject(GameFontNormalSmall)
		end
		local TextLeft2 = _G[self:GetName().."TextLeft2"]
		if TextLeft2 then
			TextLeft2:SetFontObject(GameFontNormalSmall)
		end
		local TextRight1 = _G[self:GetName().."TextRight1"]
		if TextRight1 then
			TextRight1:SetFontObject(GameFontNormalSmall)
		end
		local TextRight2 = _G[self:GetName().."TextRight2"]
		if TextRight2 then
			TextRight2:SetFontObject(GameFontNormalSmall)
		end
	end
end)

hooksecurefunc(TooltipComparisonManager, "SetItemTooltip", function(self)
	for _, tooltip in pairs(self.tooltip.shoppingTooltips) do
		if tooltip.CompareHeader then
			tooltip.CompareHeader:SetAlpha(0)
		end
	end
end)