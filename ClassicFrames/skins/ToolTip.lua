hooksecurefunc("GameTooltip_AddInstructionLine", function(self, text)
	if text ~= UNIT_POPUP_RIGHT_CLICK then return end

	local name = self:GetName()
	local numLines = self:NumLines()

	local line = _G[name .. "TextLeft" .. numLines]
	if line then
		line:SetText("")
		line:Hide()
	end

	local blankline = _G[name .. "TextLeft" .. (numLines - 1)]
	if blankline then
		blankline:Hide()
	end
end)

hooksecurefunc("GameTooltip_OnTooltipAddMoney", function(self, cost)
	local name = self:GetName()
	local numLines = self:NumLines()

	local line = _G[name .. "TextLeft" .. numLines]
	if line then
		local text = line:GetText()
		if text then
			line:SetText(string.format("%s:   %s", SELL_PRICE, C_CurrencyInfo.GetCoinTextureString(cost, 13)))
		end
	end
end)

TooltipDataProcessor.AddTooltipPreCall(Enum.TooltipDataType.Item, function(self)
	if self == _G.ShoppingTooltip1 or self == _G.ShoppingTooltip2 then
		local isPrimaryTooltip = self == _G.ShoppingTooltip1
		local manager = _G.TooltipComparisonManager
		local comparisonMethod = manager.compareInfo and manager.compareInfo.method

		local isPairedItem = comparisonMethod == Enum.TooltipComparisonMethod.WithBagMainHandItem or comparisonMethod == Enum.TooltipComparisonMethod.WithBagOffHandItem

		local header = CURRENTLY_EQUIPPED
		if not isPrimaryTooltip and isPairedItem then
			header = IF_EQUIPPED_TOGETHER
		end
		GameTooltip_AddDisabledLine(self, header, false)
	end
end)

TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Item, function(self)
	if self == _G.ShoppingTooltip1 or self == _G.ShoppingTooltip2 then
		local name = self:GetName()

		local l1, r1 = _G[name.."TextLeft1"], _G[name.."TextRight1"]
		if l1 then l1:SetFontObject("GameFontNormalSmall") end
		if r1 then r1:SetFontObject("GameFontNormal") end

		local l2, r2 = _G[name.."TextLeft2"], _G[name.."TextRight2"]
		if l2 then l2:SetFontObject("GameFontNormal") end
		if r2 then r2:SetFontObject("GameFontHighlightSmall") end

		local l3, r3 = _G[name.."TextLeft3"], _G[name.."TextRight3"]
		if l3 then l3:SetFontObject("GameFontHighlightSmall") end
		if r3 then r3:SetFontObject("GameFontHighlightSmall") end

		for i = 4, 30 do
			local lN, rN = _G[name.."TextLeft"..i], _G[name.."TextRight"..i]
			if lN then lN:SetFontObject("GameTooltipTextSmall") end
			if rN then rN:SetFontObject("GameFontHighlightSmall") end
		end
	end
end)

TooltipDataProcessor.AddTooltipPostCall(Enum.TooltipDataType.Unit, function(self)
	if self == _G.GameTooltip then
		local name = self:GetName()
		local numLines = self:NumLines()

		local _, unit = self:GetUnit()
		if not unit or issecretvalue(unit) or not UnitIsPlayer(unit) then return end

		local className = UnitClass(unit)
		if not className then return end

		for i = 2, numLines - 1 do
			local levelLine = _G[name .. "TextLeft" .. i]
			local levelText = levelLine and levelLine:GetText()

			if levelText and levelText:find("^Level") then
				local classLine = _G[name .. "TextLeft" .. (i + 1)]
				local classText = classLine and classLine:GetText()

				if classText and classText:find(className, 1, true) then
					levelLine:SetText((levelText:gsub("%s*%(Player%)$", "")) .. " " .. className .. " (Player)")

					for j = i + 1, numLines - 1 do
						_G[name .. "TextLeft" .. j]:SetText(_G[name .. "TextLeft" .. (j + 1)]:GetText())
					end
					local last = _G[name .. "TextLeft" .. numLines]
					last:SetText("")
					last:Hide()
				end
				break
			end
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

local isAdjusting = false
local function AnchorShoppingTooltips(self)
	if isAdjusting then return end
	isAdjusting = true
	if self == ShoppingTooltip1 then
		self:SetPoint("TOP", GameTooltip, "TOP", 0, -10)
	else
		self:SetPoint("TOP", GameTooltip, "TOP", 0, -10)
	end
	isAdjusting = false
end

hooksecurefunc(ShoppingTooltip1, "SetPoint", AnchorShoppingTooltips)
hooksecurefunc(ShoppingTooltip2, "SetPoint", AnchorShoppingTooltips)