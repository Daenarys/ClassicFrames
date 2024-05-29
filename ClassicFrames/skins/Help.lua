if not _G.HelpFrame then return end

ApplyCloseButton(HelpFrame.CloseButton)

HelpFrame.TitleContainer:ClearAllPoints()
HelpFrame.TitleContainer:SetPoint("TOPLEFT", HelpFrame, "TOPLEFT", 58, 0)
HelpFrame.TitleContainer:SetPoint("TOPRIGHT", HelpFrame, "TOPRIGHT", -58, 0)

ApplyTitleBgNoPortrait(HelpFrame)
ApplyNineSliceNoPortrait(HelpFrame)

hooksecurefunc(HelpFrame, "SetInitialLoading", function(self, initialLoading)
	self.SpinnerOverlay:Hide()
	self.CfSpinnerOverlay:SetShown(initialLoading)
end)

HelpFrame:HookScript("OnShow", function(self)
	self:ClearAllPoints()
	self:SetPoint("CENTER", 0, 24)
end)