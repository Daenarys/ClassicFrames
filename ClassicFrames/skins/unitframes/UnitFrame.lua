CfPowerBarColor = {}
CfPowerBarColor["MANA"] = { r = 0.00, g = 0.00, b = 1.00 }
CfPowerBarColor["RAGE"] = { r = 1.00, g = 0.00, b = 0.00 }
CfPowerBarColor["FOCUS"] = { r = 1.00, g = 0.50, b = 0.25 }
CfPowerBarColor["ENERGY"] = { r = 1.00, g = 1.00, b = 0.00 }
CfPowerBarColor["HAPPINESS"] = { r = 0.00, g = 1.00, b = 1.00 }
-- vehicle colors
CfPowerBarColor["AMMOSLOT"] = { r = 0.80, g = 0.60, b = 0.00 }
CfPowerBarColor["FUEL"] = { r = 0.0, g = 0.55, b = 0.5 }

-- these are mostly needed for a fallback case (in case the code tries to index a power token that is missing from the table,
-- it will try to index by power type instead)
CfPowerBarColor[0] = CfPowerBarColor["MANA"]
CfPowerBarColor[1] = CfPowerBarColor["RAGE"]
CfPowerBarColor[2] = CfPowerBarColor["FOCUS"]
CfPowerBarColor[3] = CfPowerBarColor["ENERGY"]
CfPowerBarColor[4] = CfPowerBarColor["HAPPINESS"]
CfPowerBarColor[5] = CfPowerBarColor["RUNES"]
CfPowerBarColor[6] = CfPowerBarColor["RUNIC_POWER"]

hooksecurefunc("UnitFrameManaBar_UpdateType", function(manaBar)
	if ( not manaBar ) then
		return
	end

	local powerType, powerToken, altR, altG, altB = UnitPowerType(manaBar.unit)
	local info = CfPowerBarColor[powerToken]

	manaBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")

	if info then
		manaBar:SetStatusBarColor(info.r, info.g, info.b)
	else
		if not altR then
			info = CfPowerBarColor[powerType] or CfPowerBarColor["MANA"]
		else
			manaBar:SetStatusBarColor(altR, altG, altB)
		end
	end
end)