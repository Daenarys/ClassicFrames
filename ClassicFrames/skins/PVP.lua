local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_PVPUI" then
		HonorFrame.SpecificScrollBar:SetSize(25, 560)
		HonorFrame.SpecificScrollBar:ClearAllPoints()
		HonorFrame.SpecificScrollBar:SetPoint("TOPLEFT", HonorFrame.SpecificScrollBox, "TOPRIGHT", -2, 3)
		HonorFrame.SpecificScrollBar:SetPoint("BOTTOMLEFT", HonorFrame.SpecificScrollBox, "BOTTOMRIGHT", 1, -1)

		ApplyScrollBarArrow(HonorFrame.SpecificScrollBar)
		ApplyScrollBarTrack(HonorFrame.SpecificScrollBar.Track)
		ApplyScrollBarThumb(HonorFrame.SpecificScrollBar.Track.Thumb)

		for _, roleButton in pairs({
			_G.HonorFrame.DPSIcon,
			_G.HonorFrame.HealerIcon,
			_G.HonorFrame.TankIcon,
			_G.ConquestFrame.DPSIcon,
			_G.ConquestFrame.HealerIcon,
			_G.ConquestFrame.TankIcon,
		}) do
			local checkButton = roleButton.checkButton or roleButton.CheckButton

			checkButton:SetSize(24, 24)
			checkButton:SetScale(1)
			checkButton:ClearAllPoints()
			checkButton:SetPoint("BOTTOMLEFT", -5, -5)
			checkButton:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
			checkButton:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
			checkButton:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
			checkButton:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
			checkButton:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
		end

		HonorFrame.DPSIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorFrame.DPSIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))
		HonorFrame.DPSIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorFrame.DPSIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))
		ConquestFrame.DPSIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		ConquestFrame.DPSIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))
		ConquestFrame.DPSIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		ConquestFrame.DPSIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("DAMAGER"))

		HonorFrame.HealerIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorFrame.HealerIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))
		HonorFrame.HealerIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorFrame.HealerIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))
		ConquestFrame.HealerIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		ConquestFrame.HealerIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))
		ConquestFrame.HealerIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		ConquestFrame.HealerIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("HEALER"))

		HonorFrame.TankIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorFrame.TankIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("TANK"))
		HonorFrame.TankIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		HonorFrame.TankIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("TANK"))
		ConquestFrame.TankIcon:SetNormalTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		ConquestFrame.TankIcon:GetNormalTexture():SetTexCoord(GetTexCoordsForRole("TANK"))
		ConquestFrame.TankIcon:SetDisabledTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
		ConquestFrame.TankIcon:GetDisabledTexture():SetTexCoord(GetTexCoordsForRole("TANK"))

		ApplyDropDown(HonorFrameTypeDropdown)

		if not PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest then
			PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest = CreateFrame("Frame", nil, PVPQueueFrame.HonorInset.CasualPanel)
			PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest:SetFrameLevel(3)
			PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest:SetSize(84, 70)
			PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest:SetPoint("TOP", 0, -48)
			PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest:Hide()

			Mixin(PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest, WeeklyRewardMixin)

			if (PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest.FlairTexture == nil) then
				PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest.FlairTexture = PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest:CreateTexture(nil, "BACKGROUND")
				PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest.FlairTexture:SetSize(187, 152)
				PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest.FlairTexture:SetAtlas("pvpqueue-chest-background")
				PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest.FlairTexture:SetPoint("CENTER")
			end

			if (PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest.ChestTexture == nil) then
				PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest.ChestTexture = PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest:CreateTexture(nil, "ARTWORK")
				PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest.ChestTexture:SetPoint("CENTER")
			end

			if (PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest.Highlight == nil) then
				PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest.Highlight = PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest:CreateTexture(nil, "HIGHLIGHT")
				PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest.Highlight:SetBlendMode("ADD")
				PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest.Highlight:SetAlpha(0.2)
				PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest.Highlight:SetPoint("CENTER")
			end

			if C_WeeklyRewards.HasAvailableRewards() then
				PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest.ChestTexture:SetAtlas("pvpqueue-chest-greatvault-collect", true)
				PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest.Highlight:SetAtlas("pvpqueue-chest-greatvault-collect", true)
			elseif PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest:HasUnlockedRewards() then
				PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest.ChestTexture:SetAtlas("pvpqueue-chest-greatvault-complete", true)
				PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest.Highlight:SetAtlas("pvpqueue-chest-greatvault-complete", true)
			else
				PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest.ChestTexture:SetAtlas("pvpqueue-chest-greatvault-incomplete", true)
				PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest.Highlight:SetAtlas("pvpqueue-chest-greatvault-incomplete", true)
			end

			PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest:SetScript("OnEnter", function(self)
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip_SetTitle(GameTooltip, GREAT_VAULT_REWARDS)
				local hasRewards = C_WeeklyRewards.HasAvailableRewards()
				if hasRewards then
					GameTooltip_AddColoredLine(GameTooltip, GREAT_VAULT_REWARDS_WAITING, GREEN_FONT_COLOR)
					GameTooltip_AddBlankLineToTooltip(GameTooltip)
				end
				GameTooltip_AddInstructionLine(GameTooltip, WEEKLY_REWARDS_CLICK_TO_PREVIEW_INSTRUCTIONS)
				GameTooltip:Show()
			end)
			PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest:SetScript("OnLeave", GameTooltip_Hide)
			PVPQueueFrame.HonorInset.CasualPanel.WeeklyChest:SetScript("OnMouseUp", function(self, ...)
				if not ConquestFrame_HasActiveSeason() or InCombatLockdown() then
					return
				end
				WeeklyRewardMixin.OnMouseUp(self, ...)
			end)
		end

		PVPQueueFrame.HonorInset.CasualPanel:HookScript("OnShow", function(self)
			local Label = self.HKLabel
			if(UnitLevel("player") < GetMaxLevelForExpansionLevel(LE_EXPANSION_WAR_WITHIN)) then
				Label:Hide()
				self.WeeklyChest:Hide()
				self.HonorLevelDisplay:SetPoint("TOP", 0, -25)
			else
				Label:SetText(RATED_PVP_WEEKLY_VAULT)
				Label:SetPoint("TOP", 0, -12)
				Label:Show()
				self.WeeklyChest:Show()
				self.HonorLevelDisplay:SetPoint("TOP", self.WeeklyChest, "BOTTOM", 0, -90)
			end
		end)

		if not PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest then
			PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest = CreateFrame("Frame", nil, PVPQueueFrame.HonorInset.RatedPanel)
			PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest:SetFrameLevel(3)
			PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest:SetSize(84, 70)
			PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest:SetPoint("TOP", 0, -48)
			PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest:Hide()

			Mixin(PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest, WeeklyRewardMixin)

			if (PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest.FlairTexture == nil) then
				PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest.FlairTexture = PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest:CreateTexture(nil, "BACKGROUND")
				PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest.FlairTexture:SetSize(187, 152)
				PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest.FlairTexture:SetAtlas("pvpqueue-chest-background")
				PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest.FlairTexture:SetPoint("CENTER")
			end

			if (PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest.ChestTexture == nil) then
				PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest.ChestTexture = PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest:CreateTexture(nil, "ARTWORK")
				PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest.ChestTexture:SetPoint("CENTER")
			end

			if (PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest.Highlight == nil) then
				PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest.Highlight = PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest:CreateTexture(nil, "HIGHLIGHT")
				PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest.Highlight:SetBlendMode("ADD")
				PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest.Highlight:SetAlpha(0.2)
				PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest.Highlight:SetPoint("CENTER")
			end

			if (PVPQueueFrame.HonorInset.RatedPanel.Label == nil) then
				PVPQueueFrame.HonorInset.RatedPanel.Label = PVPQueueFrame.HonorInset.RatedPanel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
				PVPQueueFrame.HonorInset.RatedPanel.Label:SetPoint("TOP", 0, -12)
				PVPQueueFrame.HonorInset.RatedPanel.Label:Hide()
			end

			if C_WeeklyRewards.HasAvailableRewards() then
				PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest.ChestTexture:SetAtlas("pvpqueue-chest-greatvault-collect", true)
				PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest.Highlight:SetAtlas("pvpqueue-chest-greatvault-collect", true)
			elseif PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest:HasUnlockedRewards() then
				PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest.ChestTexture:SetAtlas("pvpqueue-chest-greatvault-complete", true)
				PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest.Highlight:SetAtlas("pvpqueue-chest-greatvault-complete", true)
			else
				PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest.ChestTexture:SetAtlas("pvpqueue-chest-greatvault-incomplete", true)
				PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest.Highlight:SetAtlas("pvpqueue-chest-greatvault-incomplete", true)
			end

			PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest:SetScript("OnEnter", function(self)
				GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
				GameTooltip_SetTitle(GameTooltip, GREAT_VAULT_REWARDS)
				local hasRewards = C_WeeklyRewards.HasAvailableRewards()
				if hasRewards then
					GameTooltip_AddColoredLine(GameTooltip, GREAT_VAULT_REWARDS_WAITING, GREEN_FONT_COLOR)
					GameTooltip_AddBlankLineToTooltip(GameTooltip)
				end
				GameTooltip_AddInstructionLine(GameTooltip, WEEKLY_REWARDS_CLICK_TO_PREVIEW_INSTRUCTIONS)
				GameTooltip:Show()
			end)
			PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest:SetScript("OnLeave", GameTooltip_Hide)
			PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest:SetScript("OnMouseUp", function(self, ...)
				if not ConquestFrame_HasActiveSeason() or InCombatLockdown() then
					return
				end
				WeeklyRewardMixin.OnMouseUp(self, ...)
			end)
		end

		PVPQueueFrame.HonorInset.RatedPanel:HookScript("OnShow", function(self)
			local Tier = self.Tier
			local Label = self.Label
			if(UnitLevel("player") < GetMaxLevelForExpansionLevel(LE_EXPANSION_WAR_WITHIN)) then
				Label:Hide()
				self.HonorLevelDisplay:Show()
				self.WeeklyChest:Hide()
			else
				Label:SetText(RATED_PVP_WEEKLY_VAULT)
				Label:Show()
				self.HonorLevelDisplay:Hide()
				self.WeeklyChest:Show()
			end
		end)
		PVPQueueFrame.HonorInset.RatedPanel.Tier:SetPoint("TOP", PVPQueueFrame.HonorInset.RatedPanel.WeeklyChest, "BOTTOM", 0, -90)
		PVPQueueFrame.HonorInset.RatedPanel.Tier:SetSize(50, 50)
		PVPQueueFrame.HonorInset.RatedPanel.Tier.Icon:SetSize(50, 50)
	end
