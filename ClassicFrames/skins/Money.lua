if MoneyFrame_Update then
	local originalMoneyFrameUpdate = MoneyFrame_Update
	MoneyFrame_Update = function(...)
		pcall(originalMoneyFrameUpdate, ...)
	end
end

if SetTooltipMoney then
	local originalSetTooltipMoney = SetTooltipMoney
	SetTooltipMoney = function(...)
		pcall(originalSetTooltipMoney, ...)
	end
end

function GameTooltip_OnTooltipAddMoney(self, cost, maxcost)
	if( not maxcost or maxcost < 1 ) then --We just have 1 price to display
		SetTooltipMoney(self, cost, nil, string.format("%s:", SELL_PRICE))
	else
		GameTooltip_AddColoredLine(self, ("%s:"):format(SELL_PRICE), HIGHLIGHT_FONT_COLOR)
		local indent = string.rep(" ",4)
		SetTooltipMoney(self, cost, nil, string.format("%s%s:", indent, MINIMUM))
		SetTooltipMoney(self, maxcost, nil, string.format("%s%s:", indent, MAXIMUM))
	end
end