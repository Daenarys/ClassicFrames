local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_GarrisonUI" then
		if _G.GarrisonBuildingFrame then
			GarrisonBuildingFrame.CloseButton:SetSize(32, 32)
			GarrisonBuildingFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			GarrisonBuildingFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			GarrisonBuildingFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			GarrisonBuildingFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
			GarrisonBuildingFrame.CloseButton:ClearAllPoints()
			GarrisonBuildingFrame.CloseButton:SetPoint("TOPRIGHT", 4, 5)

			GarrisonBuildingFrameTutorialButton.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

			_G.GarrisonBuildingFrame:HookScript("OnShow", function(self)
				self:ClearAllPoints()
				self:SetPoint("CENTER")
			end)
		end
		if _G.GarrisonMissionFrame then
			GarrisonMissionFrame.CloseButton:SetSize(32, 32)
			GarrisonMissionFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			GarrisonMissionFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			GarrisonMissionFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			GarrisonMissionFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
			GarrisonMissionFrame.CloseButton:ClearAllPoints()
			GarrisonMissionFrame.CloseButton:SetPoint("TOPRIGHT", 4, 5)

			GarrisonMissionFrame.MissionTab.MissionPage.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			GarrisonMissionFrame.MissionTab.MissionPage.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			GarrisonMissionFrame.MissionTab.MissionPage.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			GarrisonMissionFrame.MissionTab.MissionPage.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
			GarrisonMissionFrame.MissionTab.MissionPage.CloseButton:ClearAllPoints()
			GarrisonMissionFrame.MissionTab.MissionPage.CloseButton:SetPoint("TOPRIGHT", 4, 5)

			GarrisonMissionFrameMissions.ScrollBar:SetSize(25, 560)
			GarrisonMissionFrameMissions.ScrollBar:ClearAllPoints()
			GarrisonMissionFrameMissions.ScrollBar:SetPoint("TOPLEFT", GarrisonMissionFrameMissions.ScrollBox, "TOPRIGHT", -4, 3)
			GarrisonMissionFrameMissions.ScrollBar:SetPoint("BOTTOMLEFT", GarrisonMissionFrameMissions.ScrollBox, "BOTTOMRIGHT", -1, -1)

			if (GarrisonMissionFrameMissions.ScrollBar.BG == nil) then
				GarrisonMissionFrameMissions.ScrollBar.BG = GarrisonMissionFrameMissions.ScrollBar:CreateTexture(nil, "BACKGROUND")
				GarrisonMissionFrameMissions.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
				GarrisonMissionFrameMissions.ScrollBar.BG:SetAllPoints()
			end

			ApplyScrollBarArrow(GarrisonMissionFrameMissions.ScrollBar)
			ApplyScrollBarTrack(GarrisonMissionFrameMissions.ScrollBar.Track)
			ApplyScrollBarThumb(GarrisonMissionFrameMissions.ScrollBar.Track.Thumb)

			GarrisonMissionFrameFollowers.ScrollBar:SetSize(25, 560)
			GarrisonMissionFrameFollowers.ScrollBar:ClearAllPoints()
			GarrisonMissionFrameFollowers.ScrollBar:SetPoint("TOPLEFT", GarrisonMissionFrameFollowers.ScrollBox, "TOPRIGHT", -4, 3)
			GarrisonMissionFrameFollowers.ScrollBar:SetPoint("BOTTOMLEFT", GarrisonMissionFrameFollowers.ScrollBox, "BOTTOMRIGHT", -1, -1)

			if (GarrisonMissionFrameFollowers.ScrollBar.BG == nil) then
				GarrisonMissionFrameFollowers.ScrollBar.BG = GarrisonMissionFrameFollowers.ScrollBar:CreateTexture(nil, "BACKGROUND")
				GarrisonMissionFrameFollowers.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
				GarrisonMissionFrameFollowers.ScrollBar.BG:SetAllPoints()
			end

			ApplyScrollBarArrow(GarrisonMissionFrameFollowers.ScrollBar)
			ApplyScrollBarTrack(GarrisonMissionFrameFollowers.ScrollBar.Track)
			ApplyScrollBarThumb(GarrisonMissionFrameFollowers.ScrollBar.Track.Thumb)

			_G.GarrisonMissionFrame:HookScript("OnShow", function(self)
				self:ClearAllPoints()
				self:SetPoint("CENTER")
			end)
		end
		if _G.GarrisonRecruiterFrame then
			ApplyCloseButton(GarrisonRecruiterFrameCloseButton)
			
			GarrisonRecruiterFrame.PortraitContainer.CircleMask:Hide()

			GarrisonRecruiterFramePortrait:SetSize(61, 61)
			GarrisonRecruiterFramePortrait:ClearAllPoints()
			GarrisonRecruiterFramePortrait:SetPoint("TOPLEFT", -6, 8)

			GarrisonRecruiterFrame.TopTileStreaks:ClearAllPoints()
			GarrisonRecruiterFrame.TopTileStreaks:SetPoint("TOPLEFT", 0, -21)
			GarrisonRecruiterFrame.TopTileStreaks:SetPoint("TOPRIGHT", -2, -21)

			ApplyTitleBg(GarrisonRecruiterFrame)
			ApplyNineSlicePortrait(GarrisonRecruiterFrame)
		end
		if _G.GarrisonShipyardFrame then
			GarrisonShipyardFrame.BorderFrame.CloseButton2:SetSize(32, 32)
			GarrisonShipyardFrame.BorderFrame.CloseButton2:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			GarrisonShipyardFrame.BorderFrame.CloseButton2:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			GarrisonShipyardFrame.BorderFrame.CloseButton2:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			GarrisonShipyardFrame.BorderFrame.CloseButton2:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
			GarrisonShipyardFrame.BorderFrame.CloseButton2:ClearAllPoints()
			GarrisonShipyardFrame.BorderFrame.CloseButton2:SetPoint("TOPRIGHT", 4, 5)

			GarrisonShipyardFrameFollowers.ScrollBar:SetSize(25, 560)
			GarrisonShipyardFrameFollowers.ScrollBar:ClearAllPoints()
			GarrisonShipyardFrameFollowers.ScrollBar:SetPoint("TOPLEFT", GarrisonShipyardFrameFollowers.ScrollBox, "TOPRIGHT", 4, 3)
			GarrisonShipyardFrameFollowers.ScrollBar:SetPoint("BOTTOMLEFT", GarrisonShipyardFrameFollowers.ScrollBox, "BOTTOMRIGHT", 7, -1)

			if (GarrisonShipyardFrameFollowers.ScrollBar.BG == nil) then
				GarrisonShipyardFrameFollowers.ScrollBar.BG = GarrisonShipyardFrameFollowers.ScrollBar:CreateTexture(nil, "BACKGROUND")
				GarrisonShipyardFrameFollowers.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
				GarrisonShipyardFrameFollowers.ScrollBar.BG:SetAllPoints()
			end

			ApplyScrollBarArrow(GarrisonShipyardFrameFollowers.ScrollBar)
			ApplyScrollBarTrack(GarrisonShipyardFrameFollowers.ScrollBar.Track)
			ApplyScrollBarThumb(GarrisonShipyardFrameFollowers.ScrollBar.Track.Thumb)

			GarrisonShipyardFrame.MissionTab.MissionPage.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			GarrisonShipyardFrame.MissionTab.MissionPage.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			GarrisonShipyardFrame.MissionTab.MissionPage.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			GarrisonShipyardFrame.MissionTab.MissionPage.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
			GarrisonShipyardFrame.MissionTab.MissionPage.CloseButton:ClearAllPoints()
			GarrisonShipyardFrame.MissionTab.MissionPage.CloseButton:SetPoint("TOPRIGHT", 4, 5)

			_G.GarrisonShipyardFrame:HookScript("OnShow", function(self)
				self:ClearAllPoints()
				self:SetPoint("CENTER")
			end)
		end
		if _G.OrderHallMissionFrame then
			OrderHallMissionFrame.CloseButton:SetSize(32, 32)
			OrderHallMissionFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			OrderHallMissionFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			OrderHallMissionFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			OrderHallMissionFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
			OrderHallMissionFrame.CloseButton:ClearAllPoints()
			OrderHallMissionFrame.CloseButton:SetPoint("TOPRIGHT", 4, 5)

			OrderHallMissionFrame.MissionTab.MissionPage.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			OrderHallMissionFrame.MissionTab.MissionPage.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			OrderHallMissionFrame.MissionTab.MissionPage.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			OrderHallMissionFrame.MissionTab.MissionPage.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
			OrderHallMissionFrame.MissionTab.MissionPage.CloseButton:ClearAllPoints()
			OrderHallMissionFrame.MissionTab.MissionPage.CloseButton:SetPoint("TOPRIGHT", 4, 5)

			OrderHallMissionFrameMissions.ScrollBar:SetSize(25, 560)
			OrderHallMissionFrameMissions.ScrollBar:ClearAllPoints()
			OrderHallMissionFrameMissions.ScrollBar:SetPoint("TOPLEFT", OrderHallMissionFrameMissions.ScrollBox, "TOPRIGHT", -4, 3)
			OrderHallMissionFrameMissions.ScrollBar:SetPoint("BOTTOMLEFT", OrderHallMissionFrameMissions.ScrollBox, "BOTTOMRIGHT", -1, -1)

			if (OrderHallMissionFrameMissions.ScrollBar.BG == nil) then
				OrderHallMissionFrameMissions.ScrollBar.BG = OrderHallMissionFrameMissions.ScrollBar:CreateTexture(nil, "BACKGROUND")
				OrderHallMissionFrameMissions.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
				OrderHallMissionFrameMissions.ScrollBar.BG:SetAllPoints()
			end

			ApplyScrollBarArrow(OrderHallMissionFrameMissions.ScrollBar)
			ApplyScrollBarTrack(OrderHallMissionFrameMissions.ScrollBar.Track)
			ApplyScrollBarThumb(OrderHallMissionFrameMissions.ScrollBar.Track.Thumb)
			
			OrderHallMissionFrameFollowers.ScrollBar:SetSize(25, 560)
			OrderHallMissionFrameFollowers.ScrollBar:ClearAllPoints()
			OrderHallMissionFrameFollowers.ScrollBar:SetPoint("TOPLEFT", OrderHallMissionFrameFollowers.ScrollBox, "TOPRIGHT", -4, 3)
			OrderHallMissionFrameFollowers.ScrollBar:SetPoint("BOTTOMLEFT", OrderHallMissionFrameFollowers.ScrollBox, "BOTTOMRIGHT", -1, -1)

			if (OrderHallMissionFrameFollowers.ScrollBar.BG == nil) then
				OrderHallMissionFrameFollowers.ScrollBar.BG = OrderHallMissionFrameFollowers.ScrollBar:CreateTexture(nil, "BACKGROUND")
				OrderHallMissionFrameFollowers.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
				OrderHallMissionFrameFollowers.ScrollBar.BG:SetAllPoints()
			end

			ApplyScrollBarArrow(OrderHallMissionFrameFollowers.ScrollBar)
			ApplyScrollBarTrack(OrderHallMissionFrameFollowers.ScrollBar.Track)
			ApplyScrollBarThumb(OrderHallMissionFrameFollowers.ScrollBar.Track.Thumb)

			for i = 1, 3 do
				ApplyBottomTab(_G['OrderHallMissionFrameTab'..i])

				_G['OrderHallMissionFrameTab'..i]:HookScript("OnShow", function(self)
					self:SetWidth(40 + self:GetFontString():GetStringWidth())
					OrderHallMissionFrameTab2:ClearAllPoints()
					OrderHallMissionFrameTab2:SetPoint("LEFT", OrderHallMissionFrameTab1, "RIGHT", -15, 0)
					OrderHallMissionFrameTab3:ClearAllPoints()
					OrderHallMissionFrameTab3:SetPoint("LEFT", OrderHallMissionFrameTab2, "RIGHT", -15, 0)
				end)
			end

			_G.OrderHallMissionFrame:HookScript("OnShow", function(self)
				self:ClearAllPoints()
				self:SetPoint("CENTER")
			end)
		end
		if _G.BFAMissionFrame then
			BFAMissionFrame.CloseButton:SetSize(32, 32)
			BFAMissionFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			BFAMissionFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			BFAMissionFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			BFAMissionFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
			BFAMissionFrame.CloseButton:ClearAllPoints()
			BFAMissionFrame.CloseButton:SetPoint("TOPRIGHT", 4, 5)

			BFAMissionFrame.MissionTab.MissionPage.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			BFAMissionFrame.MissionTab.MissionPage.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			BFAMissionFrame.MissionTab.MissionPage.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			BFAMissionFrame.MissionTab.MissionPage.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
			BFAMissionFrame.MissionTab.MissionPage.CloseButton:ClearAllPoints()
			BFAMissionFrame.MissionTab.MissionPage.CloseButton:SetPoint("TOPRIGHT", 4, 5)

			BFAMissionFrameMissions.ScrollBar:SetSize(25, 560)
			BFAMissionFrameMissions.ScrollBar:ClearAllPoints()
			BFAMissionFrameMissions.ScrollBar:SetPoint("TOPLEFT", BFAMissionFrameMissions.ScrollBox, "TOPRIGHT", -4, 3)
			BFAMissionFrameMissions.ScrollBar:SetPoint("BOTTOMLEFT", BFAMissionFrameMissions.ScrollBox, "BOTTOMRIGHT", -1, -1)

			if (BFAMissionFrameMissions.ScrollBar.BG == nil) then
				BFAMissionFrameMissions.ScrollBar.BG = BFAMissionFrameMissions.ScrollBar:CreateTexture(nil, "BACKGROUND")
				BFAMissionFrameMissions.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
				BFAMissionFrameMissions.ScrollBar.BG:SetAllPoints()
			end

			ApplyScrollBarArrow(BFAMissionFrameMissions.ScrollBar)
			ApplyScrollBarTrack(BFAMissionFrameMissions.ScrollBar.Track)
			ApplyScrollBarThumb(BFAMissionFrameMissions.ScrollBar.Track.Thumb)

			BFAMissionFrameFollowers.ScrollBar:SetSize(25, 560)
			BFAMissionFrameFollowers.ScrollBar:ClearAllPoints()
			BFAMissionFrameFollowers.ScrollBar:SetPoint("TOPLEFT", BFAMissionFrameFollowers.ScrollBox, "TOPRIGHT", -4, 3)
			BFAMissionFrameFollowers.ScrollBar:SetPoint("BOTTOMLEFT", BFAMissionFrameFollowers.ScrollBox, "BOTTOMRIGHT", -1, -1)

			if (BFAMissionFrameFollowers.ScrollBar.BG == nil) then
				BFAMissionFrameFollowers.ScrollBar.BG = BFAMissionFrameFollowers.ScrollBar:CreateTexture(nil, "BACKGROUND")
				BFAMissionFrameFollowers.ScrollBar.BG:SetColorTexture(0, 0, 0, .85)
				BFAMissionFrameFollowers.ScrollBar.BG:SetAllPoints()
			end

			ApplyScrollBarArrow(BFAMissionFrameFollowers.ScrollBar)
			ApplyScrollBarTrack(BFAMissionFrameFollowers.ScrollBar.Track)
			ApplyScrollBarThumb(BFAMissionFrameFollowers.ScrollBar.Track.Thumb)

			for i = 1, 3 do
				ApplyBottomTab(_G['BFAMissionFrameTab'..i])

				_G['BFAMissionFrameTab'..i]:HookScript("OnShow", function(self)
					self:SetWidth(40 + self:GetFontString():GetStringWidth())
					BFAMissionFrameTab2:ClearAllPoints()
					BFAMissionFrameTab2:SetPoint("LEFT", BFAMissionFrameTab1, "RIGHT", -15, 0)
					BFAMissionFrameTab3:ClearAllPoints()
					BFAMissionFrameTab3:SetPoint("LEFT", BFAMissionFrameTab2, "RIGHT", -15, 0)
				end)
			end

			_G.BFAMissionFrame:HookScript("OnShow", function(self)
				self:ClearAllPoints()
				self:SetPoint("CENTER")
			end)
		end
		if _G.CovenantMissionFrame then
			CovenantMissionFrame.CloseButton:SetSize(32, 32)
			CovenantMissionFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			CovenantMissionFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			CovenantMissionFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			CovenantMissionFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

			CovenantMissionFrame.MissionTab.MissionPage.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			CovenantMissionFrame.MissionTab.MissionPage.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			CovenantMissionFrame.MissionTab.MissionPage.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			CovenantMissionFrame.MissionTab.MissionPage.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")

			for i = 1, 2 do
				ApplyBottomTab(_G['CovenantMissionFrameTab'..i])

				_G['CovenantMissionFrameTab'..i]:HookScript("OnShow", function(self)
					self:SetWidth(40 + self:GetFontString():GetStringWidth())
					CovenantMissionFrameTab2:ClearAllPoints()
					CovenantMissionFrameTab2:SetPoint("LEFT", CovenantMissionFrameTab1, "RIGHT", -15, 0)
				end)
			end

			_G.CovenantMissionFrame:HookScript("OnShow", function(self)
				self:ClearAllPoints()
				self:SetPoint("CENTER")
			end)
		end
		if _G.GarrisonLandingPage then
			GarrisonLandingPage.CloseButton:SetSize(32, 32)
			GarrisonLandingPage.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			GarrisonLandingPage.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			GarrisonLandingPage.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			GarrisonLandingPage.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		end
		if _G.GarrisonLandingPageReportList then
			GarrisonLandingPageReportList.ScrollBar:SetSize(25, 560)
			GarrisonLandingPageReportList.ScrollBar:ClearAllPoints()
			GarrisonLandingPageReportList.ScrollBar:SetPoint("TOPLEFT", GarrisonLandingPageReportList.ScrollBox, "TOPRIGHT", -20, 1)
			GarrisonLandingPageReportList.ScrollBar:SetPoint("BOTTOMLEFT", GarrisonLandingPageReportList.ScrollBox, "BOTTOMRIGHT", -17, -5)

			if (GarrisonLandingPageReportList.ScrollBar.BG == nil) then
				GarrisonLandingPageReportList.ScrollBar.BG = GarrisonLandingPageReportList.ScrollBar:CreateTexture(nil, "BACKGROUND")
				GarrisonLandingPageReportList.ScrollBar.BG:SetColorTexture(0, 0, 0, .75)
				GarrisonLandingPageReportList.ScrollBar.BG:SetAllPoints()
			end

			GarrisonLandingPageReportList.ScrollBar.Track:ClearAllPoints()
			GarrisonLandingPageReportList.ScrollBar.Track:SetPoint("TOPLEFT", 4, -22)
			GarrisonLandingPageReportList.ScrollBar.Track:SetPoint("BOTTOMRIGHT", -4, 22)

			GarrisonLandingPageReportList.ScrollBar.Track.Begin:Hide()
			GarrisonLandingPageReportList.ScrollBar.Track.End:Hide()
			GarrisonLandingPageReportList.ScrollBar.Track.Middle:Hide()

			ApplyScrollBarArrow(GarrisonLandingPageReportList.ScrollBar)
			ApplyScrollBarThumb(GarrisonLandingPageReportList.ScrollBar.Track.Thumb)
		end
		if _G.GarrisonLandingPageFollowerList then
			GarrisonLandingPageFollowerList.ScrollBar:SetSize(25, 560)
			GarrisonLandingPageFollowerList.ScrollBar:ClearAllPoints()
			GarrisonLandingPageFollowerList.ScrollBar:SetPoint("TOPLEFT", GarrisonLandingPageFollowerList.ScrollBox, "TOPRIGHT", -20, 1)
			GarrisonLandingPageFollowerList.ScrollBar:SetPoint("BOTTOMLEFT", GarrisonLandingPageFollowerList.ScrollBox, "BOTTOMRIGHT", -17, -5)

			if (GarrisonLandingPageFollowerList.ScrollBar.BG == nil) then
				GarrisonLandingPageFollowerList.ScrollBar.BG = GarrisonLandingPageFollowerList.ScrollBar:CreateTexture(nil, "BACKGROUND")
				GarrisonLandingPageFollowerList.ScrollBar.BG:SetColorTexture(0, 0, 0, .75)
				GarrisonLandingPageFollowerList.ScrollBar.BG:SetAllPoints()
			end

			GarrisonLandingPageFollowerList.ScrollBar.Track:ClearAllPoints()
			GarrisonLandingPageFollowerList.ScrollBar.Track:SetPoint("TOPLEFT", 4, -22)
			GarrisonLandingPageFollowerList.ScrollBar.Track:SetPoint("BOTTOMRIGHT", -4, 22)

			ApplyScrollBarArrow(GarrisonLandingPageFollowerList.ScrollBar)
			ApplyScrollBarTrack(GarrisonLandingPageFollowerList.ScrollBar.Track)
			ApplyScrollBarThumb(GarrisonLandingPageFollowerList.ScrollBar.Track.Thumb)
		end
		if _G.GarrisonRecruitSelectFrame then
			GarrisonRecruitSelectFrame.CloseButton:SetSize(32, 32)
			GarrisonRecruitSelectFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			GarrisonRecruitSelectFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			GarrisonRecruitSelectFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			GarrisonRecruitSelectFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
			GarrisonRecruitSelectFrame.CloseButton:ClearAllPoints()
			GarrisonRecruitSelectFrame.CloseButton:SetPoint("TOPRIGHT", 4, 5)

			GarrisonRecruitSelectFrame.FollowerList.ScrollBar:SetSize(25, 560)
			GarrisonRecruitSelectFrame.FollowerList.ScrollBar:ClearAllPoints()
			GarrisonRecruitSelectFrame.FollowerList.ScrollBar:SetPoint("TOPLEFT", GarrisonRecruitSelectFrame.FollowerList.ScrollBox, "TOPRIGHT", -4, 0)
			GarrisonRecruitSelectFrame.FollowerList.ScrollBar:SetPoint("BOTTOMLEFT", GarrisonRecruitSelectFrame.FollowerList.ScrollBox, "BOTTOMRIGHT", -1, -3)

			if (GarrisonRecruitSelectFrame.FollowerList.ScrollBar.BG == nil) then
				GarrisonRecruitSelectFrame.FollowerList.ScrollBar.BG = GarrisonRecruitSelectFrame.FollowerList.ScrollBar:CreateTexture(nil, "BACKGROUND")
				GarrisonRecruitSelectFrame.FollowerList.ScrollBar.BG:SetColorTexture(0, 0, 0, .75)
				GarrisonRecruitSelectFrame.FollowerList.ScrollBar.BG:SetAllPoints()
			end

			GarrisonRecruitSelectFrame.FollowerList.ScrollBar.Track:ClearAllPoints()
			GarrisonRecruitSelectFrame.FollowerList.ScrollBar.Track:SetPoint("TOPLEFT", 4, -22)
			GarrisonRecruitSelectFrame.FollowerList.ScrollBar.Track:SetPoint("BOTTOMRIGHT", -4, 22)

			ApplyScrollBarArrow(GarrisonRecruitSelectFrame.FollowerList.ScrollBar)
			ApplyScrollBarTrack(GarrisonRecruitSelectFrame.FollowerList.ScrollBar.Track)
			ApplyScrollBarThumb(GarrisonRecruitSelectFrame.FollowerList.ScrollBar.Track.Thumb)

			ApplySearchBox(GarrisonLandingPageFollowerList.SearchBox)
			ApplySearchBox(GarrisonRecruitSelectFrame.FollowerList.SearchBox)

			GarrisonRecruitSelectFrame:HookScript("OnShow", function(self)
				self:ClearAllPoints()
				self:SetPoint("CENTER")
			end)
		end
		if _G.GarrisonMonumentFrame then
			GarrisonMonumentFrame:HookScript("OnShow", function(self)
				self:ClearAllPoints()
				self:SetPoint("BOTTOM", 0 , 125)
			end)
		end
	end
end)