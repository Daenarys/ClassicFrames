for i = 1, NUM_CHAT_WINDOWS do
    hooksecurefunc(_G["ChatFrame"..i].editBox, "UpdateNewcomerEditBoxHint", function(self)
        self.NewcomerHint:SetShown(false)
        self:SetAlpha(0.25)
    end)
end