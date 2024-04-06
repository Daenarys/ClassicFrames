if not _G.AddonList then return end

ApplyCloseButton(AddonListCloseButton)

AddonList.Bg:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-Background-Rock", true, true)

AddonList.TitleContainer:ClearAllPoints()
AddonList.TitleContainer:SetPoint("TOPLEFT", AddonList, "TOPLEFT", 58, 0)
AddonList.TitleContainer:SetPoint("TOPRIGHT", AddonList, "TOPRIGHT", -58, 0)

AddonListBg:ClearAllPoints()
AddonListBg:SetPoint("TOPLEFT", AddonList, "TOPLEFT", 2, -21)
AddonListBg:SetPoint("BOTTOMRIGHT", AddonList, "BOTTOMRIGHT", -2, 2)

AddonListInset:ClearAllPoints()
AddonListInset:SetPoint("TOPLEFT", AddonList, "TOPLEFT", 4, -60)
AddonListInset:SetPoint("BOTTOMRIGHT", AddonList, "BOTTOMRIGHT", -6, 26)

ApplyTitleBg(AddonList)
ApplyNineSliceNoPortrait(AddonList)

AddonList.ScrollBox:ClearAllPoints()
AddonList.ScrollBox:SetPoint("TOPLEFT", AddonList, "TOPLEFT", 8, -68)

AddonList.ScrollBar:SetSize(25, 560)
AddonList.ScrollBar:ClearAllPoints()
AddonList.ScrollBar:SetPoint("TOPLEFT", AddonList.ScrollBox, "TOPRIGHT", -5, 5)
AddonList.ScrollBar:SetPoint("BOTTOMLEFT", AddonList.ScrollBox, "BOTTOMRIGHT", -2, 2)

if (AddonList.ScrollBar.BG == nil) then
	AddonList.ScrollBar.BG = AddonList.ScrollBar:CreateTexture(nil, "BACKGROUND");
	AddonList.ScrollBar.BG:SetColorTexture(0, 0, 0, 1)
	AddonList.ScrollBar.BG:SetAllPoints()
end

ApplyScrollBarArrow(AddonList.ScrollBar)
ApplyScrollBarTrack(AddonList.ScrollBar.Track)
ApplyScrollBarThumb(AddonList.ScrollBar.Track.Thumb)

_G.AddonList:HookScript("OnShow", function(self)
	self:ClearAllPoints()
	self:SetPoint("CENTER", 0, 24)
end)