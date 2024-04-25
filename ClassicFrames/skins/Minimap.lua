if (IsAddOnLoaded("SexyMap")) then return end

-- queuestatusframe
QueueStatusFrame:ClearAllPoints();
QueueStatusFrame:SetPoint("TOPRIGHT", MiniMapLFGFrame, "TOPLEFT", -1, 1);

hooksecurefunc(QueueStatusFrame, "UpdatePosition", function(self)
	self:ClearAllPoints();
	self:SetPoint("TOPRIGHT", MiniMapLFGFrame, "TOPLEFT", -1, 1);
end)

hooksecurefunc("QueueStatusDropDown_Show", function()
	DropDownList1:ClearAllPoints()
	DropDownList1:SetPoint("BOTTOMLEFT", MiniMapLFGFrame, "BOTTOMLEFT", 0, -61)
end)