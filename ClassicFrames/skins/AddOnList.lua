if not _G.AddonList then return end

AddonList:SetSize(500, 478)

ApplyCloseButton(AddonListCloseButton)

AddonList.TitleContainer:ClearAllPoints()
AddonList.TitleContainer:SetPoint("TOPLEFT", AddonList, "TOPLEFT", 58, 0)
AddonList.TitleContainer:SetPoint("TOPRIGHT", AddonList, "TOPRIGHT", -58, 0)

ApplyTitleBg(AddonList, true)
ApplyNineSliceNoPortrait(AddonList)

AddonList.ScrollBar:SetSize(25, 560)
AddonList.ScrollBar:ClearAllPoints()
AddonList.ScrollBar:SetPoint("TOPLEFT", AddonList.ScrollBox, "TOPRIGHT", 3, 4)
AddonList.ScrollBar:SetPoint("BOTTOMLEFT", AddonList.ScrollBox, "BOTTOMRIGHT", -3, -1)

ApplyScrollBarArrow(AddonList.ScrollBar)
ApplyScrollBarTrack(AddonList.ScrollBar.Track)
ApplyScrollBarThumb(AddonList.ScrollBar.Track.Thumb)

ApplyCheckBox(AddonList.ForceLoad)
AddonList.ForceLoad:SetSize(32, 32)
AddonList.ForceLoad:SetPoint("TOP", 75, -30)

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
				ApplyCheckBox(child.Enabled)
			end
			child.IsSkinned = true
		end
	end
end)

hooksecurefunc(AddonList, "UpdatePerformance", function(self)
	self.Performance:Hide()
end)