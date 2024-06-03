local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ClassTalentUI" then
		ApplyCloseButton(ClassTalentFrameCloseButton)

		ClassTalentFrame.PortraitContainer.CircleMask:Hide()

		ClassTalentFramePortrait:SetSize(61, 61)
		ClassTalentFramePortrait:ClearAllPoints()
		ClassTalentFramePortrait:SetPoint("TOPLEFT", -6, 8)

		ClassTalentFrame.TitleContainer:ClearAllPoints()
		ClassTalentFrame.TitleContainer:SetPoint("TOPLEFT", ClassTalentFrame, "TOPLEFT", 58, 0)
		ClassTalentFrame.TitleContainer:SetPoint("TOPRIGHT", ClassTalentFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(ClassTalentFrame)
		ApplyNineSlicePortrait(ClassTalentFrame)

		for i = 1, _G.ClassTalentFrame.TabSystem:GetNumChildren() do
			local tab = select(i, _G.ClassTalentFrame.TabSystem:GetChildren())

			ApplyBottomTab(tab)
		end

		hooksecurefunc(ClassTalentFrame.TabSystem, 'Layout', function(self)
			self.tabs[1]:SetWidth(45 + self.tabs[1]:GetFontString():GetStringWidth())
			self.tabs[2]:ClearAllPoints()
			self.tabs[2]:SetPoint("LEFT", self.tabs[1], "RIGHT", -15, 0)
        end)

        hooksecurefunc(ClassTalentFrame.SpecTab, 'UpdateSpecFrame', function(frame)
			for specContentFrame in frame.SpecContentFramePool:EnumerateActive() do
				local role = GetSpecializationRole(specContentFrame.specIndex, false, false)
				
				specContentFrame.RoleIcon:SetTexCoord(GetTexCoordsForRole(role))
				specContentFrame.RoleIcon:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
			end
        end)

        ApplyDialogBorder(ClassTalentLoadoutCreateDialog.Border)
        ApplyDialogBorder(ClassTalentLoadoutImportDialog.Border)

        ApplySearchBox(ClassTalentFrame.TalentsTab.SearchBox)

        ClassTalentFrame:HookScript("OnShow", function(self)
			self:ClearAllPoints()
			self:SetPoint("CENTER", 0, 24)
		end)
	end
end)