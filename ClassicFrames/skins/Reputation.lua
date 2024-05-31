function CfReputationFrame_OnLoad(self)
	self.paragonFramesPool = CreateFramePool("FRAME", self, "ReputationParagonFrameTemplate")

	CfReputationDetailCloseButton:SetSize(32, 32)
	CfReputationDetailCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
	CfReputationDetailCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
	CfReputationDetailCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
	CfReputationDetailCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
	CfReputationDetailCloseButton:ClearAllPoints()
	CfReputationDetailCloseButton:SetPoint("TOPRIGHT", -3, -3)

	CfReputationDetailInactiveCheckBoxText:ClearAllPoints()
	CfReputationDetailInactiveCheckBoxText:SetPoint("LEFT", CfReputationDetailInactiveCheckBox, "RIGHT", 0, 1)

	CfReputationDetailMainScreenCheckBoxText:ClearAllPoints()
	CfReputationDetailMainScreenCheckBoxText:SetPoint("LEFT", CfReputationDetailMainScreenCheckBox, "RIGHT", 0, 1)

	ApplyDialogBorder(CfReputationDetailFrame.Border)
end

function CfReputationFrame_OnShow(self)
	CfReputationFrame_Update()
	self:RegisterEvent("QUEST_LOG_UPDATE")
	self:RegisterEvent("UPDATE_FACTION")
end

function CfReputationFrame_OnHide(self)
	self:UnregisterEvent("QUEST_LOG_UPDATE")
	self:UnregisterEvent("UPDATE_FACTION")
end

function CfReputationFrame_OnEvent(self, event, ...)
	if ( event == "UPDATE_FACTION" or event == "QUEST_LOG_UPDATE" or event == "MAJOR_FACTION_RENOWN_LEVEL_CHANGED" or event == "MAJOR_FACTION_UNLOCKED" ) then
		CfReputationFrame_Update()
	end
end

function CfReputationFrame_SetRowType(factionRow, isChild, isHeader, hasRep)
	local factionRowName = factionRow:GetName()
	local factionBar = _G[factionRowName.."ReputationBar"];
	local factionTitle = _G[factionRowName.."FactionName"];
	local factionButton = _G[factionRowName.."ExpandOrCollapseButton"];
	local factionStanding = _G[factionRowName.."ReputationBarFactionStanding"];
	local factionBackground = _G[factionRowName.."Background"];
	local factionLeftTexture = _G[factionRowName.."ReputationBarLeftTexture"];
	local factionRightTexture = _G[factionRowName.."ReputationBarRightTexture"];
	factionLeftTexture:SetWidth(62)
	factionRightTexture:SetWidth(42)
	factionBar:SetPoint("RIGHT", factionRow, "RIGHT", 0, 0)
	if ( isHeader ) then
		if (isChild) then
			factionRow:SetPoint("LEFT", CfReputationFrame, "LEFT", 29, 0)
		else
			factionRow:SetPoint("LEFT", CfReputationFrame, "LEFT", 10, 0)
		end
		factionButton:SetPoint("LEFT", factionRow, "LEFT", 3, 0)
		factionButton:Show()
		factionTitle:SetPoint("LEFT",factionButton,"RIGHT", 10, 0)
		if (hasRep) then
			factionTitle:SetPoint("RIGHT", factionBar, "LEFT", -3, 0)
		else
			factionTitle:SetPoint("RIGHT", factionBar, "RIGHT", -3, 0)
		end

		factionTitle:SetFontObject(GameFontNormalLeft)
		factionBackground:Hide()
		factionLeftTexture:SetHeight(15)
		factionLeftTexture:SetWidth(60)
		factionRightTexture:SetHeight(15)
		factionRightTexture:SetWidth(39)
		factionLeftTexture:SetTexCoord(0.765625, 1.0, 0.046875, 0.28125)
		factionRightTexture:SetTexCoord(0.0, 0.15234375, 0.390625, 0.625)
		factionBar:SetWidth(99)
	else
		if ( isChild ) then
			factionRow:SetPoint("LEFT", CfReputationFrame, "LEFT", 52, 0)
		else
			factionRow:SetPoint("LEFT", CfReputationFrame, "LEFT", 34, 0)
		end

		factionButton:Hide()
		factionTitle:SetPoint("LEFT", factionRow, "LEFT", 10, 0)
		factionTitle:SetPoint("RIGHT", factionBar, "LEFT", -3, 0)
		factionTitle:SetFontObject(GameFontHighlightSmall)
		factionBackground:Show()
		factionLeftTexture:SetHeight(21)
		factionRightTexture:SetHeight(21)
		factionLeftTexture:SetTexCoord(0.7578125, 1.0, 0.0, 0.328125)
		factionRightTexture:SetTexCoord(0.0, 0.1640625, 0.34375, 0.671875)
		factionBar:SetWidth(101)
	end

	if ( (hasRep) or (not isHeader) ) then
		factionStanding:Show()
		factionBar:Show()
		factionBar:GetParent().hasRep = true;
	else
		factionStanding:Hide()
		factionBar:Hide()
		factionBar:GetParent().hasRep = false;
	end