end)

ApplyDialogBorder(PVPReadyDialog.Border)

PVPReadyDialogCloseButton:SetSize(32, 32)
PVPReadyDialogCloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
PVPReadyDialogCloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-HideButton-Up")
PVPReadyDialogCloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-HideButton-Down")
PVPReadyDialogCloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
PVPReadyDialogCloseButton:ClearAllPoints()
PVPReadyDialogCloseButton:SetPoint("TOPRIGHT", -2, -2)

PVPReadyDialogBottomArt:SetSize(287, 72)
PVPReadyDialogBottomArt:SetTexture("Interface\\LFGFrame\\UI-LFG-FILIGREE")
PVPReadyDialogBottomArt:SetTexCoord(0, 0.5605, 0, 0.5625)
PVPReadyDialogBottomArt:ClearAllPoints()
PVPReadyDialogBottomArt:SetPoint("BOTTOM", 0, 55)

if (PVPReadyDialogFiligree == nil) then
	PVPReadyDialog:CreateTexture("PVPReadyDialogFiligree", "OVERLAY")
	PVPReadyDialogFiligree:SetTexture("Interface\\LFGFrame\\UI-LFG-FILIGREE")
	PVPReadyDialogFiligree:SetTexCoord(0.02734, 0.59765, 0.578125, 1.0)
	PVPReadyDialogFiligree:SetSize(292, 54)
	PVPReadyDialogFiligree:SetPoint("TOPLEFT", 7, -3)
