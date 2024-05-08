CfTargetSettings = {}

local function GetSettings()
    return ClassicFrames.db.profile.target
end

function CfTargetSettings:GetClassColorHealthEnabled()
    return GetSettings().classColorHealthBar
end
function CfTargetSettings:SetClassColorHealthEnabled(_, value)
    GetSettings().classColorHealthBar = value
end