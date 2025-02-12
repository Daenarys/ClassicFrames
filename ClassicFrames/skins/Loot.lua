local LOOTFRAME_NUMBUTTONS = 4;
local LOOTFRAME_AUTOLOOT_DELAY = 0.3;
local LOOTFRAME_AUTOLOOT_RATE = 0.35;

function LootFrame_OnLoad(self)
	self:RegisterEvent("LOOT_OPENED")
	self:RegisterEvent("LOOT_SLOT_CLEARED")
	self:RegisterEvent("LOOT_SLOT_CHANGED")
	self:RegisterEvent("LOOT_CLOSED")

	ButtonFrameTemplate_HideButtonBar(self)
	ApplyCloseButton(self.CloseButton)
	ApplyTitleBg(self)
	ApplyNineSlicePortrait(self)
end

function LootFrame_OnEvent(self, event, ...)
	if ( event == "LOOT_OPENED" ) then
		local autoLoot, isFromItem = ...;
		if( autoLoot ) then
			CfLootFrame:SetScript("OnUpdate", LootFrame_OnUpdate)
			self.AutoLootDelay = LOOTFRAME_AUTOLOOT_DELAY;
		else
			self.AutoLootDelay = 0;
			self.AutoLootTable = nil;
		end

		self.page = 1;
		LootFrame_Show(self)
		if ( not self:IsShown()) then
			CloseLoot(not autoLoot) -- The parameter tells code that we were unable to open the UI
		else
			if ( isFromItem ) then
				PlaySound(SOUNDKIT.UI_CONTAINER_ITEM_OPEN)
			end
		end
	elseif ( event == "LOOT_SLOT_CLEARED" ) then
		local arg1 = ...;
		if ( not self:IsShown() or self.AutoLootTable) then
			return;
		end

		local numLootToShow = LOOTFRAME_NUMBUTTONS;
		if ( self.numLootItems > LOOTFRAME_NUMBUTTONS ) then
			numLootToShow = numLootToShow - 1;
		end
		local slot = arg1 - ((self.page - 1) * numLootToShow)
		if ( (slot > 0) and (slot < (numLootToShow + 1)) ) then
			local button = _G["LootButton"..slot];
			if ( button ) then
				button:Hide()
			end
		end
		-- try to move second page of loot items to the first page
		local button;
		local allButtonsHidden = 1;

		for index = 1, LOOTFRAME_NUMBUTTONS do
			button = _G["LootButton"..index];
			if ( button:IsShown() ) then
				allButtonsHidden = nil;
			end
		end
		if ( allButtonsHidden and LootFrameDownButton:IsShown() ) then
			LootFrame_PageDown()
		end
		return;
	elseif ( event == "LOOT_SLOT_CHANGED" ) then
		local arg1 = ...;

		if ( not self:IsShown() ) then
			return;
		end

		local numLootToShow = LOOTFRAME_NUMBUTTONS;
		if ( self.numLootItems > LOOTFRAME_NUMBUTTONS ) then
			numLootToShow = numLootToShow - 1;
		end
		local slot = arg1 - ((self.page - 1) * numLootToShow)
		if ( (slot > 0) and (slot < (numLootToShow + 1)) ) then
			local button = _G["LootButton"..slot];
			if ( button ) then
				LootFrame_UpdateButton(slot)
			end
		end
	elseif ( event == "LOOT_CLOSED" ) then
		if( not self.AutoLootTable ) then
			LootFrame_Close()
		end
		return;
	end
end

