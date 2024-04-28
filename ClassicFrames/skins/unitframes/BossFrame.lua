if not _G.Boss1TargetFrame then return end

for i = 1, MAX_BOSS_FRAMES do
	_G["Boss"..i.."TargetFrame"].textureFrame.HealthBarText:SetFontObject(SystemFont_Outline_Small)
	_G["Boss"..i.."TargetFrame"].textureFrame.HealthBarTextLeft:SetFontObject(SystemFont_Outline_Small)
	_G["Boss"..i.."TargetFrame"].textureFrame.HealthBarTextRight:SetFontObject(SystemFont_Outline_Small)

	_G["Boss"..i.."TargetFrame"].textureFrame.HealthBarText:SetTextColor(1, 1, 1)
	_G["Boss"..i.."TargetFrame"].textureFrame.HealthBarTextLeft:SetTextColor(1, 1, 1)
	_G["Boss"..i.."TargetFrame"].textureFrame.HealthBarTextRight:SetTextColor(1, 1, 1)

	_G["Boss"..i.."TargetFrame"].textureFrame.HealthBarTextLeft:ClearAllPoints()
	_G["Boss"..i.."TargetFrame"].textureFrame.HealthBarTextLeft:SetPoint("LEFT", 7, 3)

	_G["Boss"..i.."TargetFrame"].textureFrame.ManaBarText:SetFontObject(SystemFont_Outline_Small)
	_G["Boss"..i.."TargetFrame"].textureFrame.ManaBarTextLeft:SetFontObject(SystemFont_Outline_Small)
	_G["Boss"..i.."TargetFrame"].textureFrame.ManaBarTextRight:SetFontObject(SystemFont_Outline_Small)

	_G["Boss"..i.."TargetFrame"].textureFrame.ManaBarText:SetTextColor(1, 1, 1)
	_G["Boss"..i.."TargetFrame"].textureFrame.ManaBarTextLeft:SetTextColor(1, 1, 1)
	_G["Boss"..i.."TargetFrame"].textureFrame.ManaBarTextRight:SetTextColor(1, 1, 1)

	_G["Boss"..i.."TargetFrame"].textureFrame.ManaBarTextLeft:ClearAllPoints()
	_G["Boss"..i.."TargetFrame"].textureFrame.ManaBarTextLeft:SetPoint("LEFT", 7, -8)

	_G["Boss"..i.."TargetFrameHealthBar"].breakUpLargeNumbers = true
	_G["Boss"..i.."TargetFrameManaBar"].breakUpLargeNumbers = true
end