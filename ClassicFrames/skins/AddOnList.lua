if not _G.AddonList then return end

AddonList:SetSize(500, 478)

ApplyCloseButton(AddonListCloseButton)

AddonList.TitleContainer:ClearAllPoints()
AddonList.TitleContainer:SetPoint("TOPLEFT", AddonList, "TOPLEFT", 58, 0)
AddonList.TitleContainer:SetPoint("TOPRIGHT", AddonList, "TOPRIGHT", -58, 0)

ApplyTitleBgNoPortrait(AddonList)
ApplyNineSliceNoPortrait(AddonList)

AddonList.ScrollBar:SetSize(25, 560)
AddonList.ScrollBar:ClearAllPoints()
AddonList.ScrollBar:SetPoint("TOPLEFT", AddonList.ScrollBox, "TOPRIGHT", 5, 3)
AddonList.ScrollBar:SetPoint("BOTTOMLEFT", AddonList.ScrollBox, "BOTTOMRIGHT", -5, -1)

if (AddonList.ScrollBar.BG == nil) then
	AddonList.ScrollBar.BG = AddonList.ScrollBar:CreateTexture(nil, "BACKGROUND")
	AddonList.ScrollBar.BG:SetColorTexture(0, 0, 0, 1)
	AddonList.ScrollBar.BG:SetAllPoints()
end

ApplyScrollBarArrow(AddonList.ScrollBar)
ApplyScrollBarTrack(AddonList.ScrollBar.Track)
ApplyScrollBarThumb(AddonList.ScrollBar.Track.Thumb)

AddonList.ForceLoad:SetSize(32, 32)
AddonList.ForceLoad:SetPoint("TOP", 75, -30)
AddonList.ForceLoad:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
AddonList.ForceLoad:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
AddonList.ForceLoad:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
AddonList.ForceLoad:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
AddonList.ForceLoad:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")

AddonList.SearchBox:Hide()
ApplyDropDown(AddonList.Dropdown)

hooksecurefunc(AddonList, "UpdatePerformance", function(self)
	self.Performance:Hide()
end)

hooksecurefunc('AddonList_Update', function()
	for _, child in next, { AddonList.ScrollBox.ScrollTarget:GetChildren() } do
		if not child.IsSkinned then
			child.Enabled:SetSize(24, 24)
			child.Enabled:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
			child.Enabled:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
			child.Enabled:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
			child.Enabled:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
			child.Enabled:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
			child.IsSkinned = true
		end
	end
end)

AddonList:HookScript("OnShow", function(self)
	self:ClearAllPoints()
	self:SetPoint("CENTER", 0, 24)
end)