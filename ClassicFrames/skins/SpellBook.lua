if not _G.SpellBookFrame then return end

ApplyCloseButton(SpellBookFrameCloseButton)

SpellBookFrame.PortraitContainer.CircleMask:Hide()

SpellBookFramePortrait:SetSize(61, 61)
SpellBookFramePortrait:ClearAllPoints()
SpellBookFramePortrait:SetPoint("TOPLEFT", -6, 8)

SpellBookFrame.TitleContainer:ClearAllPoints()
SpellBookFrame.TitleContainer:SetPoint("TOPLEFT", SpellBookFrame, "TOPLEFT", 58, 0)
SpellBookFrame.TitleContainer:SetPoint("TOPRIGHT", SpellBookFrame, "TOPRIGHT", -58, 0)

SpellBookFrameTutorialButton.Ring:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")

ApplyTitleBg(SpellBookFrame)
ApplyNineSlicePortrait(SpellBookFrame)

for i = 1, 3 do
	ApplyBottomTab(_G['SpellBookFrameTabButton'..i])

	_G["SpellBookFrameTabButton"..i]:HookScript("OnShow", function(self)
		SpellBookFrameTabButton1:SetWidth(40 + SpellBookFrameTabButton1:GetFontString():GetStringWidth())
		SpellBookFrameTabButton2:SetWidth(40 + SpellBookFrameTabButton2:GetFontString():GetStringWidth())
		SpellBookFrameTabButton3:SetWidth(58 + SpellBookFrameTabButton3:GetFontString():GetStringWidth())
	end)
	
	hooksecurefunc("SpellBookFrame_Update", function()
		SpellBookFrameTabButton1:ClearAllPoints()
		SpellBookFrameTabButton1:SetPoint("TOPLEFT", SpellBookFrame, "BOTTOMLEFT", 0, 1)
		SpellBookFrameTabButton2:ClearAllPoints()
		SpellBookFrameTabButton2:SetPoint("LEFT", SpellBookFrameTabButton1, "RIGHT", -15, 0)
		SpellBookFrameTabButton3:ClearAllPoints()
		SpellBookFrameTabButton3:SetPoint("LEFT", SpellBookFrameTabButton2, "RIGHT", -15, 0)
	end)
end