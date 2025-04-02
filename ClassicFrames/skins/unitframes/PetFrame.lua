if not _G.PetFrame then return end

PetFrameHealthBarText:SetAlpha(0)
PetFrameHealthBarTextLeft:SetAlpha(0)
PetFrameHealthBarTextRight:SetAlpha(0)

PetFrameManaBarText:SetAlpha(0)
PetFrameManaBarTextLeft:SetAlpha(0)
PetFrameManaBarTextRight:SetAlpha(0)

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