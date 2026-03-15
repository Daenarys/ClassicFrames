if not _G.AddonList then return end

AddonList:SetSize(500, 478)

AddonList.ForceLoad:SetSize(32, 32)
AddonList.ForceLoad:SetPoint("TOP", 75, -30)
AddonList.ForceLoad:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
AddonList.ForceLoad:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
AddonList.ForceLoad:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
AddonList.ForceLoad:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
AddonList.ForceLoad:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")

AddonList.SearchBox:Hide()
AddonList.ScrollBox:ClearAllPoints()
AddonList.ScrollBox:SetPoint("TOPLEFT", 7, -64)

ApplyDropDown(AddonList.Dropdown)
AddonList.Dropdown:SetWidth(130)
AddonList.Dropdown:SetPoint("TOPLEFT", 18, -31)
AddonList.Dropdown.Text:SetJustifyH("RIGHT")
AddonList.Dropdown.Text:SetPoint("TOPLEFT", 9, -7)

hooksecurefunc(AddonList, "UpdatePerformance", function(self)
	self.Performance:Hide()
end)