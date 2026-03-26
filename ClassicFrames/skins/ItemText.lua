if not _G.ItemTextFrame then return end

ApplyCloseButton(ItemTextFrameCloseButton)

select(3, ItemTextFrame:GetRegions()):SetSize(58, 58)
select(3, ItemTextFrame:GetRegions()):ClearAllPoints()
select(3, ItemTextFrame:GetRegions()):SetPoint("TOPLEFT", -5, 5)

ItemTextFrame.TitleContainer:ClearAllPoints()
ItemTextFrame.TitleContainer:SetPoint("TOPLEFT", ItemTextFrame, "TOPLEFT", 58, 0)
ItemTextFrame.TitleContainer:SetPoint("TOPRIGHT", ItemTextFrame, "TOPRIGHT", -58, 0)

ApplyTitleBg(ItemTextFrame)
ApplyNineSlicePortrait(ItemTextFrame)

ApplyScrollBarArrow(ItemTextScrollFrame.ScrollBar)
ApplyScrollBarTrack(ItemTextScrollFrame.ScrollBar.Track)
ApplyScrollBarThumb(ItemTextScrollFrame.ScrollBar.Track.Thumb)

ItemTextFrame:HookScript("OnEvent", function(self, event)
	if ( event == "ITEM_TEXT_READY" ) then
		local material = ItemTextGetMaterial()
		if ( material == "Parchment" ) then
			ItemTextFramePageBg:SetTexture("Interface\\QuestFrame\\QuestBG")
			ItemTextFramePageBg:SetWidth(512)
			ItemTextFramePageBg:SetHeight(543)
		end
	end
end)