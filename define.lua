------------------
--- DEFINE NPC ---
------------------

-- define a new npc
-- https://wiki.apico.buzz/wiki/Modding_API#api_define_npc()
-- an npc is a special type of menu object that has a dialogue window + a shop menu
function clara_dialogue_check()
    return {'A'}
end

function define_npc()

    clara_dialogue = {}
    clara_dialogue["A"] = {
        P = "Who are you?",
        D = {
            "My name is Clara, and I'm new from the mainland."
        },
        A = {
            "$action49"
        }
    }
    clara_dialogue["B"] = {
        P = "What do you do?",
        D = {
            "I'm a stylist and general fashionista!",
            "In all seriousness, I do hair. All styles, all lengths."
        },
        A = {
            "$action01",
            "$action49"
        }
    }
    clara_dialogue["C"] = {
        P = "Can you do my hair?",
        D = {
            "Of course, love! Just stop by anytime for a refreshing new look.",
        },
        A = {
            "$action49"
        }
    }

    clara_dialogue["D"] = {
        P = "What does your shop name mean?",
        D = {
            "It's actually the Chinese word for honeybee! 蜜蜂 is pronounced 'mee-fung'. 'Mì' is falling tone and 'fēng' is flat tone.",
        },
        A = {
            "$action49"
        }
    }

    clara_dialogue["E"] = {
        P = "Can I dye my hair?",
        D = {
            "I'm not the best at it, but you can visit my friend DOT to try it out.",
            "(This mod is fully compatible with the Fashion Stylist mod by RaptorJesus2. :) )"
        },
        A = {
            "$action01",
            "$action49"
        }
    }

    clara_dialogue["F"] = {
        P = "I'm having some issues with this mod.",
        D = {
            "Sorry to hear about that! :(",
            "Please contact me on Discord at TheNerdyTurtle96#0025 to get some help!"
        },
        A = {
            "$action01",
            "$action49"
        }
    }

    --set npc definition
    npc_def = {
        id = 987,
        name = "Clara",
        pronouns = "They/Them",
        tooltip = "They look extremely stylish...",
        shop = true,
        walking = true,
        stock = {MOD_NAME.."_space_buns",MOD_NAME.."_top_bun",MOD_NAME.."_pigtails",MOD_NAME.."_side_part",MOD_NAME.."double_braids",MOD_NAME.."_long_hair",MOD_NAME.."_veil"}, -- max 10
        dialogue = clara_dialogue,
        greeting = "Hello bee-utiful friend!."
    }

    -- define npc
    api_define_npc2(npc_def,
            "sprites/lily_npc/npc_standing.png",
            "sprites/lily_npc/npc_standing_h.png",
            "sprites/lily_npc/npc_walking.png",
            "sprites/lily_npc/npc_walking_h.png",
            "sprites/lily_npc/npc_head.png",
            "sprites/lily_npc/npc_bust.png",
            "sprites/lily_npc/npc_item.png",
            "sprites/lily_npc/npc_dialogue_menu.png",
            "sprites/lily_npc/npc_shop_menu.png",
            "clara_dialogue_check"
    )
end

function define_space_buns()
    api_define_item({
        id = "space_buns",
        name = "Space Buns",
        category = "Hair",
        tooltip = "Very sci-fi like",
        singular = true,
        shop_buy = 5
    }, "sprites/item/green_sprout_item.png")
end

function define_top_bun()
    api_define_item({
        id = "top_bun",
        name = "Top Bun",
        category = "Hair",
        tooltip = "Ready to work!",
        singular = true,
        shop_buy = 5
    }, "sprites/item/green_sprout_item.png")
end

function define_pigtails()
    api_define_item({
        id = "pigtails",
        name = "Pigtails",
        category = "Hair",
        tooltip = "Very cute!",
        singular = true,
        shop_buy = 5
    }, "sprites/item/green_sprout_item.png")
end

function define_side_part()
    api_define_item({
        id = "side_part",
        name = "Side Part",
        category = "Hair",
        tooltip = "Very cyberpunk",
        singular = true,
        shop_buy = 5
    }, "sprites/item/green_sprout_item.png")
end

function define_double_braids()
    api_define_item({
        id = "double_braids",
        name = "Double Braids",
        category = "Hair",
        tooltip = "Neat and plaited",
        singular = true,
        shop_buy = 5
    }, "sprites/item/green_sprout_item.png")
end

function define_long_hair()
    api_define_item({
        id = "long_hair",
        name = "Long",
        category = "Hair",
        tooltip = "Down and full-length",
        singular = true,
        shop_buy = 5
    }, "sprites/item/green_sprout_item.png")
end

function define_veil()
    api_define_item({
        id = "veil",
        name = "Veil",
        category = "Hair",
        tooltip = "For covering hair",
        singular = true,
        shop_buy = 5
    }, "sprites/item/green_sprout_item.png")
end