end

hooksecurefunc('PVPReadyDialog_Display', function(self, _, _, isRated, queueType, _, role)
	if ( PVPHelper_QueueNeedsRoles(queueType, isRated) ) then
		self.bottomArt:SetTexCoord(0.0, 0.5605, 0.0, 0.5625)
	else
		self.bottomArt:SetTexCoord(0.0, 0.18, 0.0, 0.5625)
	end

	self.roleIcon.texture:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
	self.roleIcon.texture:SetTexCoord(GetTexCoordsForRole(role))
end)

PVPReadyPopup.RolelessButton.Texture:SetTexture("Interface\\LFGFrame\\UI-LFG-ICON-ROLES")
PVPReadyPopup.RolelessButton.Texture:SetTexCoord(0.5234375, 0.78125, 0, 0.2578125)

PVPMatchScoreboard.CloseButton:SetSize(32, 32)
PVPMatchScoreboard.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
PVPMatchScoreboard.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
PVPMatchScoreboard.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
PVPMatchScoreboard.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
PVPMatchScoreboard.CloseButton:ClearAllPoints()
PVPMatchScoreboard.CloseButton:SetPoint("TOPRIGHT", 3.6, 3)

PVPMatchScoreboard.Content.ScrollBar:SetSize(25, 560)
PVPMatchScoreboard.Content.ScrollBar:ClearAllPoints()
PVPMatchScoreboard.Content.ScrollBar:SetPoint("TOPLEFT", PVPMatchScoreboard.Content, "TOPRIGHT", -25, -2)
PVPMatchScoreboard.Content.ScrollBar:SetPoint("BOTTOMLEFT", PVPMatchScoreboard.Content, "BOTTOMRIGHT", -25, 40)

