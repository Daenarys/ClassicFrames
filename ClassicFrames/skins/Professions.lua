local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Professions" then
		ApplyCloseButton(ProfessionsFrame.CloseButton)

		ProfessionsFrame.MaximizeMinimize:SetSize(32, 32)
		ProfessionsFrame.MaximizeMinimize:ClearAllPoints()
		ProfessionsFrame.MaximizeMinimize:SetPoint("RIGHT", ProfessionsFrame.CloseButton, "LEFT", 10, 0)

		ProfessionsFrame.MaximizeMinimize.MaximizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Up")
		ProfessionsFrame.MaximizeMinimize.MaximizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Down")
		ProfessionsFrame.MaximizeMinimize.MaximizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Disabled")
		ProfessionsFrame.MaximizeMinimize.MaximizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

		ProfessionsFrame.MaximizeMinimize.MinimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Up")
		ProfessionsFrame.MaximizeMinimize.MinimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Down")
		ProfessionsFrame.MaximizeMinimize.MinimizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Disabled")
		ProfessionsFrame.MaximizeMinimize.MinimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

		if (ProfessionsFrame.ButtonFrameEdge == nil) then
			ProfessionsFrame.ButtonFrameEdge = ProfessionsFrame.MaximizeMinimize:CreateTexture(nil, "OVERLAY")
			ProfessionsFrame.ButtonFrameEdge:SetAtlas("UI-OuterBorderButtonPatch", true)
			ProfessionsFrame.ButtonFrameEdge:ClearAllPoints()
			ProfessionsFrame.ButtonFrameEdge:SetPoint("CENTER", ProfessionsFrame.MaximizeMinimize, "LEFT", 6, 0)
		end

		ProfessionsFramePortrait:SetSize(61, 61)
		ProfessionsFramePortrait:ClearAllPoints()
		ProfessionsFramePortrait:SetPoint("TOPLEFT", -6, 8)

		ProfessionsFrame.TitleContainer:ClearAllPoints()
		ProfessionsFrame.TitleContainer:SetPoint("TOPLEFT", ProfessionsFrame, "TOPLEFT", 58, 0)
		ProfessionsFrame.TitleContainer:SetPoint("TOPRIGHT", ProfessionsFrame, "TOPRIGHT", -58, 0)

		ProfessionsFrame.CraftingPage.TutorialButton.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

		ApplyTitleBg(ProfessionsFrame)
		ApplyNineSlicePortrait(ProfessionsFrame)

		for i = 1, _G.ProfessionsFrame.TabSystem:GetNumChildren() do
			local tab = select(i, ProfessionsFrame.TabSystem:GetChildren())

			ApplyBottomTab(tab)

			tab:HookScript("OnShow", function(self)
				self:SetWidth(40 + self:GetFontString():GetStringWidth())
			end)
		end

		hooksecurefunc(ProfessionsFrame, "UpdateTabs", function(self)
			self.TabSystem.tabs[2]:ClearAllPoints()
			self.TabSystem.tabs[2]:SetPoint("LEFT", self.TabSystem.tabs[1], "RIGHT", -15, 0)
			if self.TabSystem.tabs[2]:IsShown() then
				self.TabSystem.tabs[3]:ClearAllPoints()
				self.TabSystem.tabs[3]:SetPoint("LEFT", self.TabSystem.tabs[2], "RIGHT", -15, 0)
			else
				self.TabSystem.tabs[3]:ClearAllPoints()
				self.TabSystem.tabs[3]:SetPoint("LEFT", self.TabSystem.tabs[1], "RIGHT", -15, 0)
			end
		end)

		ApplyScrollBarArrow(ProfessionsFrame.CraftingPage.RecipeList.ScrollBar)
		ApplyScrollBarTrack(ProfessionsFrame.CraftingPage.RecipeList.ScrollBar.Track)
		ApplyScrollBarThumb(ProfessionsFrame.CraftingPage.RecipeList.ScrollBar.Track.Thumb)

		ApplyScrollBarArrow(ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.ScrollBar)
		ApplyScrollBarTrack(ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.ScrollBar.Track)
		ApplyScrollBarThumb(ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.ScrollBar.Track.Thumb)

		ApplyScrollBarArrow(ProfessionsFrame.OrdersPage.BrowseFrame.OrderList.ScrollBar)
		ApplyScrollBarTrack(ProfessionsFrame.OrdersPage.BrowseFrame.OrderList.ScrollBar.Track)
		ApplyScrollBarThumb(ProfessionsFrame.OrdersPage.BrowseFrame.OrderList.ScrollBar.Track.Thumb)

		ApplyCloseButton(ProfessionsFrame.CraftingPage.CraftingOutputLog.ClosePanelButton)
		ApplyTitleBgNoPortrait(ProfessionsFrame.CraftingPage.CraftingOutputLog)
		ApplyNineSliceNoPortrait(ProfessionsFrame.CraftingPage.CraftingOutputLog)

		ApplyFilterDropDown(ProfessionsFrame.CraftingPage.RecipeList.FilterDropdown)
		ApplyFilterDropDown(ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.FilterDropdown)

		ApplyCloseButton(InspectRecipeFrame.CloseButton)
		ApplyTitleBg(InspectRecipeFrame)
		ApplyNineSlicePortrait(InspectRecipeFrame)
	end
end)