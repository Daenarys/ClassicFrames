local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AdventureMap" then
		ApplyCloseButton(AdventureMapQuestChoiceDialog.CloseButton, true)
		AdventureMapQuestChoiceDialog.CloseButton:ClearAllPoints()
		AdventureMapQuestChoiceDialog.CloseButton:SetPoint("TOPRIGHT", 3, -10)

		AdventureMapQuestChoiceDialog.Background:SetAlpha(0)

		if (AdventureMapQuestChoiceDialog.Bg == nil) then
			AdventureMapQuestChoiceDialog.Bg = AdventureMapQuestChoiceDialog:CreateTexture(nil, "BACKGROUND", nil, -2)
			AdventureMapQuestChoiceDialog.Bg:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\UI-Background-Rock", true, true)
			AdventureMapQuestChoiceDialog.Bg:SetPoint("TOPLEFT", 5, -35)
			AdventureMapQuestChoiceDialog.Bg:SetPoint("BOTTOMRIGHT", -5, 3)
		end

		if (AdventureMapQuestChoiceDialog.Paper == nil) then
			AdventureMapQuestChoiceDialog.Paper = AdventureMapQuestChoiceDialog:CreateTexture(nil, "BACKGROUND", nil, -1)
			AdventureMapQuestChoiceDialog.Paper:SetTexture("Interface\\QuestFrame\\QuestBG", true, true)
			AdventureMapQuestChoiceDialog.Paper:SetPoint("TOPLEFT", 5, -35)
			AdventureMapQuestChoiceDialog.Paper:SetPoint("BOTTOMRIGHT", 155, 30)
		end

		if (AdventureMapQuestChoiceDialog.TitleBg == nil) then
			AdventureMapQuestChoiceDialog.TitleBg = AdventureMapQuestChoiceDialog:CreateTexture(nil, "BACKGROUND", nil , -1)
			AdventureMapQuestChoiceDialog.TitleBg:SetAtlas("_UI-Frame-TitleTileBg", false)
			AdventureMapQuestChoiceDialog.TitleBg:SetSize(256, 18)
			AdventureMapQuestChoiceDialog.TitleBg:SetHorizTile(true)
			AdventureMapQuestChoiceDialog.TitleBg:SetPoint("TOPLEFT", 6, -17)
			AdventureMapQuestChoiceDialog.TitleBg:SetPoint("TOPRIGHT", -25, -17)
		end

		if (AdventureMapQuestChoiceDialog.TopLeftCorner == nil) then
			AdventureMapQuestChoiceDialog.TopLeftCorner = AdventureMapQuestChoiceDialog:CreateTexture(nil, "BACKGROUND")
			AdventureMapQuestChoiceDialog.TopLeftCorner:SetSize(32, 32)
			AdventureMapQuestChoiceDialog.TopLeftCorner:SetTexture("Interface\\FrameGeneral\\UI-Frame")
			AdventureMapQuestChoiceDialog.TopLeftCorner:SetTexCoord(0.63281250, 0.88281250, 0.28125000, 0.53125000)
			AdventureMapQuestChoiceDialog.TopLeftCorner:SetPoint("TOPLEFT", -2, -14)
		end

		if (AdventureMapQuestChoiceDialog.TopRightCorner == nil) then
			AdventureMapQuestChoiceDialog.TopRightCorner = AdventureMapQuestChoiceDialog:CreateTexture(nil, "BACKGROUND")
			AdventureMapQuestChoiceDialog.TopRightCorner:SetSize(33, 33)
			AdventureMapQuestChoiceDialog.TopRightCorner:SetTexture("Interface\\FrameGeneral\\UI-Frame")
			AdventureMapQuestChoiceDialog.TopRightCorner:SetTexCoord(0.63281250, 0.89062500, 0.00781250, 0.26562500)
			AdventureMapQuestChoiceDialog.TopRightCorner:SetPoint("TOPRIGHT", -1, -14)
		end

		if (AdventureMapQuestChoiceDialog.TopEdge == nil) then
			AdventureMapQuestChoiceDialog.TopEdge = AdventureMapQuestChoiceDialog:CreateTexture(nil, "BACKGROUND")
			AdventureMapQuestChoiceDialog.TopEdge:SetSize(256, 28)
			AdventureMapQuestChoiceDialog.TopEdge:SetTexture("Interface\\FrameGeneral\\_UI-Frame", true)
			AdventureMapQuestChoiceDialog.TopEdge:SetTexCoord(0, 1, 0.43750000, 0.65625000)
			AdventureMapQuestChoiceDialog.TopEdge:SetPoint("TOPLEFT", AdventureMapQuestChoiceDialog.TopLeftCorner, "TOPRIGHT")
			AdventureMapQuestChoiceDialog.TopEdge:SetPoint("TOPRIGHT", AdventureMapQuestChoiceDialog.TopRightCorner, "TOPLEFT")
		end

		if (AdventureMapQuestChoiceDialog.BottomLeftCorner == nil) then
			AdventureMapQuestChoiceDialog.BottomLeftCorner = AdventureMapQuestChoiceDialog:CreateTexture(nil, "BACKGROUND")
			AdventureMapQuestChoiceDialog.BottomLeftCorner:SetSize(14, 14)
			AdventureMapQuestChoiceDialog.BottomLeftCorner:SetTexture("Interface\\FrameGeneral\\UI-Frame")
			AdventureMapQuestChoiceDialog.BottomLeftCorner:SetTexCoord(0.00781250, 0.11718750, 0.63281250, 0.74218750)
			AdventureMapQuestChoiceDialog.BottomLeftCorner:SetPoint("BOTTOMLEFT", -2, -5)
		end

		if (AdventureMapQuestChoiceDialog.BottomRightCorner == nil) then
			AdventureMapQuestChoiceDialog.BottomRightCorner = AdventureMapQuestChoiceDialog:CreateTexture(nil, "BACKGROUND")
			AdventureMapQuestChoiceDialog.BottomRightCorner:SetSize(11, 11)
			AdventureMapQuestChoiceDialog.BottomRightCorner:SetTexture("Interface\\FrameGeneral\\UI-Frame")
			AdventureMapQuestChoiceDialog.BottomRightCorner:SetTexCoord(0.13281250, 0.21875000, 0.89843750, 0.98437500)
			AdventureMapQuestChoiceDialog.BottomRightCorner:SetPoint("BOTTOMRIGHT", -1, -5)
		end

		if (AdventureMapQuestChoiceDialog.BottomEdge == nil) then
			AdventureMapQuestChoiceDialog.BottomEdge = AdventureMapQuestChoiceDialog:CreateTexture(nil, "BACKGROUND")
			AdventureMapQuestChoiceDialog.BottomEdge:SetSize(256, 9)
			AdventureMapQuestChoiceDialog.BottomEdge:SetTexture("Interface\\FrameGeneral\\_UI-Frame", true)
			AdventureMapQuestChoiceDialog.BottomEdge:SetTexCoord(0, 1, 0.20312500, 0.27343750)
			AdventureMapQuestChoiceDialog.BottomEdge:SetPoint("BOTTOMLEFT", AdventureMapQuestChoiceDialog.BottomLeftCorner, "BOTTOMRIGHT")
			AdventureMapQuestChoiceDialog.BottomEdge:SetPoint("BOTTOMRIGHT", AdventureMapQuestChoiceDialog.BottomRightCorner, "BOTTOMLEFT")
		end

		if (AdventureMapQuestChoiceDialog.LeftEdge == nil) then
			AdventureMapQuestChoiceDialog.LeftEdge = AdventureMapQuestChoiceDialog:CreateTexture(nil, "BACKGROUND")
			AdventureMapQuestChoiceDialog.LeftEdge:SetSize(16, 256)
			AdventureMapQuestChoiceDialog.LeftEdge:SetTexture("Interface\\FrameGeneral\\!UI-Frame", false, true)
			AdventureMapQuestChoiceDialog.LeftEdge:SetTexCoord(0.35937500, 0.60937500, 0, 1)
			AdventureMapQuestChoiceDialog.LeftEdge:SetPoint("TOPLEFT", AdventureMapQuestChoiceDialog.TopLeftCorner, "BOTTOMLEFT")
			AdventureMapQuestChoiceDialog.LeftEdge:SetPoint("BOTTOMLEFT", AdventureMapQuestChoiceDialog.BottomLeftCorner, "TOPLEFT")
		end

		if (AdventureMapQuestChoiceDialog.RightEdge == nil) then
			AdventureMapQuestChoiceDialog.RightEdge = AdventureMapQuestChoiceDialog:CreateTexture(nil, "BACKGROUND")
			AdventureMapQuestChoiceDialog.RightEdge:SetSize(10, 256)
			AdventureMapQuestChoiceDialog.RightEdge:SetTexture("Interface\\FrameGeneral\\!UI-Frame", false, true)
			AdventureMapQuestChoiceDialog.RightEdge:SetTexCoord(0.17187500, 0.32812500, 0, 1)
			AdventureMapQuestChoiceDialog.RightEdge:SetPoint("TOPRIGHT", AdventureMapQuestChoiceDialog.TopRightCorner, "BOTTOMRIGHT", 1, 0)
			AdventureMapQuestChoiceDialog.RightEdge:SetPoint("BOTTOMRIGHT", AdventureMapQuestChoiceDialog.BottomRightCorner, "TOPRIGHT")
		end

		if (AdventureMapQuestChoiceDialog.ButtonBorder == nil) then
			AdventureMapQuestChoiceDialog.ButtonBorder = AdventureMapQuestChoiceDialog:CreateTexture(nil, "BACKGROUND")
			AdventureMapQuestChoiceDialog.ButtonBorder:SetAtlas("_UI-Frame-InnerBotTile", true)
			AdventureMapQuestChoiceDialog.ButtonBorder:SetPoint("BOTTOMLEFT", AdventureMapQuestChoiceDialog.BottomLeftCorner, "BOTTOMRIGHT", -7, 31)
			AdventureMapQuestChoiceDialog.ButtonBorder:SetPoint("BOTTOMRIGHT", AdventureMapQuestChoiceDialog.BottomRightCorner, "BOTTOMLEFT", 7, 31)
		end

		AdventureMapQuestChoiceDialog.Details.ScrollBar:SetSize(25, 560)
		AdventureMapQuestChoiceDialog.Details.ScrollBar:ClearAllPoints()
		AdventureMapQuestChoiceDialog.Details.ScrollBar:SetPoint("TOPLEFT", AdventureMapQuestChoiceDialog.Details, "TOPRIGHT", 1, 12)
		AdventureMapQuestChoiceDialog.Details.ScrollBar:SetPoint("BOTTOMLEFT", AdventureMapQuestChoiceDialog.Details, "BOTTOMRIGHT", -1, -58)

		ApplyScrollBarArrow(AdventureMapQuestChoiceDialog.Details.ScrollBar)
		ApplyScrollBarTrack(AdventureMapQuestChoiceDialog.Details.ScrollBar.Track)
		ApplyScrollBarThumb(AdventureMapQuestChoiceDialog.Details.ScrollBar.Track.Thumb)

		if (AdventureMapQuestChoiceDialog.Details.ScrollBar.BG == nil) then
			AdventureMapQuestChoiceDialog.Details.ScrollBar.BG = AdventureMapQuestChoiceDialog.Details.ScrollBar:CreateTexture(nil, "BACKGROUND")
			AdventureMapQuestChoiceDialog.Details.ScrollBar.BG:SetColorTexture(0, 0, 0, 0.75)
			AdventureMapQuestChoiceDialog.Details.ScrollBar.BG:SetAllPoints()
		end
	end
end)