if not _G.ExpansionLandingPage then return end

ExpansionLandingPage:HookScript("OnShow", function(self)
	for _, child in next, { self.Overlay:GetChildren() } do
		if DragonflightLandingOverlayMixin and child.OnLoad == DragonflightLandingOverlayMixin.OnLoad then
	    	child.CloseButton:SetSize(32, 32)
			child.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			child.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			child.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			child.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
			child.CloseButton:ClearAllPoints()
			child.CloseButton:SetPoint("TOPRIGHT", -2, -2)
			UIPanelCloseButton_SetBorderAtlas(child.CloseButton, "UI-Frame-Oribos-ExitButtonBorder", -1, 1)

			child.MajorFactionList.ScrollBar:SetSize(25, 560)
			child.MajorFactionList.ScrollBar:ClearAllPoints()
			child.MajorFactionList.ScrollBar:SetPoint("TOPLEFT", child.MajorFactionList.ScrollBox, "TOPRIGHT", -1, -7)
			child.MajorFactionList.ScrollBar:SetPoint("BOTTOMLEFT", child.MajorFactionList.ScrollBox, "BOTTOMRIGHT", 2, -1)

			if (child.MajorFactionList.ScrollBar.BG == nil) then
				child.MajorFactionList.ScrollBar.BG = child.MajorFactionList.ScrollBar:CreateTexture(nil, "BACKGROUND")
				child.MajorFactionList.ScrollBar.BG:SetColorTexture(0, 0, 0, .25)
				child.MajorFactionList.ScrollBar.BG:SetAllPoints()
			end

			child.MajorFactionList.ScrollBar.Track:SetWidth(18)
			child.MajorFactionList.ScrollBar.Track:ClearAllPoints()
			child.MajorFactionList.ScrollBar.Track:SetPoint("TOPLEFT", 4, -22)
			child.MajorFactionList.ScrollBar.Track:SetPoint("BOTTOMRIGHT", -4, 22)

			child.MajorFactionList.ScrollBar.Track.Begin:Hide()
			child.MajorFactionList.ScrollBar.Track.End:Hide()
			child.MajorFactionList.ScrollBar.Track.Middle:Hide()

			ApplyScrollBarArrow(child.MajorFactionList.ScrollBar)
			ApplyScrollBarThumb(child.MajorFactionList.ScrollBar.Track.Thumb)
	 	end
	    if WarWithinLandingOverlayMixin and child.OnLoad == WarWithinLandingOverlayMixin.OnLoad then
	    	child:SetPoint("CENTER", -47, 32)

	    	child.CloseButton:SetSize(32, 32)
			child.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			child.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			child.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			child.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
			child.CloseButton:ClearAllPoints()
			child.CloseButton:SetPoint("TOPRIGHT", -3, -4)
			UIPanelCloseButton_SetBorderAtlas(child.CloseButton, "UI-Frame-Oribos-ExitButtonBorder", -1, 1)

			child.MajorFactionList.ScrollBar:SetSize(25, 560)
			child.MajorFactionList.ScrollBar:ClearAllPoints()
			child.MajorFactionList.ScrollBar:SetPoint("TOPLEFT", child.MajorFactionList.ScrollBox, "TOPRIGHT", -8, -7)
			child.MajorFactionList.ScrollBar:SetPoint("BOTTOMLEFT", child.MajorFactionList.ScrollBox, "BOTTOMRIGHT", 8, 7)

			if (child.MajorFactionList.ScrollBar.BG == nil) then
				child.MajorFactionList.ScrollBar.BG = child.MajorFactionList.ScrollBar:CreateTexture(nil, "BACKGROUND")
				child.MajorFactionList.ScrollBar.BG:SetColorTexture(0, 0, 0, .25)
				child.MajorFactionList.ScrollBar.BG:SetAllPoints()
			end

			child.MajorFactionList.ScrollBar.Track:ClearAllPoints()
			child.MajorFactionList.ScrollBar.Track:SetPoint("TOPLEFT", 4, -22)
			child.MajorFactionList.ScrollBar.Track:SetPoint("BOTTOMRIGHT", -4, 22)

			child.MajorFactionList.ScrollBar.Track.Begin:Hide()
			child.MajorFactionList.ScrollBar.Track.End:Hide()
			child.MajorFactionList.ScrollBar.Track.Middle:Hide()

			ApplyScrollBarArrow(child.MajorFactionList.ScrollBar)
			ApplyScrollBarThumb(child.MajorFactionList.ScrollBar.Track.Thumb)
	 	end
	end
end)