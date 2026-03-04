if not _G.EditModeManagerFrame then return end

ApplyDropDown(EditModeManagerFrame.LayoutDropdown)
EditModeManagerFrame.LayoutDropdown:SetWidth(215)
EditModeManagerFrame.LayoutDropdown:SetPoint("TOPLEFT", 23, -50)
EditModeManagerFrame.LayoutLabel:SetPoint("BOTTOMLEFT", EditModeManagerFrame.LayoutDropdown, "TOPLEFT", 1, -2)

EditModeSystemSettingsDialog:HookScript("OnShow", function(self)
	for _, frame in next, { self.Settings:GetChildren() } do
		if frame.Dropdown then
			ApplyDropDown(frame.Dropdown)
		end
	end
end)