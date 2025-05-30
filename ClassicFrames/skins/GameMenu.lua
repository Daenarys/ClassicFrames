if not _G.GameMenuFrame then return end

hooksecurefunc("GameMenuFrame_UpdateVisibleButtons", function(self)
	if C_StorePublic.IsEnabled() then
		self:SetHeight(268)
	else
		self:SetHeight(248)
	end
end)