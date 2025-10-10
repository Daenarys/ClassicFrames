if (C_AddOns.IsAddOnLoaded("Bagnon")) then return end

local NUM_CONTAINER_COLUMNS = 4;
local ROWS_IN_BG_TEXTURE = 5;
local MAX_MIDDLE_TEXTURES = 2;
local BG_TEXTURE_MIDDLE_START = 215;
local BG_TEXTURE_TOP_PLUS_TWO_START = 97;
local BG_TEXTURE_TOP_PLUS_TWO_END = 163;
local BG_TEXTURE_TOP_START = 2;
local BG_TEXTURE_TOP_END = 89;
local BG_TEXTURE_TOP_ONE_ROW_END = 86;
local BG_TEXTURE_HEIGHT = 512;
local CONTAINER_WIDTH = 192;
local CONTAINER_SPACING = 0;
local VISIBLE_CONTAINER_SPACING = 3;
local CONTAINER_SCALE = 0.75;
local BACKPACK_HEIGHT = 256;
local BACKPACK_BASE_HEIGHT = 256;
local BACKPACK_DEFAULT_TOPHEIGHT = 256;
local BACKPACK_EXTENDED_TOPHEIGHT = 226;
local BACKPACK_BASE_SIZE = 16;
local BACKPACK_TOKENFRAME_HEIGHT = 22;
local ROW_HEIGHT = 41;
local FIRST_BACKPACK_BUTTON_OFFSET_BASE = -225;
local CONTAINER_BOTTOM_TEXTURE_DEFAULT_START = 169;
local CONTAINER_BOTTOM_TEXTURE_DEFAULT_END = 179;
local CONTAINER_BOTTOM_TEXTURE_DEFAULT_HEIGHT = CONTAINER_BOTTOM_TEXTURE_DEFAULT_END - CONTAINER_BOTTOM_TEXTURE_DEFAULT_START;
local CONTAINER_BOTTOM_TEXTURE_DEFAULT_ROW_END = 172;
local CONTAINER_BOTTOM_TEXTURE_DEFAULT_ROW_HEIGHT = CONTAINER_BOTTOM_TEXTURE_DEFAULT_ROW_END - CONTAINER_BOTTOM_TEXTURE_DEFAULT_START;

if ContainerFrame1Portrait then
	ContainerFrame1Portrait:Hide()
end
if ContainerFrame1MoneyFrame.Border then
	ContainerFrame1MoneyFrame.Border:Hide()
end