end

function CfReputationFrame_Update()
	CfReputationFrame.paragonFramesPool:ReleaseAll()

	local numFactions = GetNumFactions()

	-- Update scroll frame
	if ( not FauxScrollFrame_Update(ReputationListScrollFrame, numFactions, NUM_FACTIONS_DISPLAYED, REPUTATIONFRAME_FACTIONHEIGHT ) ) then
		ReputationListScrollFrameScrollBar:SetValue(0)
	end
	local factionOffset = FauxScrollFrame_GetOffset(ReputationListScrollFrame)

	for i=1, NUM_FACTIONS_DISPLAYED, 1 do
		local factionIndex = factionOffset + i;
		local factionRow = _G["ReputationBar"..i];
		local factionBar = _G["ReputationBar"..i.."ReputationBar"];
		local factionTitle = _G["ReputationBar"..i.."FactionName"];
		local factionButton = _G["ReputationBar"..i.."ExpandOrCollapseButton"];
		local factionStanding = _G["ReputationBar"..i.."ReputationBarFactionStanding"];
		local factionBackground = _G["ReputationBar"..i.."Background"];
		if ( factionIndex <= numFactions ) then
			local name, description, standingID, barMin, barMax, barValue, atWarWith, canToggleAtWar, isHeader, isCollapsed, hasRep, isWatched, isChild, factionID, hasBonusRepGain, canSetInactive = GetFactionInfo(factionIndex)
			factionTitle:SetText(name)
			if ( isCollapsed ) then
				factionButton:SetNormalTexture("Interface\\Buttons\\UI-PlusButton-Up")
			else
				factionButton:SetNormalTexture("Interface\\Buttons\\UI-MinusButton-Up")
			end
			factionRow.index = factionIndex;
			factionRow.isCollapsed = isCollapsed;

			local colorIndex = standingID;
			local barColor = FACTION_BAR_COLORS[colorIndex];
			local factionStandingtext;

			if ( factionID and C_Reputation.IsFactionParagon(factionID) ) then
				local paragonFrame = ReputationFrame.paragonFramesPool:Acquire()
				paragonFrame.factionID = factionID;
				paragonFrame:SetPoint("RIGHT", factionRow, 11, 0)
				local currentValue, threshold, rewardQuestID, hasRewardPending, tooLowLevelForParagon = C_Reputation.GetFactionParagonInfo(factionID)
				C_Reputation.RequestFactionParagonPreloadRewardData(factionID)
				paragonFrame.Glow:SetShown(not tooLowLevelForParagon and hasRewardPending)
				paragonFrame.Check:SetShown(not tooLowLevelForParagon and hasRewardPending)
				paragonFrame:Show()
			end

			local isCapped;
			if (standingID == MAX_REPUTATION_REACTION) then
				isCapped = true;
			end
			-- check if this is a friendship faction or a Major Faction
			local isMajorFaction = factionID and C_Reputation.IsMajorFaction(factionID)
			local repInfo = factionID and C_GossipInfo.GetFriendshipReputation(factionID)
			if (repInfo and repInfo.friendshipFactionID > 0) then
				factionStandingtext = repInfo.reaction;
				if ( repInfo.nextThreshold ) then
					barMin, barMax, barValue = repInfo.reactionThreshold, repInfo.nextThreshold, repInfo.standing;
				else
					-- max rank, make it look like a full bar
					barMin, barMax, barValue = 0, 1, 1;
					isCapped = true;
				end
				local friendshipColorIndex = 5;
				barColor = FACTION_BAR_COLORS[colorIndex]; -- always color friendships green
				factionRow.friendshipID = repInfo.friendshipFactionID; -- for doing friendship tooltip
			elseif ( isMajorFaction ) then
				local majorFactionData = C_MajorFactions.GetMajorFactionData(factionID)

				barMin, barMax = 0, majorFactionData.renownLevelThreshold;
				isCapped = C_MajorFactions.HasMaximumRenown(factionID)
				barValue = isCapped and majorFactionData.renownLevelThreshold or majorFactionData.renownReputationEarned or 0;
				barColor = BLUE_FONT_COLOR;

				factionRow.friendshipID = nil;
				factionStandingtext = RENOWN_LEVEL_LABEL .. majorFactionData.renownLevel;
			else
				local gender = UnitSex("player")
				factionStandingtext = GetText("FACTION_STANDING_LABEL"..standingID, gender)
				factionRow.friendshipID = nil;
			end

			factionStanding:SetText(factionStandingtext)

			--Normalize Values
			barMax = barMax - barMin;
			barValue = barValue - barMin;
			barMin = 0;

			factionRow.standingText = factionStandingtext;
			if ( isCapped ) then
				factionRow.rolloverText = nil;
			else
				factionRow.rolloverText = HIGHLIGHT_FONT_COLOR_CODE.." "..format(REPUTATION_PROGRESS_FORMAT, BreakUpLargeNumbers(barValue), BreakUpLargeNumbers(barMax))..FONT_COLOR_CODE_CLOSE;
			end
			factionBar:SetFillStyle("STANDARD_NO_RANGE_FILL")
			factionBar:SetMinMaxValues(0, barMax)
			factionBar:SetValue(barValue)
			factionBar:SetStatusBarColor(barColor.r, barColor.g, barColor.b)

			factionBar.BonusIcon:SetShown(hasBonusRepGain)

			CfReputationFrame_SetRowType(factionRow, isChild, isHeader, hasRep)

			factionRow:Show()

			-- Update details if this is the selected faction
			if ( atWarWith ) then
				_G["ReputationBar"..i.."ReputationBarAtWarHighlight1"]:Show()
				_G["ReputationBar"..i.."ReputationBarAtWarHighlight2"]:Show()
			else
				_G["ReputationBar"..i.."ReputationBarAtWarHighlight1"]:Hide()
				_G["ReputationBar"..i.."ReputationBarAtWarHighlight2"]:Hide()
			end
			if ( factionIndex == GetSelectedFaction() ) then
				if ( CfReputationDetailFrame:IsShown() ) then
					CfReputationDetailFactionName:SetText(name)
					CfReputationDetailFactionDescription:SetText(description)
					if ( atWarWith ) then
						CfReputationDetailAtWarCheckBox:SetChecked(true)
					else
						CfReputationDetailAtWarCheckBox:SetChecked(false)
					end
					if ( canToggleAtWar and (not isHeader)) then
						CfReputationDetailAtWarCheckBox:Enable()
						CfReputationDetailAtWarCheckBoxText:SetTextColor(RED_FONT_COLOR.r, RED_FONT_COLOR.g, RED_FONT_COLOR.b)
					else
						CfReputationDetailAtWarCheckBox:Disable()
						CfReputationDetailAtWarCheckBoxText:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
					end
					if ( canSetInactive ) then
						CfReputationDetailInactiveCheckBox:Enable()
						CfReputationDetailInactiveCheckBoxText:SetTextColor(CfReputationDetailInactiveCheckBoxText:GetFontObject():GetTextColor())
					else
						CfReputationDetailInactiveCheckBox:Disable()
						CfReputationDetailInactiveCheckBoxText:SetTextColor(GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b)
					end
					if ( IsFactionInactive(factionIndex) ) then
						CfReputationDetailInactiveCheckBox:SetChecked(true)
					else
						CfReputationDetailInactiveCheckBox:SetChecked(false)
					end
					if ( isWatched ) then
						CfReputationDetailMainScreenCheckBox:SetChecked(true)
					else
						CfReputationDetailMainScreenCheckBox:SetChecked(false)
					end
					_G["ReputationBar"..i.."ReputationBarHighlight1"]:Show()
					_G["ReputationBar"..i.."ReputationBarHighlight2"]:Show()
				end
			else
				_G["ReputationBar"..i.."ReputationBarHighlight1"]:Hide()
				_G["ReputationBar"..i.."ReputationBarHighlight2"]:Hide()
			end
		else
			factionRow:Hide()
		end
	end
	if ( GetSelectedFaction() == 0 ) then
		CfReputationDetailFrame:Hide()
	end
