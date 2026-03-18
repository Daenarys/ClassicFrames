local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_ArtifactUI" then
		ArtifactFrame.CloseButton:SetSize(32, 32)
		ArtifactFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		ArtifactFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		ArtifactFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		ArtifactFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		ArtifactFrame.CloseButton:ClearAllPoints()
		ArtifactFrame.CloseButton:SetPoint("TOPRIGHT", 8, 7)

		ArtifactFrameTab2:ClearAllPoints()
		ArtifactFrameTab2:SetPoint("LEFT", ArtifactFrameTab1, "RIGHT", -15, 0)

		for i = 1, 2 do
			ApplyBottomTab(_G['ArtifactFrameTab'..i])

			_G["ArtifactFrameTab"..i]:HookScript("OnShow", function(self)
				if _G["ArtifactFrameTab"..i] == ArtifactFrameTab1 then
					self:SetWidth(46 + self:GetFontString():GetStringWidth())
				elseif _G["ArtifactFrameTab"..i] == ArtifactFrameTab2 then
					self:SetWidth(40 + self:GetFontString():GetStringWidth())
				end
			end)
		end
	elseif name == "Blizzard_RemixArtifactUI" then
		ApplyCloseButton(RemixArtifactFrame.CloseButton)
	end
end)