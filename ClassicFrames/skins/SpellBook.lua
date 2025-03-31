if not _G.SpellBookFrame then return end

hooksecurefunc("SpellBookFrame_Update", function()
	-- Make sure the correct tab is selected
	for i=1,3 do
		local tab = _G["SpellBookFrameTabButton"..i]
		if ( tab.bookType == SpellBookFrame.bookType ) then
			PanelTemplates_SelectTab(tab)
		else
			PanelTemplates_DeselectTab(tab)
		end
	end

	SpellBookFrameTabButton1:ClearAllPoints()
	SpellBookFrameTabButton1:SetPoint("TOPLEFT", SpellBookFrame, "BOTTOMLEFT", 0, 1)
end)