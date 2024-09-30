local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_SubscriptionInterstitialUI" then
		ApplyCloseButton(SubscriptionInterstitialFrame.CloseButton)
		
		SubscriptionInterstitialFrame.TitleContainer:ClearAllPoints()
		SubscriptionInterstitialFrame.TitleContainer:SetPoint("TOPLEFT", SubscriptionInterstitialFrame, "TOPLEFT", 58, 0)
		SubscriptionInterstitialFrame.TitleContainer:SetPoint("TOPRIGHT", SubscriptionInterstitialFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBgNoPortrait(SubscriptionInterstitialFrame)
		ApplyNineSliceNoPortrait(SubscriptionInterstitialFrame)

		SubscriptionInterstitialFrame:HookScript("OnShow", function(self)
			self:ClearAllPoints()
			self:SetPoint("CENTER", 0, 100)
		end)
	end
end)