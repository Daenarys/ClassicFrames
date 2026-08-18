if not _G.AddonList then return end

AddonList:SetSize(500, 478)

ApplyCheckBox(AddonList.ForceLoad)
AddonList.ForceLoad:SetSize(32, 32)
AddonList.ForceLoad:SetPoint("TOP", 75, -30)

AddonList.SearchBox:Hide()

AddonList.ScrollBox:ClearAllPoints()
AddonList.ScrollBox:SetPoint("TOPLEFT", 7, -64)

ApplyDropDown(AddonList.Dropdown)
AddonList.Dropdown:SetWidth(130)
AddonList.Dropdown:SetPoint("TOPLEFT", 18, -31)
AddonList.Dropdown.Text:SetJustifyH("RIGHT")
AddonList.Dropdown.Text:SetPoint("TOPLEFT", 9, -7)

hooksecurefunc("AddonList_Update", function()
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