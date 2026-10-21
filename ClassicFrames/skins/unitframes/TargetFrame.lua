local function SkinTargetCastbar(frame)
	frame:HookScript("OnEvent", function(self, event)
		if self.Text then
			if event == "UNIT_SPELLCAST_FAILED" then
				self.Text:SetText(FAILED)
			elseif event == "UNIT_SPELLCAST_INTERRUPTED" then
				self.Text:SetText(INTERRUPTED)
			end
		end
	end)
end

SkinTargetCastbar(TargetFrame.spellbar)
SkinTargetCastbar(FocusFrame.spellbar)

for _, frame in _G.pairs(_G.BossTargetFrameContainer.BossTargetFrames) do
	SkinTargetCastbar(frame.spellbar)
end