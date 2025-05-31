if not _G.SpellFlyout then return end

if SpellFlyoutBackgroundEnd then
	SpellFlyoutBackgroundEnd:SetTexelSnappingBias(0)
	SpellFlyoutBackgroundEnd:SetSnapToPixelGrid(false)
end

if SpellFlyoutHorizontalBackground then
	SpellFlyoutHorizontalBackground:SetTexelSnappingBias(0)
	SpellFlyoutHorizontalBackground:SetSnapToPixelGrid(false)
end

if SpellFlyoutVerticalBackground then
	SpellFlyoutVerticalBackground:SetTexelSnappingBias(0)
	SpellFlyoutVerticalBackground:SetSnapToPixelGrid(false)
end