hooksecurefunc("UnitFrameManaBar_UpdateType", function(manaBar)
	if (not manaBar) then
		return
	end

	local powerType, powerToken, altR, altG, altB = UnitPowerType(manaBar.unit)
	local info = PowerBarColor[powerToken]

	manaBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")

	if (info) then
		local playerDeadOrGhost = (manaBar.unit == "player" and (UnitIsDead("player") or UnitIsGhost("player")))
		manaBar:GetStatusBarTexture():SetDesaturated(playerDeadOrGhost)
		manaBar:GetStatusBarTexture():SetAlpha(playerDeadOrGhost and 0.5 or 1)
		if (info.atlas) then
			manaBar:SetStatusBarTexture(info.atlas)
			manaBar:SetStatusBarColor(1, 1, 1)
		else
			if (playerDeadOrGhost) then
				manaBar:SetStatusBarColor(0.6, 0.6, 0.6, 0.5)
			else
				manaBar:SetStatusBarColor(info.r, info.g, info.b)
			end
		end
		if (manaBar.Spark) then
			manaBar.Spark:SetAlpha(0)
		end
	else
		if (not altR) then
			info = PowerBarColor[powerType] or PowerBarColor["MANA"]
		else
			manaBar:SetStatusBarColor(altR, altG, altB)
		end
	end
end)