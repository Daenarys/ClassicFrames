hooksecurefunc("TextStatusBar_UpdateTextStringWithValues", function(statusFrame, textString, value, valueMin, valueMax)
	if ( ( tonumber(valueMax) ~= valueMax or valueMax > 0 ) and not ( statusFrame.pauseUpdates ) ) then
		local valueDisplay = value
		local valueMaxDisplay = valueMax
		if ( statusFrame.capNumericDisplay ) then
			valueDisplay = AbbreviateLargeNumbers(value)
			valueMaxDisplay = AbbreviateLargeNumbers(valueMax)
		else
			valueDisplay = BreakUpLargeNumbers(value)
			valueMaxDisplay = BreakUpLargeNumbers(valueMax)
		end

		local textDisplay = GetCVar("statusTextDisplay")
		if ( value and valueMax > 0 and ( (textDisplay ~= "NUMERIC" and textDisplay ~= "NONE") or statusFrame.showPercentage ) and not statusFrame.showNumeric) then
			if ( value == 0 and statusFrame.zeroText ) then
				textString:SetText(statusFrame.zeroText)
			elseif ( textDisplay == "BOTH" and not statusFrame.showPercentage) then
				if( statusFrame.LeftText and statusFrame.RightText ) then
					if(not statusFrame.powerToken or statusFrame.powerToken == "MANA") then
						statusFrame.LeftText:SetText(math.ceil((value / valueMax) * 100) .. "%")
					end
					statusFrame.RightText:SetText(valueDisplay)
				else
					valueDisplay = "(" .. math.ceil((value / valueMax) * 100) .. "%) " .. valueDisplay .. " / " .. valueMaxDisplay
				end
				textString:SetText(valueDisplay)
			else
				valueDisplay = math.ceil((value / valueMax) * 100) .. "%"
				if ( statusFrame.prefix and (statusFrame.alwaysPrefix or not (statusFrame.cvar and GetCVar(statusFrame.cvar) == "1" and statusFrame.textLockable) ) ) then
					textString:SetText(statusFrame.prefix .. " " .. valueDisplay)
				else
					textString:SetText(valueDisplay)
				end
			end
		elseif ( value == 0 and statusFrame.zeroText ) then
			textString:SetText(statusFrame.zeroText)
			return
		else
			if ( statusFrame.prefix and (statusFrame.alwaysPrefix or not (statusFrame.cvar and GetCVar(statusFrame.cvar) == "1" and statusFrame.textLockable) ) ) then
				textString:SetText(statusFrame.prefix.." "..valueDisplay.." / "..valueMaxDisplay)
			else
				textString:SetText(valueDisplay.." / "..valueMaxDisplay)
			end
		end
	end
end)