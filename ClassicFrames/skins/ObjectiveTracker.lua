if not _G.ObjectiveTrackerFrame then return end

hooksecurefunc("ObjectiveTracker_Update", function()
	ObjectiveTrackerFrame.HeaderMenu.MinimizeButton:ClearAllPoints()
	ObjectiveTrackerFrame.HeaderMenu.MinimizeButton:SetPoint("TOPRIGHT", 9, 7)
end)