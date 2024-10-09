if UIWidgetBelowMinimapContainerFrame then
	UIWidgetBelowMinimapContainerFrame:HookScript("OnUpdate", function(self)
		self:ClearAllPoints()
		self:SetPoint("TOPRIGHT", MinimapCluster, "BOTTOMRIGHT")
	end)
end

if UIWidgetCenterDisplayFrame then
	ApplyDialogBorder(UIWidgetCenterDisplayFrame.NineSlice)
end