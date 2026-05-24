if not _G.LootFrame then return end

ApplyCloseButton(LootFrame.ClosePanelButton)
ApplyTitleBg(LootFrame, true)
ApplyNineSliceNoPortrait(LootFrame)

ApplyScrollBarHybrid(LootFrame.ScrollBar, true, true)
ApplyScrollBarThumb(LootFrame.ScrollBar.Track.Thumb)

local function CullCorner(texture, startU, endU, startV, endV, relU, relV, dirU, dirV)
	local width = endU - startU
	local height = endV - startV

	local finalStartU = startU + (width * (1 - relU) * dirU)
	local finalEndU = finalStartU + (width * relU)

	local finalStartV = startV + (height * (1 - relV) * dirV)
	local finalEndV = finalStartV + (height * relV)

	texture:SetTexCoord(finalStartU, finalEndU, finalStartV, finalEndV)
	texture:SetSize(132 * relU, 132 * relV)
end

CullCorner(LootFrame.NineSlice.TopLeftCorner, 0.525390625, 0.783203125, 0.001953125, 0.259765625, .65, .6, 0, 0)
CullCorner(LootFrame.NineSlice.TopRightCorner, 0.001953125, 0.259765625, 0.263671875, 0.521484375, .25, .4, 1, 0)
CullCorner(LootFrame.NineSlice.BottomLeftCorner, 0.001953125, 0.259765625, 0.001953125, 0.259765625, .55, .4, 0, 1)
CullCorner(LootFrame.NineSlice.BottomRightCorner, 0.263671875, 0.521484375, 0.001953125, 0.259765625, .35, .4, 1, 1)

if _G.BonusRollFrame then
	BonusRollFrame.SpecRing:SetTexture("Interface\\AddOns\\ClassicFrames\\icons\\MiniMap-TrackingBorder")
end