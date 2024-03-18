if not _G.ObjectiveTrackerFrame then return end

hooksecurefunc("ObjectiveTracker_Update", function()
	ObjectiveTrackerFrame.HeaderMenu.MinimizeButton:ClearAllPoints()
	ObjectiveTrackerFrame.HeaderMenu.MinimizeButton:SetPoint("TOPRIGHT", 9, 7)

	for _, child in pairs({ _G.ObjectiveTrackerBlocksFrame:GetChildren() }) do
		if child and child.MinimizeButton then
			child.MinimizeButton:Hide()
		end
	end
end)