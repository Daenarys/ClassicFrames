if not _G.AddonList then return end

ApplyCloseButton(AddonListCloseButton)

AddonList.TitleContainer:ClearAllPoints()
AddonList.TitleContainer:SetPoint("TOPLEFT", AddonList, "TOPLEFT", 58, 0)
AddonList.TitleContainer:SetPoint("TOPRIGHT", AddonList, "TOPRIGHT", -58, 0)

ApplyTitleBgNoPortrait(AddonList)
ApplyNineSliceNoPortrait(AddonList)

AddonList.ScrollBar:SetSize(25, 560)
AddonList.ScrollBar:ClearAllPoints()
AddonList.ScrollBar:SetPoint("TOPLEFT", AddonList.ScrollBox, "TOPRIGHT", -2, 2)
AddonList.ScrollBar:SetPoint("BOTTOMLEFT", AddonList.ScrollBox, "BOTTOMRIGHT", -2, -1)

if (AddonList.ScrollBar.BG == nil) then
	AddonList.ScrollBar.BG = AddonList.ScrollBar:CreateTexture(nil, "BACKGROUND")
	AddonList.ScrollBar.BG:SetColorTexture(0, 0, 0, 1)
	AddonList.ScrollBar.BG:SetAllPoints()
end

ApplyScrollBarArrow(AddonList.ScrollBar)
ApplyScrollBarTrack(AddonList.ScrollBar.Track)
ApplyScrollBarThumb(AddonList.ScrollBar.Track.Thumb)

ApplyDropDown(AddonList.Dropdown)

AddonList:HookScript("OnShow", function(self)
	self:ClearAllPoints()
	self:SetPoint("CENTER", 0, 24)
end)