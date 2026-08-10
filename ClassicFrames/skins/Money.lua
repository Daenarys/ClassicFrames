-- Wrap MoneyFrame functions in pcall to suppress Blizzard secret value bug
if MoneyFrame_Update then
    local originalMoneyFrameUpdate = MoneyFrame_Update
    MoneyFrame_Update = function(...)
        pcall(originalMoneyFrameUpdate, ...)
    end
end

local function SetMoney(frame, money, prefixText, suffixText)
	frame:AddLine(" ", 1.0, 1.0, 1.0)
	local numLines = frame:NumLines()
	if ( not frame.numMoneyFrames ) then
		frame.numMoneyFrames = 0
	end
	if ( not frame.shownMoneyFrames ) then
		frame.shownMoneyFrames = 0
	end
	local name = frame:GetName().."MoneyFrame"..frame.shownMoneyFrames+1
	local moneyFrame = _G[name]
	if ( not moneyFrame ) then
		frame.numMoneyFrames = frame.numMoneyFrames+1
		moneyFrame = CreateFrame("Frame", name, frame, "TooltipMoneyFrameTemplate")
		name = moneyFrame:GetName()
		MoneyFrame_SetType(moneyFrame, "STATIC")
	end
	_G[name.."PrefixText"]:SetText(prefixText)
	_G[name.."SuffixText"]:SetText(suffixText)
	moneyFrame:SetPoint("LEFT", frame:GetName().."TextLeft"..numLines, "LEFT", 4, 0)
	moneyFrame:Show()
	if ( not frame.shownMoneyFrames ) then
		frame.shownMoneyFrames = 1
	else
		frame.shownMoneyFrames = frame.shownMoneyFrames+1
	end
	MoneyFrame_Update(moneyFrame:GetName(), money)
	frame:SetMinimumWidth(moneyFrame:GetWidth())
end

function GameTooltip_OnTooltipAddMoney(self, cost, maxcost)
	if( not maxcost or maxcost < 1 ) then
		SetMoney(self, cost, string.format("%s:", SELL_PRICE))
	end
end