for i = 1, _G.NUM_CONTAINER_FRAMES do
	_G['ContainerFrame'..i].NineSlice:Hide()
	_G['ContainerFrame'..i].Bg:Hide()

	_G['ContainerFrame'..i..'TitleText']:SetSize(112, 12)
	_G['ContainerFrame'..i..'TitleText']:ClearAllPoints()
	_G['ContainerFrame'..i..'TitleText']:SetPoint("TOPLEFT", _G['ContainerFrame'..i], 47, -10)
	_G['ContainerFrame'..i..'TitleText']:SetTextColor(255, 255, 255, 1)

	_G['ContainerFrame'..i..'Portrait']:SetSize(40, 40)
	_G['ContainerFrame'..i..'Portrait']:ClearAllPoints()
	_G['ContainerFrame'..i..'Portrait']:SetPoint("TOPLEFT", 7, -5)

	_G['ContainerFrame'..i].PortraitButton:SetSize(40, 40)
	_G['ContainerFrame'..i].PortraitButton:ClearAllPoints()
	_G['ContainerFrame'..i].PortraitButton:SetPoint("TOPLEFT", 7, -5)
	_G['ContainerFrame'..i].PortraitButton:SetHighlightTexture("bags-roundhighlight")
	_G['ContainerFrame'..i].PortraitButton:GetHighlightTexture():SetSize(36, 36)
	_G['ContainerFrame'..i].PortraitButton:GetHighlightTexture():ClearAllPoints()
	_G['ContainerFrame'..i].PortraitButton:GetHighlightTexture():SetPoint("CENTER", -3, 3)

	_G['ContainerFrame'..i].PortraitContainer:SetFrameLevel(0)
	_G['ContainerFrame'..i].PortraitContainer.CircleMask:Hide()

	_G['ContainerFrame'..i].CloseButton:SetSize(32, 32)
	_G['ContainerFrame'..i].CloseButton:SetDisabledTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Disabled")
	_G['ContainerFrame'..i].CloseButton:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
	_G['ContainerFrame'..i].CloseButton:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
	_G['ContainerFrame'..i].CloseButton:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight")
	_G['ContainerFrame'..i].CloseButton:ClearAllPoints()
	if _G['ContainerFrame'..i] == ContainerFrame1 then
		ContainerFrame1.CloseButton:SetPoint("TOPRIGHT", 0, -1)
	else
		_G['ContainerFrame'..i].CloseButton:SetPoint("TOPRIGHT")
	end

	if not (_G['ContainerFrame'..i..'BackgroundTop']) then
		_G['ContainerFrame'..i]:CreateTexture('ContainerFrame'..i..'BackgroundTop', "ARTWORK")
		_G['ContainerFrame'..i..'BackgroundTop']:SetSize(256, 512)
		_G['ContainerFrame'..i..'BackgroundTop']:SetTexture("Interface\\ContainerFrame\\UI-Bag-Components")
		_G['ContainerFrame'..i..'BackgroundTop']:SetPoint("TOPRIGHT", 0, 0)
	end

	if not (_G['ContainerFrame'..i..'BackgroundMiddle1']) then
		_G['ContainerFrame'..i]:CreateTexture('ContainerFrame'..i..'BackgroundMiddle1', "ARTWORK")
		_G['ContainerFrame'..i..'BackgroundMiddle1']:SetSize(256, 512)
		_G['ContainerFrame'..i..'BackgroundMiddle1']:SetTexture("Interface\\ContainerFrame\\UI-Bag-Components")
		_G['ContainerFrame'..i..'BackgroundMiddle1']:SetTexCoord(0, 1, 0.3515625, 0.8515625)
		_G['ContainerFrame'..i..'BackgroundMiddle1']:SetPoint("TOP", _G['ContainerFrame'..i..'BackgroundTop'], "BOTTOM")
	end

	if not (_G['ContainerFrame'..i..'BackgroundMiddle2']) then
		_G['ContainerFrame'..i]:CreateTexture('ContainerFrame'..i..'BackgroundMiddle2', "ARTWORK")
		_G['ContainerFrame'..i..'BackgroundMiddle2']:SetSize(256, 256)
		_G['ContainerFrame'..i..'BackgroundMiddle2']:SetTexture("Interface\\ContainerFrame\\UI-Bag-Components")
		_G['ContainerFrame'..i..'BackgroundMiddle2']:SetTexCoord(0, 1, 0.353515625, 0.8515625)
		_G['ContainerFrame'..i..'BackgroundMiddle2']:SetPoint("TOP", _G['ContainerFrame'..i..'BackgroundMiddle1'], "BOTTOM")
		_G['ContainerFrame'..i..'BackgroundMiddle2']:Hide()
	end

	if not (_G['ContainerFrame'..i..'BackgroundBottom']) then
		_G['ContainerFrame'..i]:CreateTexture('ContainerFrame'..i..'BackgroundBottom', "ARTWORK")
		_G['ContainerFrame'..i..'BackgroundBottom']:SetSize(256, 10)
		_G['ContainerFrame'..i..'BackgroundBottom']:SetTexture("Interface\\ContainerFrame\\UI-Bag-Components")
		_G['ContainerFrame'..i..'BackgroundBottom']:SetTexCoord(0, 1, 0.330078125, 0.349609375)
		_G['ContainerFrame'..i..'BackgroundBottom']:SetPoint("TOP", _G['ContainerFrame'..i..'BackgroundMiddle1'], "BOTTOM")
	end

	hooksecurefunc(_G['ContainerFrame'..i], "UpdateItemLayout", function(self)
		for i, itemButton in self:EnumerateValidItems() do
			itemButton.emptyBackgroundAtlas = nil
		end
	end)
end

