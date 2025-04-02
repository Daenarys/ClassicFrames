if not _G.ModelPreviewFrame then return end

ModelPreviewFrame.Display.ModelScene.ControlFrame:HookScript("OnShow", function(self)
	self:SetPoint("TOP")
end)