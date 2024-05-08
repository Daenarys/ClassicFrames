function GetCfPlayerOptions()
    return {
        order = 1,
        name = "PlayerFrame",
        handler = CfPlayerSettings,
        type = "group",
        args = {
            playerClassColorHealthEnable = {
                order = 1,
                width = "full",
                name = "Class Colored Health Bar",
                desc = "Enable or disable class colored health bar",
                type = "toggle",
                get = "GetClassColorHealthEnabled",
                set = "SetClassColorHealthEnabled"
            },
            playerEliteMode = {
                order = 2,
                name = "Elite Mode",
                desc = "Select a Frame Texture",
                values = {
                    [0] = "None",
                    [1] = "Rare",
                    [2] = "Elite",
                    [3] = "Rare Elite"
                },
                type = "select",
                get = "GetEliteMode",
                set = "SetEliteMode"
            },
        },
    }
end