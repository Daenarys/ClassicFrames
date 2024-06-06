local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(self, event, name)
	if name == "Blizzard_DelvesDifficultyPicker" then
		ApplyDialogBorder(DelvesDifficultyPickerFrame.Border)

		DelvesDifficultyPickerFrame.CloseButton:SetSize(32, 32)
		DelvesDifficultyPickerFrame.CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
		DelvesDifficultyPickerFrame.CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
		DelvesDifficultyPickerFrame.CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
		DelvesDifficultyPickerFrame.CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
		DelvesDifficultyPickerFrame.CloseButton:ClearAllPoints()
		DelvesDifficultyPickerFrame.CloseButton:SetPoint("TOPRIGHT", 4, 4)

		if (DelvesDifficultyPickerFrame.Corner == nil) then
			DelvesDifficultyPickerFrame.Corner = DelvesDifficultyPickerFrame:CreateTexture(nil, "OVERLAY")
			DelvesDifficultyPickerFrame.Corner:SetSize(32, 32)
			DelvesDifficultyPickerFrame.Corner:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Corner")
			DelvesDifficultyPickerFrame.Corner:SetPoint("TOPRIGHT")
		end

		DelvesDifficultyPickerFrame:HookScript("OnShow", function(self)
			self:ClearAllPoints()
			self:SetPoint("CENTER", 0, 50)
		end)
	end
end)