local LOOT_UPDATE_INTERVAL = 0.5;
function LootFrame_OnUpdate(self, elapsed)
	self.timeSinceUpdate = (self.timeSinceUpdate or 0) + elapsed;
	if( self.AutoLootTable )then
		if( self.AutoLootDelay > 0 ) then
			self.AutoLootDelay = self.AutoLootDelay - elapsed;
			self.timeSinceUpdate = 0;
			self.AutoLootCurrentIdx = 1;
		elseif( self.timeSinceUpdate >  LOOTFRAME_AUTOLOOT_RATE ) then
			local entry = self.AutoLootTable[self.AutoLootCurrentIdx]
			if( entry and not entry.roll and not entry.locked) then
				self.AutoLootTable[self.AutoLootCurrentIdx].hide = true;
			end
			self.AutoLootCurrentIdx = self.AutoLootCurrentIdx +1;
			self.timeSinceUpdate = 0;
			if( self.AutoLootCurrentIdx > #self.AutoLootTable ) then
				self:SetScript("OnUpdate", nil)
				self.timeSinceUpdate = nil;
				self.AutoLootTable = nil;
				--close
				LootFrame_Close()
			else
				local numLootToShow = LOOTFRAME_NUMBUTTONS;
				if ( self.numLootItems > LOOTFRAME_NUMBUTTONS ) then
					numLootToShow = numLootToShow - 1;
				end
				local slot = self.AutoLootCurrentIdx - ((self.page - 1) * numLootToShow) - 1;
				if ( (slot > 0) and (slot < (numLootToShow + 1)) ) then
					local button = _G["LootButton"..slot];
					if ( button ) then
						button:Hide()
					end
				end
				-- try to move second page of loot items to the first page
				if( self.AutoLootCurrentIdx % numLootToShow == 1 ) then
					if( LootFrameDownButton:IsShown() ) then
						LootFrame_PageDown()
					end
				end
				LootFrame_Update()
			end
		end
	elseif ( self.timeSinceUpdate >= LOOT_UPDATE_INTERVAL ) then
		self:SetScript("OnUpdate", nil)
		self.timeSinceUpdate = nil;
		LootFrame_Update()
	end
end

function LootFrame_UpdateButton(index)
	local numLootItems = CfLootFrame.numLootItems;
	--Logic to determine how many items to show per page
	local numLootToShow = LOOTFRAME_NUMBUTTONS;
	local self = CfLootFrame;
	if( self.AutoLootTable ) then
		numLootItems = #self.AutoLootTable;
	end
	if ( numLootItems > LOOTFRAME_NUMBUTTONS ) then
		numLootToShow = numLootToShow - 1; -- make space for the page buttons
	end
	local button = _G["LootButton"..index];
	local slot = (numLootToShow * (CfLootFrame.page - 1)) + index;
	if ( slot <= numLootItems ) then
		if ( (LootSlotHasItem(slot)  or (self.AutoLootTable and self.AutoLootTable[slot]) )and index <= numLootToShow) then
			local texture, item, quantity, currencyID, quality, locked, isQuestItem, questId, isActive;
			if(self.AutoLootTable)then
				local entry = self.AutoLootTable[slot];
				if( entry.hide ) then
					button:Hide()
					return;
				else
					texture = entry.texture;
					item = entry.item;
					quantity = entry.quantity;
					quality = entry.quality;
					locked = entry.locked;
					isQuestItem = entry.isQuestItem;
					questId = entry.questId;
					isActive = entry.isActive;
				end
			else
				texture, item, quantity, currencyID, quality, locked, isQuestItem, questId, isActive = GetLootSlotInfo(slot)
			end

			if ( currencyID ) then 
				item, texture, quantity, quality = CurrencyContainerUtil.GetCurrencyContainerInfo(currencyID, quantity, item, texture, quality)
			end
			
			local text = _G["LootButton"..index.."Text"];
			if ( texture ) then
				local color = ITEM_QUALITY_COLORS[quality];
				SetItemButtonQuality(button, quality, GetLootSlotLink(slot))
				_G["LootButton"..index.."IconTexture"]:SetTexture(texture)
				text:SetText(item)
				if( locked ) then
					SetItemButtonNameFrameVertexColor(button, 1.0, 0, 0)
					SetItemButtonTextureVertexColor(button, 0.9, 0, 0)
					SetItemButtonNormalTextureVertexColor(button, 0.9, 0, 0)
				else
					SetItemButtonNameFrameVertexColor(button, 0.5, 0.5, 0.5)
					SetItemButtonTextureVertexColor(button, 1.0, 1.0, 1.0)
					SetItemButtonNormalTextureVertexColor(button, 1.0, 1.0, 1.0)
				end

				local questTexture = _G["LootButton"..index.."IconQuestTexture"];
				if ( questId and not isActive ) then
					questTexture:SetTexture(TEXTURE_ITEM_QUEST_BANG)
					questTexture:Show()
				elseif ( questId or isQuestItem ) then
					questTexture:SetTexture(TEXTURE_ITEM_QUEST_BORDER)
					questTexture:Show()
				else
					questTexture:Hide()
				end

				text:SetVertexColor(color.r, color.g, color.b)
				local countString = _G["LootButton"..index.."Count"];
				if ( quantity > 1 ) then
					countString:SetText(quantity)
					countString:Show()
				else
					countString:Hide()
				end
				button.slot = slot;
				button.quality = quality;
				button:Enable()
			else
				text:SetText("")
				_G["LootButton"..index.."IconTexture"]:SetTexture(nil)
				SetItemButtonNormalTextureVertexColor(button, 1.0, 1.0, 1.0)
				CfLootFrame:SetScript("OnUpdate", LootFrame_OnUpdate)
				button:Disable()
			end
			button:Show()
		else
			button:Hide()
		end
	else
		button:Hide()
	end
end

function LootFrame_Update()
	for index = 1, LOOTFRAME_NUMBUTTONS do
		LootFrame_UpdateButton(index)
	end
	if ( CfLootFrame.page == 1 ) then
		LootFrameUpButton:Hide()
		LootFramePrev:Hide()
	else
		LootFrameUpButton:Show()
		LootFramePrev:Show()
	end
	local numItemsPerPage = LOOTFRAME_NUMBUTTONS;
	if ( CfLootFrame.numLootItems > LOOTFRAME_NUMBUTTONS ) then
		numItemsPerPage = numItemsPerPage - 1;
	end
	if ( CfLootFrame.page == ceil(CfLootFrame.numLootItems / numItemsPerPage) or CfLootFrame.numLootItems == 0 ) then
		LootFrameDownButton:Hide()
		LootFrameNext:Hide()
	else
		LootFrameDownButton:Show()
		LootFrameNext:Show()
	end
end

function LootFrame_Close()
	StaticPopup_Hide("LOOT_BIND")
	CfLootFrame:Hide()
end

function LootFrame_PageDown()
	CfLootFrame.page = CfLootFrame.page + 1;
	LootFrame_Update()
end

function LootFrame_PageUp()
	CfLootFrame.page = CfLootFrame.page - 1;
	LootFrame_Update()
end

function LootFrame_Show(self)
	self.numLootItems = GetNumLootItems()
	if(self.AutoLootTable) then
		self.numLootItems = #self.AutoLootTable;
	end

	if GetCVarBool("lootUnderMouse") then
		self:Show()
		-- position loot window under mouse cursor
		local x, y = GetCursorPosition()
		x = x / self:GetEffectiveScale()
		y = y / self:GetEffectiveScale()

		local posX = x - 175;
		local posY = y + 25;

		if (self.numLootItems > 0) then
			posX = x - 40;
			posY = y + 55;
			posY = posY + 40;
		end

		if( posY < 350 ) then
			posY = 350;
		end

		self:ClearAllPoints()
		self:SetPoint("TOPLEFT", nil, "BOTTOMLEFT", posX, posY)
		self:GetCenter()
		self:Raise()
	else
		self:Show()
		self:ClearAllPoints()
		self:SetPoint("TOPLEFT", 16, -116)
	end

	LootFrame_Update()
	LootFramePortraitOverlay:SetTexture("Interface\\TargetingFrame\\TargetDead")
end

function LootFrame_OnShow(self)
	if( self.numLootItems == 0 ) then
		PlaySound(SOUNDKIT.LOOT_WINDOW_OPEN_EMPTY)
	elseif( IsFishingLoot() ) then
		PlaySound(SOUNDKIT.FISHING_REEL_IN)
		LootFramePortraitOverlay:SetTexture("Interface\\LootFrame\\FishingLoot-Icon")
	end
end

function LootFrame_OnHide(self)
	CloseLoot()
	-- Close any loot distribution confirmation windows
	StaticPopup_Hide("CONFIRM_LOOT_DISTRIBUTION")

	if( self.AutoLootTable )then
		self:SetScript("OnUpdate", nil)
		self.timeSinceUpdate = nil;
		self.AutoLootTable = nil;
	end
end

function LootButton_OnClick(self, button)
	-- Close any loot distribution confirmation windows
	StaticPopup_Hide("CONFIRM_LOOT_DISTRIBUTION")

	CfLootFrame.selectedLootButton = self:GetName()
	CfLootFrame.selectedSlot = self.slot;
	CfLootFrame.selectedQuality = self.quality;
	CfLootFrame.selectedItemName = _G[self:GetName().."Text"]:GetText()
	CfLootFrame.selectedTexture = _G[self:GetName().."IconTexture"]:GetTexture()
	LootSlot(self.slot)
end

function LootItem_OnEnter(self)
	local slot = ((LOOTFRAME_NUMBUTTONS - 1) * (CfLootFrame.page - 1)) + self:GetID()
	local slotType = GetLootSlotType(slot)
	if ( slotType == Enum.LootSlotType.Item ) then
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetLootItem(slot)
		CursorUpdate(self)
	end
	if ( slotType == Enum.LootSlotType.Currency ) then
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:SetLootCurrency(slot)
		CursorUpdate(self)
	end
end

hooksecurefunc(_G.LootFrame, "PlayOpenAnimation", function(self)
	self.ShowAnim:Stop()
	self:SetSize(0, 0)
	self:SetAlpha(0)
end)

if _G.BonusRollFrame then
	BonusRollFrame.SpecRing:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")
end