ApplyScrollBarArrow(PVPMatchScoreboard.Content.ScrollBar)
ApplyScrollBarTrack(PVPMatchScoreboard.Content.ScrollBar.Track)
ApplyScrollBarThumb(PVPMatchScoreboard.Content.ScrollBar.Track.Thumb)

PVPScoreboardTab1:ClearAllPoints()
PVPScoreboardTab1:SetPoint("TOPLEFT", 0, 50)
PVPScoreboardTab2:ClearAllPoints()
PVPScoreboardTab2:SetPoint("LEFT", PVPScoreboardTab1, "RIGHT", -14, 0)
PVPScoreboardTab3:ClearAllPoints()
PVPScoreboardTab3:SetPoint("LEFT", PVPScoreboardTab2, "RIGHT", -14, 0)

for i = 1, 3 do
	ApplyBottomTab(_G['PVPScoreboardTab'..i])

	_G["PVPScoreboardTab"..i]:HookScript("OnShow", function(self)
		PVPScoreboardTab1:SetWidth(60 + PVPScoreboardTab1:GetFontString():GetStringWidth())
		PVPScoreboardTab2:SetWidth(40 + PVPScoreboardTab2:GetFontString():GetStringWidth())
		PVPScoreboardTab3:SetWidth(40 + PVPScoreboardTab3:GetFontString():GetStringWidth())
	end)
end

PVPMatchScoreboard:HookScript("OnShow", function(self)
	self:ClearAllPoints()
	self:SetPoint("CENTER")
end)

PVPMatchResults.CloseButton:SetSize(32, 32)
PVPMatchResults.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
PVPMatchResults.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
PVPMatchResults.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
PVPMatchResults.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
PVPMatchResults.CloseButton:ClearAllPoints()
PVPMatchResults.CloseButton:SetPoint("TOPRIGHT", 3.6, 3)

PVPMatchResults.content.scrollBar:SetSize(25, 560)
PVPMatchResults.content.scrollBar:ClearAllPoints()
PVPMatchResults.content.scrollBar:SetPoint("TOPLEFT", PVPMatchResults.content, "TOPRIGHT", -25, -3)
PVPMatchResults.content.scrollBar:SetPoint("BOTTOMLEFT", PVPMatchResults.content, "BOTTOMRIGHT", -25, 122)

ApplyScrollBarArrow(PVPMatchResults.content.scrollBar)
ApplyScrollBarTrack(PVPMatchResults.content.scrollBar.Track)
ApplyScrollBarThumb(PVPMatchResults.content.scrollBar.Track.Thumb)

PVPScoreFrameTab1:ClearAllPoints()
PVPScoreFrameTab1:SetPoint("TOPLEFT", 0, 50)
PVPScoreFrameTab2:ClearAllPoints()
PVPScoreFrameTab2:SetPoint("LEFT", PVPScoreFrameTab1, "RIGHT", -14, 0)
PVPScoreFrameTab3:ClearAllPoints()
PVPScoreFrameTab3:SetPoint("LEFT", PVPScoreFrameTab2, "RIGHT", -14, 0)

for i = 1, 3 do
	ApplyBottomTab(_G['PVPScoreFrameTab'..i])

	_G["PVPScoreFrameTab"..i]:HookScript("OnShow", function(self)
		PVPScoreFrameTab1:SetWidth(60 + PVPScoreFrameTab1:GetFontString():GetStringWidth())
		PVPScoreFrameTab2:SetWidth(40 + PVPScoreFrameTab2:GetFontString():GetStringWidth())
		PVPScoreFrameTab3:SetWidth(40 + PVPScoreFrameTab3:GetFontString():GetStringWidth())
	end)
end

PVPMatchResults:HookScript("OnShow", function(self)
	self:ClearAllPoints()
	self:SetPoint("CENTER")
end)

ReadyStatus.CloseButton:SetSize(32, 32)
ReadyStatus.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
ReadyStatus.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-HideButton-Up")
ReadyStatus.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-HideButton-Down")
ReadyStatus.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
ReadyStatus.CloseButton:ClearAllPoints()
ReadyStatus.CloseButton:SetPoint("TOPRIGHT", -2, -2)

ApplyDialogBorder(ReadyStatus.Border)