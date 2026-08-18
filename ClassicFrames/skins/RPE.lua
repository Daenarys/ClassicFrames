if RPETurnStrafeStyleMixin then
	hooksecurefunc(RPETurnStrafeStyleMixin, "OnLoad", function(self)
		self.BG:SetAlpha(0)

		local border = CreateFrame("Frame", nil, self, "DialogBorderDarkTemplate")
	end)
end