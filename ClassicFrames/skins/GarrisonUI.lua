local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_GarrisonUI" then
		if _G.GarrisonBuildingFrame then
			ApplyCloseButton(GarrisonBuildingFrame.CloseButton)

			GarrisonBuildingFrameTutorialButton.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")
		end
		if _G.GarrisonMissionFrame then
			ApplyCloseButton(GarrisonMissionFrame.CloseButton)

			GarrisonMissionFrame.MissionTab.MissionPage.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			GarrisonMissionFrame.MissionTab.MissionPage.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			GarrisonMissionFrame.MissionTab.MissionPage.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			GarrisonMissionFrame.MissionTab.MissionPage.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
			GarrisonMissionFrame.MissionTab.MissionPage.CloseButton:ClearAllPoints()
			GarrisonMissionFrame.MissionTab.MissionPage.CloseButton:SetPoint("TOPRIGHT", 4, 5)

			ApplyScrollBarArrow(GarrisonMissionFrameMissions.ScrollBar)
			ApplyScrollBarTrack(GarrisonMissionFrameMissions.ScrollBar.Track)
			ApplyScrollBarThumb(GarrisonMissionFrameMissions.ScrollBar.Track.Thumb)

			ApplyScrollBarArrow(GarrisonMissionFrameFollowers.ScrollBar)
			ApplyScrollBarTrack(GarrisonMissionFrameFollowers.ScrollBar.Track)
			ApplyScrollBarThumb(GarrisonMissionFrameFollowers.ScrollBar.Track.Thumb)
		end
		if _G.GarrisonRecruiterFrame then
			ApplyCloseButton(GarrisonRecruiterFrameCloseButton)

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
			ApplyCloseButton(GarrisonShipyardFrame.BorderFrame.CloseButton2)

			ApplyScrollBarArrow(GarrisonShipyardFrameFollowers.ScrollBar)
			ApplyScrollBarTrack(GarrisonShipyardFrameFollowers.ScrollBar.Track)
			ApplyScrollBarThumb(GarrisonShipyardFrameFollowers.ScrollBar.Track.Thumb)

			GarrisonShipyardFrame.MissionTab.MissionPage.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			GarrisonShipyardFrame.MissionTab.MissionPage.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			GarrisonShipyardFrame.MissionTab.MissionPage.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			GarrisonShipyardFrame.MissionTab.MissionPage.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
			GarrisonShipyardFrame.MissionTab.MissionPage.CloseButton:ClearAllPoints()
			GarrisonShipyardFrame.MissionTab.MissionPage.CloseButton:SetPoint("TOPRIGHT", 4, 5)
		end
		if _G.OrderHallMissionFrame then
			ApplyCloseButton(OrderHallMissionFrame.CloseButton)

			OrderHallMissionFrame.MissionTab.MissionPage.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			OrderHallMissionFrame.MissionTab.MissionPage.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			OrderHallMissionFrame.MissionTab.MissionPage.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			OrderHallMissionFrame.MissionTab.MissionPage.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
			OrderHallMissionFrame.MissionTab.MissionPage.CloseButton:ClearAllPoints()
			OrderHallMissionFrame.MissionTab.MissionPage.CloseButton:SetPoint("TOPRIGHT", 4, 5)

			ApplyScrollBarArrow(OrderHallMissionFrameMissions.ScrollBar)
			ApplyScrollBarTrack(OrderHallMissionFrameMissions.ScrollBar.Track)
			ApplyScrollBarThumb(OrderHallMissionFrameMissions.ScrollBar.Track.Thumb)

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
		end
		if _G.BFAMissionFrame then
			ApplyCloseButton(BFAMissionFrame.CloseButton)

			BFAMissionFrame.MissionTab.MissionPage.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			BFAMissionFrame.MissionTab.MissionPage.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			BFAMissionFrame.MissionTab.MissionPage.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			BFAMissionFrame.MissionTab.MissionPage.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
			BFAMissionFrame.MissionTab.MissionPage.CloseButton:ClearAllPoints()
			BFAMissionFrame.MissionTab.MissionPage.CloseButton:SetPoint("TOPRIGHT", 4, 5)

			ApplyScrollBarArrow(BFAMissionFrameMissions.ScrollBar)
			ApplyScrollBarTrack(BFAMissionFrameMissions.ScrollBar.Track)
			ApplyScrollBarThumb(BFAMissionFrameMissions.ScrollBar.Track.Thumb)

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
		end
		if _G.GarrisonLandingPage then
			GarrisonLandingPage.CloseButton:SetSize(32, 32)
			GarrisonLandingPage.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
			GarrisonLandingPage.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
			GarrisonLandingPage.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
			GarrisonLandingPage.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		end
		if _G.GarrisonLandingPageReportList then
			GarrisonLandingPageReportList.ScrollBar.Track.Begin:Hide()
			GarrisonLandingPageReportList.ScrollBar.Track.End:Hide()
			GarrisonLandingPageReportList.ScrollBar.Track.Middle:Hide()

			ApplyScrollBarArrow(GarrisonLandingPageReportList.ScrollBar)
			ApplyScrollBarThumb(GarrisonLandingPageReportList.ScrollBar.Track.Thumb)
		end
		if _G.GarrisonLandingPageFollowerList then
			ApplyScrollBarArrow(GarrisonLandingPageFollowerList.ScrollBar)
			ApplyScrollBarTrack(GarrisonLandingPageFollowerList.ScrollBar.Track)
			ApplyScrollBarThumb(GarrisonLandingPageFollowerList.ScrollBar.Track.Thumb)
		end
		if _G.GarrisonRecruitSelectFrame then
			ApplyCloseButton(GarrisonRecruitSelectFrame.CloseButton)

			ApplyScrollBarArrow(GarrisonRecruitSelectFrame.FollowerList.ScrollBar)
			ApplyScrollBarTrack(GarrisonRecruitSelectFrame.FollowerList.ScrollBar.Track)
			ApplyScrollBarThumb(GarrisonRecruitSelectFrame.FollowerList.ScrollBar.Track.Thumb)
		end
	end
end)