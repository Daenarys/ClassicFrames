CfPlayerSettings = {}

local function GetSettings()
    return ClassicFrames.db.profile.player
end

function CfPlayerSettings:GetClassColorHealthEnabled()
    return GetSettings().classColorHealthBar
end
function CfPlayerSettings:SetClassColorHealthEnabled(_, value)
    GetSettings().classColorHealthBar = value
    self:RebuildFrames()
end

function CfPlayerSettings:GetEliteMode()
    return GetSettings().eliteMode
end
function CfPlayerSettings:SetEliteMode(_, value)
    GetSettings().eliteMode = value
    self:RebuildFrames()
end

function CfPlayerSettings:RebuildFrames()
    if (GetSettings().classColorHealthBar) then
		local _, classKey = UnitClass("player")
		local r,g,b,_ = GetClassColor(classKey)
        CfPlayerFrameHealthBar.lockColor = true
		CfPlayerFrameHealthBar:SetStatusBarColor(r, g, b)
    else
        CfPlayerFrameHealthBar:SetStatusBarColor(0, 1, 0)
	end

    if GetSettings().eliteMode == 0 then
		PlayerFrame.PlayerFrameContainer.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame") 
	end
	if GetSettings().eliteMode == 1 then
		PlayerFrame.PlayerFrameContainer.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare") 
	end
	if GetSettings().eliteMode == 3 then
		PlayerFrame.PlayerFrameContainer.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Rare-Elite") 
	end
	if GetSettings().eliteMode == 2 then
		PlayerFrame.PlayerFrameContainer.FrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame-Elite") 
	end
end