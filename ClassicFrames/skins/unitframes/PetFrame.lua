if not _G.PetFrame then return end

PetFrameHealthBarText:SetFontObject(SystemFont_Outline_Small)
PetFrameHealthBarTextLeft:SetFontObject(SystemFont_Outline_Small)
PetFrameHealthBarTextRight:SetFontObject(SystemFont_Outline_Small)

PetFrameHealthBarText:SetTextColor(1, 1, 1)
PetFrameHealthBarTextLeft:SetTextColor(1, 1, 1)
PetFrameHealthBarTextRight:SetTextColor(1, 1, 1)

PetFrameManaBarText:SetFontObject(SystemFont_Outline_Small)
PetFrameManaBarTextLeft:SetFontObject(SystemFont_Outline_Small)
PetFrameManaBarTextRight:SetFontObject(SystemFont_Outline_Small)

PetFrameManaBarText:SetTextColor(1, 1, 1)
PetFrameManaBarTextLeft:SetTextColor(1, 1, 1)
PetFrameManaBarTextRight:SetTextColor(1, 1, 1)

local _, class = UnitClass("player")
if ( class == "DEATHKNIGHT" or class == "ROGUE") then
	PetFrame:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 60, -75)
elseif ( class == "SHAMAN" or class == "DRUID" ) then
	PetFrame:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 60, -100)
elseif ( class == "WARLOCK" ) then
	PetFrame:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 60, -90)
elseif ( class == "PALADIN" ) then
	PetFrame:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 60, -90)
elseif ( class == "PRIEST" ) then
	PetFrame:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 60, -90)
elseif ( class == "MONK" ) then
	PetFrame:SetPoint("TOPLEFT", PlayerFrame, "TOPLEFT", 90, -100)
end