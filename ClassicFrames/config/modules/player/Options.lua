function GetCfPlayerOptions()
    return {
        order = 1,
        name = "Player",
        handler = CfPlayerSettings,
        type = "group",
        args = {
            playerClassColorHealthEnable = {
                order = 3,
                width = "full",
                name = "Class Color Health Bar",
                desc = "Enable or disable class color player health bar",
                type = "toggle",
                get = "GetClassColorHealthEnabled",
                set = "SetClassColorHealthEnabled",
            },
            playerEliteMode = {
                order = 3,
                name = "Elite Mode",
                desc = "Select an Elite Mode style",
                values = {
                    [0] = "None",
                    [1] = "Rare",
                    [2] = "Elite",
                    [3] = "Rare Elite"
                },
                type = "select",
                get = "GetEliteMode",
                set = "SetEliteMode",
            },
        },
    }
end