hooksecurefunc("ContainerFrame_GenerateFrame", function(frame, size, id)
	local name = frame:GetName()
	local bgTextureTop = _G[name.."BackgroundTop"];
	local bgTextureMiddle = _G[name.."BackgroundMiddle1"];
	local bgTextureMiddle2 = _G[name.."BackgroundMiddle2"];
	local bgTextureBottom = _G[name.."BackgroundBottom"];
	local bgTexture1Slot = _G[name.."Background1Slot"];
	local columns = NUM_CONTAINER_COLUMNS;
	local rows = frame:GetRows()
	local backpackFirstButtonOffset = FIRST_BACKPACK_BUTTON_OFFSET_BASE;

	-- if id = 0 then its the backpack
	if ( id == 0 ) then
		if ContainerFrameSettingsManager:IsUsingCombinedBags() then return end
		bgTexture1Slot:Hide()

		local extended = size > BACKPACK_BASE_SIZE;
		local extraRows = 0;

		bgTextureTop:SetTexture("Interface\\ContainerFrame\\UI-BackpackBackground")
		if (extended) then
			extraRows = math.ceil((size - BACKPACK_BASE_SIZE) / columns)
			bgTextureTop:SetHeight(BACKPACK_EXTENDED_TOPHEIGHT)
			bgTextureTop:SetTexCoord(0, 1, 0, BACKPACK_EXTENDED_TOPHEIGHT / BACKPACK_DEFAULT_TOPHEIGHT)
			backpackFirstButtonOffset = backpackFirstButtonOffset - (ROW_HEIGHT * extraRows)	
		else
			bgTextureTop:SetHeight(BACKPACK_DEFAULT_TOPHEIGHT)
			bgTextureTop:SetTexCoord(0, 1, 0, 1)
		end
		bgTextureTop:Show()
		bgTextureBottom:Hide()

		-- Hide unused textures
		for i=1, MAX_MIDDLE_TEXTURES do
			_G[name.."BackgroundMiddle"..i]:SetTexture("Interface\\ContainerFrame\\UI-Bag-Components")
			_G[name.."BackgroundMiddle"..i]:Hide()
		end

		local middleBgHeight = 0;

		if (extended) then
			local remainingRows = extraRows;

			-- Calculate the number of background textures we're going to need
			local bgTextureCount = ceil(remainingRows/ROWS_IN_BG_TEXTURE)
			local height;

			-- Try to cycle all the middle bg textures
			for i=1, bgTextureCount do
				bgTextureMiddle = _G[name.."BackgroundMiddle"..i];
				if ( remainingRows > ROWS_IN_BG_TEXTURE ) then
					-- If more rows left to draw than can fit in a texture then draw the max possible
					height = ROWS_IN_BG_TEXTURE * ROW_HEIGHT;
					remainingRows = remainingRows - ROWS_IN_BG_TEXTURE;
				else
					height = remainingRows * ROW_HEIGHT;
				end

				middleBgHeight = middleBgHeight + height;
				bgTextureMiddle:SetHeight(height)
				bgTextureMiddle:SetTexCoord(0, 1, BG_TEXTURE_MIDDLE_START / BG_TEXTURE_HEIGHT, ((BG_TEXTURE_MIDDLE_START + height) / BG_TEXTURE_HEIGHT) )
				bgTextureMiddle:Show()
			end
			
			-- Position and setup bottom texture
			bgTextureBottom:SetPoint("TOP", bgTextureMiddle:GetName(), "BOTTOM", 0, 0)
			bgTextureBottom:SetTexture("Interface\\ContainerFrame\\UI-BackpackBackground")
			bgTextureBottom:SetHeight(BACKPACK_DEFAULT_TOPHEIGHT - BACKPACK_EXTENDED_TOPHEIGHT)
			bgTextureBottom:SetTexCoord(0, 1, BACKPACK_EXTENDED_TOPHEIGHT / BACKPACK_DEFAULT_TOPHEIGHT, 1)
			bgTextureBottom:Show()
		end

		BACKPACK_HEIGHT = BACKPACK_BASE_HEIGHT + middleBgHeight;
		local tokenFrame = ContainerFrameSettingsManager:GetTokenTrackerIfShown(frame)
		if tokenFrame then
			if not tokenFrame.BG then
				tokenFrame.BG = tokenFrame:CreateTexture(nil, "BACKGROUND")
				tokenFrame.BG:SetTexture("Interface\\ContainerFrame\\UI-Backpack-TokenFrame")
				tokenFrame.BG:SetSize(256, 32)
				tokenFrame.BG:ClearAllPoints()
				tokenFrame.BG:SetPoint("TOPLEFT")
			end
			tokenFrame:SetSize(183, 32)
			tokenFrame.Border:Hide()
			frame:SetHeight(BACKPACK_HEIGHT+BACKPACK_TOKENFRAME_HEIGHT)
		else
			frame:SetHeight(BACKPACK_HEIGHT)
		end
	else
		bgTextureBottom:SetHeight(CONTAINER_BOTTOM_TEXTURE_DEFAULT_HEIGHT)
		bgTextureBottom:SetTexCoord(0, 1, CONTAINER_BOTTOM_TEXTURE_DEFAULT_START / BG_TEXTURE_HEIGHT, CONTAINER_BOTTOM_TEXTURE_DEFAULT_END / BG_TEXTURE_HEIGHT)
		if (size == 1) then
			-- Halloween gag gift
			bgTexture1Slot:Show()
			bgTextureTop:Hide()
			bgTextureMiddle:Hide()
			bgTextureMiddle2:Hide()
			bgTextureBottom:Hide()
		else
			bgTexture1Slot:Hide()
			bgTextureTop:Show()
			
			-- Set textures
			bgTextureTop:SetTexture("Interface\\ContainerFrame\\UI-Bag-Components")
			for i=1, MAX_MIDDLE_TEXTURES do
				_G[name.."BackgroundMiddle"..i]:SetTexture("Interface\\ContainerFrame\\UI-Bag-Components")
				_G[name.."BackgroundMiddle"..i]:Hide()
			end
			bgTextureBottom:SetTexture("Interface\\ContainerFrame\\UI-Bag-Components")
						
			local bgTextureCount, height;
			-- Subtract one, since the top texture contains one row already
			local remainingRows = rows-1;

			-- See if the bag needs the texture with two slots at the top
			local isPlusTwoBag;
			if ( mod(size,columns) == 2 ) then
				isPlusTwoBag = 1;
			end

			-- Bag background display stuff
			if ( isPlusTwoBag ) then
				bgTextureTop:SetTexCoord(0, 1, BG_TEXTURE_TOP_PLUS_TWO_START / BG_TEXTURE_HEIGHT, BG_TEXTURE_TOP_PLUS_TWO_END / BG_TEXTURE_HEIGHT)
				bgTextureTop:SetHeight(BG_TEXTURE_TOP_PLUS_TWO_END - BG_TEXTURE_TOP_PLUS_TWO_START)
			else
				if ( rows == 1 ) then
					-- If only one row chop off the bottom of the texture
					bgTextureTop:SetTexCoord(0, 1, BG_TEXTURE_TOP_START / BG_TEXTURE_HEIGHT, BG_TEXTURE_TOP_ONE_ROW_END / BG_TEXTURE_HEIGHT)
					bgTextureTop:SetHeight(BG_TEXTURE_TOP_ONE_ROW_END - BG_TEXTURE_TOP_START)
				else
					bgTextureTop:SetTexCoord(0, 1, BG_TEXTURE_TOP_START / BG_TEXTURE_HEIGHT, BG_TEXTURE_TOP_END / BG_TEXTURE_HEIGHT)
					bgTextureTop:SetHeight(BG_TEXTURE_TOP_END - BG_TEXTURE_TOP_START)
				end
			end
			-- Calculate the number of background textures we're going to need
			bgTextureCount = ceil(remainingRows/ROWS_IN_BG_TEXTURE)
			
			local middleBgHeight = 0;
			-- If one row only special case
			if ( rows == 1 ) then
				bgTextureBottom:SetPoint("TOP", bgTextureMiddle:GetName(), "TOP", 0, 0)
				bgTextureBottom:Show()
				-- Hide middle bg textures
				for i=1, MAX_MIDDLE_TEXTURES do
					_G[name.."BackgroundMiddle"..i]:Hide()
				end
			else
				-- Try to cycle all the middle bg textures
				for i=1, bgTextureCount do
					bgTextureMiddle = _G[name.."BackgroundMiddle"..i];
					if ( remainingRows > ROWS_IN_BG_TEXTURE ) then
						-- If more rows left to draw than can fit in a texture then draw the max possible
						height = ROWS_IN_BG_TEXTURE * ROW_HEIGHT;
						remainingRows = remainingRows - ROWS_IN_BG_TEXTURE;
					else
						height = remainingRows * ROW_HEIGHT;
						remainingRows = 0;
					end

					if remainingRows == 0 or i == bgTextureCount then
						-- For non-backpack bags, the bottom texture has to contain a small slice of the bottom row of items.
						-- So if this middle texture is the bottom one, subtract out that slice from the middle texture's height
						height = height - CONTAINER_BOTTOM_TEXTURE_DEFAULT_ROW_HEIGHT;
					end

					middleBgHeight = middleBgHeight + height;
					bgTextureMiddle:SetHeight(height)
					bgTextureMiddle:SetTexCoord(0, 1, BG_TEXTURE_MIDDLE_START / BG_TEXTURE_HEIGHT, ((BG_TEXTURE_MIDDLE_START + height) / BG_TEXTURE_HEIGHT) )
					bgTextureMiddle:Show()
				end
				-- Position bottom texture
				bgTextureBottom:SetPoint("TOP", bgTextureMiddle:GetName(), "BOTTOM", 0, 0)
				bgTextureBottom:Show()
			end
				
			-- Set the frame height
			frame:SetHeight(bgTextureTop:GetHeight()+bgTextureBottom:GetHeight()+middleBgHeight)	
		end
	end

	if (size == 1) then
		-- Halloween gag gift
		frame:SetHeight(70)	
		frame:SetWidth(99)
		local itemButton = frame.Items[1]
		itemButton:SetPoint("BOTTOMRIGHT", name, "BOTTOMRIGHT", -10, 5)
	else
		frame:SetWidth(CONTAINER_WIDTH)

		for i=1, size, 1 do
			local itemButton = frame.Items[i]
			-- Set first button
			if ( i == 1 ) then
				-- Anchor the first item differently if its the backpack frame
				if ( id == 0 ) then
					itemButton:SetPoint("BOTTOMRIGHT", name, "TOPRIGHT", -12, backpackFirstButtonOffset)
				else
					itemButton:SetPoint("BOTTOMRIGHT", name, "BOTTOMRIGHT", -12, 9)
				end
			else
				if ( mod((i-1), columns) == 0 ) then
					itemButton:SetPoint("BOTTOMRIGHT", frame.Items[i - columns], "TOPRIGHT", 0, 4)	
				else
					itemButton:SetPoint("BOTTOMRIGHT", frame.Items[i - 1], "BOTTOMLEFT", -5, 0)	
				end
			end
		end
	end
end)

