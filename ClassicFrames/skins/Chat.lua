for i = 1, NUM_CHAT_WINDOWS do
	_G["ChatFrame"..i.."Tab"]:HookScript("OnEnter", GameTooltip_Hide)

	hooksecurefunc(_G["ChatFrame"..i].editBox, "UpdateNewcomerEditBoxHint", function(self)
		self.NewcomerHint:SetShown(false)
		self:SetAlpha(0.35)
	end)
end