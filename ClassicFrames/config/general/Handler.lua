function ClassicFrames:GetEnabled()
    return self.db.profile.enabled
end
function ClassicFrames:SetEnabled(_, value)
    self.db.profile.enabled = value
end