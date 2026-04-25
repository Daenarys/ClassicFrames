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

		ProfessionsFrame.CraftingPage.RecipeList.ScrollBar:SetSize(25, 560)
		ProfessionsFrame.CraftingPage.RecipeList.ScrollBar:ClearAllPoints()
		ProfessionsFrame.CraftingPage.RecipeList.ScrollBar:SetPoint("TOPLEFT", ProfessionsFrame.CraftingPage.RecipeList.ScrollBox, "TOPRIGHT", -8, -5)
		ProfessionsFrame.CraftingPage.RecipeList.ScrollBar:SetPoint("BOTTOMLEFT", ProfessionsFrame.CraftingPage.RecipeList.ScrollBox, "BOTTOMRIGHT", -5, -4)

		if (ProfessionsFrame.CraftingPage.RecipeList.ScrollBar.BG == nil) then
			ProfessionsFrame.CraftingPage.RecipeList.ScrollBar.BG = ProfessionsFrame.CraftingPage.RecipeList.ScrollBar:CreateTexture(nil, "BACKGROUND")
			ProfessionsFrame.CraftingPage.RecipeList.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
			ProfessionsFrame.CraftingPage.RecipeList.ScrollBar.BG:SetAllPoints()
		end

		ApplyScrollBarArrow(ProfessionsFrame.CraftingPage.RecipeList.ScrollBar)
		ApplyScrollBarTrack(ProfessionsFrame.CraftingPage.RecipeList.ScrollBar.Track)
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

		ApplyCloseButton(ProfessionsFrame.CraftingPage.CraftingOutputLog.ClosePanelButton)
		ProfessionsFrame.CraftingPage.CraftingOutputLog.ClosePanelButton:SetFrameLevel(4)
		ApplyTitleBg(ProfessionsFrame.CraftingPage.CraftingOutputLog, true)
		ApplyNineSliceNoPortrait(ProfessionsFrame.CraftingPage.CraftingOutputLog)

		local function CullCorner(texture, startU, endU, startV, endV, relU, relV, dirU, dirV)
			local width = endU - startU
			local height = endV - startV

			local finalStartU = startU + (width * (1 - relU) * dirU)
			local finalEndU = finalStartU + (width * relU)

			local finalStartV = startV + (height * (1 - relV) * dirV)
			local finalEndV = finalStartV + (height * relV)

			texture:SetTexCoord(finalStartU, finalEndU, finalStartV, finalEndV)
			texture:SetSize(132 * relU, 132 * relV)
		end

		CullCorner(ProfessionsFrame.CraftingPage.CraftingOutputLog.NineSlice.TopLeftCorner, 0.525390625, 0.783203125, 0.001953125, 0.259765625, .65, .6, 0, 0)
		CullCorner(ProfessionsFrame.CraftingPage.CraftingOutputLog.NineSlice.TopRightCorner, 0.001953125, 0.259765625, 0.263671875, 0.521484375, .25, .4, 1, 0)
		CullCorner(ProfessionsFrame.CraftingPage.CraftingOutputLog.NineSlice.BottomLeftCorner, 0.001953125, 0.259765625, 0.001953125, 0.259765625, .55, .4, 0, 1)
		CullCorner(ProfessionsFrame.CraftingPage.CraftingOutputLog.NineSlice.BottomRightCorner, 0.263671875, 0.521484375, 0.001953125, 0.259765625, .35, .4, 1, 1)

		ApplyFilterDropDown(ProfessionsFrame.CraftingPage.RecipeList.FilterDropdown)
		ApplyFilterDropDown(ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.FilterDropdown)

		ApplyCloseButton(InspectRecipeFrame.CloseButton)
		ApplyTitleBg(InspectRecipeFrame)
		ApplyNineSlicePortrait(InspectRecipeFrame)
	end
end)