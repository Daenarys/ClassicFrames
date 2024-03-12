if not _G.SettingsPanel then return end

ApplyCloseButton(SettingsPanel.ClosePanelButton)
ApplyTitleBg(SettingsPanel)
ApplyNineSliceNoPortrait(SettingsPanel)

SettingsPanel.CloseButton:Hide()

SettingsPanel.Bg:ClearAllPoints()
SettingsPanel.Bg:SetPoint("TOPLEFT", SettingsPanel, "TOPLEFT", 1, -18)
SettingsPanel.Bg:SetPoint("BOTTOMRIGHT", SettingsPanel, "BOTTOMRIGHT", -3, 3)

SettingsPanel.Container.SettingsList.ScrollBar:SetSize(25, 560)
SettingsPanel.Container.SettingsList.ScrollBar:ClearAllPoints()
SettingsPanel.Container.SettingsList.ScrollBar:SetPoint("TOPLEFT", SettingsPanel.Container.SettingsList.ScrollBox, "TOPRIGHT", -4, 2)
SettingsPanel.Container.SettingsList.ScrollBar:SetPoint("BOTTOMLEFT", SettingsPanel.Container.SettingsList.ScrollBox, "BOTTOMRIGHT", -1, 0)

if (SettingsPanel.Container.SettingsList.ScrollBar.BG == nil) then
	SettingsPanel.Container.SettingsList.ScrollBar.BG = SettingsPanel.Container.SettingsList.ScrollBar:CreateTexture(nil, "BACKGROUND");
	SettingsPanel.Container.SettingsList.ScrollBar.BG:SetColorTexture(0, 0, 0, .1)
	SettingsPanel.Container.SettingsList.ScrollBar.BG:SetAllPoints()
end

SettingsPanel.Container.SettingsList.ScrollBar.Track:SetWidth(18)
SettingsPanel.Container.SettingsList.ScrollBar.Track:ClearAllPoints()
SettingsPanel.Container.SettingsList.ScrollBar.Track:SetPoint("TOPLEFT", 4, -22)
SettingsPanel.Container.SettingsList.ScrollBar.Track:SetPoint("BOTTOMRIGHT", -4, 22)

SettingsPanel.Container.SettingsList.ScrollBar.Track.Begin:Hide()
SettingsPanel.Container.SettingsList.ScrollBar.Track.End:Hide()
SettingsPanel.Container.SettingsList.ScrollBar.Track.Middle:Hide()

ApplyScrollBarArrow(SettingsPanel.Container.SettingsList.ScrollBar)
ApplyScrollBarThumb(SettingsPanel.Container.SettingsList.ScrollBar.Track.Thumb)

hooksecurefunc(SettingsPanel.Container.SettingsList.ScrollBox, 'Update', function(frame)
	for _, child in next, { frame.ScrollTarget:GetChildren() } do
		if child.CheckBox then
			child.CheckBox:SetNormalTexture("Interface\\Buttons\\UI-CheckBox-Up")
			child.CheckBox:SetPushedTexture("Interface\\Buttons\\UI-CheckBox-Down")
			child.CheckBox:SetHighlightTexture("Interface\\Buttons\\UI-CheckBox-Highlight")
			child.CheckBox:SetCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check")
			child.CheckBox:SetDisabledCheckedTexture("Interface\\Buttons\\UI-CheckBox-Check-Disabled")
		end
	end
end)

_G.SettingsPanel:HookScript("OnShow", function(self)
	self:ClearAllPoints()
	self:SetPoint("CENTER", 0, 5)
end)