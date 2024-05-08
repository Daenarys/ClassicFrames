function GetCfMinimapOptions()
    return {
        order = 3,
        name = "Minimap",
        handler = CfMinimapSettings,
        type = "group",
        args = {
            miniMapEnable = {
                order = 1,
                width = "full",
                name = "Classic Minimap (requires reload)",
                desc = "Enable or disable the Classic Minimap",
                type = "toggle",
                get = "GetMinimapEnabled",
                set = "SetMinimapEnabled"
            },
        },
    }
end