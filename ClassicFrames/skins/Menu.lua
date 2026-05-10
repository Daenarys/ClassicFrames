if not _G.CompositorMixin then return end

hooksecurefunc(CompositorMixin, "AttachFontString", function(parent)
	if not parent.attachments then return end

	for _, widget in ipairs(parent.attachments) do
		local widgetType = widget:GetObjectType()
		if widgetType == "FontString" then
			widget:SetFontObject(GameFontHighlightSmallLeft)
		end
	end
end)