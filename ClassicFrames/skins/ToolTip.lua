local COPPER = "|T" .. "Interface\\MoneyFrame\\UI-MoneyIcons" .. ":13:13:1:-1:128:32:64:96:0:32|t"
local SILVER = "|T" .. "Interface\\MoneyFrame\\UI-MoneyIcons" .. ":13:13:1:-1:128:32:32:64:0:32|t"
local GOLD = "|T" .. "Interface\\MoneyFrame\\UI-MoneyIcons" .. ":13:13:1:-1:128:32:0:32:0:32|t"

local function ReplaceAtlasWithMoneyIcons(line)
	local text = line:GetText()
	if text then
		text = text:gsub("|A:coin%-copper:[^|]+|a", COPPER)
				   :gsub("|A:coin%-silver:[^|]+|a", SILVER)
				   :gsub("|A:coin%-gold:[^|]+|a", GOLD)
		line:SetText(text)
	end
end

hooksecurefunc("GameTooltip_OnTooltipAddMoney", function(self)
	local name = self:GetName()
	local numLines = self:NumLines()

	local line = _G[name .. "TextLeft" .. numLines]
	if line then ReplaceAtlasWithMoneyIcons(line) end
end)

function UnitFrame_UpdateTooltip(self)
	GameTooltip_SetDefaultAnchor(GameTooltip, self)
	if ( GameTooltip:SetUnit(self.unit, self.hideStatusOnTooltip) ) then
		self.UpdateTooltip = UnitFrame_UpdateTooltip
	else
		self.UpdateTooltip = nil
	end
end

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

		local _, unit = self:GetUnit()
		if not unit or issecretvalue(unit) or not UnitIsPlayer(unit) then return end

		local className = UnitClass(unit)
		if not className then return end

		local levelLine, classLine

		for i = 2, self:NumLines() do
			local line = _G[name .. "TextLeft" .. i]
			if line then
				local text = line:GetText()
				if text then
					if text:find("^Level") then
						levelLine = i
					elseif (text == className or text:find(className)) and levelLine then
						classLine = i
						break
					end
				end
			end
		end

		if levelLine and classLine then
			local levelLine = _G[name .. "TextLeft" .. levelLine]
			local currentLevelText = levelLine:GetText() or ""

			currentLevelText = currentLevelText:gsub("%s*%(Player%)", "")
			levelLine:SetText(currentLevelText .. " " .. className .. " (Player)")

			local numLines = self:NumLines()
			for i = classLine, numLines - 1 do
				local currentLeft = _G[name .. "TextLeft" .. i]
				local nextLeft = _G[name .. "TextLeft" .. (i + 1)]
				if currentLeft and nextLeft then
					currentLeft:SetText(nextLeft:GetText())
				end
			end

			local lastLeft = _G[name .. "TextLeft" .. numLines]
			if lastLeft then
				lastLeft:SetText("")
				lastLeft:Hide()
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