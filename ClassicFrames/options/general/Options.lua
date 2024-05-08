function GetCfOptions()
    return {
        type = "group",
        name = "Classic Frames",
        handler = ClassicFrames,
        args = {
            player = GetCfPlayerOptions(),
            target = GetCfTargetOptions(),
            minimap = GetCfMinimapOptions()
        },
    }
end

function GetCfOptionsBlizzard()
    return {
        type = "group",
        name = "Classic Frames",
        args = {
            g1 = {
                order = 1,
                type = "execute",
                name = "Open Config",
                func = function()
                    HideUIPanel(SettingsPanel)
                    HideUIPanel(GameMenuFrame)
                    ClassicFrames:OpenOptions()
                end
            }
        },
    }
end