local function GetRightActionBarWidth()
	local offset = 0;
	if MultiBar3_IsVisible and MultiBar3_IsVisible() and MultiBarRight:IsInDefaultPosition() then
		local point, relativeTo, relativePoint, offsetX, offsetY = MultiBarRight:GetPoint(1)
		offset = MultiBarRight:GetWidth() - offsetX; -- Subtract x offset since it will be a negative value due to us anchoring to the right side and anchoring towards the middle
	end

	if MultiBar4_IsVisible and MultiBar4_IsVisible() and MultiBarLeft:IsInDefaultPosition() then
		local point, relativeTo, relativePoint, offsetX, offsetY = MultiBarLeft:GetPoint(1)
		offset = MultiBarLeft:GetWidth() - offsetX;
	end

	return offset + 10;
end

hooksecurefunc("UpdateContainerFrameAnchors", function()
	if ContainerFrameSettingsManager:IsUsingCombinedBags() then return end

	local containerFrameOffsetX = GetRightActionBarWidth()
	local frame, xOffset, yOffset, screenHeight, freeScreenHeight, leftMostPoint, column;
	local screenWidth = GetScreenWidth()
	local containerScale = 1;
	local leftLimit = 0;
	if ( BankFrame:IsShown() ) then
		leftLimit = BankFrame:GetRight() - 25;
	end
	
	while ( containerScale > CONTAINER_SCALE ) do
		screenHeight = GetScreenHeight() / containerScale;
		-- Adjust the start anchor for bags depending on the multibars
		xOffset = containerFrameOffsetX / containerScale; 
		yOffset = CONTAINER_OFFSET_Y / containerScale; 
		-- freeScreenHeight determines when to start a new column of bags
		freeScreenHeight = screenHeight - yOffset;
		leftMostPoint = screenWidth - xOffset;
		column = 1;
		local frameHeight;
		for index, frameName in ipairs(_G.ContainerFrameSettingsManager:GetBagsShown()) do
			frameHeight = frameName:GetHeight()
			if ( freeScreenHeight < frameHeight ) then
				-- Start a new column
				column = column + 1;
				leftMostPoint = screenWidth - ( column * CONTAINER_WIDTH * containerScale ) - xOffset;
				freeScreenHeight = screenHeight - yOffset;
			end
			freeScreenHeight = freeScreenHeight - frameHeight - VISIBLE_CONTAINER_SPACING;
		end
		if ( leftMostPoint < leftLimit ) then
			containerScale = containerScale - 0.01;
		else
			break;
		end
	end
	
	if ( containerScale < CONTAINER_SCALE ) then
		containerScale = CONTAINER_SCALE;
	end
	
	screenHeight = GetScreenHeight() / containerScale;
	-- Adjust the start anchor for bags depending on the multibars
	xOffset = containerFrameOffsetX / containerScale;
	yOffset = CONTAINER_OFFSET_Y / containerScale;
	-- freeScreenHeight determines when to start a new column of bags
	freeScreenHeight = screenHeight - yOffset;
	column = 0;
	for index, frameName in ipairs(_G.ContainerFrameSettingsManager:GetBagsShown()) do
		frame = frameName;
		frame:SetScale(containerScale)
		if ( index == 1 ) then
			-- First bag
			frame:SetPoint("BOTTOMRIGHT", frame:GetParent(), "BOTTOMRIGHT", -xOffset, yOffset )
		elseif ( freeScreenHeight < frame:GetHeight() ) then
			-- Start a new column
			column = column + 1;
			freeScreenHeight = screenHeight - yOffset;
			frame:SetPoint("BOTTOMRIGHT", frame:GetParent(), "BOTTOMRIGHT", -(column * CONTAINER_WIDTH) - xOffset, yOffset )
		else
			-- Anchor to the previous bag
			frame:SetPoint("BOTTOMRIGHT", _G.ContainerFrameSettingsManager:GetBagsShown()[index - 1], "TOPRIGHT", 0, CONTAINER_SPACING)	
		end
		freeScreenHeight = freeScreenHeight - frame:GetHeight() - VISIBLE_CONTAINER_SPACING;
	end
end)

hooksecurefunc(ContainerFrame1, "SetSearchBoxPoint", function(self, searchBox)
	searchBox:SetPoint("TOPLEFT", self, "TOPLEFT", 54, -37)
end)

hooksecurefunc(ContainerFrame1, "UpdateCurrencyFrames", function(self)
	local tokenFrame = ContainerFrameSettingsManager:GetTokenTrackerIfShown(self)

	if tokenFrame then
		tokenFrame:ClearAllPoints()
		tokenFrame:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 9, 0)
		tokenFrame:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -9, 0)

		self.MoneyFrame:ClearAllPoints()
		self.MoneyFrame:SetPoint("BOTTOMRIGHT", tokenFrame, "TOPRIGHT", 7, 2)
		self.MoneyFrame:SetPoint("BOTTOMLEFT", tokenFrame, "TOPLEFT", -7, 2)
	else
		self.MoneyFrame:ClearAllPoints()
		self.MoneyFrame:SetPoint("BOTTOMLEFT", self, "BOTTOMLEFT", 2, 12)
		self.MoneyFrame:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", -2, 12)
	end
end)