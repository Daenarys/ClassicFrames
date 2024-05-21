local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_SubscriptionInterstitialUI" then
		ApplyCloseButton(SubscriptionInterstitialFrame.CloseButton)
		
		SubscriptionInterstitialFrame.TitleContainer:ClearAllPoints()
		SubscriptionInterstitialFrame.TitleContainer:SetPoint("TOPLEFT", SubscriptionInterstitialFrame, "TOPLEFT", 58, 0)
		SubscriptionInterstitialFrame.TitleContainer:SetPoint("TOPRIGHT", SubscriptionInterstitialFrame, "TOPRIGHT", -58, 0)

		SubscriptionInterstitialFrameBg:ClearAllPoints()
		SubscriptionInterstitialFrameBg:SetPoint("TOPLEFT", SubscriptionInterstitialFrame, "TOPLEFT", 2, -21)
		SubscriptionInterstitialFrameBg:SetPoint("BOTTOMRIGHT", SubscriptionInterstitialFrame, "BOTTOMRIGHT", -2, 2)

		ApplyTitleBg(SubscriptionInterstitialFrame)
		ApplyNineSliceNoPortrait(SubscriptionInterstitialFrame)
	end
end)