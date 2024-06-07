local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_Professions" then
		ApplyCloseButton(ProfessionsFrame.CloseButton)

		ProfessionsFrame.MaximizeMinimize:SetSize(32, 32)
		ProfessionsFrame.MaximizeMinimize:ClearAllPoints()
		ProfessionsFrame.MaximizeMinimize:SetPoint("RIGHT", ProfessionsFrame.CloseButton, "LEFT", 8.5, 0)
		ProfessionsFrame.MaximizeMinimize:SetFrameLevel(2)

		ProfessionsFrame.MaximizeMinimize.MaximizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Up")
		ProfessionsFrame.MaximizeMinimize.MaximizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Down")
		ProfessionsFrame.MaximizeMinimize.MaximizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-BiggerButton-Disabled")
		ProfessionsFrame.MaximizeMinimize.MaximizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

		ProfessionsFrame.MaximizeMinimize.MinimizeButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Up")
		ProfessionsFrame.MaximizeMinimize.MinimizeButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Down")
		ProfessionsFrame.MaximizeMinimize.MinimizeButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-SmallerButton-Disabled")
		ProfessionsFrame.MaximizeMinimize.MinimizeButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

		ProfessionsFrame.PortraitContainer.CircleMask:Hide()

		ProfessionsFramePortrait:SetSize(61, 61)
		ProfessionsFramePortrait:ClearAllPoints()
		ProfessionsFramePortrait:SetPoint("TOPLEFT", -6, 8)

		ProfessionsFrame.TitleContainer:ClearAllPoints()
		ProfessionsFrame.TitleContainer:SetPoint("TOPLEFT", ProfessionsFrame, "TOPLEFT", 58, 0)
		ProfessionsFrame.TitleContainer:SetPoint("TOPRIGHT", ProfessionsFrame, "TOPRIGHT", -58, 0)

		ProfessionsFrame.CraftingPage.TutorialButton.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

		ApplyTitleBg(ProfessionsFrame)

		ProfessionsFrame.NineSlice.TopEdge:SetSize(128, 132)
		ProfessionsFrame.NineSlice.TopEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalHorizontal", true)
		ProfessionsFrame.NineSlice.TopEdge:SetTexCoord(0, 1, 0.263671875, 0.521484375)
		ProfessionsFrame.NineSlice.TopEdge:ClearAllPoints()
		ProfessionsFrame.NineSlice.TopEdge:SetPoint("TOPLEFT", ProfessionsFrame.NineSlice.TopLeftCorner, "TOPRIGHT")
		ProfessionsFrame.NineSlice.TopEdge:SetPoint("TOPRIGHT", ProfessionsFrame.NineSlice.TopRightCorner, "TOPLEFT")

		ProfessionsFrame.NineSlice.TopLeftCorner:SetSize(132, 132)
		ProfessionsFrame.NineSlice.TopLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
		ProfessionsFrame.NineSlice.TopLeftCorner:SetTexCoord(0.263671875, 0.521484375, 0.263671875, 0.521484375)
		ProfessionsFrame.NineSlice.TopLeftCorner:ClearAllPoints()
		ProfessionsFrame.NineSlice.TopLeftCorner:SetPoint("TOPLEFT", -13, 16)

		ProfessionsFrame.NineSlice.BottomEdge:SetSize(128, 132)
		ProfessionsFrame.NineSlice.BottomEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalHorizontal", true)
		ProfessionsFrame.NineSlice.BottomEdge:SetTexCoord(0, 1, 0.001953125, 0.259765625)
		ProfessionsFrame.NineSlice.BottomEdge:ClearAllPoints()
		ProfessionsFrame.NineSlice.BottomEdge:SetPoint("BOTTOMLEFT", ProfessionsFrame.NineSlice.BottomLeftCorner, "BOTTOMRIGHT")
		ProfessionsFrame.NineSlice.BottomEdge:SetPoint("BOTTOMRIGHT", ProfessionsFrame.NineSlice.BottomRightCorner, "BOTTOMLEFT")

		ProfessionsFrame.NineSlice.BottomLeftCorner:SetSize(132, 132)
		ProfessionsFrame.NineSlice.BottomLeftCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
		ProfessionsFrame.NineSlice.BottomLeftCorner:SetTexCoord(0.001953125, 0.259765625, 0.001953125, 0.259765625)
		ProfessionsFrame.NineSlice.BottomLeftCorner:ClearAllPoints()
		ProfessionsFrame.NineSlice.BottomLeftCorner:SetPoint("BOTTOMLEFT", -13, -3)

		ProfessionsFrame.NineSlice.BottomRightCorner:SetSize(132, 132)
		ProfessionsFrame.NineSlice.BottomRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
		ProfessionsFrame.NineSlice.BottomRightCorner:SetTexCoord(0.263671875, 0.521484375, 0.001953125, 0.259765625)
		ProfessionsFrame.NineSlice.BottomRightCorner:ClearAllPoints()
		ProfessionsFrame.NineSlice.BottomRightCorner:SetPoint("BOTTOMRIGHT", 4, -3)

		ProfessionsFrame.NineSlice.LeftEdge:SetSize(132, 128)
		ProfessionsFrame.NineSlice.LeftEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalVertical", false, true)
		ProfessionsFrame.NineSlice.LeftEdge:SetTexCoord(0.001953125, 0.259765625, 0, 1)
		ProfessionsFrame.NineSlice.LeftEdge:ClearAllPoints()
		ProfessionsFrame.NineSlice.LeftEdge:SetPoint("TOPLEFT", ProfessionsFrame.NineSlice.TopLeftCorner, "BOTTOMLEFT")
		ProfessionsFrame.NineSlice.LeftEdge:SetPoint("BOTTOMLEFT", ProfessionsFrame.NineSlice.BottomLeftCorner, "TOPLEFT")

		ProfessionsFrame.NineSlice.RightEdge:SetSize(132, 128)
		ProfessionsFrame.NineSlice.RightEdge:SetTexture("Interface\\FrameGeneral\\UIFrameMetalVertical", false, true)
		ProfessionsFrame.NineSlice.RightEdge:SetTexCoord(0.263671875, 0.521484375, 0, 1)
		ProfessionsFrame.NineSlice.RightEdge:ClearAllPoints()
		ProfessionsFrame.NineSlice.RightEdge:SetPoint("TOPRIGHT", ProfessionsFrame.NineSlice.TopRightCorner, "BOTTOMRIGHT")
		ProfessionsFrame.NineSlice.RightEdge:SetPoint("BOTTOMRIGHT", ProfessionsFrame.NineSlice.BottomRightCorner, "TOPRIGHT")

		for i = 1, _G.ProfessionsFrame.TabSystem:GetNumChildren() do
			local tab = select(i, _G.ProfessionsFrame.TabSystem:GetChildren())

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

		ProfessionsFrame:HookScript("OnEvent", function(self)
			if self.TabSystem.tabs[3].isSelected then
				self.NineSlice.TopRightCorner:SetSize(132, 132)
				self.NineSlice.TopRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
				self.NineSlice.TopRightCorner:SetTexCoord(0.001953125, 0.259765625, 0.263671875, 0.521484375)
				self.NineSlice.TopRightCorner:ClearAllPoints()
				self.NineSlice.TopRightCorner:SetPoint("TOPRIGHT", 4, 16)
			else
				self.NineSlice.TopRightCorner:SetSize(132, 132)
				self.NineSlice.TopRightCorner:SetTexture("Interface\\FrameGeneral\\UIFrameMetal")
				self.NineSlice.TopRightCorner:SetTexCoord(0.001953125, 0.259765625, 0.525390625, 0.783203125)
				self.NineSlice.TopRightCorner:ClearAllPoints()
				self.NineSlice.TopRightCorner:SetPoint("TOPRIGHT", 4, 16)
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

		ApplyCloseButton(ProfessionsFrame.CraftingPage.CraftingOutputLog.ClosePanelButton)
		ApplyTitleBgNoPortrait(ProfessionsFrame.CraftingPage.CraftingOutputLog)
		ApplyNineSliceNoPortrait(ProfessionsFrame.CraftingPage.CraftingOutputLog)

		ApplySearchBox(ProfessionsFrame.CraftingPage.RecipeList.SearchBox)
		ApplySearchBox(ProfessionsFrame.CraftingPage.MinimizedSearchBox)
		ApplySearchBox(ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.SearchBox)

		ApplyFilterDropDown(ProfessionsFrame.CraftingPage.RecipeList.FilterDropdown)
	end
end)