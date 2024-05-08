ClassicFrames = LibStub("AceAddon-3.0"):NewAddon("ClassicFrames", "AceConsole-3.0")
local options = GetCfOptions();
local optionsBlizzards = GetCfOptionsBlizzard();

function ClassicFrames:OnInitialize()
	self.db = LibStub("AceDB-3.0"):New("ClassicFramesDB", ClassicFramesDBDefaults, true)

	LibStub("AceConfig-3.0"):RegisterOptionsTable("ClassicFrames", options)
	LibStub("AceConfig-3.0"):RegisterOptionsTable("ClassicFramesBlizzards", optionsBlizzards)
	self.optionsFrame = LibStub("AceConfigDialog-3.0"):AddToBlizOptions("ClassicFramesBlizzards", "Classic Frames")
	self:RegisterChatCommand("cf", "OpenOptions")
	self:RegisterChatCommand("classicframes", "OpenOptions")
	CfPlayerSettings:RebuildFrames()
end

function ClassicFrames:OpenOptions(msg)
    LibStub("AceConfigDialog-3.0"):Open("ClassicFrames", CfOptions.Options)
    CfOptions.Options.frame:Show()
    CfOptions:Show()
end