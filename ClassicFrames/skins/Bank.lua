if not _G.BankFrame then return end

ApplyCloseButton(BankFrameCloseButton)

BankFramePortrait:SetSize(61, 61)
BankFramePortrait:ClearAllPoints()
BankFramePortrait:SetPoint("TOPLEFT", -6, 8)

BankFrame.TitleContainer:ClearAllPoints()
BankFrame.TitleContainer:SetPoint("TOPLEFT", BankFrame, "TOPLEFT", 58, 0)
BankFrame.TitleContainer:SetPoint("TOPRIGHT", BankFrame, "TOPRIGHT", -58, 0)

ApplyTitleBg(BankFrame)
ApplyNineSlicePortrait(BankFrame)

hooksecurefunc(BankFrame, "RefreshPageTabs", function(self)
	local prevTab
	for tab in self.bankPageTabPool:EnumerateActive() do
		ApplySideTab(tab)

		tab:ClearAllPoints()
		if prevTab then
			tab:SetPoint("TOPLEFT", prevTab, "BOTTOMLEFT", 0, -20)
		else
			tab:SetPoint("TOPLEFT", self, "TOPRIGHT", 0, -36)
		end
		prevTab = tab
	end
end)