end

function ReputationBar_OnClick(self)
	if ( CfReputationDetailFrame:IsShown() and (GetSelectedFaction() == self.index) ) then
		PlaySound(SOUNDKIT.IG_CHARACTER_INFO_CLOSE)
		CfReputationDetailFrame:Hide()
	else
		if ( self.hasRep ) then
			PlaySound(SOUNDKIT.IG_CHARACTER_INFO_OPEN)
			SetSelectedFaction(self.index)
			CfReputationDetailFrame:Show()
			CfReputationFrame_Update()
		end
	end
end

function ShowFriendshipReputationTooltip(friendshipID, parent, anchor)
	local repInfo = C_GossipInfo.GetFriendshipReputation(friendshipID)
	if ( repInfo and repInfo.friendshipFactionID and repInfo.friendshipFactionID > 0) then
		GameTooltip:SetOwner(parent, anchor)
		local rankInfo = C_GossipInfo.GetFriendshipReputationRanks(repInfo.friendshipFactionID)
		if ( rankInfo.maxLevel > 0 ) then
			GameTooltip:SetText(repInfo.name.." ("..rankInfo.currentLevel.." / "..rankInfo.maxLevel..")", 1, 1, 1)
		else
			GameTooltip:SetText(repInfo.name, 1, 1, 1)
		end
		GameTooltip:AddLine(repInfo.text, nil, nil, nil, true)
		if ( repInfo.nextThreshold ) then
			local current = repInfo.standing - repInfo.reactionThreshold;
			local max = repInfo.nextThreshold - repInfo.reactionThreshold;
			GameTooltip:AddLine(repInfo.reaction.." ("..current.." / "..max..")" , 1, 1, 1, true)
		else
			GameTooltip:AddLine(repInfo.reaction, 1, 1, 1, true)
		end
		GameTooltip:Show()
	end
end

function CfReputationDetailMainScreenCheckBox_OnClick(self)
	if ( self:GetChecked() ) then
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
		SetWatchedFactionIndex(GetSelectedFaction())
	else
		PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_OFF)
		SetWatchedFactionIndex(0)
	end
end

ReputationFrame.ScrollBox:Hide()
ReputationFrame.ScrollBar:Hide()
ReputationFrameFactionLabel:Hide()
ReputationFrameStandingLabel:Hide()

ReputationFrame:HookScript("OnShow", function()
	CfReputationFrame:Show()
end)

ReputationFrame:HookScript("OnHide", function()
	CfReputationFrame:Hide()
end)