hooksecurefunc('UIDropDownMenu_CreateFrames', function(level)
	local listFrame = _G['DropDownList'..level]
	local listFrameName = listFrame:GetName()

	local Backdrop = _G[listFrameName..'Backdrop']
	if Backdrop then
		ApplyDialogBorder(Backdrop)
	end
end)