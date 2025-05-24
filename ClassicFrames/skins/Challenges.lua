local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ChallengesUI" then
		ChallengesFrame:HookScript("OnShow", function()
			SetPortraitToTexture(PVEFramePortrait, "Interface\\Icons\\achievement_bg_wineos_underxminutes")
		end)
	end
end)