local function CreateMoneyButtonNormalTexture(button, iconWidth)
	if not button then
		return;
	end
	local texture = button:CreateTexture();
	texture:SetTexture("Interface\\MoneyFrame\\UI-MoneyIcons");
	texture:SetWidth(iconWidth);
	texture:SetHeight(iconWidth);
	texture:SetPoint("RIGHT");
	button:SetNormalTexture(texture);
	
	return texture;
end

hooksecurefunc("MoneyFrame_Update", function(frameName, money)
	local frame;
	if ( type(frameName) == "table" ) then
		frame = frameName;
		frameName = frame:GetName();
	else
		frame = _G[frameName];
	end

	local goldButton = frame.GoldButton;
	local silverButton = frame.SilverButton;
	local copperButton = frame.CopperButton;

	local iconWidth = MONEY_ICON_WIDTH;
	local spacing = MONEY_BUTTON_SPACING;
	if ( frame.small ) then
		iconWidth = MONEY_ICON_WIDTH_SMALL;
		spacing = MONEY_BUTTON_SPACING_SMALL;
	end

	local texture = CreateMoneyButtonNormalTexture(goldButton, iconWidth);
	texture:SetTexCoord(0, 0.25, 0, 1);
	texture = CreateMoneyButtonNormalTexture(silverButton, iconWidth);
	texture:SetTexCoord(0.25, 0.5, 0, 1);
	texture = CreateMoneyButtonNormalTexture(copperButton, iconWidth);
	texture:SetTexCoord(0.5, 0.75, 0, 1);
end)