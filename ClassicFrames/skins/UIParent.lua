if not _G.UIParentRightManagedFrameContainer then return end

hooksecurefunc(UIParentRightManagedFrameContainer, "Layout", function(self)
	local xOffset = -EditModeUtil:GetRightActionBarWidth() - 7;
	self:SetPoint("TOPRIGHT", xOffset, -181)
end)