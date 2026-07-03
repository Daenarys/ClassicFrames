local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Professions" then
		ApplyCloseButton(ProfessionsFrame.CloseButton)

		ProfessionsFrame.MaximizeMinimize:SetSize(32, 32)
		ProfessionsFrame.MaximizeMinimize:ClearAllPoints()
		ProfessionsFrame.MaximizeMinimize:SetPoint("RIGHT", ProfessionsFrame.CloseButton, "LEFT", 8.5, 0)
		ProfessionsFrame.MaximizeMinimize:SetFrameLevel(2)

		ApplyMaxMinButton(ProfessionsFrame.MaximizeMinimize)

		ProfessionsFramePortrait:SetSize(61, 61)
		ProfessionsFramePortrait:ClearAllPoints()
		ProfessionsFramePortrait:SetPoint("TOPLEFT", -6, 8)

		ProfessionsFrame.TitleContainer:ClearAllPoints()
		ProfessionsFrame.TitleContainer:SetPoint("TOPLEFT", ProfessionsFrame, "TOPLEFT", 58, 0)
		ProfessionsFrame.TitleContainer:SetPoint("TOPRIGHT", ProfessionsFrame, "TOPRIGHT", -58, 0)

		ApplyTitleBg(ProfessionsFrame)
		ApplyNineSlicePortraitMinimizable(ProfessionsFrame)

		ProfessionsFrame.CraftingPage.TutorialButton.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

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

		ApplyScrollBarHybrid(ProfessionsFrame.CraftingPage.RecipeList.ScrollBar, true)
		ApplyScrollBarThumb(ProfessionsFrame.CraftingPage.RecipeList.ScrollBar.Track.Thumb)

		ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.ScrollBar:SetSize(25, 560)
		ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.ScrollBar:ClearAllPoints()
		ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.ScrollBar:SetPoint("TOPLEFT", ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.ScrollBox, "TOPRIGHT", -6, 3)
		ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.ScrollBar:SetPoint("BOTTOMLEFT", ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.ScrollBox, "BOTTOMRIGHT", 3, -4)

		if (ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.ScrollBar.BG == nil) then
			ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.ScrollBar.BG = ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.ScrollBar:CreateTexture(nil, "BACKGROUND")
			ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.ScrollBar)
		ApplyScrollBarTrack(ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.ScrollBar.Track)
		ApplyScrollBarThumb(ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.ScrollBar.Track.Thumb)

		ProfessionsFrame.OrdersPage.BrowseFrame.OrderList.ScrollBar:SetSize(25, 560)
		ProfessionsFrame.OrdersPage.BrowseFrame.OrderList.ScrollBar:ClearAllPoints()
		ProfessionsFrame.OrdersPage.BrowseFrame.OrderList.ScrollBar:SetPoint("TOPLEFT", ProfessionsFrame.OrdersPage.BrowseFrame.OrderList.ScrollBox, "TOPRIGHT", -8, 3)
		ProfessionsFrame.OrdersPage.BrowseFrame.OrderList.ScrollBar:SetPoint("BOTTOMLEFT", ProfessionsFrame.OrdersPage.BrowseFrame.OrderList.ScrollBox, "BOTTOMRIGHT", 5, -1)

		if (ProfessionsFrame.OrdersPage.BrowseFrame.OrderList.ScrollBar.BG == nil) then
			ProfessionsFrame.OrdersPage.BrowseFrame.OrderList.ScrollBar.BG = ProfessionsFrame.OrdersPage.BrowseFrame.OrderList.ScrollBar:CreateTexture(nil, "BACKGROUND")
			ProfessionsFrame.OrdersPage.BrowseFrame.OrderList.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			ProfessionsFrame.OrdersPage.BrowseFrame.OrderList.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(ProfessionsFrame.OrdersPage.BrowseFrame.OrderList.ScrollBar)
		ApplyScrollBarTrack(ProfessionsFrame.OrdersPage.BrowseFrame.OrderList.ScrollBar.Track)
		ApplyScrollBarThumb(ProfessionsFrame.OrdersPage.BrowseFrame.OrderList.ScrollBar.Track.Thumb)

		ProfessionsFrame.OrdersPage:HookScript("OnShow", function()
			ApplyNineSlicePortrait(ProfessionsFrame)
		end)

		ProfessionsFrame.OrdersPage:HookScript("OnHide", function()
			ApplyNineSlicePortraitMinimizable(ProfessionsFrame)
		end)

		ApplyFilterDropDown(ProfessionsFrame.CraftingPage.RecipeList.FilterDropdown)
		ApplyFilterDropDown(ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.FilterDropdown)

		ApplyCloseButton(ProfessionsFrame.CraftingPage.CraftingOutputLog.ClosePanelButton)
		ApplyTitleBg(ProfessionsFrame.CraftingPage.CraftingOutputLog, true)
		ApplyNineSliceNoPortrait(ProfessionsFrame.CraftingPage.CraftingOutputLog)
		ApplyNineSliceOverlapFix(ProfessionsFrame.CraftingPage.CraftingOutputLog, true)

		ApplyCloseButton(InspectRecipeFrame.CloseButton)
		ApplyTitleBg(InspectRecipeFrame)
		ApplyNineSlicePortrait(InspectRecipeFrame)
	end
end)