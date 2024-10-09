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
		ApplyNineSlicePortraitMinimizable(ProfessionsFrame)

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

		ApplyCloseButtonOld(ProfessionsFrame.CraftingPage.CraftingOutputLog.ClosePanelButton)
		ApplyTitleBgNoPortrait(ProfessionsFrame.CraftingPage.CraftingOutputLog)
		ApplyNineSliceNoPortraitOld(ProfessionsFrame.CraftingPage.CraftingOutputLog)

		if ProfessionsFrame.CraftingPage.CraftingOutputLog.ScrollBar then
			ProfessionsFrame.CraftingPage.CraftingOutputLog.ScrollBar.Track.Begin:Hide()
			ProfessionsFrame.CraftingPage.CraftingOutputLog.ScrollBar.Track.End:Hide()
			ProfessionsFrame.CraftingPage.CraftingOutputLog.ScrollBar.Track.Middle:Hide()

			ApplyScrollBarThumb(ProfessionsFrame.CraftingPage.CraftingOutputLog.ScrollBar.Track.Thumb)

			ProfessionsFrame.CraftingPage.CraftingOutputLog.ScrollBar.Back:SetSize(18, 16)
			ProfessionsFrame.CraftingPage.CraftingOutputLog.ScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
			ProfessionsFrame.CraftingPage.CraftingOutputLog.ScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
			ProfessionsFrame.CraftingPage.CraftingOutputLog.ScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
			ProfessionsFrame.CraftingPage.CraftingOutputLog.ScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

			ProfessionsFrame.CraftingPage.CraftingOutputLog.ScrollBar.Forward:SetSize(18, 16)
			ProfessionsFrame.CraftingPage.CraftingOutputLog.ScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
			ProfessionsFrame.CraftingPage.CraftingOutputLog.ScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
			ProfessionsFrame.CraftingPage.CraftingOutputLog.ScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
			ProfessionsFrame.CraftingPage.CraftingOutputLog.ScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")
		end

		ApplySearchBox(ProfessionsFrame.CraftingPage.RecipeList.SearchBox)
		ApplySearchBox(ProfessionsFrame.CraftingPage.MinimizedSearchBox)
		ApplySearchBox(ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.SearchBox)

		ApplyFilterDropDown(ProfessionsFrame.CraftingPage.RecipeList.FilterDropdown)
		ApplyFilterDropDown(ProfessionsFrame.OrdersPage.BrowseFrame.RecipeList.FilterDropdown)
	end
end)