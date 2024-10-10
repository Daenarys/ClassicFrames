local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_GuildBankUI" then
		ApplyCloseButtonOld(GuildBankFrame.CloseButton)

		GuildBankFrameTab2:ClearAllPoints()
		GuildBankFrameTab2:SetPoint("LEFT", GuildBankFrameTab1, "RIGHT", -16, 0)
		GuildBankFrameTab3:ClearAllPoints()
		GuildBankFrameTab3:SetPoint("LEFT", GuildBankFrameTab2, "RIGHT", -16, 0)
		GuildBankFrameTab4:ClearAllPoints()
		GuildBankFrameTab4:SetPoint("LEFT", GuildBankFrameTab3, "RIGHT", -16, 0)

		for i = 1, 4 do
			ApplyBottomTab(_G['GuildBankFrameTab'..i])

			_G["GuildBankFrameTab"..i]:HookScript("OnShow", function()
				GuildBankFrameTab1:SetWidth(40 + GuildBankFrameTab1:GetFontString():GetStringWidth())
				GuildBankFrameTab2:SetWidth(54 + GuildBankFrameTab2:GetFontString():GetStringWidth())
				GuildBankFrameTab3:SetWidth(40 + GuildBankFrameTab3:GetFontString():GetStringWidth())
				GuildBankFrameTab4:SetWidth(54 + GuildBankFrameTab4:GetFontString():GetStringWidth())
			end)
		end

		GuildBankFrame.Log.ScrollBar:SetSize(25, 560)
		GuildBankFrame.Log.ScrollBar:ClearAllPoints()
		GuildBankFrame.Log.ScrollBar:SetPoint("TOPLEFT", GuildBankMessageFrame, "TOPRIGHT", -3, 5)
		GuildBankFrame.Log.ScrollBar:SetPoint("BOTTOMLEFT", GuildBankMessageFrame, "BOTTOMRIGHT", 0, -3)

		ApplyScrollBarArrow(GuildBankFrame.Log.ScrollBar)
		ApplyScrollBarTrack(GuildBankFrame.Log.ScrollBar.Track)
		ApplyScrollBarThumb(GuildBankFrame.Log.ScrollBar.Track.Thumb)

		GuildBankInfoScrollFrame.ScrollBar:SetSize(25, 560)
		GuildBankInfoScrollFrame.ScrollBar:ClearAllPoints()
		GuildBankInfoScrollFrame.ScrollBar:SetPoint("TOPLEFT", GuildBankInfoScrollFrame, "TOPRIGHT", -5, 3)
		GuildBankInfoScrollFrame.ScrollBar:SetPoint("BOTTOMLEFT", GuildBankInfoScrollFrame, "BOTTOMRIGHT", -2, -3)

		ApplyScrollBarArrow(GuildBankInfoScrollFrame.ScrollBar)
		ApplyScrollBarTrack(GuildBankInfoScrollFrame.ScrollBar.Track)
		ApplyScrollBarThumb(GuildBankInfoScrollFrame.ScrollBar.Track.Thumb)

		ApplySearchBox(GuildItemSearchBox)
	end
end)