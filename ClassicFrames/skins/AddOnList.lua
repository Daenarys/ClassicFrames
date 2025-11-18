if not _G.AddonList then return end

AddonList:SetSize(500, 478)

ApplyCloseButton(AddonListCloseButton)

AddonList.TitleContainer:ClearAllPoints()
AddonList.TitleContainer:SetPoint("TOPLEFT", AddonList, "TOPLEFT", 58, 1)
AddonList.TitleContainer:SetPoint("TOPRIGHT", AddonList, "TOPRIGHT", -58, 1)

ApplyTitleBgNoPortrait(AddonList)
ApplyNineSliceNoPortrait(AddonList)

AddonList.Bg:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-Background-Rock", true, true)

AddonList.ScrollBar:SetSize(25, 560)
AddonList.ScrollBar:ClearAllPoints()
AddonList.ScrollBar:SetPoint("TOPLEFT", AddonList.ScrollBox, "TOPRIGHT", 5, 3)
AddonList.ScrollBar:SetPoint("BOTTOMLEFT", AddonList.ScrollBox, "BOTTOMRIGHT", -5, -1)

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

AddonList.Dropdown:SetWidth(130)
AddonList.Dropdown:SetPoint("TOPLEFT", 18, -31)
AddonList.Dropdown.Text:SetJustifyH("RIGHT")
AddonList.Dropdown.Text:SetPoint("TOPLEFT", 9, -7)

hooksecurefunc('AddonList_Update', function()
	for _, child in next, { AddonList.ScrollBox.ScrollTarget:GetChildren() } do
		if not child.IsSkinned then
			if child.Enabled then
				child.Enabled:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
				child.Enabled:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
				child.Enabled:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
				child.Enabled:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
				child.Enabled:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
			end
			child.IsSkinned = true
		end
	end
end)

hooksecurefunc(AddonList, "UpdatePerformance", function(self)
	self.Performance:Hide()
end)