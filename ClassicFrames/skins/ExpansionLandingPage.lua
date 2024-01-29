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
			UIPanelCloseButton_SetBorderAtlas(child.CloseButton, "UI-Frame-Oribos-ExitButtonBorder", -1, 1);

			child.MajorFactionList.ScrollBar:SetSize(25, 560)
			child.MajorFactionList.ScrollBar:ClearAllPoints()
			child.MajorFactionList.ScrollBar:SetPoint("TOPLEFT", child.MajorFactionList.ScrollBox, "TOPRIGHT", -1, -7)
			child.MajorFactionList.ScrollBar:SetPoint("BOTTOMLEFT", child.MajorFactionList.ScrollBox, "BOTTOMRIGHT", 2, -1)

			if (child.MajorFactionList.ScrollBar.BG == nil) then
				child.MajorFactionList.ScrollBar.BG = child.MajorFactionList.ScrollBar:CreateTexture(nil, "BACKGROUND");
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

			child.MajorFactionList.ScrollBar.Track.Thumb:SetWidth(18)
			child.MajorFactionList.ScrollBar.Track.Thumb.Begin:SetAtlas("UI-ScrollBar-Knob-EndCap-Top", true)
			child.MajorFactionList.ScrollBar.Track.Thumb.End:SetAtlas("UI-ScrollBar-Knob-EndCap-Bottom", true)
			child.MajorFactionList.ScrollBar.Track.Thumb.Middle:SetAtlas("UI-ScrollBar-Knob-Center", true)
			child.MajorFactionList.ScrollBar.Track.Thumb.upBeginTexture = "UI-ScrollBar-Knob-EndCap-Top"
			child.MajorFactionList.ScrollBar.Track.Thumb.upMiddleTexture = "UI-ScrollBar-Knob-Center"
			child.MajorFactionList.ScrollBar.Track.Thumb.upEndTexture = "UI-ScrollBar-Knob-EndCap-Bottom"
			child.MajorFactionList.ScrollBar.Track.Thumb.overBeginTexture = "UI-ScrollBar-Knob-MouseOver-EndCap-Top"
			child.MajorFactionList.ScrollBar.Track.Thumb.overMiddleTexture = "UI-ScrollBar-Knob-MouseOver-Center"
			child.MajorFactionList.ScrollBar.Track.Thumb.overEndTexture = "UI-ScrollBar-Knob-MouseOver-EndCap-Bottom"
			child.MajorFactionList.ScrollBar.Track.Thumb.downBeginTexture = "UI-ScrollBar-Knob-EndCap-Top-Disabled"
			child.MajorFactionList.ScrollBar.Track.Thumb.downMiddleTexture = "UI-ScrollBar-Knob-Center-Disabled"
			child.MajorFactionList.ScrollBar.Track.Thumb.downEndTexture = "UI-ScrollBar-Knob-EndCap-Bottom-Disabled"
			child.MajorFactionList.ScrollBar.Track.Thumb.Middle:ClearAllPoints()
			child.MajorFactionList.ScrollBar.Track.Thumb.Middle:SetPoint("TOPLEFT", 0, -5)
			child.MajorFactionList.ScrollBar.Track.Thumb.Middle:SetPoint("BOTTOMRIGHT", 0, 5)

			ApplyScrollBarArrow(child.MajorFactionList.ScrollBar)
	 	end
	end
end)