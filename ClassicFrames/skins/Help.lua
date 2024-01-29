if not _G.HelpFrame then return end

ApplyCloseButton(HelpFrame.CloseButton)

HelpFrame.TitleContainer:ClearAllPoints()
HelpFrame.TitleContainer:SetPoint("TOPLEFT", HelpFrame, "TOPLEFT", 58, 0)
HelpFrame.TitleContainer:SetPoint("TOPRIGHT", HelpFrame, "TOPRIGHT", -58, 0)

HelpFrameBg:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-Background-Rock", true, true)
HelpFrameBg:ClearAllPoints()
HelpFrameBg:SetPoint("TOPLEFT", 0, -20)
HelpFrameBg:SetPoint("BOTTOMRIGHT", -2, 2)

ApplyTitleBg(HelpFrame)
ApplyNineSliceNoPortrait(HelpFrame)

_G.HelpFrame:HookScript("OnShow", function(self)
	self:ClearAllPoints()
	self:SetPoint("CENTER", 0, 24)
end)

HelpBrowser:ClearAllPoints()
HelpBrowser:SetPoint("TOPLEFT", 2, -22)
HelpBrowser:SetPoint("BOTTOMRIGHT", -5, 4)