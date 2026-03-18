if not _G.DressUpFrame then return end

ApplyDropDown(DressUpFrameCustomSetDropdown)

hooksecurefunc(DressUpFrame, "ConfigureSize", function(self, isMinimized)
	if isMinimized then
		self.CustomSetDropdown:SetWidth(135)
		self.CustomSetDropdown:SetPoint("TOP", -42, -29)
	else
		self.CustomSetDropdown:SetWidth(178)
		self.CustomSetDropdown:SetPoint("TOP", -22, -29)
	end
end)
