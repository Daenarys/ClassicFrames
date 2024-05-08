function GetCfTargetOptions()
    return {
        order = 2,
        name = "TargetFrame",
        handler = CfTargetSettings,
        type = "group",
        args = {
            targetClassColorHealthEnable = {
                order = 1,
                width = "full",
                name = "Class Colored Health Bar",
                desc = "Enable or disable class colored health bar",
                type = "toggle",
                get = "GetClassColorHealthEnabled",
                set = "SetClassColorHealthEnabled"
            },
        },
    }
end