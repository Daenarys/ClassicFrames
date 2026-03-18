local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_AdventureMap" then
		AdventureMapQuestChoiceDialog.CloseButton:SetSize(32, 32)
		AdventureMapQuestChoiceDialog.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		AdventureMapQuestChoiceDialog.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		AdventureMapQuestChoiceDialog.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		AdventureMapQuestChoiceDialog.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		AdventureMapQuestChoiceDialog.CloseButton:ClearAllPoints()
		AdventureMapQuestChoiceDialog.CloseButton:SetPoint("TOPRIGHT", 3, -10)

		AdventureMapQuestChoiceDialog.AcceptButton:SetPoint("BOTTOMLEFT", 6, 2)
		AdventureMapQuestChoiceDialog.DeclineButton:SetPoint("BOTTOMRIGHT", -6, 2)

		AdventureMapQuestChoiceDialog.Details.ScrollBar:SetWidth(20)
		AdventureMapQuestChoiceDialog.Details.ScrollBar:ClearAllPoints()
		AdventureMapQuestChoiceDialog.Details.ScrollBar:SetPoint("TOPLEFT", AdventureMapQuestChoiceDialog.Details, "TOPRIGHT", 0, -20)
		AdventureMapQuestChoiceDialog.Details.ScrollBar:SetPoint("BOTTOMLEFT", AdventureMapQuestChoiceDialog.Details, "BOTTOMRIGHT", 0, 10)

		if (AdventureMapQuestChoiceDialog.Details.ScrollBar.BG == nil) then
			AdventureMapQuestChoiceDialog.Details.ScrollBar.BG = AdventureMapQuestChoiceDialog.Details.ScrollBar:CreateTexture(nil, "BACKGROUND")
			AdventureMapQuestChoiceDialog.Details.ScrollBar.BG:SetColorTexture(0, 0, 0, .25)
			AdventureMapQuestChoiceDialog.Details.ScrollBar.BG:SetAllPoints()
		end

		AdventureMapQuestChoiceDialog.Details.ScrollBar.Track.Begin:Hide()
		AdventureMapQuestChoiceDialog.Details.ScrollBar.Track.End:Hide()
		AdventureMapQuestChoiceDialog.Details.ScrollBar.Track.Middle:Hide()

		ApplyScrollBarThumb(AdventureMapQuestChoiceDialog.Details.ScrollBar.Track.Thumb)

		AdventureMapQuestChoiceDialog.Details.ScrollBar.Back:SetSize(18, 16)
		AdventureMapQuestChoiceDialog.Details.ScrollBar.Back:SetNormalAtlas("UI-ScrollBar-ScrollUpButton-Up")
		AdventureMapQuestChoiceDialog.Details.ScrollBar.Back:SetPushedAtlas("UI-ScrollBar-ScrollUpButton-Down")
		AdventureMapQuestChoiceDialog.Details.ScrollBar.Back:SetDisabledAtlas("UI-ScrollBar-ScrollUpButton-Disabled")
		AdventureMapQuestChoiceDialog.Details.ScrollBar.Back:SetHighlightAtlas("UI-ScrollBar-ScrollUpButton-Highlight")

		AdventureMapQuestChoiceDialog.Details.ScrollBar.Forward:SetSize(18, 16)
		AdventureMapQuestChoiceDialog.Details.ScrollBar.Forward:SetNormalAtlas("UI-ScrollBar-ScrollDownButton-Up")
		AdventureMapQuestChoiceDialog.Details.ScrollBar.Forward:SetPushedAtlas("UI-ScrollBar-ScrollDownButton-Down")
		AdventureMapQuestChoiceDialog.Details.ScrollBar.Forward:SetDisabledAtlas("UI-ScrollBar-ScrollDownButton-Disabled")
		AdventureMapQuestChoiceDialog.Details.ScrollBar.Forward:SetHighlightAtlas("UI-ScrollBar-ScrollDownButton-Highlight")

		hooksecurefunc(AdventureMapQuestChoiceDialog, "RefreshDetails", function()
			AdventureMapQuestChoiceDialog.Background:SetTexture("Interface\\Addons\\ClassicFrames\\icons\\AdventureMap")
			AdventureMapQuestChoiceDialog.Background:SetTexCoord(0.000976562, 0.34375, 0.000976562, 0.428711)
		end)
	end
end)